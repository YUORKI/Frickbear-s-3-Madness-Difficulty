function layer_shader_start()
{
    if (event_type == ev_draw)
    {
        if (event_number == 0)
        {
            shader_set(shFog);
            shader_set_uniform_f(shader_get_uniform(shFog, "fogStart"), global.FogStart);
            shader_set_uniform_f(shader_get_uniform(shFog, "fogEnd"), global.Fog);
        }
    }
}

function layer_shader_end()
{
    if (event_type == ev_draw)
    {
        if (event_number == 0)
            shader_reset();
    }
}

var lay_id = layer_get_id("Decorations");
layer_script_begin(lay_id, layer_shader_start);
layer_script_end(lay_id, layer_shader_end);
lay_id = layer_get_id("Decorations2");
layer_script_begin(lay_id, layer_shader_start);
layer_script_end(lay_id, layer_shader_end);
lay_id = layer_get_id("Wall");
layer_script_begin(lay_id, layer_shader_start);
layer_script_end(lay_id, layer_shader_end);
