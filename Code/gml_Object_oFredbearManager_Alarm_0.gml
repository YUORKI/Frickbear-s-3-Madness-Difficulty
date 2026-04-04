instance_create_depth(0, 0, -10, oJumpscare_Fredbear);
var MicrogamesCleared = MicrogameNumber - 1;
var MicrogamesHiScore = global.BossHiScores[2][global.Difficulty];
global.ThisBossHiScore = MicrogamesCleared;

if (MicrogamesCleared > MicrogamesHiScore)
    global.BossHiScores[2][global.Difficulty] = MicrogamesCleared;
