var Vibration = (Frame / 5) + 1;
var FrameVal = 1 - (floor(Frame) % 3);
var Offset = (round(((FrameVal * 2) / Vibration) * 80) / 10) + (sqrt(Frame) * OriginX * 2);
var Head = (JumpscareID * 2) + 1;
var Body = JumpscareID * 2;

if (sprite_index == sJumpscareSalvage)
{
    Head = JumpscareID;
    Body = 0;
}

var _JumpX = JumpX;
var _JumpY = JumpY;
var _SizeBody = SizeBody;
var _SizeHead = SizeHead;
var _JumpAngle = JumpAngle;
var _Alpha = Alpha;

with (oExtras_AnimatronicGallery)
{
    surface_set_target(OverGUISurf);
    
    if (other.sprite_index == sJumpscare_Fredbear)
    {
        draw_sprite_ext(other.sprite_index, min(floor(other.Frame / 2), 45), 0, 0, 1, 1, 0, -1, _Alpha);
    }
    else
    {
        draw_sprite_ext(other.sprite_index, Body, _JumpX + Offset, _JumpY, _SizeBody, _SizeBody, _JumpAngle, -1, _Alpha);
        draw_sprite_ext(other.sprite_index, Head, _JumpX, _JumpY, _SizeHead, _SizeHead, Offset + _JumpAngle, -1, _Alpha);
    }
    
    surface_reset_target();
}

if (instance_exists(oMicrogame_Extras))
{
    draw_sprite_ext(sprite_index, Body, _JumpX + Offset, _JumpY, _SizeBody, _SizeBody, _JumpAngle, -1, _Alpha);
    draw_sprite_ext(sprite_index, Head, _JumpX, _JumpY, _SizeHead, _SizeHead, Offset + _JumpAngle, -1, _Alpha);
}
