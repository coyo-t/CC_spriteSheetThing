///@arg nametable
///@arg x
///@arg y
var nameTable = argument0;
var _x = argument1;
var _y = argument2;
var randomReturn = string_letters(base64_encode(string(random_range(0, 2048))));

var yNameTable = nameTable[| _y];
var xNameTable;

if (yNameTable != 0 && yNameTable != undefined)
{
	xNameTable = yNameTable[| _x];
} else {
	return string(randomReturn);	
}

if (xNameTable != 0 && xNameTable != undefined)
{
	return xNameTable
} else {
	return string(randomReturn);	
}
