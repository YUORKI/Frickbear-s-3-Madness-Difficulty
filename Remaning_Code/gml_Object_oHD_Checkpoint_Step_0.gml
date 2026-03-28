image_index = 0;

if (Active)
{
    Frame += 0.2;
    image_index = 1 + (floor(Frame) % 6);
}
