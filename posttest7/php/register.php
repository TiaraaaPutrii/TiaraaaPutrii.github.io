<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styleloginregis.css">
    <title>Register</title>
</head>
<body>
      <div class="container">
        <div class="box form-box">

        <?php 
         
         include("config.php");
         if(isset($_POST['submit'])){
            $username = $_POST['username'];
            $email = $_POST['email'];
            $age = $_POST['age'];
            $password = password_hash($_POST["password"], PASSWORD_DEFAULT);

            $tmp_name = $_FILES['gambar']['tmp_name'];
            $file_name = $_FILES['gambar']['name'];
            $file_size = $_FILES['gambar']['size'];

           
            $max_size = 1 * 1024 * 1024; // 1MB

            $date = date("Y-m-d");
            $ekstensi = explode('.', $file_name);
            $ekstensi = strtolower(end($ekstensi));

            $newFileName = sprintf("%s.%s", $date, $ekstensi);

            if ($file_size > $max_size) {
                echo "<div class='message'>
                          <p>File terlalu besar. Maksimal ukuran file adalah 1MB.</p>
                      </div>";
            } else {
                
                move_uploaded_file($tmp_name, '../img/'.$newFileName);
            
                $verify_query = mysqli_query($con,"SELECT Email FROM users WHERE Email='$email'");

                if(mysqli_num_rows($verify_query) != 0) {
                    echo "<div class='message'>
                              <p>This email is used, Try another One Please!</p>
                          </div> <br>";
                    echo "<a href='javascript:self.history.back()'><button class='btn'>Go Back</button>";
                } else {
                    
                    mysqli_query($con,"INSERT INTO users(Username,Email,Age,Password,gambar) VALUES('$username','$email','$age','$password','$newFileName')") or die("Error Occurred");

                    echo "<div class='message'>
                              <p>Registration successful!</p>
                          </div> <br>";
                    echo "<a href='index.php'><button class='btn'>Login Now</button>";
                }
            }
         } else {
        ?>

            <header>Sign Up</header>
            <form action="" method="post" enctype="multipart/form-data">
                <div class="field input">
                    <label for="username">Username</label>
                    <input type="text" name="username" id="username" autocomplete="off" required>
                </div>

                <div class="field input">
                    <label for="email">Email</label>
                    <input type="text" name="email" id="email" autocomplete="off" required>
                </div>

                <div class="field input">
                    <label for="age">Age</label>
                    <input type="number" name="age" id="age" autocomplete="off" required>
                </div>
                <div class="field input">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" autocomplete="off" required>
                </div>

                <div class="field input">
                    <label for="gambar">Upload Gambar (Max 1MB):</label>
                    <input type="File" name="gambar" accept="image/*" required><br><br>
                </div>

                <div class="field">
                    <input type="submit" class="btn" name="submit" value="Register" required>
                </div>
                <div class="links">
                    Already a member? <a href="index.php">Sign In</a>
                </div>
            </form>

        <?php } ?>
        </div>
      </div>
</body>
</html>
