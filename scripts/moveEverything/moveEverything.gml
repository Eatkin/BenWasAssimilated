//This is the order everything moves in whenever the player moves

var order;
order[0]=control;
order[1]=obj_ticker;
order[2]=parent_effect;		//Effects appear on collision with enemies and walls, so this definitely goes first
order[3]=parent_attack;
order[4]=parent_enemy;

for (var i=0; i<array_length_1d(order); i+=1)
	with (order[i])
		event_user(0);