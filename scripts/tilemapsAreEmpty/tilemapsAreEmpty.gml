//Cycle through the entire map and if we find a tile, we return false

var tileCount=0;

var hrepeats=global.tileMapWidth;
var vrepeats=global.tileMapHeight;
var map=global.solidMap;

var _firstTilex=-1;
var _firstTiley=-1;
repeat (2)	{
	for (var i=0; i<hrepeats; i+=1)
		for (var j=0; j<vrepeats; j+=1)	{
			var tileToCheck=tilemap_get(map,i,j);
			if (!tile_get_empty(tileToCheck))	{
				tileCount+=1;
				if (_firstTilex==-1)	{
					_firstTilex=i;
					_firstTiley=j;
				}
			}
		}
		
	//Switch layers for the repeat
	var map=global.nonSolidMap;
}
	
//Update BenIV's tiles
//This is only called from obj_BenIV so we can safely do this
firstTileX=_firstTilex;
firstTileY=_firstTiley;

return tileCount;