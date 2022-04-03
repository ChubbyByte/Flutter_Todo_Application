<?php

  include '../configs/config.php';

  $title = $_POST['title'];
  $description = $_POST['description'];

  $result = array();

  $sql = "INSERT INTO task (title, description) VALUES ('$title', '$description')";

  $query = mysqli_query($conn, $sql);

  if($query){

    $taskId_sql_query = "SELECT * FROM  task WHERE title = '$title'";
    $taskId_query = mysqli_query($conn, $taskId_sql_query);

    if($taskId_query){
      $taskId = "";
      while ($row = mysqli_fetch_assoc($taskId_query)) {
        $taskId = $row['id'];
      }
      $result["taskId"] = $taskId;
      $result["success"] = true;
      $result["message"] = "Adding task wa successful";
      echo json_encode($result);
    }else{
      $result["error"] = false;
      $result["message"] = "Receiving taskId failed";
      echo json_encode($result);
    }
  }else{
    $result["error"] = flase;
    $result["message"] = "Adding task was failed";
    echo json_encode($result);
  }

?>
