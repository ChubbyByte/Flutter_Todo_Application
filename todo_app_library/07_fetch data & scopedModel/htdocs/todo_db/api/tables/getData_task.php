<?php

  include '../configs/config.php';

  $result = array();

  $sql = "SELECT * FROM task"; //get all 'Data' in tableName 'task'

  $query = mysqli_query($conn, $sql);

  while($row = mysqli_fetch_assoc($query)){
    $result[] = $row;
  }

  echo json_encode($result);

?>