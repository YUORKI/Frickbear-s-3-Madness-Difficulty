ButtonID = [0, 0];
BaseY = y;
Timer = 0;

function PositionTest(arg0, arg1)
{
    if (instance_exists(arg0) && floor((Timer % 1) * 6) == arg1 && global.MonitorSystem == "Vents")
    {
        if (arg0.VentY > 1)
            exit;
        
        var ButtonX = oCameraUI.x + 320 + (arg0.VentX * 80);
        var ButtonY = oCameraUI.y + 164 + (arg0.VentY * 80);
        draw_sprite(sVentAnimatronic, arg1, ButtonX, ButtonY);
    }
}

function draw_salvage_wires()
{
    with (oSalvage_VentCrawler)
    {
        for (var i = 1; i < array_length(Path); i++)
        {
            var XPrev = Path[i - 1][0];
            var YPrev = Path[i - 1][1];
            var XCur = Path[i][0];
            var YCur = Path[i][1];
            var XNext, YNext;
            
            if (i < (array_length(Path) - 1))
            {
                XNext = Path[i + 1][0];
                YNext = Path[i + 1][1];
            }
            
            var Direction = point_direction(XPrev, YPrev, XCur, YCur);
            var ImageType = 0;
            var XScale = 1;
            var YScale = 1;
            
            if (i == (array_length(Path) - 1))
            {
                ImageType = 0;
            }
            else if (point_direction(Path[i][0], Path[i][1], XNext, YNext) == Direction)
            {
                ImageType = 1;
            }
            else
            {
                ImageType = 2;
                
                if ((YCur - YPrev) == 1 && (XNext - XCur) == -1)
                    Direction = 270;
                
                if ((YCur - YPrev) == 1 && (XNext - XCur) == 1)
                    Direction = 180;
                
                if ((YCur - YPrev) == -1 && (XNext - XCur) == -1)
                    Direction = 0;
                
                if ((YCur - YPrev) == -1 && (XNext - XCur) == 1)
                    Direction = 90;
                
                if ((XCur - XPrev) == -1 && (YNext - YCur) == -1)
                    Direction = 180;
                
                if ((XCur - XPrev) == -1 && (YNext - YCur) == 1)
                    Direction = 90;
                
                if ((XCur - XPrev) == 1 && (YNext - YCur) == -1)
                    Direction = 270;
                
                if ((XCur - XPrev) == 1 && (YNext - YCur) == 1)
                    Direction = 0;
                
                draw_text((XCur * 48) + x, (YCur * 48) + y, Direction);
            }
            
            var Img = (ImageType * 2) + 1 + floor((Timer * 2) % 2);
            
            if (ImageType == 0 && Vanishing)
                Img = 0;
            
            if (!Vanishing || (floor(VanishFrame / 4) % 2) == 0)
            {
                with (other)
                {
                    if (ButtonID[0] == XCur && ButtonID[1] == YCur)
                        draw_sprite_ext(sBossSalvage_Wires, Img, x, y, 1, 1, Direction, c_white, 1);
                }
            }
        }
    }
}
