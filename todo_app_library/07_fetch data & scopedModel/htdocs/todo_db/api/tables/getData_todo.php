<?php

  include '../configs/config.php';

  $result = array();

  $sql = "SELECT * FROM todo"; //get all 'Data' in tableName 'todo'

  $query = mysqli_query($conn, $sql);

  while($row = mysqli_fetch_assoc($query)){
    $result[] = $row;
  }

  echo json_encode($result);

?>