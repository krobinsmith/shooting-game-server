<?php

error_reporting(E_ERROR | E_PARSE);

include_once("bl_Common.php");
Utils::check_session($_POST['sid']);

$link = Connection::dbConnect();
$sid     = Utils::sanitaze_var($_POST['sid'], $link);
$nftid    = Utils::sanitaze_var($_POST['nftid'], $link, $sid);

$query_weapons   = Connection::Query($link, "SELECT * FROM " . WEAPONS_DB . " WHERE `nft_id` = '$nftid' ");
$numrows_weapons = mysqli_num_rows($query_weapons);

if($numrows_weapons == 0)
{
    http_response_code(400);
    exit();
}

if($numrows_weapons > 1)
{
    http_response_code(401);
    exit();
}


$row_weapon = mysqli_fetch_assoc($query_weapons);

$retValue = PrintData($row_weapon);



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