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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="stylehome.css">
    <title>Home</title>
</head>
<body>
    <div class="nav">
        <div class="logo">
            <p><a href="home.php"><img src="../LOGO.png" alt="" height=100px width=180px></a> </p>
        </div>

        <div class="right-links">

            <?php 
            
            $id = $_SESSION['id'];
            $query = mysqli_query($con,"SELECT*FROM users WHERE Id=$id");
            
            while($result = mysqli_fetch_assoc($query)){
                $res_Uname = $result['Username'];
                $res_Email = $result['Email'];
                $res_Age = $result['Age'];
                $res_id = $result['Id'];
                $res_gambar = $result['gambar'];
            }
            
            $gambar = sprintf("../img/%s",$res_gambar);

            echo "<a href='edit.php?Id=$res_id'><button class='btn'>Change Profile</button></a>";
            ?>

            <a href="logout.php"> <button class="btn">Log Out</button> </a>
            <a href= "delete.php"> <button class="btn" >Delete</button> </a>
            <a href= "../html/mainHome.html"> <button class="btn" >Back</button> </a>
            <a href="search.php"> <button class="btn">Cari Data</button> </a>
            
        </div>
    </div>
    <main>

       <div class="main-box top">
          <div class="top">
            <div class="box">
                <img src=<?php echo $gambar ?> alt="" width=400px height=400px>
            </div>
            <div class="box">
                <p>Hello <b><?php echo $res_Uname ?></b>, Welcome</p>
            </div>
            <div class="box">
                <p>Your email is <b><?php echo $res_Email ?></b>.</p>
            </div>
          </div>
          <div class="bottom">
            <div class="box">
                <p>And you are <b><?php echo $res_Age ?> years old</b>.</p> 
            </div>
          </div>
       </div>

    </main>
</body>

</html>