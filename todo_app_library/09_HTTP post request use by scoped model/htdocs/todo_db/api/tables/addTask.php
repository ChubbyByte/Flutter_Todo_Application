<?php

  include '../configs/config.php';

  $title = $_POST['title'];
  $description = $_POST['description'];

  $result = array();

  $sql = "INSERT INTO task (title, description) VALUES ('$title', '$description')";

  $query = mysqli_query($conn, $sql);

  if($query){
    $result["success"] = "Adding task wa successful";
    echo json_encode($result);
  }else{
    $result["error"] = "Adding task failed";
    echo json_encode($result);
  }

?>