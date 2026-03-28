x = round(OriginalX + (dsin(MovementDirection) * MovementRange * dsin(BaseTimer + (Timer * TimerSpeed))));
y = round(OriginalY + (dcos(MovementDirection) * MovementRange * dsin(BaseTimer + (Timer * TimerSpeed))));
Timer += 1;
