//Returns if you will collide with a thing

var xx=argument0;
var yy=argument1;


//Here's a specific case for unlocking locks
var padlock=instance_place(xx,yy,obj_padlock);
if (isHero() and padlock!=noone)	{
		var key=keyItemHolding;
		var col=padlock.colour;
		var destroyed=false;
		switch (col)	{
			case Colour.Yellow:
				if (key==obj_yellowKey)
					destroyed=true;
				break;
			case Colour.Blue:
				if (key==obj_blueKey)
					destroyed=true;
				break;
			case Colour.Red:
				if (key==obj_redKey)
					destroyed=true;
				break;
		}
		
		if (destroyed)
			instance_destroy(padlock);
		
		//We return NOT destroyed because returning true means we did collide
		openedALock=destroyed;
		return !destroyed;
	}

/*var lay_id = layer_get_id("solidTiles");
var map_id = layer_tilemap_get_id(lay_id);*/

var cellx=floor(xx/16);
var celly=floor(yy/16);

/*var tileToCheck=tilemap_get(map_id,cellx,celly);
if (!tile_get_empty(tileToCheck))*/
//Replace this with grid checking because tile checking was failing
var gridValue=mp_grid_get_cell(global.pathfindingGrid,cellx,celly);
var cellOccupied=(gridValue==-1) ? true : false;
if (cellOccupied)
	return true;
	
	
return false;