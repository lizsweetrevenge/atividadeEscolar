<?php
    require_once("conn.php");
    $disciplina = $_POST['txtDisciplina'];

    $sqlDisciplina = "INSERT INTO tbdisciplinas(nomeDisciplina) VALUES ('$disciplina')";
    $resultadoDisciplina = mysqli_query($conn, $sqlDisciplina);

    if(mysqli_affected_rows($conn) != 0){
        echo "
            <META HTTP-EQUIV=REFRESH CONTENT = '0;URL=index.html'>
            <script type=\"text/javascript\">
                alert(\"Disciplina cadastrado com Sucesso. \");
            </script>
        ";
    }else{
        echo "
        <META HTTP-EQUIV=REFRESH CONTENT = '0;URL=cadDisciplina.php'>
        <script type=\"text/javascript\">
                alert(\"A Disciplina não foi cadastrado com Sucesso \");
        </script>
        ";
    }
?>