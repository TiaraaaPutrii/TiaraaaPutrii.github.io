<?php


 session_start();

 include("config.php");
 if(!isset($_SESSION['valid'])){
  header("Location: index.php");
 }
$id = $_SESSION['id'];
$query = mysqli_query($con,"DELETE FROM users WHERE Id=$id");

echo"<script> alert('Akun berhasil dihapus')</script>";
$status = true;

session_destroy();

header("Location: index.php");


?>