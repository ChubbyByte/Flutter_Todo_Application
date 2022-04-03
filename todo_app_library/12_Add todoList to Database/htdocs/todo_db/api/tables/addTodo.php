<?php

  include '../configs/config.php';

  $todoInfos = $_POST['todoInfos'];
  $taskId = $_POST['taskId'];

  $exploded = explode(",", $todoInfos);

  $result = array();

  $sql = "";
  foreach($exploded as $data) {
    $sql .= "INSERT INTO todo (taskId, todoInfo) VALUES ('".$taskId."', '".$data."');";
      print($data);
  }
  print($data);

  if(mysqli_multi_query($conn, $sql)){
    $result['success'] = "Adding todo was successful";
    echo json_encode($result);
  }else{
    $result["error"] = "Adding todo was failed";
    echo json_encode($result);
  }

mysqli_close($conn);
?>
