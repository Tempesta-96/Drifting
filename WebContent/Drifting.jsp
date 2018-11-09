<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Drifting</title>
</head>
<style>
#track {
	width: 600px;
	height: 600px;
	position: relative;
	background-image: url("resources/Car.PNG");
	background-size: 600px 600px;
	top: 0px;
	margin-left: 50px;
	margin-top: 50px;
}

#car {
	width: 100px;
	height: 100px;
	position: absolute;
	background-image: url("resources/car.gif");
	background-size: 100px 100px;
}

#face {
	width: 700px;
	height: 700px;
	margin-left: 100px;
	padding-top: 100px;
}

#ambulance {
	width: 100px;
	height: 50px;
	position: absolute;
	background-image: url("resources/ambulance.png");
	background-size: 100px 50px;
	margin-top: 25px;
}

#helicopter {
	width: 100px;
	height: 50px;
	position: absolute;
	background-image: url("resources/helicopter1.png");
	background-size: 100px 50px;
}

#newpolice {
	width: 100px;
	height: 50px;
	position: absolute;
	background-image: url("resources/newpolice.png");
	background-size: 100px 50px;
	margin-top: 25px;
}

#biggertrack {
	width: 700px;
	height: 700px;
	position: absolute;
	background-image: url("resources/black.png");
	background-size: 700px 700px;
}
</style>

<script type="text/javascript">
	function myMove() {
		helicopterMove();
		initializeCar();
		ambulanceMove();
		policecarMove();
		
	}
	function initializeCar() {
		var elem = document.getElementById("car");
		var posX = 0;
		var posY = 0;
		elem.style.top = posY + 'px';
		elem.style.left = posX + 'px';
	}
	function move(event) {
		var speed = 5;
		var k = event.keyCode;
	    var chrId = document.getElementById('car');
	    var rotation = {
	    		value: function() {
		    		if (k == 87) {
		                return 3;
		            } else if (k == 83) {
		                return 1;
		            }else if (k == 65) {
		            	return 2;
		            } else if (k== 68) {
		            	return 0;
		            }
	    		}
		    };
		var chr = {
		        updown: function () {
		            var y = parseInt(getComputedStyle(chrId).top);
		            if (k == 87) {
		                y -= speed;
		            } else if (k == 83) {
		                y += speed;
		            }
		            return y;
		        },

		        leftright: function () {
		            var x = parseInt(getComputedStyle(chrId).left);
		            if (k == 65) {
		                x -= speed;
		            } else if (k == 68) {
		                x += speed;
		            }

		            return x;
		        }
		    };
		if (rotation.value() == 2) {
			chrId.style.transform = "scaleX(-1)";
		} else {
			var deg = rotation.value() * 90;
			chrId.style.transform = "rotate("
					+ deg + "deg)";
		}
		chrId.style.top = (chr.updown()) + "px";
		chrId.style.left = (chr.leftright()) + "px";
	}

	function carMove(event) {
		var elem = document.getElementById("car");
		var rect = elem.getBoundingClientRect();
		var rotation = 0;
		var posX = 0;
		if (event.keyCode == 100) {
			alert(rect.left);
			rect.left++;
		}
		
		//function frame() {
			
			/*if (posX < 500 & posY == 0) {
				rotation = 0;
				posX++;
			} else if (posX == 500 & posY < 500) {
				rotation = 1;
				posY++;
			} else if (posX > 0 & posY == 500) {
				rotation = 2;
				posX--;
			} else {
				rotation = 3;
				posY--;
			}
			if (rotation == 2) {
				document.getElementById("car").style.transform = "scaleX(-1)";
			} else {
				var deg = rotation * 90;
				document.getElementById("car").style.transform = "rotate("
						+ deg + "deg)";
			}*/
		//}
	}
	function ambulanceMove() {
		var elem1 = document.getElementById("ambulance");
		var posX1 = -180;
		var posY1 = 0;
		var speed = 2;
		var id = setInterval(frame, 11);
		var rotation = 0;
		function frame() {
			if (posX1 < 500 & posY1 == 0) {
				rotation = 0;
				posX1+= speed;
			} else if (posX1 == 500 & posY1 < 500) {
				rotation = 1;
				posY1+= speed;
			} else if (posX1 > 0 & posY1 == 500) {
				rotation = 2;
				posX1-= speed;
			} else {
				rotation = 3;
				posY1-= speed;
			}
			if (rotation == 2) {
				document.getElementById("ambulance").style.transform = "scaleX(-1)";
			} else {
				var deg = rotation * 90;
				document.getElementById("ambulance").style.transform = "rotate("
						+ deg + "deg)";
			}

			elem1.style.top = posY1 + 'px';
			elem1.style.left = posX1 + 'px';
		}
	}
	function policecarMove() {

		var elem2 = document.getElementById("newpolice");
		var posX2 = -90;
		var posY2 = 0;
		var speed = 2;
		var id = setInterval(frame, 11);
		var rotation = 0;
		function frame() {
			if (posX2 < 500 & posY2 == 0) {
				rotation = 0;
				posX2+= speed;
			} else if (posX2 == 500 & posY2 < 500) {
				rotation = 1;
				posY2+= speed;
			} else if (posX2 > 0 & posY2 == 500) {
				rotation = 2;
				posX2-= speed;
			} else {
				rotation = 3;
				posY2-= speed;
			}
			if (rotation == 2) {
				document.getElementById("newpolice").style.transform = "scaleX(-1)";
			} else {
				var deg = rotation * 90;
				document.getElementById("newpolice").style.transform = "rotate("
						+ deg + "deg)";
			}

			elem2.style.top = posY2 + 'px';
			elem2.style.left = posX2 + 'px';
		}
	}

	function helicopterMove() {
		var elem3 = document.getElementById("helicopter");
		var posX3 = 90;
		var posY3 = 0;
		var speed = 3;
		var id = setInterval(frame, 10);
		var rotation = 0;
		function frame() {
			if (posX3 < 630 & posY3 == 0) {
				rotation = 0;
				posX3+= speed;
			} else if (posX3 == 630 & posY3 < 651) {
				rotation = 1;
				posY3+= speed;
			} else if (posX3 > -30 & posY3 == 651) {
				rotation = 2;
				posX3-= speed;
			} else {
				rotation = 3;
				posY3-= speed;
			}
			if (rotation == 2) {
				document.getElementById("helicopter").style.transform = "scaleX(-1)";
			} else {
				var deg = rotation * 90;
				document.getElementById("helicopter").style.transform = "rotate("
						+ deg + "deg)";
			}

			elem3.style.top = posY3 + 'px';
			elem3.style.left = posX3 + 'px';
		}
	}
</script>
<body onload="myMove()"  onkeydown="move(event)">
	<iframe width="0" height="0"
		src="https://www.youtube.com/embed/iuJDhFRDx9M?autoplay=1"
		frameborder="0"
		allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
		></iframe>
	<div id="biggertrack">
		<div id="helicopter"></div>
		<div id="track">
			<div id="face">
				<img src="resources/Capture.PNG">
			</div>
			<div id="car"></div>
			<div id="newpolice"></div>
			<div id="ambulance"></div>
		</div>
	</div>
</body>
</html>