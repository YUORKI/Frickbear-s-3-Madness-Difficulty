function get_animdude_levels(arg0)
{
    var O = -1;
    var F = oAnimdude_Floor;
    var I = oAnimdude_Wall;
    var W = oAnimdude_SpikeTrap;
    var w = oAnimdude_SpikeTrap2;
    var Y = oAnimdude_SpikeTrap3;
    var Q = oAnimdude_Fireball;
    var T = oAnimdude_FakeFloor;
    var G = oAnimdude_Trophy;
    var S = oAnimdude_Switch;
    var X = oAnimdude_Dragon;
    var t = oAnimdude_FakeTrophy;
    var LevelQueue = [];
    
    if (arg0)
    {
        var StarterLevel = choose([[O, O, O, O, O, O, O, O, O, I], [O, O, O, O, O, O, O, O, O, I], [O, O, O, O, O, W, W, W, O, O], [O, O, O, O, O, O, O, O, O, O], [F, F, F, F, F, F, F, F, F, F]], [[O, O, O, O, O, O, O, O, O, I], [O, O, O, O, O, O, O, O, O, I], [O, O, O, O, O, O, w, O, W, O], [O, O, O, O, O, O, O, O, O, O], [F, F, F, F, F, F, F, F, F, F]], [[O, O, O, O, O, O, O, O, O, I], [O, O, O, O, O, O, O, O, O, I], [O, O, O, O, O, W, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [F, F, F, O, F, F, F, O, F, F]]);
        array_push(LevelQueue, [[O, O, O, O, O, O, O, O, Q, O], [O, O, O, O, O, O, O, O, O, O], [O, O, Q, O, O, O, O, O, O, O], [O, I, Q, O, O, O, O, I, Q, O], [F, F, O, F, F, O, F, F, O, F]]);
        array_push(LevelQueue, [[O, O, O, O, O, O, O, W, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, F, F, O, O], [O, O, O, F, F, O, O, O, O, O], [F, F, O, O, O, O, O, O, O, F]]);
        array_push(LevelQueue, [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, I, O, O, O, O, Y, I, O], [F, F, F, F, F, F, F, F, F, F]]);
        array_push(LevelQueue, [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, Y, I, I, O], [F, F, F, F, F, F, F, F, F, F]]);
        array_push(LevelQueue, [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, T, O, O, O, O], [F, F, O, O, F, F, O, O, F, F]]);
        array_push(LevelQueue, [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, W, W, W, O, O, O], [O, O, O, O, O, O, O, O, O, O], [F, F, O, F, F, F, F, F, O, F]]);
        array_push(LevelQueue, [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, W, W, W, O, O, O, w, O, O], [O, O, O, O, O, O, O, O, O, O], [F, F, F, F, F, F, F, F, F, F]]);
        array_push(LevelQueue, [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, W, O, O, O], [O, O, T, O, O, O, O, O, O, O], [F, F, F, O, O, F, F, F, O, F]]);
        array_push(LevelQueue, [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, W, O, O, O, W, W, O, O, w], [O, O, O, O, O, O, O, O, O, O], [F, F, F, O, F, F, F, F, F, F]]);
        array_push(LevelQueue, [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, T, O, O, O], [O, O, O, F, F, F, F, O, O, F], [O, I, O, T, O, O, T, O, O, O], [F, F, F, F, O, O, F, O, O, O]]);
        array_push(LevelQueue, [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, S, O, O, O, O, W, O], [O, O, O, O, O, X, O, O, O, O], [F, F, F, F, F, O, O, F, F, F]]);
        array_push(LevelQueue, [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, S, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, F, F, O, O, X, O, O], [F, F, O, O, O, F, F, O, O, F]]);
        array_push(LevelQueue, [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, T, O, t, O, O, O, O], [F, F, F, F, O, O, F, F, F, F]]);
        array_push(LevelQueue, [[O, O, O, O, O, O, Q, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, W, O], [O, I, O, Q, O, O, O, O, O, O], [F, F, F, O, F, F, O, F, F, F]]);
        var CloserLevel = choose([[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, w, O, O, G, O], [O, I, O, O, O, O, O, O, I, O], [F, F, F, F, F, F, F, F, F, O]], [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, G, O], [O, O, O, O, O, O, F, F, F, O], [O, O, O, F, F, O, O, O, O, O], [F, F, O, O, O, O, O, O, O, O]], [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, w, O, w, O, W, O], [O, O, O, O, O, O, O, O, G, O], [F, F, F, F, F, F, F, F, F, F]]);
        LevelQueue = array_concat([StarterLevel], array_shuffle(LevelQueue), [CloserLevel]);
    }
    else
    {
        array_push(LevelQueue, choose([[O, O, O, O, O, O, O, O, O, I], [O, O, O, O, O, O, O, O, O, I], [O, O, O, O, O, W, W, W, O, O], [O, O, O, O, O, O, O, O, O, O], [F, F, F, F, F, F, F, F, F, F]], [[O, O, O, O, O, O, O, O, O, I], [O, O, O, O, O, O, O, O, O, I], [O, O, O, O, O, O, w, O, W, O], [O, O, O, O, O, O, O, O, O, O], [F, F, F, F, F, F, F, F, F, F]], [[O, O, O, O, O, O, O, O, O, I], [O, O, O, O, O, O, O, O, O, I], [O, O, O, O, O, W, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [F, F, F, O, F, F, F, O, F, F]]));
        array_push(LevelQueue, choose([[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, T, O, O, O, O], [F, F, O, O, F, F, O, O, F, F]], [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, W, W, W, O, O, O], [O, O, O, O, O, O, O, O, O, O], [F, F, O, F, F, F, F, F, O, F]], [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, W, W, W, O, O, O, w, O, O], [O, O, O, O, O, O, O, O, O, O], [F, F, F, F, F, F, F, F, F, F]]));
        array_push(LevelQueue, choose([[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, W, O, O, O], [O, O, T, O, O, O, O, O, O, O], [F, F, F, O, O, F, F, F, O, F]], [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, W, O, O, O, W, W, O, O, w], [O, O, O, O, O, O, O, O, O, O], [F, F, F, O, F, F, F, F, F, F]], [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, T, O, O, O], [O, O, O, F, F, F, F, O, O, F], [O, I, O, T, O, O, T, O, O, O], [F, F, F, F, O, O, F, O, O, O]]));
        array_push(LevelQueue, choose([[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, S, O, O, O, O, W, O], [O, O, O, O, O, X, O, O, O, O], [F, F, F, F, F, O, O, F, F, F]], [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, S, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, F, F, O, O, X, O, O], [F, F, O, O, O, F, F, O, O, F]], [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, T, O, t, O, O, O, O], [F, F, F, F, O, O, F, F, F, F]], [[O, O, O, O, O, O, Q, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, W, O], [O, I, O, Q, O, O, O, O, O, O], [F, F, F, O, F, F, O, F, F, F]]));
        array_push(LevelQueue, choose([[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, w, O, O, G, O], [O, I, O, O, O, O, O, O, I, O], [F, F, F, F, F, F, F, F, F, O]], [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, G, O], [O, O, O, O, O, O, F, F, F, O], [O, O, O, F, F, O, O, O, O, O], [F, F, O, O, O, O, O, O, O, O]], [[O, O, O, O, O, O, O, O, O, O], [O, O, O, O, O, O, O, O, O, O], [O, O, O, O, w, O, w, O, W, O], [O, O, O, O, O, O, O, O, G, O], [F, F, F, F, F, F, F, F, F, F]]));
    }
    
    return LevelQueue;
}
