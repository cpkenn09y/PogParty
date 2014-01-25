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
		drop: dropAction
	})
}

function dropAction(e, obj){
	movePogs()
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