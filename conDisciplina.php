<?php
            
            require_once('conn.php');

            $sql=mysqli_query($conn,"SELECT * FROM tbdisciplinas");
            
        
            while($linha=mysqli_fetch_array($sql))
            {
            $id=$linha['idDisciplina'];
            $nd=$linha['nomeDisciplina'];
            $ch=$linha['cargaHoraria'];
            
            echo"<p>";
            
            echo "<table><tr><td>Id Disciplina: </td><td>$id</td><tr>";
            echo "<tr><td>Nome da Disciplina: </td><td>$nd</td><tr> <br><br>";
            echo "<tr><td>Carga Horária: </td><td>$ch</td><tr> <br><br>";
            
            
            }
            
            ?>