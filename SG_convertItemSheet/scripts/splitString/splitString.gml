///@arg string
///@arg sentinel
var outName = argument0;
var sentinel = string(argument1);
var modName = [];
modName[0] = "";
var lastChar = "";
	
for (var i = 0; i < string_length(outName); i++)
{
	var char = string_char_at(outName, i + 1);
	if ((char == sentinel && lastChar != sentinel) || (char != sentinel && lastChar == sentinel))
	{
			modName[array_length_1d(modName)] = "";
	}
	modName[array_length_1d(modName) - 1] += char;
	lastChar = char;
		
}

return modName;
