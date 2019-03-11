/// @desc
global.showInfotext ^= keyboard_check_pressed(vk_f1);

#region save default
if (keyboard_check_pressed(vk_f3))
{
	if (surface_exists(surf_vis))
	{
		surface_save(surf_vis, export_image_subfolder + export_fileName + ".png");

	}
	
}
#endregion

#region save numbered
if (keyboard_check_pressed(vk_f2))
{
	//split the string up for the numbering
	//if no #'s are found, just slap the number on the end of the outName
	var splitName = splitString(export_fileName, "#");

	var spr_w = sprite_get_width(img_spr);
	var spr_h = sprite_get_height(img_spr);

	var count_w = floor(spr_w / item_w);
	var count_h = floor(spr_h / item_h);

	var surfaces = surface_create(sprite_width, sprite_height);

	var count = 0;

	for (var _y = 0; _y < count_h; _y++)
	{
		for (var _x = 0; _x < count_w; _x++)
		{
			if (
				!export_numbered_useTruthMask ||
				(export_numbered_useTruthMask && string_char_at(truthMask_table[| _y], _x+1) == truthMask_tChar)
			)
			{
				surface_set_target(surfaces);
				draw_surface_part(
					surf_vis,
					0 + (padding_left + (_x * cell_w + (padding_right * _x))), 
					0 + (padding_top + (_y * cell_h + (padding_bottom * _y))),
					cell_w,
					cell_h,
					0,
					0
				);
				surface_reset_target();
				surface_save(surfaces, export_numbered_subfolder + addZeroes(splitName, count) + ".png");
				count++;
			}
			
		}
		
	}
	surface_free(surfaces);

}
#endregion

#region save named
if (keyboard_check_pressed(vk_f4))
{
	//split the string up for the numbering
	//if no #'s are found, just slap the number on the end of the outName

	var spr_w = sprite_get_width(img_spr);
	var spr_h = sprite_get_height(img_spr);

	var count_w = floor(spr_w / item_w);
	var count_h = floor(spr_h / item_h);

	var surfaces = surface_create(sprite_width, sprite_height);

	var count = 0;

	for (var _y = 0; _y < count_h; _y++)
	{
		for (var _x = 0; _x < count_w; _x++)
		{
			if (
				!export_named_useTruthMask ||
				(export_named_useTruthMask && string_char_at(truthMask_table[| _y], _x+1) == truthMask_tChar)
			)
			{
				surface_set_target(surfaces);
				draw_surface_part(
					surf_vis,
					0 + (padding_left + (_x * cell_w + (padding_right * _x))), 
					0 + (padding_top + (_y * cell_h + (padding_bottom * _y))),
					cell_w,
					cell_h,
					0,
					0
				);
				surface_reset_target();
				surface_save(surfaces, export_named_subfolder + getNametableName(nameTable_json, _x, _y) + ".png");
				count++;
			}
			
		}
		
	}
	surface_free(surfaces);

}
#endregion

if (keyboard_check_pressed(vk_f5))
{
	room_restart();
}
