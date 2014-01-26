TIMEUNTILRESTACK = 1200

var ApplicationController = function() {

}

ApplicationController.prototype.run = function(){
	this.setDragDrop();
	this.placeCurrentPogCounter()
}

ApplicationController.prototype.setDragDrop = function(){
	$('.slammer').draggable({ revert: true });
	self = this
	$('#pog-stack').droppable({
		activeClass: "game-board-highlight",
		hoverClass: "game-board-hover",
		accept: ".slammer",
		drop: self.afterMath
	})
}

ApplicationController.prototype.placeCurrentPogCounter = function() {
	$pogs = $('.pog')
	currentStackCount = $pogs.length
	$('.pog').eq(0).text(currentStackCount)
}

ApplicationController.prototype.removePogStackCounter = function() {
	$('.pog').eq(0).text()
}

ApplicationController.prototype.afterMath = function(e, obj){
	self.removePogStackCounter()
	self.movePogs()

	$.ajax({
	  type: "POST",
	  url: "/games/run_game/"
	}).done(function(pogOrientation){
		faceDownPogs = pogOrientation.face_down
		self.visualizeFaceDown(faceDownPogs)
		// Put the number of pogs written on the top one
		// append a span and center it, for the count
		// TAKE THEM OUT OF THE DOM
		// Set TimeOut and then RESET
	})
}

ApplicationController.prototype.visualizeFaceDown = function(faceDownPogs) {
	faceDownPogs.forEach(function(id) {
		$('.pog#' + id).addClass('face-down')
	})
}

ApplicationController.prototype.movePogs = function(){
	var pogs = $('.pog')
	$.each(pogs, function(i, elem){
		var pogPosition = $(elem).position()
		$(elem).animate({
			top:  pogPosition.top + self.randNum(150),
			left: pogPosition.left + self.randNum(300)
		})
	})
}

ApplicationController.prototype.randNum = function(scale){
	return (Math.round(Math.random()) * 2 - 1) * (Math.random() * scale)
}

$(document).ready(function() {
	myApplication = new ApplicationController()
	myApplication.run()
})