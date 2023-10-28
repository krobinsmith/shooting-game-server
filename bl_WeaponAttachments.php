<?php
error_reporting(E_ERROR | E_PARSE);

include_once("bl_Common.php");
Utils::check_session($_POST['sid']);

$link = Connection::dbConnect();

$sid     = Utils::sanitaze_var($_POST['sid'], $link);
$name    = Utils::sanitaze_var($_POST['name'], $link, $sid);
$pass    = Utils::sanitaze_var($_POST['password'], $link, $sid);
$nft = Utils::sanitaze_var($_POST['nft'], $link, $sid);


//echo $nft;


if (empty($nft))
  {
    http_response_code(400);
    exit();
  }

$query   = Connection::Query($link, "SELECT customizer FROM " . WEAPONS_DB . " WHERE `nft_id` ='$nft' ");
$numrows = mysqli_num_rows($query);

if ($numrows != 1)
  {
    http_response_code(401);
    exit();
  }

$row = mysqli_fetch_assoc($query);

echo $row["customizer"];

mysqli_close($link);

function PrintData($row, $sid)
  {
    $data = "success\n";
    foreach ($row as $key => $value)
      {
        if ($key == "password") //don't retrieve the password
            continue;
            $data .= $key . "|" . $value . "\n";
      }
      if(PER_TO_PER_ENCRYPTION)
      {
        $data = "encrypt" . Utils::encrypt_aes($data,$sid);
      }
      echo $data;
  }
?>