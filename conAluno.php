<?php
            
            require_once('conn.php');

            $sql=mysqli_query($conn,"SELECT * FROM tbAluno");
            
        
            while($linha=mysqli_fetch_array($sql))
            {
            $ra=$linha['ra'];
            $nome=$linha['nomeAluno'];
            
            echo"<p>";
            
            echo "<table><tr><td>Código do Professor: </td><td>$ra</td><tr>";
            echo "<tr><td>Nome do Professor: </td><td>$nome</td><tr> <br><br>";

            
            
            }
            
            ?>