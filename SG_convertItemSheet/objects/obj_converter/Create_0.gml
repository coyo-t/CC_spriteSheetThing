/// @desc
config_json = json_decode(file_text_openToString("cfg.json"));
global.language = config_json[? "lang"];
locale_strings = json_decode(file_text_openToString("locale/" + global.language + ".json"));

#region loading settings
var set = config_json[? "settings"];
global.showInfotext = set[? "showHelp"];

var setCol = set[? "textFore"];
helpTextCol_fore = make_colour_rgb(setCol[|0], setCol[|1], setCol[|2]);

var setColBg = set[? "textShad"];
helpTextCol_shad = make_colour_rgb(setColBg[|0], setColBg[|1], setColBg[|2]);

var setShadDist = set[? "textShadDist"];
helpTextShadow_dist = [setShadDist[|0], setShadDist[|1]];
#endregion

var config_paths = config_json[? "paths"];
var config_padding = config_json[? "padding"];
var config_itemProp = config_json[? "item"];
var config_frameProp = config_json[? "frame"];

//img_path = config_paths[? "itemSheet"];//get_open_filename("png image|*.png", "");
img_spr = sprite_add(config_paths[? "itemSheet"], 1, false, false, 0, 0);
empty_spr = sprite_add(config_paths[? "itemEmpty"], 1, false, false, 0, 0);
frame_spr = sprite_add(config_paths[? "itemFrame"], 1, false, false, 0, 0);
sprite_index = sprite_exists(frame_spr) ? frame_spr : spr_missing;

surf_vis = surface_create(1, 1);

var pdBtw = config_padding[? "betweenFrame"];
padding_left = pdBtw[| 0];
padding_right = pdBtw[| 1];
padding_top = pdBtw[| 2];
padding_bottom = pdBtw[| 3];

var inFrm = config_padding[? "insideFrame"];
padding_cell_left = inFrm[| 0];//bbox_left - x;
padding_cell_right = inFrm[| 1];//(sprite_width - (bbox_right + 1)) - x;
padding_cell_top = inFrm[| 2];//bbox_top - y;
padding_cell_bottom = inFrm[| 3];//(sprite_height - (bbox_bottom + 1)) - y;

var cl = config_json[? "bgColour"];
bgCol = make_colour_rgb(cl[|0], cl[|1], cl[|2]);
bgAlpha = cl[|3];

var prop = config_json[? "item"];
item_w = prop[? "width"];
item_h = prop[? "height"];

prop = config_json[? "frame"];
cell_w = prop[? "width"];
cell_h = prop[? "height"];

var xport = config_json[? "exportSettings"];
var xport_sub = xport[? "common"];
export_fileName = xport_sub[? "outName"];
export_image_subfolder = xport_sub[? "subfolder"];
export_truthMask_name = xport_sub[? "trueFalseMask"];
export_useTruthMask = xport_sub[? "useTrueFalseMask"];

xport_sub = xport[? "numbered"];
export_numbered_subfolder = xport_sub[? "subfolder"];
export_numbered_useTruthMask = xport_sub[? "useTrueFalseMask"];

xport_sub = xport[? "named"];
export_named_subfolder = xport_sub[? "subfolder"];
export_named_useTruthMask = xport_sub[? "useTrueFalseMask"];
var export_named_nameTable = xport_sub[? "nameTable"];

var truthMask_json = json_decode(file_text_openToString(export_truthMask_name));
truthMask_json = truthMask_json[? "truthMask"];

truthMask_tChar = truthMask_json[? "true"];
truthMask_fChar = truthMask_json[? "false"];
truthMask_table = truthMask_json[? "table"];

nameTable_json = json_decode(file_text_openToString(export_named_nameTable));
nameTable_json = nameTable_json[? "nameTable"];

infoText = locale_strings[? "helpText"];
window_set_caption(locale_strings[? "titleText"]);
