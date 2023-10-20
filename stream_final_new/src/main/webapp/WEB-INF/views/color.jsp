<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<link rel="stylesheet" href="/css/colorPick.css">
    <!-- The following line applies the dark theme -->
    <link rel="stylesheet" href="/css/colorPick.dark.theme.css">
	<style>
		.picker {
			border-radius: 5px;
			width: 36px;
			height: 36px;
			cursor: pointer;
			-webkit-transition: all linear .2s;
			-moz-transition: all linear .2s;
			-ms-transition: all linear .2s;
			-o-transition: all linear .2s;
			transition: all linear .2s;
			border: thin solid #eee;
		}
		.picker:hover {
			transform: scale(1.1);
		}
	</style>
</head>
<body>


	<!--div class id 값만 변경하면 됨 -->
	<div class="picker" id="picker1"></div>



	<script src="js/jquery-3.1.1.min.js"></script>
	<script src="../src/colorPick.js"></script>
	<script>
		$("#picker1").colorPick({
			'initialColor' : '#8e44ad',
			'palette': ["#1abc9c", "#16a085", "#2ecc71", "#27ae60", "#3498db", "#2980b9", "#9b59b6", "#8e44ad", "#34495e", "#2c3e50", "#f1c40f", "#f39c12", "#e67e22", "#d35400", "#e74c3c", "#c0392b", "#ecf0f1"],
			'onColorSelected': function() {
				console.log("The user has selected the color: " + this.color)
				this.element.css({'backgroundColor': this.color, 'color': this.color});
			}
		});

        $("#picker2").colorPick({
			'initialColor' : '#34495e',
			'palette': ["#34495e", "#2c3e50", "#f1c40f", "#f39c12", "#e67e22", "#d35400", "#e74c3c", "#c0392b", "#ecf0f1"],
			'onColorSelected': function() {
				console.log("The user has selected the color: " + this.color)
				this.element.css({'backgroundColor': this.color, 'color': this.color});
			}
		});
	</script>
</body>
</html>