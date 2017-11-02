<?php
$ini=$admi=$bus=/*$reg=*/0;

switch (basename($_SERVER['PHP_SELF'])) {
    case "inicio.php": $ini="class='active'"; break;
    case "clientes.php": $admi="class='active'"; break;
    case "galeria.php": $bus="class='active'"; break;
    //case "servicios.php": $reg="class='active'"; break;
} 
?>
<header>

<div class="colores">
  <div class="color1"></div>
  <div class="color2"></div>
</div>
<nav class="col-xs-12 navbar sinpa navbar-default ">
      <div class="col-md-4 col-xs-12">
        <center>
          <img src="app/img/inicio/logo.png" alt="">  
        </center>        
      </div>
      <div class="container-fluid col-md-8 col-xs-12">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>  
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav">
            <li><a <?php echo $admi ?> href="clientes.php"> Clientes</a></li>
            <li><a <?php echo $admi ?> href="Login.php"> Cerrar Sesión</a></li>
            <!--li><a <?php echo $reg ?> href="cliente.php">Clientes</a></li-->
          </ul>
        </div>
      </div>
</nav>
<div class="colores">
  <div class="color1"></div>
  <div class="color2"></div>
</div>

</header>