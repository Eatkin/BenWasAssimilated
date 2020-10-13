//Moves to the position that is free and furthest away from the player, if it fails it moves randomly
//This is really retarded for some reason so probably don't use it

var dir;
var moved=false;
var distanceToPlayer=distance_to_object(obj_hero);
var minDist=distanceToPlayer;
var minDir=-1;

var _x=x;
var _y=y;

for (var i=0; i<4; i+=1)	{
	dir=i*90;
	var xto=x+global.gridSize*dcos(dir);
	var yto=y-global.gridSize*dsin(dir);
	if (!checkCollisionList(xto,yto))	{
		x=xto;
		y=yto;
		var dist=distance_to_object(obj_hero);
		if (dist<minDist)	{
			minDist=dist;
			minDir=i;
		}
		x=_x;
		y=_y;
	}
}

if (minDir=-1)
	return false;
	
var xto=x+global.gridSize*dcos(minDir);
var yto=y-global.gridSize*dsin(minDir);

//if we've found a position that's further away, we move there, otherwise we randomly move
if (minDist<distanceToPlayer and !checkCollisionList(xto,yto))	{
	x=xto;
	y=yto;
	moved=true;
}
else
	moved=moveRandom();

return moved;