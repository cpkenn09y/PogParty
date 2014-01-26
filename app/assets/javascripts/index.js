$(function(){
	setDragDrop();
	console.log('shit works');
})

function setDragDrop(){
	$('.slammer').draggable({ revert: "invalid" });

	$('#pog-stack').droppable({
		activeClass: "game-board-highlight",
		hoverClass: "game-board-hover",
		accept: ".slammer",
		drop: afterMath
	})
}

function afterMath(e, obj){
	movePogs()

	$.ajax({
	  type: "POST",
	  url: "/games/run_game/"
	}).done(function(pogOrientation){
		faceDownPogs = pogOrientation.face_down
		visualizeFaceDown(faceDownPogs)
		// TAKE THEM OUT OF THE DOM
	})
}

function visualizeFaceDown(faceDownPogs) {
	faceDownPogs.forEach(function(id) {
		$('.pog#' + id).addClass('face-down')
	})
}

function movePogs(){
	var pogs = $('.pog')
	$.each(pogs, function(i, elem){
		var pogPosition = $(elem).position()
		$(elem).animate({
			top:  pogPosition.top + randNum(150),
			left: pogPosition.left + randNum(300)
		})
	})
}

function randNum(scale){
	return (Math.round(Math.random()) * 2 - 1) * (Math.random() * scale)
}