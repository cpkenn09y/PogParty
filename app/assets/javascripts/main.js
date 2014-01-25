$(function(){

	function PogCollection(){
		this.pogs = [];
	}

	PogCollection.prototype.updatePogs = function(){
		for(var i=0; i<this.pogs.length; i++){
			if()
		}
	}

	function Pog(status){
		this.status = status;
	}

	function dropSlammer(){

	}

	/////////////////////////

	var pogCollection = new PogCollection();
	for(var i=0; i<10; i++){
		pogCollection.flipped.push(new Pog('unflipped'));
	}

	$('.slammer-on-deck').draggable({
		revert: "invalid"
	});

	$('.playing-board').droppable({
		accept: ".slammer-on-deck",
		drop: function(){
			// calls pogCollection.updatePogs();
			// console.log("shits dropped!");
		}
	})

	console.log('shit works');
	console.log(pogCollection);
})