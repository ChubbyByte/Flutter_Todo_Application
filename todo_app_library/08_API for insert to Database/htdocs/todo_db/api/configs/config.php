<?php

  $host = 'localhost';
  $user = 'root';
  $pwd = '';
  $dbName = 'todo_db';

  $conn = mysqli_connect($host, $user, $pwd, $dbName);

  if(!$conn){
    echo '[SERVER] >> connection fail ### [404]<hr>';
  }else{
    // echo '[SERVER] >> connected ### [OK]<hr>';
  }



?>