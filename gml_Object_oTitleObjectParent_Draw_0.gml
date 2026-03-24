shader_set(shFog);
shader_set_uniform_f(shader_get_uniform(shFog, "fogStart"), global.FogStart);
shader_set_uniform_f(shader_get_uniform(shFog, "fogEnd"), global.Fog);

function fx(arg0, arg1)
{
    return round((x + (arg0 * dcos(image_angle * -1))) - (arg1 * dsin(image_angle * -1)));
}

function fy(arg0, arg1)
{
    return round(y + (arg1 * dcos(image_angle * -1)) + (arg0 * dsin(image_angle * -1)));
}

function fz(arg0)
{
    return round(depth + arg0);
}
