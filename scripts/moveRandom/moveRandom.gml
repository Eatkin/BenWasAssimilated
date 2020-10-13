//Moves in a random direction

var dir=irandom(3);		//Pick a random direction
dir*=90;				//Convert to an angle

var moved=false;

for (var i=0; i<4; i+=1)	{
	var xto=x+global.gridSize*dcos(dir);
	var yto=y-global.gridSize*dsin(dir);
	
	if (!checkCollisionList(xto,yto))	{
		x=xto;
		y=yto;
		return true;
	}
	
	dir+=90;
}

return moved;