switch (Text)
{
    case "Battery Pack":
        image_index = 6;
        break;
    
    case "Distortion Clock":
        image_index = 4;
        break;
    
    case "Deathcoin":
        image_index = 2;
        break;
    
    case "Snowcone":
        image_index = 1;
        break;
    
    case "Golden Cupcake":
        image_index = 10;
        break;
    
    case "Beartrap":
        image_index = 11;
        break;
    
    case "Laser Doors":
        image_index = 3;
        break;
    
    case "King's Prize":
        image_index = 5;
        break;
    
    case "Mimic Ball":
        image_index = 12;
        break;
    
    case "Pickles":
        image_index = 13;
        break;
    
    case "High-Quality Lumber":
        image_index = 14;
        break;
    
    case "AR Mask":
        image_index = 15;
        break;
    
    case "Rewind Clock":
        image_index = 16;
        break;
    
    default:
        image_index = 1;
        break;
}

draw_sprite_stretched(sWindowBase, 0, x, y, 48, 48);
var VisualStock = min(Stock, 5);

for (var i = 0; i < VisualStock; i++)
{
    var StockOffset = (i - ((VisualStock - 1) / 2)) * 2;
    var _x = x + 8 + StockOffset;
    var _y = (y + 8) - StockOffset;
    draw_outline(16777215, sShopItemIcons, image_index, _x, _y);
    draw_sprite(sShopItemIcons, image_index, _x, _y);
}

draw_set_font(global.FontW97Black);
shader_set(TransparencyShader);

if (place_meeting(x, y, oMouseHitbox))
{
    var DescText = Description;
    
    if (Text == "Mimic Ball")
        DescText += (" (DUPLICATED ITEM: " + string(MimicText) + ")");
    
    if (ErrorTimer > 0)
    {
        DescText = ErrorMessage;
        ErrorTimer -= 0.016666666666666666;
    }
    
    draw_text_ext(9 + oCameraUI.x, 183 + oCameraUI.y, Text, 14, 294);
    draw_text_ext(9 + oCameraUI.x, 206 + oCameraUI.y, DescText, 14, 286);
    draw_text_ext(9 + oCameraUI.x, 283 + oCameraUI.y, "Price: " + string(AlteredPrice) + " Tokens", 14, 294);
    draw_text_ext(156 + oCameraUI.x, 283 + oCameraUI.y, "Remaining: " + string(Stock), 14, 294);
}
else
{
    ErrorTimer = 0;
}

draw_rectangle_color(x, y + 48, x + 47, y + 64, c_black, c_black, c_black, c_black, false);

if (AlteredPrice >= 100)
    draw_sprite(sCounterNumbers, floor(AlteredPrice / 100), x + 26, y + 50);

if (AlteredPrice >= 10)
    draw_sprite(sCounterNumbers, floor((AlteredPrice % 100) / 10), x + 33, y + 50);

draw_sprite(sCounterNumbers, AlteredPrice % 10, x + 40, y + 50);
draw_set_font(global.FontW97Black);
shader_reset();
