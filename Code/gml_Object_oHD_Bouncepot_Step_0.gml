if (Active)
    Frame += 0.2;

image_index = floor(Frame);

if (Frame == 2)
{
    with (oHD_Guard)
    {
        YVelocity = -6;
        SpringJump = true;
    }
}

if (Frame >= 7)
{
    Frame = 0;
    Active = false;
}
