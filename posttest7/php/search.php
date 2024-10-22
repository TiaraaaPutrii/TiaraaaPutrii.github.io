<?php
session_start();

include("config.php");
if(!isset($_SESSION['valid'])){
 header("Location: ../php/index.php");
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search</title>
    <link rel="stylesheet" href="stylesearch.css">
</head>
<body>
    <div class="container">
        <form method="post">
            <input type="text" name="search" placeholder="Search data">
            <button class="btn" name="submit">Search</button>
        </form>
        <a href="home.php"> <button class="btn">Back</button> </a>
        <div class="container">
            <table class="table">
                <?php
if(isset($_POST['submit'])){
    $search=$_POST['search'];

    $sql="Select * from users where Id like '%$search%' or Username like '%$search%' or Email like '%$search%'";
    $result=mysqli_query($con, $sql);
    if($result){
    if(mysqli_num_rows($result)>0){
        echo '<thead>
        <tr>
        <th>Id</th>
        <th>User</th>
        <th>Email</th>
        </tr>
        </thead>
        ';
    while($row=mysqli_fetch_assoc($result)){
        echo '<tbody>
        <tr>
        <td>'.$row['Id'].'</td>
        <td>'.$row['Username'].'</td>
        <td>'.$row['Email'].'</td>
        </tr>
        </tbody>';
        }

    }else{
        echo '<h2>Data not found</h2>';
    }
    }

}

?>


            </table>
        </div>
    </div>
</body>
</html>