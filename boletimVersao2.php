<html>
<body>

<?php
    require_once("conn.php");
?>

<form action="boletimVersao2.php" method="post">
    
    <select name="selectAluno" required>
        <option value="">Selecione o aluno</option>
        <?php
            $sqlAlunos = "SELECT * FROM tbaluno";
            $resultadoAlunos = mysqli_query($conn, $sqlAlunos);
            while($rowAlunos = mysqli_fetch_assoc($resultadoAlunos)){
                echo "<option value='".$rowAlunos['ra']."'>".$rowAlunos['nomeAluno']."</option>";
            }
        ?>
    </select><br><br>

    <input type="submit" name="buscar" value="Buscar Boletim">
</form>

<?php
if (isset($_POST['buscar'])) {
    $ra = $_POST['selectAluno'];

    // Buscar o nome do aluno uma vez só
    $sqlAluno = "SELECT nomeAluno FROM tbaluno WHERE ra = '$ra'";
    $resultadoAluno = mysqli_query($conn, $sqlAluno);
    $aluno = mysqli_fetch_assoc($resultadoAluno);

    if ($aluno) {
        echo "<h2>Boletim do Aluno: ".$aluno['nomeAluno']."</h2>";

        // Buscar as disciplinas, notas e faltas
        $resultado = mysqli_query($conn, "
            SELECT tbdisciplinas.nomeDisciplina, tbprofessor.nomeProfessor, tbnotas.nota, tbnotas.faltas 
            FROM tbnotas 
            INNER JOIN tbdisciplinas ON tbdisciplinas.idDisciplina = tbnotas.idDisciplina 
            INNER JOIN tbprofessor ON tbprofessor.idProfessor = tbnotas.idProfessor 
            WHERE tbnotas.ra = '$ra'
        ");

        if (mysqli_num_rows($resultado) > 0) {
            echo "<table border='1' cellpadding='5' cellspacing='0'>";
            echo "<tr>
                    <th>Disciplina</th>
                    <th>Professor</th>
                    <th>Nota</th>
                    <th>Faltas</th>
                  </tr>";

            while ($linha = mysqli_fetch_assoc($resultado)) {
                echo "<tr>";
                echo "<td>".$linha['nomeDisciplina']."</td>";
                echo "<td>".$linha['nomeProfessor']."</td>";
                echo "<td>".$linha['nota']."</td>";
                echo "<td>".$linha['faltas']."</td>";
                echo "</tr>";
            }

            echo "</table>";
        } else {
            echo "<p>Este aluno ainda não possui notas cadastradas.</p>";
        }
    } else {
        echo "<p>Aluno não encontrado.</p>";
    }
}
?>

</body>
</html>