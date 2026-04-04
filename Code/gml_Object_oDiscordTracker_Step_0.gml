np_update();

if (UpdateDelay <= 0 && CurrentRoom != room)
    update_discord();

if (UpdateDelay > 0)
    UpdateDelay--;
