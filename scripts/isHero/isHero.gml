var obj=object_index;
//Optional argument
if (argument_count>0)
	obj=argument[0];

if (obj==obj_hero or object_is_ancestor(obj,obj_hero))
	return true;
	
return false;