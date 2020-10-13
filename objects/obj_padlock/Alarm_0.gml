/// @description

var tileAtX=x;
var tileAtY=y;
var lay_id = layer_get_id("solidTiles");
var map_id = layer_tilemap_get_id(lay_id);

var cellx=floor(tileAtX/16);
var celly=floor(tileAtY/16);

tilemap_set(map_id,1,cellx,celly);	//Assign our solid tile as a dirt patch
mpGridAddCell(tileAtX,tileAtY);