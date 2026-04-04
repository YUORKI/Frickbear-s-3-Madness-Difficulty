WaitForFlip = false;
CurrentCam = 0;
Exposure = 0;

function get_phantom_list()
{
    if (global.ChallengeTitle == "Ladies' Night")
    {
        global.AILevels[UnknownEnum.Value_19] = 20;
        return [3, 5, 6, 0, 0, 0, 0, 0];
    }
    else if (global.ChallengeTitle == "Even a Bear!")
    {
        global.AILevels[UnknownEnum.Value_19] = 20;
        return [0, 0, 2, 0, 0, 0, 0, 0];
    }
    else
    {
        return [1, 2, 3, 4, 5, 6, 0, 0];
    }
}

CurrentCams = array_concat([0], array_shuffle(get_phantom_list()));
AmountOfPhantoms = 0;
Aggro = 0;

enum UnknownEnum
{
    Value_19 = 19
}
