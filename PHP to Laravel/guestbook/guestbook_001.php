<!DOCTYPE html>
<head>
    <title>超級陽春留言板</title>
</head>
<body>
    <h1>超級陽春留言板</h1>
    <?php
        // 連接資料庫所需帳號密碼
        $servername = "localhost";
        $username   = "root";
        $password   = "";

        try {
            
            // 連接資料庫以及設定資料庫錯誤回報的模式
            $db = new PDO("mysql:host=$servername;dbname=guestbook", $username, $password);
            $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $messages = $db->query("SELECT * FROM guestbook")->fetchAll();
            
            //print_r($messages);
                        
            echo "留言筆數：".count($messages)."<br>";

            foreach ($messages as $message) {
                echo "大名：".$message['name']."<br>";
                echo "留言：".$message['message']."<br>";
                echo "時間：".$message['created_at']."<br>";
                echo "<hr>";
            }

            print_r($_REQUEST);

            // 如果接收到表單送出的資料，存入資料庫
            if (isset($_REQUEST['submit'])) {
                $name    = $_REQUEST['name'];
                $message = $_REQUEST['message'];

                $sql = $db->prepare("INSERT INTO guestbook (name, message) values (?, ?);");
                $sql->execute([$name, $message]);

                header('Location: '.$_SERVER['PHP_SELF']);
            }
            

        } catch(PDOException $e) {
            echo $e->getMessage();
        }
    ?>

    <form>
        大名：<input name="name" type="text">
        <br>
        留言：<input name="message" type="text">
        <br>
        <input name="submit" type="submit" value="送出" >
    </form>
</body>
</html>