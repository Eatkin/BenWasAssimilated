/// @description

if (collectible)
	exit;

if (counter==1)	{
	counter-=1;
	exit
}

visible=true;
stepOn=false;
var xto=x+global.gridSize*dcos(dir);
var yto=y-global.gridSize*dsin(dir);
if (collisionAt(xto,yto))	{
	instance_destroy();
	playSound(snd_projectileHitWall,0,false);
}
else {
	x=xto;
	y=yto;
}