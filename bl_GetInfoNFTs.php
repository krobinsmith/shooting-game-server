<?php

error_reporting(E_ERROR | E_PARSE);

include_once("bl_Common.php");
Utils::check_session($_POST['sid']);

$link = Connection::dbConnect();
$sid     = Utils::sanitaze_var($_POST['sid'], $link);
$nftids    = Utils::sanitaze_var($_POST['nftids'], $link, $sid);


$array_nftid = explode(",", $nftids);
$i = 0;
$retval = null;

while($array_nftid[$i] != null)
{

    $query_weapons   = Connection::Query($link, "SELECT * FROM " . WEAPONS_DB . " WHERE `nft_id` = '$array_nftid[$i]' ");
    $numrows_weapons = mysqli_num_rows($query_weapons);

    if($numrows_weapons == 0)
    {
        $retval->$i = json_decode("{}");
        $i ++;
        continue;
    }

    if($numrows_weapons > 1)
    {
        $retval->$i = json_decode("{}");
        $i++;
        continue;
    }

    $row_weapon = mysqli_fetch_assoc($query_weapons);

    $retval->$i = $row_weapon;

    $i++;
}


echo json_encode($retval);


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