Frame = 0;
BlinkFrames = 0;
Position = 0;
PositionSpeed = 0;
PositionTarget = 0;
BounceOffset = 0;
BounceSpeed = 0;
BounceOffset = 128;
TimeToNextQuip = 999;
Randomizer = random_range(0.75, 1.25);
CurrentLine = undefined;
QuoteLibrary = [voc_Rodney_Idle_35kDollars, voc_Rodney_Idle_AdRevenue, voc_Rodney_Idle_AlarmYou, voc_Rodney_Idle_AltF4, voc_Rodney_Idle_AntiPiracy, voc_Rodney_Idle_Beating4020, voc_Rodney_Idle_BetterToDo, voc_Rodney_Idle_Boring2, voc_Rodney_Idle_BossBet, voc_Rodney_Idle_Buddy, voc_Rodney_Idle_Burp2, voc_Rodney_Idle_Clothes, voc_Rodney_Idle_ComicMischief, voc_Rodney_Idle_Demonitized, voc_Rodney_Idle_DoneThat, voc_Rodney_Idle_DontChoke, voc_Rodney_Idle_Doors, voc_Rodney_Idle_Fanverse, voc_Rodney_Idle_FanverseManifesto, voc_Rodney_Idle_FeatureCreep, voc_Rodney_Idle_FirstTimePlaying, voc_Rodney_Idle_FiveNights, voc_Rodney_Idle_FourthPhoneCall, voc_Rodney_Idle_Frickbears3, voc_Rodney_Idle_FunChallenge, voc_Rodney_Idle_GasLeak, voc_Rodney_Idle_GetJumpscared, voc_Rodney_Idle_GettingPaid, voc_Rodney_Idle_GetWorse, voc_Rodney_Idle_GimmikoShill, voc_Rodney_Idle_InRealTime, voc_Rodney_Idle_Invalidate, voc_Rodney_Idle_JumpscareCompilation, voc_Rodney_Idle_Keyboard, voc_Rodney_Idle_Kneecapped, voc_Rodney_Idle_LegallyDistinct, voc_Rodney_Idle_MakeshipPlushie, voc_Rodney_Idle_ManualBreathing, voc_Rodney_Idle_MassiveLoreHint, voc_Rodney_Idle_MemoryLeak, voc_Rodney_Idle_Missed, voc_Rodney_Idle_Noticed, voc_Rodney_Idle_RecordTheseLines, voc_Rodney_Idle_ReleaseLikeThis, voc_Rodney_Idle_RodneyPlus, voc_Rodney_Idle_SalvageThisGameplay, voc_Rodney_Idle_SayTheLine, voc_Rodney_Idle_SecretCheatCode, voc_Rodney_Idle_Slurp, voc_Rodney_Idle_SmellLikeThat, voc_Rodney_Idle_Sweatshop, voc_Rodney_Idle_TheControversy, voc_Rodney_Idle_ThreeDimensions, voc_Rodney_Idle_TooManyNights, voc_Rodney_Idle_Boring1];
QuoteLibrary = array_shuffle(QuoteLibrary);
QuoteLibrary_MinigameFail = array_shuffle([voc_Rodney_Fail_InThisOne, voc_Rodney_Fail_PlayingGamesPoorly, voc_Rodney_Fail_SeenThatComing, voc_Rodney_Fail_StifledLaugh, voc_Rodney_Fail_WaitingForThat, voc_Rodney_Fail_WompWomp]);
QuoteLibrary_Item = array_shuffle([voc_Rodney_Item_BagOfChips, voc_Rodney_Item_DontNeedPowerups, voc_Rodney_Item_Handicap, voc_Rodney_Item_MinimumWage]);
QuoteLibrary_Tokens = array_shuffle([voc_Rodney_Tokens_Casino, voc_Rodney_Tokens_KingsPrizes, voc_Rodney_Tokens_LivingWage, voc_Rodney_Tokens_PaidForPlaying]);
QuoteNum = 0;
QuoteNum_MinigameFail = 0;
QuoteNum_Item = 0;
QuoteNum_Tokens = 0;
CallMuted = false;
YOffset = 0;
SubtitleList = [];
SubtitleTimingList = [];

function set_soundclip(arg0)
{
    var Subtitles = subtitle(arg0);
    var RodneyGain = 3;
    CurrentSound = arg0;
    SubtitleList = Subtitles[0];
    SubtitleTimingList = Subtitles[1];
    CurrentLine = reverb_sound(arg0, 0, 0, false, RodneyGain, 1, 0.05);
    SubtitleEntry = 0;
    PositionTarget = 1;
    BounceSpeed = 2;
    BlinkFrames = 5;
}
