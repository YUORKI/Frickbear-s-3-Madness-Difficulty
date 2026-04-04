y = BaseY + ((dsin(BounceFrame) * 10) / ((floor(BounceFrame / 90) * 2) + 1));
BounceFrame = min(BounceFrame + 45, 900);

if (Enter == true)
{
    x += (((room_width / 2) - x) / 10);
}
else
{
    x += LeaveAcceleration;
    LeaveAcceleration -= 1;
}

if (x < -320)
    instance_destroy();

image_index = CurrentImage;

if (Image != CurrentImage)
{
    CurrentImage = Image;
    BounceFrame = 0;
}
