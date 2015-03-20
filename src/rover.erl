-module(rover).
-compile(export_all). 
-record(rover,{position={0,0}, direction=east}).

m(R = #rover{ position = {X,Y}, direction = D}) ->  
	R#rover{ position = case D of north -> {X, Y+1}; south -> {X, Y-1}; east -> {X+1, Y}; west -> {X-1, Y} end }.

l(R = #rover{direction = D}) -> 	
	R#rover{ direction = case D of north -> west; south -> east; east -> north; west -> south end }.

r(R = #rover{direction = D}) -> 	
	R#rover{ direction = case D of north -> east; south -> west; east -> south;  west -> north end }.

execute([], Rover) -> Rover;
execute([H | L], Rover) -> execute(L, ?MODULE:H(Rover)).

start() -> execute([l,r,r,l,m,m,m], #rover{}).