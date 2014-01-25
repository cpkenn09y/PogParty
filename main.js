$(function(){

	function PogCollection(){
		this.flipped 	 = [];
		this.unflipped = [];	
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
			// calls dropSlammer();
			// console.log("shits dropped!");
		}
	})

	console.log('shit works');
	console.log(pogCollection);
})