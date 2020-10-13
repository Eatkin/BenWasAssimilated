//These functions are slow and cause slow-down in HTML5 target so will just call them once here

var layidSolid=layer_get_id("solidTiles");
global.solidMap = layer_tilemap_get_id(layidSolid);
var layidNonSolid=layer_get_id("otherTiles");
global.nonSolidMap=layer_tilemap_get_id(layidNonSolid);
global.tileMapWidth=tilemap_get_width(global.solidMap);
global.tileMapHeight=tilemap_get_height(global.solidMap);