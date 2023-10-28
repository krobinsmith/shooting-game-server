<?php
error_reporting(E_ERROR | E_PARSE);

include("bl_Common.php");
Utils::check_session($_POST['sid']);

$link = Connection::dbConnect();

$sid    = Utils::sanitaze_var($_POST['sid'], $link);
$name   = Utils::sanitaze_var($_POST['name'], $link, $sid);
$id     = Utils::sanitaze_var($_POST['id'], $link, $sid);
$type   = Utils::sanitaze_var($_POST['type'], $link, $sid);
$hash   = Utils::sanitaze_var($_POST['hash'], $link, $sid);
$nft  = Utils::sanitaze_var($_POST['nft'], $link, $sid);
$line   =  Utils::sanitaze_var($_POST['line'], $link, $sid);





if (!empty($nft)) {


        $query = "UPDATE " . WEAPONS_DB . " SET customizer='$line' WHERE nft_id='$nft'";
        $result = mysqli_query($link, $query) or die(mysqli_error($link));
        if ($result) {
            echo "done" . " === " . json_encode($result) . $line;
        }

} else {
    http_response_code(401);
    exit();
}

mysqli_close($link);