/// @desc
var xRoom_1h = (room_width * 0.5);
var yRoom_1h = (room_height * 0.5);

var imspr = sprite_exists(img_spr) ? img_spr : spr_missing;
var emptyspr = sprite_exists(empty_spr) ? empty_spr : spr_missing;
var spr_w = sprite_get_width(imspr);
var spr_h = sprite_get_height(imspr);

var count_w = floor(spr_w / item_w);
var count_h = floor(spr_h / item_h);

var grid_xSize = (cell_w * count_w) + (padding_left + padding_right * count_w);
var grid_ySize = (cell_h * count_h) + (padding_top + padding_bottom * count_h);

draw_line(xRoom_1h, 0, xRoom_1h, room_height);
draw_line(0, yRoom_1h, room_width, yRoom_1h);
draw_line(xRoom_1h - 1, 0, xRoom_1h - 1, room_height);
draw_line(0, yRoom_1h - 1, room_width, yRoom_1h - 1);

if (
	!surface_exists(surf_vis) || 
	(surface_get_width(surf_vis) != grid_xSize || surface_get_height(surf_vis) != grid_ySize)
)
{
	surf_vis = surface_create(grid_xSize, grid_ySize);
	surface_set_target(surf_vis);	
	draw_clear_alpha(bgCol, bgAlpha);

	for (var _y = 0; _y < count_h; _y++)
	{
		for (var _x = 0; _x < count_w; _x++)
		{
			draw_sprite(
				sprite_index, 
				0, 
				0 + (padding_left + (_x * cell_w + (padding_right * _x))), 
				0 + (padding_top + (_y * cell_h + (padding_bottom * _y)))
			);
			gpu_set_blendmode_ext(bm_src_colour, bm_src_alpha);
			draw_sprite(
				sprite_index, 
				0, 
				0 + (padding_left + (_x * cell_w + (padding_right * _x))), 
				0 + (padding_top + (_y * cell_h + (padding_bottom * _y)))
			);
			gpu_set_blendmode(bm_normal);
			var paddingTotal_left = padding_left + padding_cell_left;
			var paddingTotal_top = padding_top + padding_cell_top;
			
			gpu_set_colourwriteenable(true, true, true, config_json[? "transparentFrameBg"]);
			draw_sprite_part(
				imspr,
				0,
				_x * item_w,
				_y * item_h,
				item_w,
				item_h,
				0 + (paddingTotal_left + (_x * cell_w + (padding_right * _x))),
				0 + (paddingTotal_top + (_y * cell_h + (padding_bottom * _y)))
			);
			gpu_set_colourwriteenable(true, true, true, true);
			if (export_useTruthMask && string_char_at(truthMask_table[| _y], _x+1) != truthMask_tChar)
			{
				draw_sprite(
					emptyspr, 
					0, 
					0 + (padding_left + (_x * cell_w + (padding_right * _x))), 
					0 + (padding_top + (_y * cell_h + (padding_bottom * _y)))
				);
			}
			
		}
	
	}
	
	surface_reset_target();
	
}

if (surface_exists(surf_vis))
{
	draw_surface(
		surf_vis, 
		xRoom_1h - (grid_xSize * 0.5), 
		yRoom_1h - (grid_ySize * 0.5)
	);
}

if (global.showInfotext)
{
	draw_set_colour(helpTextCol_shad);
	draw_text(0xf + helpTextShadow_dist[0], 0xf + helpTextShadow_dist[1], infoText);
	draw_set_colour(helpTextCol_fore);
	draw_text(0xf, 0xf, infoText);
	draw_set_colour(c_white);
}
