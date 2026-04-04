function draw_billboard(arg0, arg1, arg2, arg3, arg4, arg5, arg6)
{
    shader_set(BillboardShader);
    matrix_set(2, matrix_build(arg2, arg3, arg4, 0, 0, 0, arg5, arg6, 1));
    draw_sprite_ext(arg0, arg1, 0, 0, arg5, arg6, 0, -1, 1);
    matrix_set(2, matrix_build_identity());
    shader_reset();
}
