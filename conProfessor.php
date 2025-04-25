<?php

            require_once('conn.php');
            
            $sql=mysqli_query($conn,"SELECT * FROM tbProfessor");
            
        
            while($linha=mysqli_fetch_array($sql))
            {
            $id=$linha['idProfessor'];
            $nome=$linha['nomeProfessor'];
            
            echo"<p>";
            
            echo "<table><tr><td>Código do Professor: </td><td>$id</td><tr>";
            echo "<tr><td>Nome do Professor: </td><td>$nome</td><tr> <br><br>";

            
            
            }
            
            ?>