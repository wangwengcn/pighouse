<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Bootstrap, from Twitter</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="<c:url value="/resources/assets/css/bootstrap.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/assets/css/waterfall.css" />"
	rel="stylesheet">
<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
	min-width: 920px;
}
</style>
<link
	href="<c:url value="/resources/assets/css/bootstrap-responsive.css" />"
	rel="stylesheet">
</head>

<body>

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container containerWrapper">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a> <a class="brand" href="#">Project name</a>
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li class="active"><a href="#">Home</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Dropdown <b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
								<li><a href="#">Another action</a></li>
								<li><a href="#">Something else here</a></li>
								<li class="divider"></li>
								<li class="nav-header">Nav header</li>
								<li><a href="#">Separated link</a></li>
								<li><a href="#">One more separated link</a></li>
							</ul></li>
					</ul>
					<form class="navbar-form pull-right">
						<a id="loginButton" role="button" class="btn btn-primary">Sign
							in</a>
					</form>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>

	<div id="wallpull" class="transitions-enabled centered clearfix">
		<div class="thumbnail  item">
			<img alt="300x200" data-src="holder.js/300x200"
				style="width: 300px; height: 200px;"
				src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAADICAYAAABS39xVAAAE0klEQVR4nO3bwWrqQACG0b7/o+QlssvGTcBFEAQRRCQLXyF3FZnE2NZybf3DWZxNnNrZ5GMyTj6u1+sAkODjrycA8F2CBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYK1E3/dD13VDXddDVVVDVVXDdrsdLpfL4vj9fj80TTNUVTU0TTPs9/uH3/3M2J/Ot67rt54v70GwVqDv+0mo5k6n02R813WL47quu/vuZ8Z+1+VyeTjfuq7vovXX8+V9CNYKbLfb24252+2G6/U6HI/H27WmaW5jz+fzZAU2//vz+fyjsT+d77j6ORwOd//rXebL+xCsFei6bmjbdqjrenK9XGGUY+c3cHmjlyuR7469XC63a5vNZjKHzWZz+2xcObVte3tk+4v5kkuwVmq/3y/eqGVAyvFLwXlmbPn/DofD3bXv7CMtBetV8yWTYK1Q27Z3j4ijpSg8uv7M2Ov1els11XU9WdmUj6SPlHErw/LK+ZJHsFaovEHL/aD5Z19dfzYAZaRKX+0dlY+UVVUNx+PxV+ZLHsFaqXITu1xlvToAu91u8vl8hTc3/8Vw/tgmWJQEa8XGm7TcjH91AOarrL7vP53j+Bg5znN+pEGwKAnWii3dqK/exC73z6rq81/myiMHS7H6jfmSRbBWoG3b281aXh9v1HLT+5XHBMqzX+Vj3tIeVvnI+ihWr54veQRrBcqVynikoAxCeaTglQcxx0g1TTM5fT//lbDv+8kqbJzzEgdHKQnWCnz2as7SY9ArXnUpN9vHX/keRfPRdz7aa/JqDiPBWon5y8RfvfR7Op1uq4+2bSdHCZ4dWx5LaNt28tnSSffP3nt8tDn+P+dLLsECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAEx/gGqz/KbVlcJ6AAAAABJRU5ErkJggg==">
			<div class="caption">
				<h3>Thumbnail label</h3>
				<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
					Donec id elit non mi porta gravida at eget metus. Nullam id dolor
					id nibh ultricies vehicula ut id elit.</p>
				<p>
					<a class="btn btn-primary" href="#">Action</a> <a class="btn"
						href="#">Action</a>
				</p>
			</div>
		</div>
		<div class="thumbnail item">
			<img alt="300x200" data-src="holder.js/300x200"
				style="width: 300px; height: 200px;"
				src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAADICAYAAABS39xVAAAE0klEQVR4nO3bwWrqQACG0b7/o+QlssvGTcBFEAQRRCQLXyF3FZnE2NZybf3DWZxNnNrZ5GMyTj6u1+sAkODjrycA8F2CBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYK1E3/dD13VDXddDVVVDVVXDdrsdLpfL4vj9fj80TTNUVTU0TTPs9/uH3/3M2J/Ot67rt54v70GwVqDv+0mo5k6n02R813WL47quu/vuZ8Z+1+VyeTjfuq7vovXX8+V9CNYKbLfb24252+2G6/U6HI/H27WmaW5jz+fzZAU2//vz+fyjsT+d77j6ORwOd//rXebL+xCsFei6bmjbdqjrenK9XGGUY+c3cHmjlyuR7469XC63a5vNZjKHzWZz+2xcObVte3tk+4v5kkuwVmq/3y/eqGVAyvFLwXlmbPn/DofD3bXv7CMtBetV8yWTYK1Q27Z3j4ijpSg8uv7M2Ov1els11XU9WdmUj6SPlHErw/LK+ZJHsFaovEHL/aD5Z19dfzYAZaRKX+0dlY+UVVUNx+PxV+ZLHsFaqXITu1xlvToAu91u8vl8hTc3/8Vw/tgmWJQEa8XGm7TcjH91AOarrL7vP53j+Bg5znN+pEGwKAnWii3dqK/exC73z6rq81/myiMHS7H6jfmSRbBWoG3b281aXh9v1HLT+5XHBMqzX+Vj3tIeVvnI+ihWr54veQRrBcqVynikoAxCeaTglQcxx0g1TTM5fT//lbDv+8kqbJzzEgdHKQnWCnz2as7SY9ArXnUpN9vHX/keRfPRdz7aa/JqDiPBWon5y8RfvfR7Op1uq4+2bSdHCZ4dWx5LaNt28tnSSffP3nt8tDn+P+dLLsECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAEx/gGqz/KbVlcJ6AAAAABJRU5ErkJggg==">
			<div class="caption">
				<h3>Thumbnail label</h3>
				<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
					Donec id elit non mi porta gravida at eget metus. Nullam id dolor
					id nibh ultricies vehicula ut id elit.</p>
				<p>
					<a class="btn btn-primary" href="#">Action</a> <a class="btn"
						href="#">Action</a>
				</p>
			</div>
		</div>
		<div class="thumbnail item">
			<img alt="300x200" data-src="holder.js/300x200"
				style="width: 300px; height: 200px;"
				src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAADICAYAAABS39xVAAAE0klEQVR4nO3bwWrqQACG0b7/o+QlssvGTcBFEAQRRCQLXyF3FZnE2NZybf3DWZxNnNrZ5GMyTj6u1+sAkODjrycA8F2CBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYK1E3/dD13VDXddDVVVDVVXDdrsdLpfL4vj9fj80TTNUVTU0TTPs9/uH3/3M2J/Ot67rt54v70GwVqDv+0mo5k6n02R813WL47quu/vuZ8Z+1+VyeTjfuq7vovXX8+V9CNYKbLfb24252+2G6/U6HI/H27WmaW5jz+fzZAU2//vz+fyjsT+d77j6ORwOd//rXebL+xCsFei6bmjbdqjrenK9XGGUY+c3cHmjlyuR7469XC63a5vNZjKHzWZz+2xcObVte3tk+4v5kkuwVmq/3y/eqGVAyvFLwXlmbPn/DofD3bXv7CMtBetV8yWTYK1Q27Z3j4ijpSg8uv7M2Ov1els11XU9WdmUj6SPlHErw/LK+ZJHsFaovEHL/aD5Z19dfzYAZaRKX+0dlY+UVVUNx+PxV+ZLHsFaqXITu1xlvToAu91u8vl8hTc3/8Vw/tgmWJQEa8XGm7TcjH91AOarrL7vP53j+Bg5znN+pEGwKAnWii3dqK/exC73z6rq81/myiMHS7H6jfmSRbBWoG3b281aXh9v1HLT+5XHBMqzX+Vj3tIeVvnI+ihWr54veQRrBcqVynikoAxCeaTglQcxx0g1TTM5fT//lbDv+8kqbJzzEgdHKQnWCnz2as7SY9ArXnUpN9vHX/keRfPRdz7aa/JqDiPBWon5y8RfvfR7Op1uq4+2bSdHCZ4dWx5LaNt28tnSSffP3nt8tDn+P+dLLsECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAEx/gGqz/KbVlcJ6AAAAABJRU5ErkJggg==">
			<div class="caption">
				<h3>Thumbnail label</h3>
				<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
					Donec id elit non mi porta gravida at eget metus. Nullam id dolor
					id nibh ultricies vehicula ut id elit.</p>
				<p>
					<a class="btn btn-primary" href="#">Action</a> <a class="btn"
						href="#">Action</a>
				</p>
			</div>
		</div>
		<div class="thumbnail item">
			<img alt="300x200" data-src="holder.js/300x200"
				style="width: 300px; height: 200px;"
				src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAADICAYAAABS39xVAAAE0klEQVR4nO3bwWrqQACG0b7/o+QlssvGTcBFEAQRRCQLXyF3FZnE2NZybf3DWZxNnNrZ5GMyTj6u1+sAkODjrycA8F2CBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYK1E3/dD13VDXddDVVVDVVXDdrsdLpfL4vj9fj80TTNUVTU0TTPs9/uH3/3M2J/Ot67rt54v70GwVqDv+0mo5k6n02R813WL47quu/vuZ8Z+1+VyeTjfuq7vovXX8+V9CNYKbLfb24252+2G6/U6HI/H27WmaW5jz+fzZAU2//vz+fyjsT+d77j6ORwOd//rXebL+xCsFei6bmjbdqjrenK9XGGUY+c3cHmjlyuR7469XC63a5vNZjKHzWZz+2xcObVte3tk+4v5kkuwVmq/3y/eqGVAyvFLwXlmbPn/DofD3bXv7CMtBetV8yWTYK1Q27Z3j4ijpSg8uv7M2Ov1els11XU9WdmUj6SPlHErw/LK+ZJHsFaovEHL/aD5Z19dfzYAZaRKX+0dlY+UVVUNx+PxV+ZLHsFaqXITu1xlvToAu91u8vl8hTc3/8Vw/tgmWJQEa8XGm7TcjH91AOarrL7vP53j+Bg5znN+pEGwKAnWii3dqK/exC73z6rq81/myiMHS7H6jfmSRbBWoG3b281aXh9v1HLT+5XHBMqzX+Vj3tIeVvnI+ihWr54veQRrBcqVynikoAxCeaTglQcxx0g1TTM5fT//lbDv+8kqbJzzEgdHKQnWCnz2as7SY9ArXnUpN9vHX/keRfPRdz7aa/JqDiPBWon5y8RfvfR7Op1uq4+2bSdHCZ4dWx5LaNt28tnSSffP3nt8tDn+P+dLLsECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAEx/gGqz/KbVlcJ6AAAAABJRU5ErkJggg==">
			<div class="caption">
				<h3>Thumbnail label</h3>
				<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
					Donec id elit non mi porta gravida at eget metus. Nullam id dolor
					id nibh ultricies vehicula ut id elit.</p>
				<p>
					<a class="btn btn-primary" href="#">Action</a> <a class="btn"
						href="#">Action</a>
				</p>
			</div>
		</div>
		<div class="thumbnail item">
			<img alt="300x200" data-src="holder.js/300x200"
				style="width: 300px; height: 200px;"
				src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAADICAYAAABS39xVAAAE0klEQVR4nO3bwWrqQACG0b7/o+QlssvGTcBFEAQRRCQLXyF3FZnE2NZybf3DWZxNnNrZ5GMyTj6u1+sAkODjrycA8F2CBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYK1E3/dD13VDXddDVVVDVVXDdrsdLpfL4vj9fj80TTNUVTU0TTPs9/uH3/3M2J/Ot67rt54v70GwVqDv+0mo5k6n02R813WL47quu/vuZ8Z+1+VyeTjfuq7vovXX8+V9CNYKbLfb24252+2G6/U6HI/H27WmaW5jz+fzZAU2//vz+fyjsT+d77j6ORwOd//rXebL+xCsFei6bmjbdqjrenK9XGGUY+c3cHmjlyuR7469XC63a5vNZjKHzWZz+2xcObVte3tk+4v5kkuwVmq/3y/eqGVAyvFLwXlmbPn/DofD3bXv7CMtBetV8yWTYK1Q27Z3j4ijpSg8uv7M2Ov1els11XU9WdmUj6SPlHErw/LK+ZJHsFaovEHL/aD5Z19dfzYAZaRKX+0dlY+UVVUNx+PxV+ZLHsFaqXITu1xlvToAu91u8vl8hTc3/8Vw/tgmWJQEa8XGm7TcjH91AOarrL7vP53j+Bg5znN+pEGwKAnWii3dqK/exC73z6rq81/myiMHS7H6jfmSRbBWoG3b281aXh9v1HLT+5XHBMqzX+Vj3tIeVvnI+ihWr54veQRrBcqVynikoAxCeaTglQcxx0g1TTM5fT//lbDv+8kqbJzzEgdHKQnWCnz2as7SY9ArXnUpN9vHX/keRfPRdz7aa/JqDiPBWon5y8RfvfR7Op1uq4+2bSdHCZ4dWx5LaNt28tnSSffP3nt8tDn+P+dLLsECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAEx/gGqz/KbVlcJ6AAAAABJRU5ErkJggg==">
			<div class="caption">
				<h3>Thumbnail label</h3>
				<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
					Donec id elit non mi porta gravida at eget metus. Nullam id dolor
					id nibh ultricies vehicula ut id elit.</p>
				<p>
					<a class="btn btn-primary" href="#">Action</a> <a class="btn"
						href="#">Action</a>
				</p>
			</div>
		</div>
		<div class="thumbnail item">
			<img alt="300x200" data-src="holder.js/300x200"
				style="width: 300px; height: 200px;"
				src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAASwAAADICAYAAABS39xVAAAE0klEQVR4nO3bwWrqQACG0b7/o+QlssvGTcBFEAQRRCQLXyF3FZnE2NZybf3DWZxNnNrZ5GMyTj6u1+sAkODjrycA8F2CBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYK1E3/dD13VDXddDVVVDVVXDdrsdLpfL4vj9fj80TTNUVTU0TTPs9/uH3/3M2J/Ot67rt54v70GwVqDv+0mo5k6n02R813WL47quu/vuZ8Z+1+VyeTjfuq7vovXX8+V9CNYKbLfb24252+2G6/U6HI/H27WmaW5jz+fzZAU2//vz+fyjsT+d77j6ORwOd//rXebL+xCsFei6bmjbdqjrenK9XGGUY+c3cHmjlyuR7469XC63a5vNZjKHzWZz+2xcObVte3tk+4v5kkuwVmq/3y/eqGVAyvFLwXlmbPn/DofD3bXv7CMtBetV8yWTYK1Q27Z3j4ijpSg8uv7M2Ov1els11XU9WdmUj6SPlHErw/LK+ZJHsFaovEHL/aD5Z19dfzYAZaRKX+0dlY+UVVUNx+PxV+ZLHsFaqXITu1xlvToAu91u8vl8hTc3/8Vw/tgmWJQEa8XGm7TcjH91AOarrL7vP53j+Bg5znN+pEGwKAnWii3dqK/exC73z6rq81/myiMHS7H6jfmSRbBWoG3b281aXh9v1HLT+5XHBMqzX+Vj3tIeVvnI+ihWr54veQRrBcqVynikoAxCeaTglQcxx0g1TTM5fT//lbDv+8kqbJzzEgdHKQnWCnz2as7SY9ArXnUpN9vHX/keRfPRdz7aa/JqDiPBWon5y8RfvfR7Op1uq4+2bSdHCZ4dWx5LaNt28tnSSffP3nt8tDn+P+dLLsECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAExBAuIIVhADMECYggWEEOwgBiCBcQQLCCGYAEx/gGqz/KbVlcJ6AAAAABJRU5ErkJggg==">
			<div class="caption">
				<h3>Thumbnail label</h3>
				<p>Cras justo odio, dapibus ac facilisis in, egestas eget quam.
					Donec id elit non mi porta gravida at eget metus. Nullam id dolor
					id nibh ultricies vehicula ut id elit.</p>
				<p>
					<a class="btn btn-primary" href="#">Action</a> <a class="btn"
						href="#">Action</a>
				</p>
			</div>
		</div>
	</div>

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="<c:url value="/resources/assets/js/jquery-1.8.2.js" />"></script>
	<script src="<c:url value="/resources/assets/js/bootstrap.min.js" />"></script>
	<script src="<c:url value="/resources/assets/js/jquery.masonry.js" />"></script>
	<script src="<c:url value="/resources/assets/js/jquery.validate.js" />"></script>
	<script src="<c:url value="/resources/assets/js/jquery.form.js" />"></script>
	<script>
		// 瀑布流
		$(function() {
			$('#wallpull').masonry({
				itemSelector : '.item',
				isFitWidth : true
			});
		});
	</script>

	<div id="loginWindow" class="modal hide fade" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">&times;</button>
			<h3 id="myModalLabel">Please sign in</h3>
		</div>
		<div class="modal-body">
			<form id="loginForm" class="form-horizontal">
				<div class="control-group">
					<label class="control-label" for="email">Email</label>
					<div class="controls">
						<input type="text" name="email" id="email" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" for="password">Password</label>
					<div class="controls">
						<input type="password" name="password" id="password" />
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<label class="checkbox"> <input type="checkbox" />
							Remember me
						</label>
					</div>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<button id="loginSubmitButton" class="btn btn-large btn-primary"
				type="submit">Sign in</button>
		</div>
	</div>
	<script>
		// 登录相关
		$(function() {
			var validator = $('#loginForm').validate({
				rules : {
					email : {
						required : true,
						email : true
					},
					password : {
						required : true,
						minlength : 6
					}
				},
				errorClass : 'text-error',
				submitHandler : function(form) {
					$('#loginForm').ajaxSubmit({
						dataType : 'xml',
						type : 'post',
						url : '<c:url value="/user/getUser" />',
						clearForm : true,
						success : function(xml) {
							alert($(xml).find("email").text());
						}
					});
				}
			});

			$("#loginButton").click(function() {
				$('#loginWindow').modal();
			});

			$("#loginSubmitButton").click(function() {
				$('#loginForm').submit();
			});

		});
	</script>
</body>
</html>