///@arg path

var _f = file_text_open_read(argument0);
var str = "";

if (file_exists(argument0))
{
	while (!file_text_eof(_f))
	{
		str += file_text_readln(_f);
	}
	file_text_close(_f);
}
return str;