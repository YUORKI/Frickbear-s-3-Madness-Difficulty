with (oCamera3DMaze_Fredbear)
{
    LockOnTarget = instance_nearest(x, y, oInteractionPoint);
    LockX = LockOnTarget.x;
    LockY = LockOnTarget.y;
    LockZ = LockOnTarget.Height;
}
