function get_deathquip(arg0, arg1 = undefined)
{
    var VoiceLineDatabase = array_create(70, [sfxNOTHING]);
    VoiceLineDatabase[UnknownEnum.Value_0] = [voc_Freddy_DoItYourself, voc_Freddy_FiveNights, voc_Freddy_MessWithTheFaz, voc_Freddy_PartysJustStarting, voc_Freddy_Showbiz, voc_Freddy_Suited, voc_Freddy_WelcomeToTheFamily, voc_Freddy_WhoRunsThings];
    VoiceLineDatabase[UnknownEnum.Value_1] = [voc_Bonnie_ASongComingOn, voc_Bonnie_BadaBoom, voc_Bonnie_BigOlEars, voc_Bonnie_BonnieSong, voc_Bonnie_HoldYaAlright, voc_Bonnie_OnTheClock, voc_Bonnie_PitchPoifect, voc_Bonnie_ProvideFeedback, voc_Bonnie_Raise];
    VoiceLineDatabase[UnknownEnum.Value_2] = [voc_Chica_GoDownEasy, voc_Chica_ImSoHungry, voc_Chica_JustGotServed, voc_Chica_MmmCake, voc_Chica_OnlyChicken, voc_Chica_StarvinOverHere, voc_Chica_WingIt, voc_Chica_YouAintFat, voc_Chica_YoureCooked];
    VoiceLineDatabase[UnknownEnum.Value_3] = [voc_Foxy_BiscuitEater2, voc_Foxy_Floundering, voc_Foxy_OldBear, voc_Foxy_OnePiece, voc_Foxy_QuickerThanThat, voc_Foxy_QuickRedFox, voc_Foxy_TheHooks, voc_Foxy_ThePlank];
    VoiceLineDatabase[UnknownEnum.Value_4] = [voc_GoldenFreddy_AnyTrick, voc_GoldenFreddy_Cough, voc_GoldenFreddy_FellAsleep, voc_GoldenFreddy_Laugh2, voc_GoldenFreddy_LikeTheyUsedTo, voc_GoldenFreddy_NeverGetsOld, voc_GoldenFreddy_StillBeHaunted];
    VoiceLineDatabase[UnknownEnum.Value_5] = [voc_Endoskeleton_Careful, voc_Endoskeleton_ErrorEvent, voc_Endoskeleton_NewSuit, voc_Endoskeleton_NoBones, voc_Endoskeleton_ProcessComplete, voc_Endoskeleton_EndOYou, voc_Endoskeleton_LightsOffProtocol, voc_Endoskeleton_OldSkeleton, voc_Endoskeleton_WildRide];
    VoiceLineDatabase[UnknownEnum.Value_6] = [voc_ToyFreddy_Fazballs, voc_ToyFreddy_HardlyGaming, voc_ToyFreddy_Leaderboard, voc_ToyFreddy_Minesweeper, voc_ToyFreddy_SwingAtTheKing, voc_ToyFreddy_WinningSon];
    VoiceLineDatabase[UnknownEnum.Value_7] = [voc_ToyBonnie_Autograph, voc_ToyBonnie_Criminal, voc_ToyBonnie_DieToMeetMe, voc_ToyBonnie_FutureIsNow, voc_ToyBonnie_Limelight, voc_ToyBonnie_MoveAside, voc_ToyBonnie_OneStarRises];
    VoiceLineDatabase[UnknownEnum.Value_8] = [voc_ToyChica_AdorableCorpse, voc_ToyChica_BadAtThis, voc_ToyChica_BingoGotEm, voc_ToyChica_Bloodstains, voc_ToyChica_DeserveMe, voc_ToyChica_GoodLittleCupcake, voc_ToyChica_PartyFowl];
    VoiceLineDatabase[UnknownEnum.Value_9] = [voc_Mangle_LetsHang2, voc_Mangle_Privacy, voc_Mangle_SeeWhatYouveDone, voc_Mangle_Sorry, voc_Mangle_ThatPretty, voc_Mangle_TwoHeads];
    VoiceLineDatabase[UnknownEnum.Value_10] = [voc_WitheredFreddy_EndsTheSame, voc_WitheredFreddy_Lifeless, voc_WitheredFreddy_NeverEnds, voc_WitheredFreddy_PoorCareerChoice, voc_WitheredFreddy_ToLast, voc_WitheredFreddy_WelcomeToTheFamily, voc_WitheredFreddy_TooOld, voc_WitheredFreddy_WitheredOut];
    VoiceLineDatabase[UnknownEnum.Value_11] = [voc_WitheredBonnie_BrokenNow, voc_WitheredBonnie_CantTell, voc_WitheredBonnie_DidntReallyThink, voc_WitheredBonnie_InWithTheOld, voc_WitheredBonnie_LondonBridge, voc_WitheredBonnie_LookIntoMyEye, voc_WitheredBonnie_StrangeIsntIt, voc_WitheredBonnie_ToreMeApart];
    VoiceLineDatabase[UnknownEnum.Value_12] = [voc_WitheredChica_BakedIntoPizzas, voc_WitheredChica_BirdOfPrey, voc_WitheredChica_Flightless, voc_WitheredChica_HaventYouHeard, voc_WitheredChica_SliceYouToPieces, voc_WitheredChica_Tangled, voc_WitheredChica_TheWorst];
    VoiceLineDatabase[UnknownEnum.Value_13] = [voc_WitheredFoxy_DeadMen, voc_WitheredFoxy_DownWithHisShip, voc_WitheredFoxy_Flashlight, voc_WitheredFoxy_NoMercy, voc_WitheredFoxy_OldFox, voc_WitheredFoxy_ThePlank, voc_WitheredFoxy_TwoEyepatches, voc_WitheredFoxy_WateryGrave];
    VoiceLineDatabase[UnknownEnum.Value_14] = [voc_BB_PizzaCoupon, voc_BB_SeeMeComing, voc_BB_TakeABalloon, voc_BB_TheSlack, voc_BB_TheUnexpected, voc_BB_YoullFloatToo];
    VoiceLineDatabase[UnknownEnum.Value_15] = [sfxNOTHING];
    VoiceLineDatabase[UnknownEnum.Value_16] = [voc_Marionette_CanBeSaved, voc_Marionette_GrandfatherClock, voc_Marionette_MyStrings, voc_Marionette_ShouldntBeHere, voc_Marionette_TakeLife, voc_Marionette_ThatsBetter, voc_Marionette_WakeTheBaby, voc_Marionette_WindUpTheBox];
    VoiceLineDatabase[UnknownEnum.Value_17] = [sfxNOTHING];
    VoiceLineDatabase[UnknownEnum.Value_18] = [voc_RWQFSFASXC_L, voc_RWQFSFASXC_SKILLISSUE, voc_RWQFSFASXC_TRYAGAIN, voc_RWQFSFASXC_YOUSUCK, voc_RWQFSFASXC_ITSME];
    VoiceLineDatabase[UnknownEnum.Value_19] = [sfxNOTHING];
    VoiceLineDatabase[UnknownEnum.Value_20] = [voc_Springtrap_AlwaysComeBack, voc_Springtrap_Burn, voc_Springtrap_EvilDoesntDie, voc_Springtrap_IronicConfidence, voc_Springtrap_Laugh, voc_Springtrap_NoLight, voc_Springtrap_OthersLikeAnimals, voc_Springtrap_Pathetic, voc_Springtrap_QuickAndPainless, voc_Springtrap_Tally];
    VoiceLineDatabase[UnknownEnum.Value_21] = [voc_Plushtrap_AgainAGAIN, voc_Plushtrap_GotYou, voc_Plushtrap_IWin, voc_Plushtrap_Tag, voc_Plushtrap_WhatFun];
    VoiceLineDatabase[UnknownEnum.Value_22] = [voc_NightmareFredbear_Box, voc_NightmareFredbear_KeepRepeating, voc_NightmareFredbear_Laugh2, voc_NightmareFredbear_MyDomain, voc_NightmareFredbear_WakingUp, voc_NightmareFredbear_WhatGame];
    VoiceLineDatabase[UnknownEnum.Value_23] = [voc_NightmareBB_BetterThisWay, voc_NightmareBB_ButtUnkicked, voc_NightmareBB_ClickLikeAGirl, voc_NightmareBB_DentalHygeine, voc_NightmareBB_MyTeethYourFace, voc_NightmareBB_PanickyPatrolman, voc_NightmareBB_Sike, voc_NightmareBB_Uuuuugly];
    VoiceLineDatabase[UnknownEnum.Value_24] = [voc_Nightmarionne_CuriosityKilledTheCat, voc_Nightmarionne_DeathInTheEye, voc_Nightmarionne_FightOrFlight, voc_Nightmarionne_IgnoranceIsBliss, voc_Nightmarionne_OutrunMeForever, voc_Nightmarionne_PryingEyes, voc_Nightmarionne_PullingTheStrings, voc_Nightmarionne_SweetDreams, voc_Nightmarionne_TemptedFate, voc_Nightmarionne_TheDevil];
    VoiceLineDatabase[UnknownEnum.Value_25] = [sfxNOTHING];
    VoiceLineDatabase[UnknownEnum.Value_26] = [voc_Baby_BelieveInCircuses, voc_Baby_EntireCircus, voc_Baby_HoldItAgainstUs, voc_Baby_IceCream, voc_Baby_MadeMeDo, voc_Baby_MakesZero, voc_Baby_TrustingMe];
    VoiceLineDatabase[UnknownEnum.Value_27] = [voc_FuntimeFreddy_DeathDayBoy, voc_FuntimeFreddy_DoubleYourFuntimes, voc_FuntimeFreddy_NoBody, voc_FuntimeFreddy_NotAMouse, voc_FuntimeFreddy_QuiteTheFunTime];
    VoiceLineDatabase[UnknownEnum.Value_28] = [voc_FuntimeFoxy_ClassAct, voc_FuntimeFoxy_Huzzah, voc_FuntimeFoxy_NoJumpscare, voc_FuntimeFoxy_Speechless, voc_FuntimeFoxy_TuneIn, voc_FuntimeFoxy_Bloodshed, voc_FuntimeFoxy_Cartoonish, voc_FuntimeFoxy_MovieTheater];
    VoiceLineDatabase[UnknownEnum.Value_29] = [voc_Ballora_AnythingButGraceful, voc_Ballora_DownWillComeBaby, voc_Ballora_FacesTowardsHeaven, voc_Ballora_HushLittleBaby, voc_Ballora_LittleThings, voc_Ballora_NotQuiteMyTempo, voc_Ballora_TerriblePerformance, voc_Ballora_TooSlow, voc_Ballora_WindowToTheSoul];
    VoiceLineDatabase[UnknownEnum.Value_30] = [voc_BonBon_FazbearPincer, voc_BonBon_GuyWithNoLegs, voc_BonBon_NoSleeping, voc_BonBon_PowerOfTeamwork, voc_BonBon_PushedTooHard, voc_BonBon_Short];
    VoiceLineDatabase[UnknownEnum.Value_31] = [sfxNOTHING];
    VoiceLineDatabase[UnknownEnum.Value_32] = [sfxNOTHING];
    VoiceLineDatabase[UnknownEnum.Value_33] = [voc_Lefty_Exterminate, voc_Lefty_FiveDollars, voc_Lefty_NothingLeft, voc_Lefty_PeaceAndQuiet, voc_Lefty_ScreamedLessLoudly, voc_Lefty_ShutYouUp, voc_Lefty_StrungAlong, voc_Lefty_TheSuit, voc_Lefty_YouHearThat];
    VoiceLineDatabase[UnknownEnum.Value_34] = [voc_MoltenFreddy_AllMe, voc_MoltenFreddy_CantTakeTheHeat, voc_MoltenFreddy_CheckTheFace, voc_MoltenFreddy_IGotHim, voc_MoltenFreddy_LookMeInTheEye, voc_MoltenFreddy_MightyLog, voc_MoltenFreddy_Outnumber, voc_MoltenFreddy_RedOnMe, voc_MoltenFreddy_Spaghetti];
    VoiceLineDatabase[UnknownEnum.Value_35] = [voc_ScrapBaby_LightsOut, voc_ScrapBaby_NeedYourPower, voc_ScrapBaby_NothingControlled, voc_ScrapBaby_StartAllOver, voc_ScrapBaby_YouWontDie];
    VoiceLineDatabase[UnknownEnum.Value_36] = [voc_TwistedWolf_BigBadWolf, voc_TwistedWolf_ExpectingMore, voc_TwistedWolf_HuffPuff, voc_TwistedWolf_ImTwisted, voc_TwistedWolf_LibertyToWolves, voc_TwistedWolf_LightReading, voc_TwistedWolf_MereIllusion, voc_TwistedWolf_Scared, voc_TwistedWolf_SmokeAndMirrors, voc_TwistedWolf_TheDirt];
    VoiceLineDatabase[UnknownEnum.Value_37] = [sfxNOTHING];
    VoiceLineDatabase[UnknownEnum.Value_38] = [voc_Dreadbear_Brains, voc_Dreadbear_CarveYou, voc_Dreadbear_HalloweenSpirit, voc_Dreadbear_ItsAlive, voc_Dreadbear_MyTummy, voc_Dreadbear_StillHungry, voc_Dreadbear_TreatForMe];
    VoiceLineDatabase[UnknownEnum.Value_39] = [sfxNOTHING];
    VoiceLineDatabase[UnknownEnum.Value_41] = [voc_Animdude_EnoughTrolling, voc_Animdude_ImaginaryMonster, voc_Animdude_Theories, voc_Animdude_ThisStory, voc_Animdude_Underachiever, voc_Animdude_YouKnow, voc_Animdude_YourPlace];
    VoiceLineDatabase[UnknownEnum.Value_40] = [sfxNOTHING];
    VoiceLineDatabase[UnknownEnum.Value_42] = [voc_Chipper_GamblingDebt, voc_Chipper_GrimReaper, voc_Chipper_IKnowTheDeal, voc_Chipper_SayHiToPhil, voc_Chipper_TermiteMound, voc_Chipper_Timber, voc_Chipper_TooExpensive];
    VoiceLineDatabase[UnknownEnum.Value_43] = [voc_Sparky_BeHere, voc_Sparky_LetTheDogsOut, voc_Sparky_MyBites, voc_Sparky_NewTricks, voc_Sparky_PlayDead, voc_Sparky_ScrewedThePooch, voc_Sparky_WontBelieveYou, voc_Sparky_WrongTree];
    VoiceLineDatabase[UnknownEnum.Value_44] = [voc_Candy_BeforeThem, voc_Candy_BrightSide, voc_Candy_CatGotYourTongue, voc_Candy_CheapOrigami, voc_Candy_Fishing, voc_Candy_GenuineArticle, voc_Candy_HidInTheLocker, voc_Candy_NineLives];
    VoiceLineDatabase[UnknownEnum.Value_45] = [voc_Popgoes_AnAI, voc_Popgoes_BurnForEternity, voc_Popgoes_CallMeEvergreen, voc_Popgoes_Epitome, voc_Popgoes_ImTheHero, voc_Popgoes_MyHeart, voc_Popgoes_RealisticDepiction, voc_Popgoes_Reprinted, voc_Popgoes_TheWindow];
    VoiceLineDatabase[UnknownEnum.Value_46] = [sfxNOTHING];
    VoiceLineDatabase[UnknownEnum.Value_47] = [voc_FuntimeChica_HitItBig, voc_FuntimeChica_KeepGambling, voc_FuntimeChica_StupidGames, voc_FuntimeChica_Surprise, voc_FuntimeChica_WinSome];
    VoiceLineDatabase[UnknownEnum.Value_48] = [voc_Felix_SleepingWithDaFishes];
    VoiceLineDatabase[UnknownEnum.Value_49] = [voc_Salvage_Death_6AMShow, voc_Salvage_Death_BeyondYou, voc_Salvage_Death_Created, voc_Salvage_Death_FarGreater, voc_Salvage_Death_History, voc_Salvage_Death_Overpower, voc_Salvage_Death_Reestablished, voc_Salvage_Death_ScreamedLouder, voc_Salvage_Death_Shadow, voc_Salvage_Death_Symmetry, voc_Salvage_Death_WeightClass];
    randomize();
    
    if (is_undefined(arg1))
        arg1 = ((global.DeathRecord[arg0] + global.FunValue[0]) * global.FunValue[1]) % array_length(VoiceLineDatabase[arg0]);
    
    return VoiceLineDatabase[arg0][arg1];
}

function get_selection_voiceline(arg0)
{
    var VoiceLineDatabase = array_create(70, [sfxNOTHING]);
    VoiceLineDatabase[UnknownEnum.Value_0] = voc_Freddy_HorHorHorHor;
    VoiceLineDatabase[UnknownEnum.Value_1] = voc_Bonnie_RockNRoll;
    VoiceLineDatabase[UnknownEnum.Value_2] = voc_Chica_LetsEat;
    VoiceLineDatabase[UnknownEnum.Value_3] = voc_Foxy_Ahoy;
    VoiceLineDatabase[UnknownEnum.Value_4] = voc_GoldenFreddy_ItsMe;
    VoiceLineDatabase[UnknownEnum.Value_5] = voc_Endoskeleton_WhereAmI;
    VoiceLineDatabase[UnknownEnum.Value_6] = voc_ToyFreddy_UReady;
    VoiceLineDatabase[UnknownEnum.Value_7] = voc_ToyBonnie_LetsRock;
    VoiceLineDatabase[UnknownEnum.Value_8] = voc_ToyChica_LetsParty;
    VoiceLineDatabase[UnknownEnum.Value_9] = voc_Mangle_LetsPlay;
    VoiceLineDatabase[UnknownEnum.Value_10] = voc_WitheredFreddy_ImAwake;
    VoiceLineDatabase[UnknownEnum.Value_11] = voc_WitheredBonnie_WhosThere;
    VoiceLineDatabase[UnknownEnum.Value_12] = voc_WitheredChica_Garble1;
    VoiceLineDatabase[UnknownEnum.Value_13] = voc_WitheredFoxy_Arrrr;
    VoiceLineDatabase[UnknownEnum.Value_14] = voc_BB_Hello1;
    VoiceLineDatabase[UnknownEnum.Value_15] = voc_JJ_HelloThere1;
    VoiceLineDatabase[UnknownEnum.Value_16] = voc_Marionette_BeenSoLong;
    VoiceLineDatabase[UnknownEnum.Value_17] = voc_ShadowFreddy_FollowMe;
    VoiceLineDatabase[UnknownEnum.Value_18] = voc_RWQFSFASXC_Ayy;
    VoiceLineDatabase[UnknownEnum.Value_19] = voc_Phantom_Laugh;
    VoiceLineDatabase[UnknownEnum.Value_20] = voc_Springtrap_GuessWhosBack;
    VoiceLineDatabase[UnknownEnum.Value_21] = voc_Plushtrap_Nyeeheehee;
    VoiceLineDatabase[UnknownEnum.Value_22] = voc_NightmareFredbear_Laugh1;
    VoiceLineDatabase[UnknownEnum.Value_23] = voc_NightmareBB_BiteMe;
    VoiceLineDatabase[UnknownEnum.Value_24] = voc_Nightmarionne_MementoMori;
    VoiceLineDatabase[UnknownEnum.Value_25] = voc_Lolbit_HAAAAAIIIII;
    VoiceLineDatabase[UnknownEnum.Value_26] = voc_Baby_HeresTheScoop;
    VoiceLineDatabase[UnknownEnum.Value_27] = voc_FuntimeFreddy_DreamWork;
    VoiceLineDatabase[UnknownEnum.Value_28] = voc_FuntimeFoxy_Showtime;
    VoiceLineDatabase[UnknownEnum.Value_29] = voc_Ballora_CareToDance;
    VoiceLineDatabase[UnknownEnum.Value_30] = voc_Helpy_WantSomeHelp;
    VoiceLineDatabase[UnknownEnum.Value_31] = voc_MusicMan_KickIt;
    VoiceLineDatabase[UnknownEnum.Value_32] = voc_MrHippo_Select;
    VoiceLineDatabase[UnknownEnum.Value_33] = voc_Lefty_Shhh;
    VoiceLineDatabase[UnknownEnum.Value_34] = voc_MoltenFreddy_AllForOne;
    VoiceLineDatabase[UnknownEnum.Value_35] = voc_ScrapBaby_ShockingIsntIt;
    VoiceLineDatabase[UnknownEnum.Value_36] = voc_TwistedWolf_AWOOOOO;
    VoiceLineDatabase[UnknownEnum.Value_37] = voc_Malhare_LaughIntro;
    VoiceLineDatabase[UnknownEnum.Value_38] = voc_Dreadbear_HappyHalloween;
    VoiceLineDatabase[UnknownEnum.Value_39] = voc_LolzHax_MeetAtLast;
    VoiceLineDatabase[UnknownEnum.Value_41] = voc_Animdude_HelloHello;
    VoiceLineDatabase[UnknownEnum.Value_40] = voc_Coffee_Sound;
    VoiceLineDatabase[UnknownEnum.Value_42] = voc_Chipper_ImTheBeaver;
    VoiceLineDatabase[UnknownEnum.Value_43] = voc_Sparky_BowWowDude;
    VoiceLineDatabase[UnknownEnum.Value_44] = voc_Candy_UhhMeow;
    VoiceLineDatabase[UnknownEnum.Value_45] = voc_Popgoes_Popgoes;
    VoiceLineDatabase[UnknownEnum.Value_46] = voc_Rodney_ImBusy;
    VoiceLineDatabase[UnknownEnum.Value_47] = sfxNOTHING;
    VoiceLineDatabase[UnknownEnum.Value_58] = voc_UpgradeCadet_ComeGet;
    VoiceLineDatabase[UnknownEnum.Value_60] = sfxNOTHING;
    return VoiceLineDatabase[arg0];
}

function get_deathcoin_voiceline(arg0)
{
    var VoiceLineDatabase = array_create(70, [sfxNOTHING]);
    VoiceLineDatabase[UnknownEnum.Value_0] = voc_Freddy_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_1] = voc_Bonnie_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_2] = voc_Chica_RuffledYourFeathers;
    VoiceLineDatabase[UnknownEnum.Value_3] = voc_Foxy_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_4] = voc_GoldenFreddy_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_5] = voc_Endoskeleton_ShuttingDown;
    VoiceLineDatabase[UnknownEnum.Value_6] = voc_ToyFreddy_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_7] = voc_ToyBonnie_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_8] = voc_ToyChica_Whateverrr;
    VoiceLineDatabase[UnknownEnum.Value_9] = voc_Mangle_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_10] = voc_WitheredFreddy_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_11] = voc_WitheredBonnie_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_12] = voc_WitheredChica_Garble2;
    VoiceLineDatabase[UnknownEnum.Value_13] = voc_WitheredFoxy_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_14] = voc_BB_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_15] = voc_JJ_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_16] = voc_Marionette_StopMe;
    VoiceLineDatabase[UnknownEnum.Value_17] = voc_ShadowFreddy_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_18] = voc_RWQFSFASXC_Oh;
    VoiceLineDatabase[UnknownEnum.Value_19] = voc_Phantom_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_20] = voc_Springtrap_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_21] = voc_Plushtrap_NoFun;
    VoiceLineDatabase[UnknownEnum.Value_22] = voc_NightmareFredbear_YouLittle;
    VoiceLineDatabase[UnknownEnum.Value_23] = voc_NightmareBB_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_24] = voc_Nightmarionne_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_25] = voc_Lolbit_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_26] = voc_Baby_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_27] = voc_FuntimeFreddy_PartyPooper;
    VoiceLineDatabase[UnknownEnum.Value_28] = voc_FuntimeFoxy_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_29] = voc_Ballora_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_30] = voc_Helpy_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_31] = voc_MusicMan_NotGroovy;
    VoiceLineDatabase[UnknownEnum.Value_32] = voc_MrHippo_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_33] = voc_Lefty_Freedom;
    VoiceLineDatabase[UnknownEnum.Value_34] = voc_MoltenFreddy_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_35] = voc_ScrapBaby_SkaterHater;
    VoiceLineDatabase[UnknownEnum.Value_36] = voc_TwistedWolf_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_37] = voc_Malhare_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_38] = voc_Dreadbear_SoHungry;
    VoiceLineDatabase[UnknownEnum.Value_39] = voc_LolzHax_LastOfMe;
    VoiceLineDatabase[UnknownEnum.Value_41] = voc_Animdude_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_40] = voc_Coffee_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_42] = voc_Chipper_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_43] = voc_Sparky_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_44] = voc_Candy_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_45] = voc_Popgoes_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_46] = voc_Rodney_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_47] = voc_FuntimeChica_Deathcoin;
    VoiceLineDatabase[UnknownEnum.Value_49] = voc_Salvage_Beartrapped;
    VoiceLineDatabase[UnknownEnum.Value_55] = sfxFredbearGrowl_Pain;
    return VoiceLineDatabase[arg0];
}

function play_deathcoin_voiceline(arg0)
{
    return reverb_sound(get_deathcoin_voiceline(arg0), 0, 0, false, 1);
}

function play_selection_voiceline(arg0)
{
    with (oCamera3DMaze)
        bitcrush_sound(get_selection_voiceline(arg0), 0, 0, false, 1, 8);
}

enum UnknownEnum
{
    Value_0,
    Value_1,
    Value_2,
    Value_3,
    Value_4,
    Value_5,
    Value_6,
    Value_7,
    Value_8,
    Value_9,
    Value_10,
    Value_11,
    Value_12,
    Value_13,
    Value_14,
    Value_15,
    Value_16,
    Value_17,
    Value_18,
    Value_19,
    Value_20,
    Value_21,
    Value_22,
    Value_23,
    Value_24,
    Value_25,
    Value_26,
    Value_27,
    Value_28,
    Value_29,
    Value_30,
    Value_31,
    Value_32,
    Value_33,
    Value_34,
    Value_35,
    Value_36,
    Value_37,
    Value_38,
    Value_39,
    Value_40,
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46,
    Value_47,
    Value_48,
    Value_49,
    Value_55 = 55,
    Value_58 = 58,
    Value_60 = 60
}
