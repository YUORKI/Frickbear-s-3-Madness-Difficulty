var ID = UnknownEnum.Value_18;
var AI = global.AILevels[ID];

if (AI == 0)
    exit;

if (!audio_is_playing(sfxRWQ))
{
    audio_sound_gain(sfxRWQ, 0, 0);
    audio_sound_gain(sfxRWQFade, 0, 0);
    simple_sound(sfxRWQ, x - oCamera.x, y - oCamera.y, true, 0.5);
    simple_sound(sfxRWQFade, x - oCamera.x, y - oCamera.y, true, 1);
}

Flashed = global.Flashlight && Anger > 0 && abs(o3DMouse.x - 1100) < 256 && !global.CamUp;
var ScaleSize = 0.5 * (0.75 + (Anger * 0.25));

function corrupt_offset()
{
    var CorruptionDegree = (1 / max(Anger, 0.25)) + (Flashed * 32);
    return random_range(1 - CorruptionDegree, 1 + CorruptionDegree);
}

if (Anger > 0)
{
    var x1 = x + (128 * dcos(image_angle) * ScaleSize);
    var y1 = y + (128 * dsin(image_angle) * ScaleSize);
    var x2 = x - (128 * dcos(image_angle) * ScaleSize);
    var y2 = y - (128 * dsin(image_angle) * ScaleSize);
    var zTop = 256 + (256 * ScaleSize);
    var zBottom = 256 - (256 * ScaleSize);
    var TextureX = Flashed / 2;
    var TextureWidth = TextureX + 0.5;
    var CorruptionDegree = 0.01 / max(Anger, 0.25);
    var AlphaDegree = power(Anger, 1.5) * random_range(1 - CorruptionDegree, 1 + CorruptionDegree);
    
    if (Anger > 0)
        AlphaDegree = max(AlphaDegree, 0.1);
    
    audio_sound_gain(sfxRWQ, AlphaDegree * Anger * Anger, 0);
    audio_sound_gain(sfxRWQFade, Anger * Flashed, 0);
    shader_set(TransparencyShaderAlpha);
    shader_set_uniform_f(shader_get_uniform(TransparencyShaderAlpha, "Alpha_Value"), AlphaDegree);
    x1 += corrupt_offset();
    x2 += corrupt_offset();
    y1 += corrupt_offset();
    y2 += corrupt_offset();
    zTop += corrupt_offset();
    zBottom += corrupt_offset();
    var Texture = sprite_get_texture(sRXQOffice, 0);
    VertexBuffer = vertex_create_buffer();
    vertex_begin(VertexBuffer, global.VertexFormat);
    vertex_set_point(VertexBuffer, x1, y1, zTop, TextureX, 0);
    vertex_set_point(VertexBuffer, x2, y2, zBottom, TextureWidth, 1);
    vertex_set_point(VertexBuffer, x1, y1, zBottom, TextureX, 1);
    vertex_set_point(VertexBuffer, x1, y1, zTop, TextureX, 0);
    vertex_set_point(VertexBuffer, x2, y2, zBottom, TextureWidth, 1);
    vertex_set_point(VertexBuffer, x2, y2, zTop, TextureWidth, 0);
    vertex_end(VertexBuffer);
    vertex_submit(VertexBuffer, pr_trianglelist, Texture);
    vertex_delete_buffer(VertexBuffer);
    shader_reset();
}
else
{
    audio_sound_gain(sfxRWQ, 0, 0);
    audio_sound_gain(sfxRWQFade, 0, 0);
}

var FadeSpeed = ((1 + (AI / 10)) / 3) * (1 + max(0, global.Temperature / 20));

if (Flashed)
{
    Anger -= (oCamera.FlashlightPower / 180);
    
    if (Anger <= 0)
        Anger = -0.5;
}
else
{
    Anger += (FadeSpeed / 1200);
}

Frame += 1;

if (Anger >= 1)
    jumpscare(ID, -1);

enum UnknownEnum
{
    Value_18 = 18
}
