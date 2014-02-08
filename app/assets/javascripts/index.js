TIMEUNTILRESTACK = 1650
TIMEUNTILCOLLECT = 800
TIMEUNTILCOLLECTEDDISAPPEAR = (TIMEUNTILRESTACK - TIMEUNTILCOLLECT) / 2

var ApplicationController = function(game_id) {
	this.game_id = game_id
}

ApplicationController.prototype.run = function(){
	this.setDragDrop();
	this.placeCurrentPogCounter()
}

ApplicationController.prototype.setDragDrop = function(){
	$('.slammer').draggable({ revert: true });
	self = this
	$('.pog-stack').droppable({
		activeClass: "game-board-highlight",
		hoverClass: "game-board-hover",
		accept: ".slammer",
		drop: self.afterMath
	})
}

ApplicationController.prototype.placeCurrentPogCounter = function() {
	$pogs = $('.pog')
	currentStackCount = $pogs.length
	if(currentStackCount == 0) {
		alert("congratulations on winning the game")
	}
	$('#stack-counter').text(currentStackCount)

}

ApplicationController.prototype.removePogStackCounter = function() {
	$('#stack-counter').text('')
}

ApplicationController.prototype.afterMath = function(e, obj){
	self.removePogStackCounter()
	self.movePogs()

	$.ajax({
	  type: "POST",
	  url: "/games/"+self.game_id+"/run_game/"
	}).done(function(pogOrientation){
		faceDownPogs = pogOrientation.face_down
		faceUpPogs = pogOrientation.face_up
		// self.visualizeFaceDown(faceDownPogs)
		setTimeout(function(){ self.collectFaceUpPogs(faceUpPogs) },TIMEUNTILCOLLECT)
		setTimeout(function(){ self.updatePostAfterMath() },TIMEUNTILRESTACK)
	})
}

ApplicationController.prototype.collectFaceUpPogs = function(faceUpPogs) {
	faceUpPogs.forEach(function(pog) {
		$('.pog#' + pog.id).addClass('face-up')
	})
	$('.face-up').animate({
		top:  566,
		left: 0
	})
	setTimeout(function(){ self.removeFaceUpFromDOM() },TIMEUNTILCOLLECTEDDISAPPEAR)
}

ApplicationController.prototype.removeFaceUpFromDOM = function() {
	$('.face-up').remove()
}

ApplicationController.prototype.updatePostAfterMath = function(){
	self.resetPogToCenter()
	self.placeCurrentPogCounter()
}

ApplicationController.prototype.resetPogToCenter = function() {
	$('.pog').removeAttr("style")
}

// ApplicationController.prototype.visualizeFaceDown = function(faceDownPogs) {
// 	faceDownPogs.forEach(function(pog) {
// 		$('.pog#' + pog.id).addClass('face-down')
// 	})
// }

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
	game_id = Number($('.game-board')[0].id)
	myApplication = new ApplicationController(game_id)
	myApplication.run()
});