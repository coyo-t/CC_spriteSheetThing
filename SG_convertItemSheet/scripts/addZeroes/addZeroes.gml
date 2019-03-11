///@arg array
///@arg number

var arr = argument0;
var num = argument1;
var str = "";
var foundSentinel = false;

for (var i = 0; i < array_length_1d(arr); i++)
{
	if (string_char_at(arr[i], 1) == "#")
	{
		foundSentinel = true;
		if (string_length(arr[i]) == 1)
		{
			str += string(num);	
			
		} else {
			for (var j = 0; j < max(0, string_length(arr[i]) - string_length(string(num))); j++)
			{
				str += "0";
			}
			str += string(num);	
			
		}
		
	} else {
		str += arr[i];	
	}
	
}

if (!foundSentinel)
	return str + string(num);
else
	return str;
