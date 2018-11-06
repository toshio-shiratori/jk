var JKPartCar = function(jsonData, parent = null) {
    JKPart.call(this, jsonData, parent);
};

JKPartCar.prototype.start = function(timerValue){
    JKPart.prototype.start.call(this, timerValue);
	this.setStory( 'init', timerValue, 1 );
};

JKPartCar.prototype.onStory = function(key, timerValue) {
    JKPart.prototype.onStory.call(this, key, timerValue);
	switch (key) {
	case 'init':
//	    this.setAnim('angle', 'roll', timerValue, new JKAnimLiner('{ "loopEnable":true, "loopReturn":false, "timerDistance":1000, "startValue":0, "endValue":360 }'));
		var rect = new JKPartRect( '{ "priority":25, "x":0, "y":0, "w":60, "h":20, "fillStyle":"rgb(0,0,255)" }');
	    rect.setAnim('a', 'a', timerValue, new JKAnimLiner('{ "loopEnable":false, "loopReturn":false, "timerDistance":1000, "startValue":-1.0, "endValue":-0.5 }'));
	    rect.setAnim('angle', 'roll', timerValue, new JKAnimLiner('{ "loopEnable":true, "loopReturn":false, "timerDistance":1000, "startValue":0, "endValue":360 }'));
		var rect1 = new JKPartRect( '{ "centerx":30, "centery":-10 ,"priority":25, "x":0, "y":20, "w":20, "h":20, "fillStyle":"rgb(128,0,255)" }');
		var rect2 = new JKPartRect( '{ "centerx":-10, "centery":-10 ,"priority":25, "x":40, "y":20, "w":20, "h":20, "fillStyle":"rgb(128,0,255)" }');
//	    rect1.setAnim('angle', 'roll', timerValue, new JKAnimLiner('{ "loopEnable":true, "loopReturn":false, "timerDistance":1000, "startValue":0, "endValue":360 }'));
	    rect1.setAnim('a', 'a', timerValue, new JKAnimLiner('{ "loopEnable":false, "loopReturn":false, "timerDistance":1000, "startValue":-1.0, "endValue":-0.5 }'));
//	    rect2.setAnim('angle', 'roll', timerValue, new JKAnimLiner('{ "loopEnable":true, "loopReturn":false, "timerDistance":1000, "startValue":0, "endValue":360 }'));
		rect.setChild( 'rect1', rect1 );
		rect.setChild( 'rect2', rect2 );
		this.setChild( 'rect', rect );
		break;
	}
};

inherits(JKPartCar, JKPart);
  
