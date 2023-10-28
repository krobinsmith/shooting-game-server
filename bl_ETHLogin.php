<?php


error_reporting(E_ERROR | E_PARSE);


include_once("bl_Common.php");
Utils::check_session($_POST['sid']);

$link = Connection::dbConnect();
$sid     = Utils::sanitaze_var($_POST['sid'], $link);
$name    = Utils::sanitaze_var($_POST['name'], $link, $sid);
$pass    = Utils::sanitaze_var($_POST['password'], $link, $sid);
$authApp = Utils::sanitaze_var($_POST['appAuth'], $link, $sid);
$address     = Utils::sanitaze_var($_POST['address'], $link, $sid);




if (empty($address))
  {
    http_response_code(400);
    exit();
  }

$query   = Connection::Query($link, "SELECT * FROM " . PLAYERS_DB . " WHERE `address` = '$address' ");
$numrows = mysqli_num_rows($query);


$query_weapons   = Connection::Query($link, "SELECT * FROM " . WEAPONS_DB . " WHERE `address` = '$address' ");
$numrows_weapons = mysqli_num_rows($query_weapons);



if ($numrows != 1)
  {

    http_response_code(401);

    exit();
  }
$row = mysqli_fetch_assoc($query);


$retValue = PrintData($row);




if($numrows_weapons == 0)
{
    echo $retValue;
    exit();
}


while ($row_weapons = mysqli_fetch_assoc($query_weapons))
{
    $retValue .= "\t" . PrintData($row_weapons);
}

echo $retValue;

mysqli_close($link);

function PrintData($row)
  {
    $data = "success\n";
    foreach ($row as $key => $value)
      {
        if ($key == "password") //don't retrieve the password
            continue;
            $data .= $key . "|" . $value . "\n";
      }

      return $data;
  }
?>