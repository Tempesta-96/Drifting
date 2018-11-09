<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Snake</title>
</head>
<style>
BODY {
	MARGIN: 0;
}

#area {
	width: 600px;
	height: 600px;
	padding: 0px;
	margin: 0px;
	background-color: black;
}

#snake {
	width: 10px;
	height: 10px;
	position: absolute;
	background-color: white;
}

#food {
	width: 10px;
	height: 10px;
	position: absolute;
	background-color: red;
}
</style>
<script type="text/javascript">
	class Tail {
	  constructor(posX, posY) {
	    this.posX = posX;
	    this.posY = posY;
	  }
	};
	function food() {
		var gridX = 0;
		var gridY = 0;
		gridX = Math.floor(Math.random() * 60);
		gridY = Math.floor(Math.random() * 60);

		console.log("Posx:" + gridX);
		console.log("Posy:" + gridY);
		var elem = document.getElementById("food");
		elem.style.left = gridX * 10 + "px";
		elem.style.top = gridY * 10 + "px";
	}
	function snakeLength(){
		var total = 0;
	}

	function snake(event) {
		var tail = [];
		var posX = 0;
		var posY = 0;
		var speed = 10;
		var k = event.keyCode;
		var chrId = document.getElementById('snake');
		var chr = {
			updown : function() {
				var y = parseInt(getComputedStyle(chrId).top);
				if (k == 87) {
					y -= speed;
				} else if (k == 83) {
					y += speed;
				}
				return y;
			},

			leftright : function() {
				var x = parseInt(getComputedStyle(chrId).left);
				if (k == 65) {
					x -= speed;
				} else if (k == 68) {
					x += speed;
				}

				return x;
			}
		}
		chrId.style.top = (chr.updown()) + "px";
		chrId.style.left = (chr.leftright()) + "px";
		
		if(eat()== true){
			this.total += 1;
			console.log(this.total);
		}
	}
	function eat(){
		var foodId = document.getElementById("food");
		var snakeId = document.getElementById("snake");
		if((foodId.style.top == snakeId.style.top) && (foodId.style.left == snakeId.style.left)){
			food();
			return true;
		}return false;
	}
	
	
</script>
<body onload="food()" onkeydown="snake(event)">
	<div id="area">
		<div id="food"></div>
		<div id="snake"></div>
	</div>
</body>
</html>