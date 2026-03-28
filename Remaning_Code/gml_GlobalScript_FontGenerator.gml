TextOrder = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~ ¡¿áéíóú™∎ϾⅠⅡⅢⅣ";
global.FontW97Black = font_add_sprite_ext(sFont, TextOrder, true, 1);
global.FontW97White = font_add_sprite_ext(sFontColor, TextOrder, true, 1);
global.FontHanddrawn = font_add_sprite_ext(sFontHanddrawn, TextOrder, true, 1);
TextOrder = "ABCDEFGHIJKLMNOPQRSTUVWXYZ():;[]abcdefghijklmnopqrstuvwxyz'?!.,-0123456789/'\":~ ";
global.FontGameboy = font_add_sprite_ext(sFontGameboy, TextOrder, false, 1);
draw_set_font(global.FontW97Black);
draw_set_halign(fa_left);
