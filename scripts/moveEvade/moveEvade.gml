//This seems redundant but it calls moveRandom() if there is a collision, otherwise we do nothing

var hasMoved=true;

if (checkCollisionList(x,y))
	hasMoved=moveRandom();
	
//This can fail if we're colliding with something and also can't move anywhere
return hasMoved;