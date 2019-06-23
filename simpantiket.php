<?php 
include 'db.php';


    $kodetiket = $_POST['kodetiket'];
    $namatiket = $_POST['namatiket'];
    $harga = $_POST['harga'];
    $kodekategori = $_POST['kodekategori'];
    $kodekonser = $_POST['kodekonser'];

	$query = "INSERT INTO tiket VALUES ('$kodetiket', '$namatiket', '$harga', '$kodekategori', '$kodekonser')";
	$sql1 = mysqli_query($connect, $query);
	// header("location:inputtiket.php");
 ?>