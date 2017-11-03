<?php
@header("Content-type:text/html; charset=utf-8");
define("SLASH", "/");
define("SLASH_SUP", "../");
$site = array(
    "charset" => "UTF-8",
    "lang" => "es",
    "domain" => "www.radicalaction.com",
    "name" => "MI EMPRESA",
    "keywords" => "",
    "description" => "Información de la empresa"
);

if (isset($_GET['prod'])){
   if($_GET['prod']){
       $prod='&prod='.$_GET['prod'];
   }else{
       $prod='';
   }
}
if (isset($_GET['cat'])){   
   if($_GET['cat']){
       $cat='?cat='.$_GET['cat'];
   }else{
       $cat='';
   }   
}


if(IsSet($_GET['lang'])){//segun la variable lang se envia cookie
    $site['lang']=$_GET['lang'];
    setcookie("lang",$site["lang"],time()+86400);

        header("Location: ".basename($_SERVER['PHP_SELF']).$cat.$prod); // $cat y $prod son variables condicionadas y definidas arriba

} else {
    if(IsSet($_COOKIE['lang'])){
        $site['lang']=$_COOKIE['lang'];
    }
}

$path = array(
    "controllers" => "controllers" . SLASH,
    "css" => "app/css" . SLASH,
    "img" => "app/img" . SLASH,
    "js" => "app/js" . SLASH,
    "module" => "module" . SLASH,
    "tpl" => "tpl" . SLASH,
    "views" => "views" . SLASH,
    "common" => "common" . SLASH,
    "lib" => "common" . SLASH . "lib" . SLASH,
    "lang" => "common" . SLASH . "lang" . SLASH
);
$contact = array(
    "msgok" => "No se pudo enviar el mensaje, intentelo de nuevo.",
    "msgerror" => "El mensaje se envio correctamente, en breve nos pondremos en contacto con usted."
);
if (!isset($_POST['nombre'])) {
   include $path['lang'] . 'lang_' . $site['lang'] . '.php';
}
?>