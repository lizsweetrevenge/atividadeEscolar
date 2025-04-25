<?php
    require_once("conn.php");
    $professor = $_POST['txtProfessor'];

    $sqlProfessor = "INSERT INTO tbprofessor(nomeProfessor) VALUES ('$professor')";
    $resultadoProfessor = mysqli_query($conn, $sqlProfessor);

    if(mysqli_affected_rows($conn) != 0){
        echo "
            <META HTTP-EQUIV=REFRESH CONTENT = '0;URL=index.html'>
            <script type=\"text/javascript\">
                alert(\"Professor cadastrado com Sucesso. \");
            </script>
        ";
    }else{
        echo "
        <META HTTP-EQUIV=REFRESH CONTENT = '0;URL=cadProfessor.php'>
        <script type=\"text/javascript\">
                alert(\"O Professor não foi cadastrado com Sucesso \");
        </script>
        ";
    }
?>