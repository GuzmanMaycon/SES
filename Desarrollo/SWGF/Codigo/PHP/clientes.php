<!DOCTYPE html>
<html>
<head>
<?php include 'tpl/head.php'; ?>
</head>
<body>
<div class="col-xs-12 vista_clientes">

<?php 
 	include("models/config.php");
   	session_start();
    ?>
	
	<div class="buscador-resultado">
		<div class="container ">
			<h2></h2>
			<div class="table-responsive">
				<table class="table table-bordered">
				    <thead>
					    <tr>
					        <th><b>#</b></th>
					        <th><b>Nombre</b></th>
					        <th><b>N° Documento</b></th>
					        <th><b>Correo electrónico</b></th>
					        <th><b>Teléfono</b></th>
					        <th><b>E-mail</b></th>
					        <td width="50px"><b>Agregar Servicio</b></td>
					        <td width="50px"><b>Buscar</b></td>
					    </tr>
					</thead>
				    <tbody>
				    	<?php 
				    		$a=1;
				    		$sql="SELECT * FROM cliente";
				    		
						    $result = mysqli_query($db,$sql);

		   					while($row = mysqli_fetch_array($result)) {
		   				?>
					    <tr>
					        <td><?php echo $a++; ?></td>
					        <td><?php echo $row["nombres"]." ".$row["ap_paterno"]." ".$row["ap_materno"];?></td>
					        <td><?php echo $row["documento"];?></td>
					        <td><?php echo $row["direccion"];?></td>
					        <td><?php echo $row["telefono"];?></td>
					        <td><?php echo $row["email1"];?></td>
					        <td><center><a  data-toggle="modal" class="abrir-reg" documento="<?php echo $row["documento"];?>" nombre="<?php echo $row["nombres"]." ".$row["ap_paterno"]." ".$row["ap_materno"];?>">Agregar</a></center></td>
						    <td><center><a  data-toggle="modal" class="abrir-search" documento="<?php echo $row["documento"];?>" nombre="<?php echo $row["nombres"]." ".$row["ap_paterno"]." ".$row["ap_materno"];?>">Buscar</a></center></td>
						</tr>
		   				<?php 
		   					}
				    	?>
					</tbody>
				</table>			
			</div>
		</div>
	</div>
</div>
</body>
</html>

