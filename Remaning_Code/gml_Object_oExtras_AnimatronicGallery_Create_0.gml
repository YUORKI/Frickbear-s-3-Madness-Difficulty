CurrentSound = sfxNOTHING;
ExtrasDatabase = [];

for (Character = 0; Character < 70; Character++)
{
    ExtrasDatabase[Character] = 
    {
        Name: global.Descriptions[Character][0],
        Debut: "Five Nights at Freddy's",
        Desc: ["No data on this animatronic is available.", "What are you looking at me for? I don't know anything about this one either!"],
        Jumpscares: [
        {
            JumpID: Character,
            JumpSprite: sJumpscare,
            JumpSide: 0,
            JumpSideVertical: -1
        }],
        VoiceLines: [],
        Image: sNOTHING
    };
}

DescriptionMode = 0;
CurrentChar = 0;
ImageSize = 0;
PreviousImage = sNOTHING;
PreviousImageSize = 0;
DefaultImageX = 430;
ImageX = DefaultImageX;
ImageOffsetX = 0;
ImageOffsetY = 0;
ImageOffsetSize = 0;
LastMouseX = 0;
LastMouseY = 0;
AngleOffset = 0;
DescOffset = 0;
DescDragged = false;
VoiceOffset = 0;
VoiceDragged = false;
Frame = 0;
SubtitleList = [];
SubtitleTimingList = [];
SubtitleEntry = 0;
SoundPlaying = -1;
ViewMode = false;
VACreditOffset = -200;
VACredit = " ";
var Character = UnknownEnum.Value_0;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's (2014)";
    Desc = ["The frontman of the Fazbear band! If there's anything this old bear knows, it's how to put on a show. Despite his grizzly exterior and intimidating demeanor, Freddy's a real sweetheart around the kids! ...Though around the nightguards, he's anything but.", "Freddy's portrait was, as is probably to be expected, the first one I finished out of the whole cast. I wanted to give each of the main four a distinct body shape, so Freddy wound up being designed to be very square."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: -1,
        JumpSideVertical: -1
    }, 
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 1,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Freddy_HorHorHorHor,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Freddy_Laugh1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Freddy_Laugh2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Freddy_DoItYourself,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Freddy_FiveNights,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Freddy_MessWithTheFaz,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Freddy_PartysJustStarting,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Freddy_Showbiz,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Freddy_Suited,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Freddy_WelcomeToTheFamily,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Freddy_WhoRunsThings,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Freddy_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Freddy;
}

Character = UnknownEnum.Value_1;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's (2014)";
    Desc = ["Freddy's right-hand rabbit, and the guitarist in the Fazbear Band! ...Also the only one in the band who plays an instrument, which brings into question if they can really be called a band in the first place. Regardless, this bunny can really shred! Prone to stagefright, but can put on a great show all the same.", "I find it kinda funny that practically every fan design of Bonnie makes him the skinny lanky one, and this game definitely continues that trend. Though something else I find funny is how common it seems to be in Bonnie fan redesigns to give him overalls - I've always wondered if there's one specific fan design out there that could be pointed to as the progenitor of the concept or if everyone just somehow all individually came to the same idea. I could honestly see both being equally likely."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: -1,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Bonnie_RockNRoll,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Bonnie_ASongComingOn,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Bonnie_BadaBoom,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Bonnie_BigOlEars,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Bonnie_BonnieSong,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Bonnie_HoldYaAlright,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Bonnie_OnTheClock,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Bonnie_PitchPoifect,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Bonnie_ProvideFeedback,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Bonnie_Raise,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Bonnie_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Bonnie;
}

Character = UnknownEnum.Value_2;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's (2014)";
    Desc = ["The female vocalist of the Fazbear Band! As could probably be gleamed just from one look at her - be it her cupcake, her 'Let's Eat!!!' slogan proudly printed upon her bib, or just her general roundness compared to her bandmates - Chica likes to eat. She can often be found rummaging trash cans around the establishment looking for discarded pizza after hours, much to the chagrin of the janitorial staff. They've complained about this to the engineering team, though according to them, this was never a function they programmed her to be capable of.", "Considering Chica's only two known traits are being a girl and eating a lot of pizza, pretty much any redesign of her that significantly alters her body shape has to choose one of two paths - either making her curvy and feminine, or making her round. I, for one, am a firm believer in Wide Chica. Overall I wanted to make her a bit more birdlike, as well as more circular to complement the very square Freddy and very triangular Foxy."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 1,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Chica_LetsEat,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Chica_GoDownEasy,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Chica_ImSoHungry,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Chica_JustGotServed,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Chica_MmmCake,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Chica_OnlyChicken,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Chica_StarvinOverHere,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Chica_WingIt,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Chica_YouAintFat,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Chica_YoureCooked,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Chica_RuffledYourFeathers,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Chica;
}

Character = UnknownEnum.Value_3;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's (2014)";
    Desc = ["This pesky pirate is the eternal rival to the Fazbear Band, having his own sideshow in Pirate's Cove! His animatronic systems are surprisingly much more robust than the rest of the gang, although they're equally prone to fail because of it. Despite the popularity of the Pirate's Cove show, Foxy is rarely in good enough condition for it to be operational. The 'Out of Order' sign set outside his stage has sadly become more of a permanent fixture in the restaurant than Foxy himself.", "It's kind of messed up how overlooked Foxy seems to be these days compared to the early days of the FNaF fandom, although I guess it's only natural with how many other wacky characters have been introduced into this franchise since then. I always found the fact that he's separated from the other three really cool; even if he's typically considered one of the 'main four' it definitely helps him stand out within that group. I wanted to play into that with his characterization here, giving him a sort of one-sided rivalry with the main band."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: -1,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Foxy_Ahoy,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Foxy_BiscuitEater2,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Foxy_Floundering,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Foxy_OldBear,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Foxy_OnePiece,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Foxy_QuickerThanThat,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Foxy_QuickRedFox,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Foxy_TheHooks,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Foxy_ThePlank,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Foxy_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Foxy;
}

Character = UnknownEnum.Value_4;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's (2014)";
    Desc = ["A desolate shell of what was once the face of the Fazbear brand. Despite his outward appearance, calling him devoid of life wouldn't be entirely correct - this empty husk has exhibited some very strange, almost supernatural capabilities. Those few who know of his existence also know well that he should be avoided. At least his vest is as fashionable as ever!", "Since all the animatronics in this game are 2D illustrations as opposed to 3D renders, and as a result each of their frames needs to be drawn from scratch, there's really no benefit to having one character just be a recolor of another like there often is with 3D models. As such, I figured I should take the opportunity to try and make former recolors more visually distinct from the characters they're originally derived from. Golden Freddy is one of many examples of this! You'll notice that despite Withered Freddy, Golden Freddy and Shadow Freddy all sharing the same base model in FNaF2, their designs are quite distinct here."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: 0
    }];
    VoiceLines = [
    {
        LineID: voc_GoldenFreddy_ItsMe,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_GoldenFreddy_Laugh1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_GoldenFreddy_AnyTrick,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_GoldenFreddy_Cough,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_GoldenFreddy_FellAsleep,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_GoldenFreddy_Laugh2,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_GoldenFreddy_LikeTheyUsedTo,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_GoldenFreddy_NeverGetsOld,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_GoldenFreddy_StillBeHaunted,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_GoldenFreddy_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_GoldenFreddy;
}

Character = UnknownEnum.Value_5;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's (2014)";
    Desc = ["If you've ever wondered what Freddy would look like naked, wonder no longer! (Seriously, stop wondering, that's weird.) The Endoskeleton houses all the mechanical components that bring Freddy and his friends to life, being designed as a blank slate that can be programmed to be any character. It's against the rules at Freddy Frickbear's Pizza for an endoskeleton to be spotted by customers without its costume on, so this one doesn't enjoy being seen.", "Despite its design being moreso based on Endo-02, this endoskeleton is meant to represent endos as a whole! Golden Freddy was designed to do something similar, being sort of a fusion between his FNaF1 and FNaF2 selves. This way both could be represented in spirit without clogging up the roster with two very similar-looking and acting characters!"];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Endoskeleton_WhereAmI,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Endoskeleton_Careful,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Endoskeleton_ErrorEvent,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Endoskeleton_NewSuit,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Endoskeleton_NoBones,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Endoskeleton_ProcessComplete,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Endoskeleton_EndOYou,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Endoskeleton_LightsOffProtocol,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Endoskeleton_OldSkeleton,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Endoskeleton_WildRide,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Endoskeleton_ShuttingDown,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Endoskeleton;
}

Character = UnknownEnum.Value_6;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 2 (2014)";
    Desc = ["Toy Freddy was the face of Fazbear Entertainment's major rebrand in the late 80's, coming after a long string of controversies regarding guest safety. As part of this initiative, Freddy and his friends were redesigned in the hopes that they'd be less scary to children. Just look how adorably sanitized he is!", "Toy Freddy, um...well...y'know, he's kinda...um...fat. I mean c'mon, y'know, he's...c'mon. What can I say? He's gained a few pounds. I mean, look at him compared to the other animatronics on the show stage. He's...y'know, rounder? More big-boned? Y'know? Ate a little bit too much pizza? Y'know what I mean? Just because it's called Freddy Fazbear's Pizza doesn't mean you gotta eat all of it, y'know what I mean?"];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_ToyFreddy_UReady,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_ToyFreddy_AwMan,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_ToyFreddy_Sobbing,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_ToyFreddy_Fazballs,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyFreddy_HardlyGaming,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyFreddy_Leaderboard,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyFreddy_Minesweeper,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyFreddy_SwingAtTheKing,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyFreddy_WinningSon,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyFreddy_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_ToyFreddy;
}

Character = UnknownEnum.Value_7;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 2 (2014)";
    Desc = ["Did you know all four Toy animatronics are equipped with facial recognition and access to criminal databases? It's true! Fazbear Entertainment was quite the trailblazer in the development of this technology, pouring a fortune into R&D to get it working as a way to demonstrate their commitment to safety. You'd better hope you've never been caught shoplifting or running a red light, because Toy Bonnie knows, and Toy Bonnie will deal with you accordingly.", "Since Toy Bonnie is meant to be a safer update to the original Bonnie, I thought it'd be funny to give him the copyright-free, safer update to his guitar."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: -1,
        JumpSideVertical: -1
    }, 
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 1,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_ToyBonnie_LetsRock,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_ToyBonnie_ISeeYou,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_ToyBonnie_ISpy,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_ToyBonnie_OhSecurityGuy,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_ToyBonnie_FindYouEventually,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_ToyBonnie_JustFreddy,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_ToyBonnie_TimeForThis,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_ToyBonnie_Shades1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_ToyBonnie_Shades2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_ToyBonnie_Autograph,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyBonnie_Criminal,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyBonnie_DieToMeetMe,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyBonnie_FutureIsNow,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyBonnie_Limelight,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyBonnie_MoveAside,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyBonnie_OneStarRises,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyBonnie_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_ToyBonnie;
}

Character = UnknownEnum.Value_8;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 2 (2014)";
    Desc = ["This newer, sleeker redesign of Chica is a real party girl! An embodiment of fun through fitness, Toy Chica was designed to encourage kids to get up and move, with a slimmer design to match. This was largely in response to parents' complaints that the previous Chica's overbearing love of pizza encouraged childhood obesity.", "This would probably be a good place to mention that leading up to this game's release, practically every time I revealed a new set of designs there were people commenting that one or more of them were hot. It wasn't even limited to the female characters, either. It's not even on purpose."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: -1,
        JumpSideVertical: -1
    }, 
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }, 
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 1,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_ToyChica_LetsParty,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_ToyChica_AdorableCorpse,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyChica_BadAtThis,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyChica_BingoGotEm,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyChica_Bloodstains,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyChica_DeserveMe,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyChica_GoodLittleCupcake,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyChica_PartyFowl,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ToyChica_Whateverrr,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_ToyChica;
}

Character = UnknownEnum.Value_9;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 2 (2014)";
    Desc = ["Originally intended as a softer, cutesier version of Foxy that could keep toddlers entertained, the company soon found they underestimated the sheer strength of preschoolers. The animatronic was torn apart within days of being introduced, and, not wanting to go any more over-budget than they already had with the restaurant, the company chose to just kind of leave it like that. It was dubbed 'The Mangle', and promoted as a take-apart-and-put-back-together attraction. While some parents questioned the safety of such a thing, Fazbear Entertainment argued such an attraction was important to encouraging kids' creativity, and may lead them to a future in the STEM field.", "Fun fact, this is my favorite animatronic! Despite usually drawing Mangle's body closer to his original model before now, I decided to finally acquiesce with this design and give her the noodle body a lot of FNaF fanartists do. Frankly, I wish I started doing this a lot sooner. Not only is it way easier to draw, it's also way more funny."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: 1
    }];
    VoiceLines = [
    {
        LineID: voc_Mangle_LetsPlay,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Mangle_LetsHang2,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Mangle_Privacy,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Mangle_SeeWhatYouveDone,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Mangle_Sorry,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Mangle_ThatPretty,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Mangle_TwoHeads,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Mangle_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Mangle;
}

Character = UnknownEnum.Value_10;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 2 (2014)";
    Desc = ["An older Freddy model salvaged from an abandoned location. While being the model most Freddy's locations used in the company's heyday, his intimidating stature was found to be a bit too scary for a lot of kids. Not wanting the face of their brand to continue making children cry, the company chose to remedy Freddy's design in future models, making him look rounder and friendlier.", "While a lot of returning characters in this game have basically the exact same mechanics as they did in Frickbear's 2, Withered Freddy is one of the few exceptions. Funnily enough, I mainly changed his mechanic because I thought the old one was too difficult to manage, especially for a character introduced in night 2 - though it seems like I just ended up swapping one obnoxious mechanic for another."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: -1,
        JumpSideVertical: -1
    }, 
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 1,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_WitheredFreddy_ImAwake,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_WitheredFreddy_EndsTheSame,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredFreddy_Lifeless,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredFreddy_NeverEnds,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredFreddy_PoorCareerChoice,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredFreddy_ToLast,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredFreddy_TooOld,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredFreddy_WelcomeToTheFamily,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredFreddy_WitheredOut,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredFreddy_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_WitheredFreddy;
}

Character = UnknownEnum.Value_11;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 2 (2014)";
    Desc = ["An older Bonnie model who met the unfortunate fate of being R&D's robotic guinea pig. His endoskeleton head was removed so it could be used to test the animatronics' facial recognition systems, though it was sadly never reattached, even after testing concluded.", "I think the bit with making Withered Bonnie bilingual came from the slight Spanish inflection his voice actor has in UCN. There wasn't really much to work with in regards to Withered Bonnie's personality otherwise, so we decided to run with it."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_WitheredBonnie_WhosThere,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_WitheredBonnie_CantTell,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredBonnie_DidntReallyThink,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredBonnie_InWithTheOld,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredBonnie_LondonBridge,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredBonnie_LookIntoMyEye,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredBonnie_StrangeIsntIt,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredBonnie_ToreMeApart,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredBonnie_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_WitheredBonnie;
}

Character = UnknownEnum.Value_12;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 2 (2014)";
    Desc = ["An older Chica model left to rot at an abandoned location. A design flaw in her facial motors has resulted in tears around her eyes and mouth. Her endoskeleton was also not at all designed to support the weight of her abnormally large jaw, leading to it snapping off near the end of her service life. She's been left that way ever since.", "Some people make games out of passion. Some do it for admiration. Others just do it for fun. I personally made this game purely in the hopes that it would convince people to draw Withered Chica more often."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: -1,
        JumpSideVertical: -1
    }, 
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 1,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_WitheredChica_Garble1,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_WitheredChica_InHereSomewhere,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_WitheredChica_NeedAHug,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_WitheredChica_SqueezePastHere,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_WitheredChica_MySensors,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_WitheredChica_SeeingThings,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_WitheredChica_TheWind,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_WitheredChica_Shades,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_WitheredChica_BakedIntoPizzas,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredChica_BirdOfPrey,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredChica_Flightless,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredChica_HaventYouHeard,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredChica_SliceYouToPieces,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredChica_Tangled,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredChica_TheWorst,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredChica_Garble2,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_WitheredChica;
}

Character = UnknownEnum.Value_13;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 2 (2014)";
    Desc = ["An older Foxy model who was largely spared by the retrofitting efforts made to the other animatronics of his line. ...This is most likely thanks to him being out of service frequently enough for the company to deem such efforts pointless. His visual sensors were never replaced, meaning he isn't tricked by the mask like many other animatronics are. This would be a good thing for him, if not for the fact that he's still plagued by the old sensors' extreme sensitivity to light.", "Withered Foxy was the first character developed who really had any sort of special animations in the office. Fun fact - all the animations in this game are done entirely in-engine, through the sheer power of math! The 3D models in this game are actually the same way. There's probably less obtuse ways to handle both of those things, but unfortunately I don't really know how to animate or 3D model otherwise."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_WitheredFoxy_Arrrr,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_WitheredFoxy_DeadMen,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredFoxy_DownWithHisShip,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredFoxy_Flashlight,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredFoxy_NoMercy,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredFoxy_OldFox,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredFoxy_ThePlank,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredFoxy_TwoEyepatches,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredFoxy_WateryGrave,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_WitheredFoxy_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_WitheredFoxy;
}

Character = UnknownEnum.Value_14;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 2 (2014)";
    Desc = ["Everyone's favorite! BB was an experimental animatronic created by the company with the unique purpose of selling balloons. While they hoped this would lead to a long line of similar vendor bots in the future, BB was unfortunately met with widely negative reception from customers - likely thanks to his tendency to steal their belongings after not receiving payment for his balloons. While BB can still be found at some locations, he's largely been phased out over time.", "BB is a hilarious specimen. His role actually changed quite a bit over the course of development - At one point he was going to be in every salvage location and act as a hint giver like he was in Frickbear's 2, before that responsibility was moved to the various employee memos instead. After that I think the idea of him being a shopkeeper was considered too, although that duty ultimately went to Upgrade Cadet instead. Now he's just kind of a weird anomaly, being the only one of the six default characters who activates on night 2 instead of night 1 as well as the only one who has a sprite in the salvage locations."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: -1,
        JumpSideVertical: -1
    }, 
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 1,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_BB_Hello1,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_BB_Hello2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_BB_Hello3,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_BB_Hi,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_BB_BuhBye,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_BB_Laugh1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_BB_Laugh2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_BB_Laugh3,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_BB_Shades,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_BB_PizzaCoupon,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_BB_SeeMeComing,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_BB_TakeABalloon,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_BB_TheSlack,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_BB_TheUnexpected,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_BB_YoullFloatToo,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_BB_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_BB;
}

Character = UnknownEnum.Value_15;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 2 (2014)";
    Desc = ["After BB was met with overwhelmingly negative reception from guests, JJ, a planned companion character who was set to appear in future Fazbear's locations, would ultimately wind up scrapped. Some prototypes of her are still out there, though many were never fully fabricated, often missing limbs or even her entire body. If you're lucky, you might find one under your desk!", "JJ's honestly mostly here out of obligation - every other animatronic from FNaF2 was on the roster so I figured she should've been included too, especially with how easy implementing her was going to be. She's probably the closest thing the roster has to a filler pick!"];
    Jumpscares = [];
    VoiceLines = [
    {
        LineID: voc_JJ_HelloThere1,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_JJ_HelloThere2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_JJ_Hello,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_JJ_ByeBye1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_JJ_ByeBye2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_JJ_Oopsies,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_JJ_Shades1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_JJ_Shades2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_JJ_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_JJ;
}

Character = UnknownEnum.Value_16;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 2 (2014)";
    Desc = ["A unique character among Freddy's ensemble, the Marionette was introduced across the majority of locations in the early 80's as a part of Fazbear Entertainment's new safety initiative! (When asked what exactly spurred this initiative on, the company refused to comment.) While it's said to enjoy entertaining and giving gifts to children, the Marionette is rarely seen performing - or even moving, for that matter. It's said that the music box keeps it lost in thought.", "I like it when Marionette is grouped alongside the main FNaF1 cast despite not being introduced until FNaF2 - I've always seen them alongside BB and the original four as the sorta 'main six' of the FNaF series. (I guess Golden Freddy should be included as part of that too, although BB and the Marionette usually stick out in my mind before just because they're completely unique characters as opposed to a variant of another one.) This is reflected in the fact that those six characters are the only ones who are activated by default in any playthrough, and also the fact that each of them has a corresponding minigame."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Marionette_BeenSoLong,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Marionette_CanBeSaved,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Marionette_GrandfatherClock,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Marionette_MyStrings,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Marionette_ShouldntBeHere,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Marionette_TakeLife,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Marionette_ThatsBetter,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Marionette_WakeTheBaby,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Marionette_WindUpTheBox,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Marionette_StopMe,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Marionette;
}

Character = UnknownEnum.Value_17;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 2 (2014)";
    Desc = ["For years, employees have reported sightings of a strange shadow moving across the walls of the pizzeria in its late hours of operation. Even stranger, the employees who claim to have seen it also claim to be compelled to follow it, wandering into back rooms of the building that haven't been touched for years, walking into walls as if they don't see them there, seemingly in a state of psychosis. Company management has dismissed these stories as employees' latest excuse to hide out in the back rooms and slack off.", "You may be wondering why Shadow Freddy's eyes and teeth are missing! Aside from just making him more visually distinct from Withered Freddy AND making him quite a bit creepier, I mainly did this so him and RWQFSFASXC would naturally complement each other - One has no eyes or teeth, while the other is ONLY eyes and teeth."];
    Jumpscares = [];
    VoiceLines = [
    {
        LineID: voc_ShadowFreddy_FollowMe,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_ShadowFreddy_Laugh,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_ShadowFreddy_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_ShadowFreddy;
}

Character = UnknownEnum.Value_18;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 2 (2014)";
    Desc = ["What, were you expecting an explanation for this thing? I don't know what's up with it either!", "You may have noticed that the name 'Shadow Bonnie' is used nowhere in this game except for this very description (and that one part of BB's quiz). I like calling RWQFSFASXC by its full name because it's funny."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: -1,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_RWQFSFASXC_Ayy,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_RWQFSFASXC_ITSME,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_RWQFSFASXC_L,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_RWQFSFASXC_SKILLISSUE,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_RWQFSFASXC_TRYAGAIN,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_RWQFSFASXC_YOUSUCK,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_RWQFSFASXC_Oh,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_RWQFSFASXC;
}

Character = UnknownEnum.Value_19;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 3 (2015)";
    Desc = ["It is said that where tragedy strikes, the Phantoms follow. Not many know what makes them manifest or from what they originate, though they always seem to appear only before those who have some deeply troubled past...or a troubled past in the making. Perhaps that's why many employees have begun seeing them lately?", "The Phantoms kinda break the trend of me trying to make former recolors look more distinct from their original counterparts, and in this case it's a combination of there just not being a whole lot to work with when it comes to the Phantoms and also me being too lazy to come up with unique designs for all six of them. "];
    Jumpscares = [
    {
        JumpID: 0,
        JumpSprite: sJumpscarePhantoms,
        JumpSide: 0,
        JumpSideVertical: -1
    }, 
    {
        JumpID: 1,
        JumpSprite: sJumpscarePhantoms,
        JumpSide: 0,
        JumpSideVertical: -1
    }, 
    {
        JumpID: 2,
        JumpSprite: sJumpscarePhantoms,
        JumpSide: 0,
        JumpSideVertical: -1
    }, 
    {
        JumpID: 3,
        JumpSprite: sJumpscarePhantoms,
        JumpSide: 0,
        JumpSideVertical: -1
    }, 
    {
        JumpID: 4,
        JumpSprite: sJumpscarePhantoms,
        JumpSide: 0,
        JumpSideVertical: 1
    }, 
    {
        JumpID: 5,
        JumpSprite: sJumpscarePhantoms,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Phantom_Laugh,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Phantom_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Phantoms;
}

Character = UnknownEnum.Value_20;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 3 (2015)";
    Desc = ["[EMPLOYEE NOTICE: This description has been redacted. Please report any and all broken and/or malfunctioning equipment to managerial staff for proper disposal. Do not touch, move, communicate with, or look away from the model as you wait for assistance. We thank you for your cooperation.]", "Springtrap is another character whose mechanic completely changed between Frickbear's 2 and 3, though he's an especially funny case since he went from being (arguably) the single easiest character to deal with in 2 to (arguably) the single hardest in 3. Maybe he's a bit unbalanced, but I figure him demanding as much attention as he does is fitting for the main antagonist of the series. After all, would it really be Springtrap if he wasn't a jerk?"];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: -1,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Springtrap_GuessWhosBack,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Springtrap_Burn,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Springtrap_EvilDoesntDie,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Springtrap_IronicConfidence,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Springtrap_Laugh,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Springtrap_NoLight,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Springtrap_OthersLikeAnimals,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Springtrap_Pathetic,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Springtrap_QuickAndPainless,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Springtrap_Tally,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Springtrap_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Springtrap;
}

Character = UnknownEnum.Value_21;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 4 (2015)";
    Desc = ["An adorable little plushie with hatred in every stitch! Plushtrap is rumored to have been made for a child whose father did not like him very much, hence the sharp teeth and proclivity towards non-consensual games of tag (said games often ending in Plushtrap gnashing on the legs of his playmates.) Despite these tendencies, his one-of-a-kind nature has made him a much sought-after collector's item for fans of Freddy's memorabilia. His existence implies the existence of a matching Fredbear plush somewhere out there, though if one existed, any documented evidence of it has been obscured from the public eye.", "The decision to make Plushtrap British actually wasn't my idea, it was his voice actor's! In fact, there's a lot of cases of that across this game - while I did write a pretty big chunk of the characters' various quips and death quotes, a lot of them were also come up with by the VA's, some even being completely improvised. There's a couple voice lines included in this game that were originally outtakes but I kept in the final game because I thought they were really funny."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: -1,
        JumpSideVertical: -1
    }, 
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 1,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Plushtrap_Nyeeheehee,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Plushtrap_ACK,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Plushtrap_AgainAGAIN,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Plushtrap_GotYou,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Plushtrap_IWin,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Plushtrap_Tag,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Plushtrap_WhatFun,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Plushtrap_NoFun,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Plushtrap;
}

Character = UnknownEnum.Value_22;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 4 (2015)";
    Desc = ["Said to be the twisted personification of events transpiring in the final days of Fredbear's Family Diner, Nightmare Fredbear is a monstrous apparition of the big man himself. ...At least, that's what some people think he is. Not many people are really sure what he is or how he came to be, if any even know of his existence to begin with. Some argue he's a twisted refurbishment of the original Fredbear animatronic made with the specific intent of freaking out kids who misbehave, although inconsistencies in his build seem to go against this theory. Others say he's just a ghost, but everyone knows those aren't real. His infamous reputation persists among employees, many joking that the best way to interrupt a meeting is to simply bring him up - everyone will be arguing about him for hours.", "Fun fact, Nightmare Fredbear was the first character to be fully voiced! (Toy Freddy doesn't really count since it was just his line for losing a minigame.) Nightmare Fredbear was ALSO one of the earliest animatronics programmed in just thanks to how simple his mechanic is, despite not being one of the characters in the demo. In fact, if you manage to enable him in the old demo using cheats, I'm pretty sure he works exactly the same as he does in the final game."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_NightmareFredbear_Laugh1,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_NightmareFredbear_Box,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_NightmareFredbear_KeepRepeating,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_NightmareFredbear_MyDomain,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_NightmareFredbear_WakingUp,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_NightmareFredbear_WhatGame,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_NightmareFredbear_YouLittle,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_NightmareFredbear;
}

Character = UnknownEnum.Value_23;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 4: Halloween Edition (2015)";
    Desc = ["Following the negative reception of the BB animatronic line, plans for future variations were thrown out and cancelled. One of the founders, however, thought it'd be really, really funny to make an even more upsetting variation of the existing BB design. Being a few beers deep in inspiration from his favorite (and self-owned) bar, he drove home and, after a few hours of hard work, determination, and keeping his kids up with all the noise, came out with Nightmare BB. Fortunately, he spent too much time testing its capacity to scare his own children to sneak him into any of the restaurants.", "I've always struggled coming up with mechanics for Nightmare BB specifically for some reason - in all three Frickbear's games (even Frickbear's 1 which he ultimately didn't even appear in the final version of), he never wound up having his originally planned mechanic in the final game. In 1, he was going to be an inverse Foxy who killed you if you used the flashlight on him, though he was ultimately scrapped and this mechanic was given to Endo instead (who keeps that mechanic to this day!). In 2 I think he was going to make a minigame pop up like Old Man Consequences in UCN, although this was scrapped because it would've been too complicated to program. In 3, the original idea was that you would need to beat his high score at one of the minigames, but this mechanic was ultimately transferred to Toy Freddy instead. His current mechanic is actually a slight retooling of Nightmarionne's old mechanic from 2."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_NightmareBB_BiteMe,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_NightmareBB_Laugh1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_NightmareBB_Laugh2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_NightmareBB_Laugh3,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_NightmareBB_Hurt1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_NightmareBB_Hurt2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_NightmareBB_Hurt3,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_NightmareBB_Hurt4,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_NightmareBB_Hurt5,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_NightmareBB_Leave1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_NightmareBB_Leave2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_NightmareBB_Leave3,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_NightmareBB_BetterThisWay,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_NightmareBB_ButtUnkicked,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_NightmareBB_ClickLikeAGirl,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_NightmareBB_DentalHygeine,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_NightmareBB_MyTeethYourFace,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_NightmareBB_PanickyPatrolman,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_NightmareBB_Sike,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_NightmareBB_Uuuuugly,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_NightmareBB_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_NightmareBB;
}

Character = UnknownEnum.Value_24;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 4: Halloween Edition (2015)";
    Desc = ["Campfire stories among residents of Hurricane tell of a cryptid personifying death itself, stalking the homes of those soon to pass and appearing before them as they take their final breath. Strangely, this creature takes the form of a twisted Marionette, much like the one seen at many Freddy's locations, and seems to only appear before those with a close personal connection to the restaurant chain. The tales of this creature have led to many wondering what other restaurants have their own personifications of death.", "In retrospect, I probably shouldn't have put so much effort into the animations of a character whose entire mechanic is to not to look at them."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Nightmarionne_MementoMori,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Nightmarionne_CuriosityKilledTheCat,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Nightmarionne_DeathInTheEye,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Nightmarionne_FightOrFlight,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Nightmarionne_IgnoranceIsBliss,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Nightmarionne_OutrunMeForever,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Nightmarionne_PryingEyes,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Nightmarionne_PullingTheStrings,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Nightmarionne_SweetDreams,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Nightmarionne_TemptedFate,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Nightmarionne_TheDevil,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Nightmarionne_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Nightmarionne;
}

Character = UnknownEnum.Value_25;

with (ExtrasDatabase[Character])
{
    Debut = "FNAF World (2016)";
    Desc = ["While the secrecy of Mendo's location has been maintained primarily as a security measure, this has led to the ironic consequence of his system not receiving a single security update since his conception. As such, a particularly nefarious hacker, said to be part of infamous group \"The Apple,\" has exploited this weakness to access company systems, only known by their online handle: \"Lolbit.\" Strangely, their attacks seem to not be born out of any monetary incentive; despite their attacks primarily consisting of increasing prices on Mendo's items, all tokens spent still wind up going to the company anyway. Security reports done on the hacker's activity seem to suggest they are motivated purely by the desire to mess with employees as much as possible...as well as use live feeds of their shifts as background noise while they draw.", "I've mentioned in the dev notes of other animatronics how I made an effort to differentiate characters who were originally just recolors of each other, and Lolbit is definitely the most extreme example of that. While in Frickbear's 2 they had a design much closer to their original Sister Location counterpart, I couldn't really get away with just making them a Funtime Foxy recolor when Funtime Foxy is now also in the game. As a result, this evil little creature was born."];
    Jumpscares = [];
    VoiceLines = [
    {
        LineID: voc_Lolbit_HAAAAAIIIII,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Lolbit_Giggle,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Lolbit_Giggle2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Lolbit_Giggle3,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Lolbit_ItsYours,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Lolbit_Lmao,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Lolbit_ThanksForBuyin,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Lolbit_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Lolbit;
}

Character = UnknownEnum.Value_26;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's: Sister Location (2016)";
    Desc = ["The self-described magnum opus of Mr. Afton, Circus Baby's design exhibits ambition to a level no animatronic has ever quite been able to match since - which only makes it all the more tragic that she was only operational in a restaurant for a single day. She's been locked away ever since, her creator vetoing any idea the board has come up with to make back their investment on her. It seems she holds a certain amount of sentimental value to her creator, which for him is quite rare. Holding much less sentimental value are the freight container's worth of Bidybabs produced alongside her, known for inexplicably shattering when left alone around Baby for any extended period of time. When asked what happened to them, Baby often claimed she \"just needed to take the edge off.\"", "The Bidybabs' designs are a pretty significant departure from their original designs, and this was for good reason! Because the Bidybabs needed to be drawn more times than pretty much any other character in the game, I wanted to simplify them down as much as possible to make doing so a lot less work. Knowing how and when to be lazy is a very important skill for a game developer to have!"];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Baby_HeresTheScoop,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Baby_BelieveInCircuses,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Baby_EntireCircus,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Baby_HoldItAgainstUs,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Baby_IceCream,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Baby_MadeMeDo,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Baby_MakesZero,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Baby_TrustingMe,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Baby_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Baby;
}

Character = UnknownEnum.Value_27;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's: Sister Location (2016)";
    Desc = ["This particularly loud and obnoxious variant of Freddy is a sensation with kids, but widely hated by their parents. The amount of bells and whistles included within his mech is rivalled only by Baby herself, with his Bonnie hand puppet, lovingly dubbed \"Bon-Bon,\" being able to think and operate entirely on its own. Some of his features seem to hold no functional purpose, however - including his oversized chest cavity which, when asked, the company has refused to clarify the purpose of. It can be assumed they were just embarrassed about how much money they spent on these superfluous features.", "Some of the omissions made in the UCN roster always bugged me, especially Funtime Freddy considering his importance to the series and the fact that all of his bandmates got to appear. Something I aimed for with the Frickbear's roster was a sort of all-or-nothing approach, where if I wasn't going to include the entirety of a certain set of animatronics, I wouldn't include any of them. (There are some exceptions to this within the roster, though.) Otherwise I figured the roster would feel sorta incomplete."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: -1,
        JumpSideVertical: -1
    }, 
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 1,
        JumpSideVertical: -1
    }, 
    {
        JumpID: UnknownEnum.Value_30,
        JumpSprite: sJumpscare,
        JumpSide: -1,
        JumpSideVertical: -1
    }, 
    {
        JumpID: UnknownEnum.Value_30,
        JumpSprite: sJumpscare,
        JumpSide: 1,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_FuntimeFreddy_DreamWork,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_FuntimeFreddy_Laugh1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_FuntimeFreddy_CountTheWays,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_FuntimeFreddy_OverHere,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_FuntimeFreddy_ASurprise,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_FuntimeFreddy_BigHug,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_FuntimeFreddy_BlowOutTheCandles,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_FuntimeFreddy_CheckThisOut,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_FuntimeFreddy_HereICome,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_FuntimeFreddy_SeeSomethingCool,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_FuntimeFreddy_TakeItAway,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_FuntimeFreddy_ComeOn1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_FuntimeFreddy_ComeOn2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_FuntimeFreddy_Doh1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_FuntimeFreddy_Doh2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_FuntimeFreddy_Mumbling,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_BonBon_Dohh1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_BonBon_Dohh2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_FuntimeFreddy_DeathDayBoy,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeFreddy_DoubleYourFuntimes,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeFreddy_NoBody,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeFreddy_NotAMouse,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeFreddy_QuiteTheFunTime,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_BonBon_FazbearPincer,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_BonBon_GuyWithNoLegs,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_BonBon_NoSleeping,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_BonBon_PushedTooHard,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_BonBon_Short,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeFreddy_PartyPooper,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_FuntimeFreddy;
}

Character = UnknownEnum.Value_28;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's: Sister Location (2016)";
    Desc = ["A self-described \"sensation of the stage,\" Funtime Foxy brings a certain amount of boisterous flair to every performance, having the showmanship of a ringmaster despite always being relegated to the sideshow. While the selling point of his act was originally his impressions, in which he would take the voice of a volunteer and say whatever the audience requested with it, she became indefinitely unavailable for rentals once certain customers realized the lack of restrictions on what she could say and taught her to repeat certain...unscrupulous phrases.", "UCN is actually my favorite FNaF game (as I'm sure you could've gleaned based on how this game is designed), although even I have to admit that some of the mechanics are just plain stupid. Funtime Foxy is probably one of the most infamous characters in that game mechanically! The nice thing about fangames is that you can pick and choose which ideas to steal to avoid making the same mistakes as the official games. Hopefully Funtime Foxy's mechanic is a lot more tolerable here!"];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 1,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_FuntimeFoxy_Showtime,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_FuntimeFoxy_ClassAct,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeFoxy_Huzzah,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeFoxy_NoJumpscare,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeFoxy_Speechless,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeFoxy_TuneIn,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeFoxy_Bloodshed,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeFoxy_Cartoonish,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeFoxy_MovieTheater,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeFoxy_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_FuntimeFoxy;
}

Character = UnknownEnum.Value_29;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's: Sister Location (2016)";
    Desc = ["Ballora values thoughtfulness and composure, hosting a much calmer performance than the rest of her troupe. In contrast, she has quite the temper in regards to her behavior around customers. Many have complained about her horrible sense of direction, being unable to correctly guide someone even to a room in her direct line of sight. Clients have been asked not to argue with her about it, as it only ever leads to her insisting they just didn't follow her directions correctly. Rowdy teens enjoy testing the limits of her advanced stabilizers by stacking objects on top of her until she falls over.", "I swear I didn't make them that big on purpose."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Ballora_CareToDance,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Ballora_AnythingButGraceful,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Ballora_DownWillComeBaby,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Ballora_FacesTowardsHeaven,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Ballora_HushLittleBaby,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Ballora_LittleThings,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Ballora_NotQuiteMyTempo,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Ballora_TerriblePerformance,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Ballora_TooSlow,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Ballora_WindowToTheSoul,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Ballora_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Ballora;
}

Character = UnknownEnum.Value_30;

with (ExtrasDatabase[Character])
{
    Debut = "Freddy Fazbear's Pizzeria Simulator (2017)";
    Desc = ["While once coming pre-installed in every Frickbear Entertainment computer, Helpy has largely been phased out over time. Originally pitched as a virtual assistant to improve workplace efficiency, he became largely disliked by the employees who were forced to install him, discovering that he was just a poorly-disguised adware program who made their computers nearly unusable thanks to his ceaseless popups. Many also found his voice really annoying.", "It's probably pretty clear just from looking at it, but Helpy's portrait here was the only one I didn't draw myself! I pretty much knew from the start that I wanted Helpy to be a parody of those old virtual assistants, crusty pre-rendered sprites and all, although I unfortunately do NOT know how to 3D model. Luckily, that's what friends are for! Orca's modelling style just so happened to perfectly fit the idea I had in mind for Helpy so it wound up working out well."];
    Jumpscares = [];
    VoiceLines = [
    {
        LineID: voc_Helpy_WantSomeHelp,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Helpy_BuyBuyBuy,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Helpy_ClickHere,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Helpy_HelloThere1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Helpy_HelloThere2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Helpy_SendEmail,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Helpy_DarnIt,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Helpy_Dawww,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Helpy_Doh,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Helpy_Fiddlesticks,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Helpy_Sonofa,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Helpy_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Helpy;
}

Character = UnknownEnum.Value_32;

with (ExtrasDatabase[Character])
{
    Debut = "Freddy Fazbear's Pizzeria Simulator (2017)";
    Desc = ["Mr. Hippo is a long-running character in Fazbear Entertainment's pantheon of mascots, existing even before Freddy Fazbear himself! In spite of this, however, he has unfortunately fallen into obscurity in recent years. A rights dispute between Fazbear Entertainment and Murray Costume Manor, the original designers of the character, ultimately led to the company deciding he wasn't an important enough character to be worth the legal hassle to keep and dropped him from their lineup. Mr. Hippo animatronics are still being produced in the modern day, though only through cheap companies who managed to scrounge up the character's rights following Murray Costume Manor's bankruptcy.", "An unfortunate aspect of trying to represent the entire FNaF series within a limited character roster is that some characters you like will inevitably need to be left out - in the case of this game, that includes the rest of the Mediocre Melodies. Pizzeria Simulator introduced so many characters that I had to be especially picky with which ones to include compared to other games, and I chose Mr. Hippo since he's by far the most popular and iconic of his group."];
    Jumpscares = [];
    VoiceLines = [
    {
        LineID: voc_MrHippo_Select,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_MrHippo_Ramble_Magic,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_MrHippo_Ramble_Toys,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_MrHippo_Ramble_VideoGames,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_MrHippo_Ramble_Monty,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_MrHippo_FakeDeathcoin,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_MrHippo_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_MrHippo;
}

Character = UnknownEnum.Value_31;

with (ExtrasDatabase[Character])
{
    Debut = "Freddy Fazbear's Pizzeria Simulator (2017)";
    Desc = ["Seeing their declining profits going into the 2000's, Fazbear Entertainment knew they needed a change of direction. After promptly firing their longtime animatronic designers and hiring an up-and-coming experimental artist to direct the designs going forward, out came Music Man! The new bandmate for the new millennium, his big launch had lunch boxes, action figures, even a cartoon with cutting edge CGI! ...But everyone was so busy running and screaming that not a single sale was made. They apologized for the trauma caused, sold him off to make some of their money back, and learned to just stick to the classics. He can still be spotted at some franchise locations to this day.", "I like Music Man. I like how he just doesn't fit with any other group of animatronics made before or after him. I like how he isn't any specific animal and is just some weird human-spider hybrid. I like that he's disproportionately creepy-looking compared to all the other purchasable animatronics in Pizzeria Simulator. I like that for some reason Steel Wool keeps making new variants of him and him specifically despite being such an unimportant character in the overall series otherwise."];
    Jumpscares = [];
    VoiceLines = [
    {
        LineID: voc_MusicMan_KickIt,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_MusicMan_Chuckle,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_MusicMan_NotGroovy,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_MusicMan;
}

Character = UnknownEnum.Value_33;

with (ExtrasDatabase[Character])
{
    Debut = "Freddy Fazbear's Pizzeria Simulator (2017)";
    Desc = ["A Freddy variant made off-the-record by company co-founder Henry Emily. Though technically still company property, Frickbear Entertainment values it at a low price in the hopes of discouraging rampant creativity from employees - After all, they don't pay employees to innovate. The few technicians trusted with handling this animatronic seem to be very wary of it. They say it's always thinking.", "Lefty's salvage value was originally five dollars, before rebalances to the upgrade economy required us to increase it. I REALLY wanted to commit to the bit, even if that price was incredibly low for how hard he actually is to deal with ingame... though tragically, the game's balancing came first."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: -1,
        JumpSideVertical: -1
    }, 
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 1,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Lefty_Shhh,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Lefty_Shhhhhhhhhh,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Lefty_Exterminate,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Lefty_FiveDollars,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Lefty_NothingLeft,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Lefty_PeaceAndQuiet,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Lefty_ScreamedLessLoudly,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Lefty_ShutYouUp,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Lefty_StrungAlong,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Lefty_TheSuit,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Lefty_YouHearThat,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Lefty_Freedom,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Lefty;
}

Character = UnknownEnum.Value_34;

with (ExtrasDatabase[Character])
{
    Debut = "Freddy Fazbear's Pizzeria Simulator (2017)";
    Desc = ["A combo deal of the original Funtime Freddy, Funtime Foxy and Ballora models tangled up as a singular entity. Nobody's entirely sure why the three of them decided to do this - in fact, nobody sent out to retrieve them has returned to tell the tale. However, the absence of Baby from the amalgamation seems to imply some in-group drama having occurred between the four of them, leading to her expulsion. Many company employees feel sympathy for the creature, wishing they could do the same with their own bosses.", "The explanation I came up with for how Molten Freddy can exist alongside regular Funtime Freddy is just that there were multiple Funtime Freddies produced. (This is also why the Withereds and Classics or the Marionette and Lefty can coexist, etc etc.) Unfortunately, there wasn't any sensible way to explain two Springtraps running around, so Scraptrap wound up being the only one of the four vent-crawlers from Pizzeria Simulator to not be included in this game."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: -1,
        JumpSideVertical: -1
    }, 
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 1,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_MoltenFreddy_AllForOne,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_MoltenFreddy_IGotHim,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_MoltenFreddy_MightyLog,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_MoltenFreddy_LookMeInTheEye,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_MoltenFreddy_CheckTheFace,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_MoltenFreddy_Spaghetti,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_MoltenFreddy_AllMe,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_MoltenFreddy_RedOnMe,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_MoltenFreddy_Outnumber,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_MoltenFreddy_CantTakeTheHeat,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_MoltenFreddy_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_MoltenFreddy;
}

Character = UnknownEnum.Value_35;

with (ExtrasDatabase[Character])
{
    Debut = "Freddy Fazbear's Pizzeria Simulator (2017)";
    Desc = ["The original Circus Baby model, worn down from years of misadventures and haphazardly cobbled back together with scrap metal stolen from Hurricane's various junkyards. (Not the lobster claw, though - that was a donation from Larry's Lobster Claws LLC.) While she'll tell you she was kicked out of her band because the others \"were trying to change her lifestyle\" and that she \"really just needed a break from them,\" it seems it was more because she's the quintessential bad roommate. No care for boundaries, bad hygiene, no job, and worst of all, asks you to buy her ice cream then doesn't pay you back.", "Despite the complete shift in art styles between Frickbear's 2 and 3, the way I draw Scrap Baby remained remarkably consistent between the two games, at least relative to the other animatronics. This game's art style was actually going to be a LOT more similar to 1 and 2 at first, although in the end I feel like the current direction was the right one to take."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_ScrapBaby_ShockingIsntIt,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_ScrapBaby_ConnectionTerminated,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ScrapBaby_LightsOut,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ScrapBaby_NeedYourPower,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ScrapBaby_NothingControlled,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ScrapBaby_StartAllOver,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ScrapBaby_YouWontDie,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_ScrapBaby_SkaterHater,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_ScrapBaby;
}

Character = UnknownEnum.Value_36;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's: The Twisted Ones (2017)";
    Desc = ["The owner of Afton Robotics tried many things to keep shareholders on board even during its roughest moments, and one of these many pitched ideas was the Illusion Disc, an incredible piece of technology that could be attached to any item and make you see them as an animatronic that wasn't really there. The shareholders were impressed at how lifelike these illusions were, and it had the potential to save a fortune on animatronic parts...though they had one request. \"Could you make the illusions a little less scary?\" Insulted, the owner shelved the idea, and it never saw use within the restaurants. Luckily, they found new purpose when their creator began using them to terrorize his children when he was bored.", "I honestly think my biggest regret when it comes to the new additions in this game's roster is not including a surprise pick. Since the roster is limited but also has to cover the entire series up to the point of the game's creation, I usually prioritize including the more popular, important or unique characters - although there's also some that are just chosen to be funny. Twisted Wolf and especially LolzHax were sort of meant to be that for Frickbear's 2, and I guess here too now that they've returned. If I ever update this game and add more characters, let it be known that I'm absolutely including at least one character nobody would be asking for."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_TwistedWolf_AWOOOOO,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_TwistedWolf_BigBadWolf,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_TwistedWolf_ExpectingMore,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_TwistedWolf_HuffPuff,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_TwistedWolf_ImTwisted,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_TwistedWolf_LibertyToWolves,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_TwistedWolf_LightReading,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_TwistedWolf_MereIllusion,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_TwistedWolf_Scared,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_TwistedWolf_SmokeAndMirrors,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_TwistedWolf_TheDirt,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_TwistedWolf_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_TwistedWolf;
}

Character = UnknownEnum.Value_37;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's: Help Wanted (2019)";
    Desc = ["Since an update to its IT systems are far out of Fazbear Entertainment's budget, most of its systems rely on decades-old software, and, as such, are riddled with decades-old bugs. Because of this, rumors have spread among employees about a computer virus somehow dating all the way back to the early 70's still infecting their systems to this very day. While the company has denied these rumors, they have yet to present an explanation for the real-world manifestations of digital characters this virus is often attributed with.", "Look, I am fully aware that Glitchtrap is his 'official' name. It's what he's called in the character encyclopedia and all the merchandise and everything. But with all due respect, I am NOT calling him that. The name SUCKS! He's not even a glitch, he's a virus! Scott Cawthon himself went on record saying he doesn't even like the name! If there's any influence I hope this game has (beyond encouraging people to draw Withered Chica more often, of course) it's that I want to popularize Malhare as the default name for this guy."];
    Jumpscares = [];
    VoiceLines = [
    {
        LineID: voc_Malhare_LaughIntro,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Malhare_LaughAppear,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Malhare_LaughEnd,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Malhare_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Malhare;
}

Character = UnknownEnum.Value_38;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's: Help Wanted: Curse of Dreadbear (2019)";
    Desc = ["Dreadbear was put together as part of an ambitious Halloween promotion at Freddy's restaurants. Unfortunately, testing with focus groups determined that an animatronic with an actual human brain would not be very popular with families, so he wound up never being used. Legends say he wanders the forests of Hurricane to this day, searching for the man who created him in the hopes that he'll build him a robot bride.", "The plans for Dreadbear's mechanic changed a lot over the course of development - Originally he was going to have one close to his original appearance in the Danger! Keep Out levels of Curse of Dreadbear where he'd start at the back of the building and slowly move towards your office, although this mechanic was ultimately reworked and given to Springtrap instead. Afterwards was the candy idea, though in this iteration there was only going to be one candy bowl and he was going to appear at the right doorway instead of the center window. Fortunately, we quickly realized he would've been much too big to fit in the doorway, which led us to the final iteration of his mechanic. A lot of animatronics' mechanics underwent a similar pipeline over the course of the game's development!"];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Dreadbear_HappyHalloween,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Dreadbear_Candy1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Dreadbear_Candy2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Dreadbear_FeedMe,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Dreadbear_Growl,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Dreadbear_TrickOrTreat,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Dreadbear_Om,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Dreadbear_OmNomNom,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Dreadbear_Tasty,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Dreadbear_ThankYou,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Dreadbear_Yummy,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Dreadbear_Brains,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Dreadbear_CarveYou,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Dreadbear_HalloweenSpirit,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Dreadbear_ItsAlive,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Dreadbear_MyTummy,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Dreadbear_StillHungry,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Dreadbear_TreatForMe,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Dreadbear_SoHungry,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Dreadbear;
}

Character = UnknownEnum.Value_39;

with (ExtrasDatabase[Character])
{
    Debut = "Freddy in Space 2 (2019)";
    Desc = ["Quite possibly the most advanced robot Afton Robotics has produced to date, LOLZHAX is a troublemaking television-headed tyrant who can bend the very fabric of time and space to summon in anything or anyone he wants. Unfortunately, his creator could not find any way this ability could be used to murder children, so LOLZHAX was stashed away, never to be used again. This has imbued him with a hatred of the Fazbear gang, seeking to exact his revenge and brainwash all of animatronic kind into becoming his willing peons as soon as he's released. Fear his despicable reign!", "LolzHax is in kind of a funny position compared to almost the entire rest of the roster, since unlike most characters who were originally 3D models and thus needed to be cartoonified to fit into this game's art style, LolzHax has ALWAYS been 2D and cartoony from his conception. As a result, his design here really isn't much different from his original one."];
    Jumpscares = [];
    VoiceLines = [
    {
        LineID: voc_LolzHax_MeetAtLast,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_LolzHax_Alert1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_LolzHax_Alert2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_LolzHax_NewChallenger,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_LolzHax_NewIrritation,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_LolzHax_MuchWorse,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_LolzHax_Behold,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_LolzHax_Laugh1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_LolzHax_Laugh2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_LolzHax_Laugh3,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_LolzHax_LastOfMe,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_LolzHax;
}

Character = UnknownEnum.Value_41;

with (ExtrasDatabase[Character])
{
    Debut = "Houston, TX (1978)";
    Desc = ["Overworked, underpaid, and underappreciated, one game developer working under Fazbear Entertainment decided he had enough and went rogue, concocting a plan to get back at the company. Reworked from a game he had created on company time into a ransomware virus, Animdude was spread across company computers, encrypting employees' files until they beat the developer's game to get them back. With nobody left at the company being skilled at the game enough to do so, they begrudgingly hired the developer back to address the issue. He was fired again soon after.", "For a while I was kind of torn on whether I wanted to characterize Animdude as 'the actual guy from There Is No Pause Button' or 'literally just Scott Cawthon.' While his mechanic is definitely more meant to be the former, his voice lines and dialogue are derived from the latter, mostly just because there would be next to nothing to work with otherwise."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Animdude_HelloHello,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Animdude_EnoughTrolling,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Animdude_ImaginaryMonster,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Animdude_Theories,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Animdude_ThisStory,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Animdude_Underachiever,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Animdude_YouKnow,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Animdude_YourPlace,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Animdude_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Animdude;
}

Character = UnknownEnum.Value_40;

with (ExtrasDatabase[Character])
{
    Debut = "The Desolate Room (2007)";
    Desc = ["Despite having been originally created as nothing more than an autonomous service robot meant to serve breakfast to those aboard the Lun Infinitus space station, Coffee soon found himself as the last hope for humanity's survival as it reached the brink of extinction. ...That was until he got warped here. One would think he'd be happy that humanity is still alive and well, but he seems a bit upset that he's been relegated to running game simulations and serving coffee again.", "Coffee actually wasn't going to be included at first; For a while only five bonus characters were planned, and I wanted to avoid adding any more than that because I felt like doing so might be a slippery slope straight into scope creep. However: Coffee's funny, so I made an exception for him."];
    Jumpscares = [];
    VoiceLines = [
    {
        LineID: voc_Coffee_Sound,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Coffee_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Coffee;
}

Character = UnknownEnum.Value_42;

with (ExtrasDatabase[Character])
{
    Debut = "Chipper & Sons Lumber Co. (2013)";
    Desc = ["Stories told of Mr. Chipper's exploits are not told lightly. A ruthless kingpin who rules his forestry empire with an iron fist, few who have gotten in the way of his business having lived to tell the tale. ...At least, that's what the termites would tell you. The rest of the forest's denizens seem to like him quite a bit. Just look at those eyes! So full of life! Do you really think anything sinister could be hiding behind them?", "If certain bits of dialogue in Chipper & Sons Lumber Co. are to be believed, every character on this roster is, in fact, a robot. The only other thing I have to mention about Chipper is that he's one of very few characters on this roster who I own merchandise of! The other two are Lefty and Funtime Foxy, who I own the plushies of. A friend got me the former for my birthday and I found the latter at a thrift store for fifty cents. ...This has absolutely nothing to do with the character, I just thought you'd like to know."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Chipper_ImTheBeaver,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Chipper_Yahoo,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Chipper_GamblingDebt,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Chipper_GrimReaper,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Chipper_IKnowTheDeal,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Chipper_SayHiToPhil,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Chipper_TermiteMound,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Chipper_Timber,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Chipper_TooExpensive,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Chipper_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Chipper;
}

Character = UnknownEnum.Value_43;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's (Film) (2023)";
    Desc = ["Poor Sparky never got past the prototyping phase, being left quite literally half-finished ever since his inception. While all his bandmates have gone on to have long and successful careers across the Freddy's locations, Sparky has been left behind as nothing more than a footnote in the company's history, the few models of him left often only ever being used for spare parts and otherwise left rotting away in company storerooms. Consider yourself lucky for finding this one - he may be missing an arm and an eye, but a Sparky animatronic in this good of condition is quite the rare find!", "For the bonus characters this time around, I chose to focus on fan characters who later became officially recognized in some way along with characters from old ScottGames properties who reappeared as cameos in some of the FNaF games. I thought this would be a good way to preserve the vibe of the guest characters in Frickbear's 2 (who were all just OCs or characters who had nothing to do with FNaF) while still having them be recognizable and make sense as inclusions in a FNaF fangame."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Sparky_BowWowDude,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Sparky_BeHere,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Sparky_LetTheDogsOut,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Sparky_MyBites,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Sparky_NewTricks,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Sparky_PlayDead,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Sparky_ScrewedThePooch,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Sparky_WontBelieveYou,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Sparky_WrongTree,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Sparky_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Sparky;
}

Character = UnknownEnum.Value_44;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Candy's (2015)";
    Desc = ["The mascot of Candy's Burgers & Fries, a rival restaurant chain to Freddy's that always seems to situate its stores directly across the street from them. As its primary competitor, Candy's seeks to rival Freddy's on every criteria possible, including the amount of tragedies at their restaurants.", "Out of all the fanverse characters, I mainly included the ones I did because they were distinct characters as opposed to variants of pre-existing ones - Ignited Freddy was considered, but ultimately not included because of that. (I've already drawn Withered Freddy and characters that are derivative of him enough!) I feel like Candy would've been a shoe-in for the roster regardless though, considering he's probably the most famous FNaF fan character."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Candy_UhhMeow,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Candy_BeforeThem,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Candy_BrightSide,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Candy_CatGotYourTongue,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Candy_CheapOrigami,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Candy_Fishing,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Candy_GenuineArticle,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Candy_HidInTheLocker,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Candy_NineLives,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Candy_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Candy;
}

Character = UnknownEnum.Value_45;

with (ExtrasDatabase[Character])
{
    Debut = "Popgoes (2016)";
    Desc = ["An original creation of Fritz Smith (no, not that one, a different one), Popgoes is the mascot of the Popgoes Pizzeria, filling a niche as the UK's premier option in animatronic entertainment. His establishment touts itself as the most cutting-edge in the industry, being way ahead of the curve in both mobile phone and 3D printing technology. In fact, Popgoes himself makes good use of his restaurant's 3D printers, often using them to recreate a figure Fritz seems to have a traumatic past with. When asked why, Popgoes said he does this because he thinks Fritz' reaction to it is funny.", "Kane Carter saw and signed off on Popgoes' dialogue in the salvage locations, by the way. He approved the line 'If I don't get back to the Dead Forest, this is gonna be my Popgoes Finale!'"];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Popgoes_Popgoes,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Popgoes_AnAI,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Popgoes_BurnForEternity,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Popgoes_CallMeEvergreen,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Popgoes_Epitome,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Popgoes_ImTheHero,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Popgoes_MyHeart,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Popgoes_RealisticDepiction,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Popgoes_Reprinted,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Popgoes_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Popgoes;
}

Character = UnknownEnum.Value_47;

with (ExtrasDatabase[Character])
{
    Debut = "Freddy Fazbear's Pizzeria Simulator (2017)";
    Desc = ["Funtime Chica is an oddity among the lineup of animatronics produced by the company, having tens of thousands in R&D poured into her only to never end up being used. According to journals penned by her creator shortly after her creation, the reason for her ultimate fate was that \"her child-kidnapping functionality left much to be desired.\"", "Funtime Chica is a holdover from Frickbear's 2, one which was added literally a day before that game's release as part of the King's Prize mechanic. That mechanic was also brought over here! RNG mechanics can be kinda unfair if it's something you're forced into, but I personally think they're really funny as something you opt into, where you stand an equal chance of getting a stupidly powerful powerup as you do dying instantly."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_FuntimeChica_HitItBig,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeChica_KeepGambling,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeChica_StupidGames,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeChica_Surprise,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeChica_WinSome,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_FuntimeChica_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_FuntimeChica;
}

Character = UnknownEnum.Value_46;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Frickbear's 2 (2022)";
    Desc = ["The best character. He'll tell you himself! With the restaurant he was originally created as the mascot for having long since shut down, Rodney was forced to start a new life...one which he would later find working for the mafia. He's quick to brag about how successful his career in crime has been - in fact, he's quick to brag in general - and loves nothing more than blabbering about the sheer amount of money he's made from it. With that in mind, one does have to wonder what he's doing here begging for handouts...", "Rodney's a real character, lemme tell ya. He was the very last traditional character added to the roster, and also the only OC of mine to be included in this game! I always found including OCs in FNaF fangames kinda cheesy and forced, buuuut Rodney WAS in Frickbear's 2, and more than one person seemed interested in him returning, so I figured what the heck. I feel like I can get away with it in this specific instance since he's pretty much treated as a joke character here. Despite what you may think, Rodney isn't and was never intended to be a FNaF OC! In fact, he was created for a completely different game project of mine...One which, assuming I finally got this game done by the time you're reading this, I may be working on at this very moment ;)"];
    Jumpscares = [];
    VoiceLines = [
    {
        LineID: voc_Rodney_ImBusy,
        LineType: UnknownEnum.Value_0
    }, 
    {
        LineID: voc_Rodney_Fail_InThisOne,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Fail_PlayingGamesPoorly,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Fail_SeenThatComing,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Fail_StifledLaugh,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Fail_WaitingForThat,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Fail_WompWomp,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_35kDollars,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_AdRevenue,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_AlarmYou,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_AltF4,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_AntiPiracy,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_Beating4020,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_BetterToDo,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_Boring1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_Boring2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_BossBet,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_Buddy,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_Burp2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_Clothes,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_ComicMischief,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_Demonitized,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_DoneThat,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_DontChoke,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_Doors,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_Fanverse,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_FanverseManifesto,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_FeatureCreep,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_FirstTimePlaying,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_FiveNights,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_FourthPhoneCall,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_Frickbears3,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_FunChallenge,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_GasLeak,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_GetJumpscared,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_GettingPaid,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_GetWorse,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_InRealTime,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_GimmikoShill,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_Invalidate,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_JumpscareCompilation,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_Keyboard,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_Kneecapped,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_LegallyDistinct,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_MakeshipPlushie,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_ManualBreathing,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_MassiveLoreHint,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_MemoryLeak,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_Missed,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_Noticed,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_RecordTheseLines,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_ReleaseLikeThis,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_RodneyPlus,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_SalvageThisGameplay,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_SayTheLine,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_SecretCheatCode,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_Slurp,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_SmellLikeThat,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_Sweatshop,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_TheControversy,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_ThreeDimensions,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Idle_TooManyNights,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Item_BagOfChips,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Item_DontNeedPowerups,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Item_Handicap,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Item_MinimumWage,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_PhoneMute,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Tokens_Casino,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Tokens_KingsPrizes,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Tokens_LivingWage,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Tokens_PaidForPlaying,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_TV_LoveThisChannel,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_TV_SomethinGood,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Win_BeginnersLuck,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Win_BigBrother,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Win_GamblingRegulations,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Win_GetToLeave,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Win_HarderWithoutMe,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Win_NotImpressed,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Rodney_Deathcoin,
        LineType: UnknownEnum.Value_2
    }];
    Image = FB_Rodney;
}

Character = UnknownEnum.Value_48;

with (ExtrasDatabase[Character])
{
    Debut = "Fazbear Frights #12: Felix the Shark (2022)";
    Desc = ["The product of one particularly eccentric Fazbear franchisee, Felix was the star attraction of a short-lived \"Underwater Freddy's\" location in central Florida, touting a unique nautical theme and even a fair few water-based attractions. Unfortunately, the location was forced to shut down after it was discovered to be a front for a money laundering operation. Not one run by the owner, mind you - one run entirely by Felix himself. (That's what the owner told the judge, at least.) With the location condemned, Felix has found himself able to conduct his business free of prying eyes, and his counterfeit token operation has been booming ever since. Be wary of any vendor bot trying to sell you on his loans - they might be an underling of his!", "A driving principle in this game's overall design was asking ourselves \"you know what would be really funny?\" Felix came about pretty late into the game's development when some last couple upgrades were being added, one of which was one that would let you go into token debt. However, an upgrade like this would obviously need a punishment for not paying off your debt - and while most game developers would be smart and save resources by making the drawback to this super specific upgrade something appropriately simple, we thought it'd be really funny to tie a whole new fully-voiced character to it instead."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Felix_ConcreteShoes,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Felix_Fuggetaboutit,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Felix_GetTheTokens,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Felix_NuttinPersonal,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Felix_SleepingWithDaFishes,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Felix_UncleVito,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Felix_UOME,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Felix_VarsityAthlete,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Felix_WomenWantMe,
        LineType: UnknownEnum.Value_3
    }];
    Image = FB_Felix;
}

Character = UnknownEnum.Value_49;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Frickbear's 3 (2026)";
    Desc = ["Cobbled together with whatever loose scraps could be found around the pizzeria, Salvage is the ultimate culmination of just about every tragedy in Fazbear Entertainment's long, troubled history, with the man responsible for them all at its helm. This mechanical amalgamation is fueled by the bad memories of the spirits trapped within itself, feeding on the agony supplied by the carefully chosen bits and pieces in its mass. One would think being stuck in the same robotic body as his angriest victims would be torture for Salvage, but it seems the sheer size of his ego has managed to completely nullify any influence they would have otherwise had. Unfortunately for him, his power trip wound up being rather short-lived.", "The idea for Salvage actually came from a scrapped concept for Frickbear's 2 - the idea was that if you salvaged all four scrap animatronics, the game would end with a boss fight against an amalgamation of all four of them. While this idea was ultimately scrapped (mostly because making a complex boss fight in Scratch wound up being too much of a headache for me), the idea got to finally be fully realized here! Beyond that, another fun little tidbit is that Salvage's name and overall premise are inspired by early pre-release fan theories for FNaF3, where Springtrap was commonly referred to as \"Salvage\" and believed to be an amalgamation of the four original animatronics before we got a better look at him. Visually, Salvage was intended to be as hideously overdesigned as we could reasonably get away with, though we did have to reel things in a bit once we realized we'd be drawing more sprites for him than any other character in the game. One last funny little tidbit: the positioning of Lefty's star on the purple part of his cloak is meant to resemble the classic Purple Guy sprite."];
    Jumpscares = [
    {
        JumpID: 1,
        JumpSprite: sJumpscareSalvage,
        JumpSide: 0,
        JumpSideVertical: -1
    }, 
    {
        JumpID: 2,
        JumpSprite: sJumpscareSalvage,
        JumpSide: 0,
        JumpSideVertical: -1
    }, 
    {
        JumpID: 3,
        JumpSprite: sJumpscareSalvage,
        JumpSide: 0,
        JumpSideVertical: -1
    }, 
    {
        JumpID: 4,
        JumpSprite: sJumpscareSalvage,
        JumpSide: 0,
        JumpSideVertical: -1
    }, 
    {
        JumpID: 5,
        JumpSprite: sJumpscareSalvage,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [
    {
        LineID: voc_Salvage_Open1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Open2_Jeremy,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Open2_Mike,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Open2_Vanessa,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Open2_Generic,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Open3,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Open4,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Open5,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Phase2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Phase3,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Phase4,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Phase5,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Ending1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Ending2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Hurt1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Hurt2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Hurt3,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Hurt4,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_HurtFinish1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_HurtFinish2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_HurtFinish3,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_HurtFinish_SuperRare,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Zapped1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Zapped2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_FinalHit,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Deathcoin1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Deathcoin2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Deathcoin3,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_DeathcoinBlocked,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Beartrapped,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Salvage_Death_6AMShow,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Salvage_Death_BeyondYou,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Salvage_Death_Created,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Salvage_Death_FarGreater,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Salvage_Death_History,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Salvage_Death_Overpower,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Salvage_Death_Reestablished,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Salvage_Death_ScreamedLouder,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Salvage_Death_Shadow,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Salvage_Death_Symmetry,
        LineType: UnknownEnum.Value_3
    }, 
    {
        LineID: voc_Salvage_Death_WeightClass,
        LineType: UnknownEnum.Value_3
    }];
    
    if (global.ClearedEndings[3][UnknownEnum.Value_3] > 0)
    {
        array_insert(VoiceLines, 4, 
        {
            LineID: voc_Salvage_Open2_Fritz,
            LineType: UnknownEnum.Value_1
        });
        array_insert(VoiceLines, 5, 
        {
            LineID: voc_Salvage_Open3_Fritz,
            LineType: UnknownEnum.Value_1
        });
    }
    
    Image = FB_Salvage;
}

Character = UnknownEnum.Value_50;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 4 (2015)";
    Desc = ["Those who meddle with forces outside their control may soon find themselves face-to-face with Nightmare, the living effigy of pure dread. Born out of the terror of a long-forgotten tragedy, his cottony insides are rich with despair. Its four cohorts born of horror lurk beneath its shadowy mass, obeying his every hellish whim with no hesitation, all to keep the spirit of the child who conceived them in an eternal vortex of fear. If you speak of it, it will know. If you hear it, it's already too late. If you see it, you have nothing left to pray for, for your fate has already been sealed. To even imagine a child could know such fear is a horror in itself.", "Thanks to Nightmare's boss fight, every base FNaF4 animatronic does actually appear in this game! This also means every single enemy from the original quadralogy of games is represented on the roster which I think is neat. Nightmare's boss fight was always conceptualized as a break from the main gameplay formula, to the point that it'd feel like you're playing a different game altogether. ...Which I guess did wind up being true in a literal sense."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [];
    Image = FB_Nightmare;
}

Character = UnknownEnum.Value_51;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 4 (2015)";
    Desc = ["A beastly bugbear born from a child's fearful memories. He doesn't care much for getting face-to-face with his victims; Instead, he often sends his little friends, the Freddles, to wear them down before going in for the kill himself. With his sheer size and hideously big claws, he could probably rip anyone in half quite easily - though when on the hunt, his slothfulness is ultimately his greatest shortcoming.", "The Nightmares were originally going to look a lot closer to their original counterparts, just with the typical Frickbear stylizations applied, although I quickly realized this would've made them look a bit too similar to the Withered animatronics, which I felt wouldn't be very interesting. As such, I decided to go all in on making them resemble plushies, a design trait that I played around with for Nightmare Fredbear on the main roster though didn't go super far with. I feel like this was the right move in the end - not only does it make more sense symbolically considering the boss fight they're part of, it also looks a heck of a lot more cool."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [];
    Image = FB_NightmareFreddy;
}

Character = UnknownEnum.Value_52;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 4 (2015)";
    Desc = ["A spindly freak born from a child's fearful memories. He's always the first to pounce whenever prey is in sight, pursuing anything and anyone so long as he perceives it as weaker than himself. That being said, he's also awfully skittish - if he's caught in the act, he's just as quick to flee as he is to kill.", "Oh...my portrait is big..."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: -1,
        JumpSideVertical: -1
    }, 
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 1,
        JumpSideVertical: -1
    }];
    VoiceLines = [];
    Image = FB_NightmareBonnie;
}

Character = UnknownEnum.Value_53;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 4 (2015)";
    Desc = ["A hulking beast born from a child's fearful memories. While not one for the hunt herself, she'll happily aid the rest of her pack in tormenting whatever victim they happen to have chosen. She does always seem to feel a hint of remorse after a victim's been dealt with, unlike the others... although that won't stop her from continuing on as soon as a new mark has been found.", "One of my favorite ongoing bits across the Frickbear's series is writing stupid text on the different Chicas' bibs. While the relatively less parodic tone of this game compared to the previous entries (key word there is relatively) meant I did wind up giving the other Chicas their typical \"Let's Eat!\" or \"Let's Party!\" text in all their sprites, I figured I could get away with making Nightmare Chica the exception."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [];
    Image = FB_NightmareChica;
}

Character = UnknownEnum.Value_54;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 4 (2015)";
    Desc = ["A stalking revenant born from a child's fearful memories. It knows no fear but from that it inflicts upon his victims, with fur as red as the devil himself and pointed ears to match. It's never a matter of \"if\" it will strike, only \"when\". It speaks not but lies through its serpent-like tongue, with a hook that could pierce the brightest of souls. If it knows remorse, we will never know, for none who faced it have lived to see it cry.", "I think it's written somewhere that anyone making a fan design or fanart of Nightmare Foxy is legally obligated to give him his tongue back. I see it everywhere, and frankly, I myself am not immune to fan design cliches."];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: -1,
        JumpSideVertical: -1
    }];
    VoiceLines = [];
    Image = FB_NightmareFoxy;
}

Character = UnknownEnum.Value_66;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 2 (2014)";
    Desc = ["Jeremy's always gotten the short end of the stick in life - although you'd have a hard time getting him to believe that. Despite how much bad luck seems to magnetize itself towards him, his cheery demeanor remains unbreakable. Through every scar, scrape, scare and scalding hot cup of coffee splattered across his face, he always looks forward to tomorrow, hoping it'll finally be the day where everything goes right. Will he ever get a break...?", "The decision to make his face wrapped in bandages was meant to be a funny little homage to the fact that of all three Jeremies we know of in FNaF canon, two of them are directly known for some sort of facial injury."];
    Jumpscares = [];
    VoiceLines = [];
    Image = FB_Jeremy;
}

Character = UnknownEnum.Value_67;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's (2014)";
    Desc = ["Mike does not think of himself as a particularly lucky man, nor a particularly ambitious one. His large stature and general irritability has made it difficult for him to make many friends...or hold a job. He's grown sardonic, seldom giving any more effort than he needs to, knowing he'll probably wind up fired from any job he gets...though he keeps pushing on regardless. Could there be someone out there that motivates him to keep on trying...?", "While commonly-agreed-upon fandom knowledge seems to point to Mike Schmidt, Michael Afton, Jeremy Fitzgerald and Fritz Smith all just being the same guy in the original canon, they were all split up into different characters here, mainly for the sake of there being enough night guards for each difficulty to be covered. The same split also happened with Vanessa and Vanny!"];
    Jumpscares = [];
    VoiceLines = [];
    Image = FB_Mike;
}

Character = UnknownEnum.Value_68;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's: Security Breach (2021)";
    Desc = ["Vanessa stands out as one of the few employees from before the company buyout to still be around - not just as a Fazbear employee, but also just in general. Getting her start in the company's game division, she somehow found herself hired on as a security guard at their flagship location, despite having no previous qualifications. Even then, she quickly proved herself as a natural at the job, and has stuck with that position ever since. While she feels she should probably find a safer line of work, she's found it harder and harder to pry herself away from the company as time has gone on. What could it be that tethers her to this chain...?", "As you may have noticed, there's a bit of a running theme between all the playable night guards in that each sorta resembles one of the original four animatronics. While she probably looks like her counterpart the least of the four, Vanessa is meant to line up with Chica, taking design cues from Toy Chica specifically. See if you can guess who the others are supposed to line up with!"];
    Jumpscares = [];
    VoiceLines = [];
    Image = FB_Vanessa;
}

Character = UnknownEnum.Value_69;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 2 (2014)";
    Desc = ["The inner machinations of Fritz' minds are an enigma to all but himself. He does not concern himself with things like \"a living wage\" or \"decent working conditions.\" In fact, nobody's quite sure what he wants out of this position, or where he even came from. It seems this strange-smelling man just wandered into the establishment one day, and, out of sheer desperation on the company's part, was hired on the spot. Of course, he intends to make the most of his opportunity graciously placed into his rat-like hands. As he gazes upon the restaurant's mascots, he ponders to himself... \"What is the true purpose of these machines? What makes them tick? What do they want from me? And how do I make them worse?\" While most would consider him mad, perhaps this is all just his own brand of brilliance...?", "If you're reading this, congratulations on beating Lunatic mode! I've actually never managed to get past night 5 on it myself, I needed the help of my playtesters to prove it was possible in the first place.\nAnyway, in regards to Fritz himself: When figuring out his characterization in this game, the only canon information we had to work off of was that he showed up while the building was in lockdown, deliberately tinkered with the animatronics to make them more dangerous, got fired within a single day, and also smelled awful. I think his design here communicates those traits well."];
    Jumpscares = [];
    VoiceLines = [];
    Image = FB_Fritz;
}

Character = UnknownEnum.Value_63;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's: Sister Location (2016)";
    Desc = ["The last living member of his family...although \"living\" might be a stretch. Having been around long enough to experience almost all of it firsthand, nobody is as familiar with the Fazbear brand's sordid history as he is. Despite being a rotting corpse, he's far from rotten to his core - in fact, he's given a lot to try and correct the misdeeds of the company. The odds that he can make things right are insurmountable...but he's defied death far too many times to give up now.", "Michael's design here actually predates a LOT of stuff in the game; For some reason, even with how much the general direction of the game changed over time, Michael has always been an important character in it through every iteration and has also pretty much looked exactly the same since the start. You can see this if you look at his concept art!"];
    Jumpscares = [];
    VoiceLines = [
    {
        LineID: voc_Michael_Call1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Michael_Call2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Michael_Call3,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Michael_Call4,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: voc_Michael_Call5,
        LineType: UnknownEnum.Value_1
    }];
    
    if (global.UnlockedAnimatronics[UnknownEnum.Value_49])
    {
        array_push(VoiceLines, 
        {
            LineID: voc_Michael_SalvagePhase1Part1,
            LineType: UnknownEnum.Value_1
        });
        array_push(VoiceLines, 
        {
            LineID: voc_Michael_SalvagePhase1Part1_Pissed,
            LineType: UnknownEnum.Value_1
        });
        array_push(VoiceLines, 
        {
            LineID: voc_Michael_SalvagePhase1Part2,
            LineType: UnknownEnum.Value_1
        });
        array_push(VoiceLines, 
        {
            LineID: voc_Michael_SalvagePhase2,
            LineType: UnknownEnum.Value_1
        });
        array_push(VoiceLines, 
        {
            LineID: voc_Michael_SalvagePhase3,
            LineType: UnknownEnum.Value_1
        });
        array_push(VoiceLines, 
        {
            LineID: voc_Michael_SalvagePhase4,
            LineType: UnknownEnum.Value_1
        });
        array_push(VoiceLines, 
        {
            LineID: voc_Michael_SalvagePhase5,
            LineType: UnknownEnum.Value_1
        });
        array_push(VoiceLines, 
        {
            LineID: voc_Michael_HadToDoThis,
            LineType: UnknownEnum.Value_1
        });
        array_push(VoiceLines, 
        {
            LineID: voc_Michael_HadToComeToThis,
            LineType: UnknownEnum.Value_1
        });
        array_push(VoiceLines, 
        {
            LineID: voc_Michael_PlayWithFire,
            LineType: UnknownEnum.Value_1
        });
        array_push(VoiceLines, 
        {
            LineID: voc_Michael_GetBurned,
            LineType: UnknownEnum.Value_1
        });
    }
    
    Image = FB_Michael;
}

Character = UnknownEnum.Value_62;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's: Security Breach (2021)";
    Desc = ["Clad in a homemade rabbit costume, Vanny seeks to keep the Fazbear legacy alive by any means necessary - especially the worst parts of it. While always a big fan of horror movies and local legends ever since she was young, it wasn't until she learned of Freddy's that she went from a normal if a bit quirky girl to a full-on demented superfan. Former friends say she was never quite the same ever since she visited that horror attraction...", "Vanny has the unique distinction of being the only thing from Security Breach in the whole game, aside from Vanessa. I don't even dislike Security Breach! If anything I feel like its brighter goofier character designs would be perfect for a game like this, but this game having such a big focus on the classic era of FNaF unfortunately meant a lot of newer stuff needed to be left out. If I were to ever add more animatronics to this game or do some sort of followup, Security Breach and Secret of the Mimic would definitely be the first places I'd pull characters from."];
    Jumpscares = [];
    VoiceLines = [
    {
        LineID: voc_Vanny_Opener,
        LineType: UnknownEnum.Value_1
    }];
    Image = FB_Vanny;
}

Character = UnknownEnum.Value_61;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Frickbear's (2019)";
    Desc = ["The Boss just seemed to appear in Hurricane one day. Claiming to be a local entrepreneur who managed to strike it rich with his video game business, he was the only bidder interested in purchasing Fazbear Entertainment when it went up for sale - mostly because he figured it was a cheap way to make a quick buck. It seems no matter what trouble he lands himself in, be it his arrest just a week into his newfound ownership or the PR disaster that came with being the new face of such a controversial brand, nothing can stop him from scraping the bottom of the barrel if it means making a few extra cents. He's greedy and heartless - in other words, he's perfect for this company!", "Okay, yeah, you and I both know who this is SUPPOSED to be, especially if you've played the previous two games. While I wanted to avoid bringing in any non-FNaF-adjacent copyrighted characters for this entry, I couldn't NOT include who's arguably the most important character across both of the first two entries! Even if his role is much smaller here, I'm glad I found a way to sneak him in regardless."];
    Jumpscares = [];
    VoiceLines = [
    {
        LineID: vocPhoneGuy6,
        LineType: UnknownEnum.Value_1
    }];
    Image = FB_TheBoss;
}

Character = UnknownEnum.Value_64;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's (2014)";
    Desc = ["Three cases of one, and one case of two. Fazbear Entertainment's brand image never did manage to recover once those children went missing - and it seems it was precisely that which led to its ultimate demise. Though the restaurant's fame may have faded as the years went on...the spirits of the children remain, powerless to do anything as the mechanical cages they were forever confined to withered away with age, growing colder, lonelier by the day.\n...That is until you came along.", "One of the few things that was present in the demo but scrapped in the final game was a cutscene with one of the missing children that'd you'd get if you met the requirements for what would ultimately become the Ultimate Route in the final game. This route probably underwent the most changes over the course of development and had the least clear direction at first - I do think what we ultimately settled on ended up being pretty cool, though it took a lot more time for us to get a grasp on what we wanted to do with it compared to Michael or Vanny's story routes."];
    Jumpscares = [];
    VoiceLines = [];
    Image = FB_MissingChildren;
}

Character = UnknownEnum.Value_55;

with (ExtrasDatabase[Character])
{
    Debut = "";
    Desc = ["", "The fact that this game is so goofy and unserious gave us a unique opportunity - namely, by setting the player's expectations so low, it meant that if we DID decide to put something deliberately creepy in the game, it would be way, WAY more effective. That was our whole philosophy behind Fredbear! We wanted him to feel like he was as out-of-place in this game as possible, not only for the aforementioned shock value, but also because it seemed appropriate for the route he was the final boss of. (Y'know, seeing as it's the one where you as a player have to go out of your way to defy the intended structure of the game.) Now, here's the thing: I can't actually 3D model. In fact, nobody on the development team at the time this idea was conceived really had the know-how to pull it off. My backup plan was to just make Fredbear 2D and puppet-animated like everyone else, just with more detailed, airbrush-shaded sprites, sorta like a Walten Files character...but luckily, we just so happened to know a guy who knew a guy, and that guy was Marco Antonio, who created Fredbear's model and did all his animations! I really have him and him alone to thank for Fredbear being as cool as he is here, his visuals turned out even cooler than I could've imagined. (...And certainly a lot cooler than what I could've done if I had stuck with the original idea!)"];
    Jumpscares = [
    {
        JumpID: Character,
        JumpSprite: sJumpscare_Fredbear,
        JumpSide: 0,
        JumpSideVertical: -1
    }, 
    {
        JumpID: Character,
        JumpSprite: sJumpscare,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [];
    Image = FB_Fredbear;
}

Character = UnknownEnum.Value_60;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 4 (2015)";
    Desc = [global.UnlockedAnimatronics[UnknownEnum.Value_55] ? "An old piece of Fredbear memorabilia that has sustained quite a bit of wear and tear over the years, perhaps a sign that it was well-loved by its former owner. They must not have wanted to let it go." : "A psychic friend to all, this little plush loves company! Why not play with him again?", global.UnlockedAnimatronics[UnknownEnum.Value_55] ? "Congratulations on seeing every ending! I was a bit worried that people wouldn't wanna put up with playing through a game five whole times just to see everything (or heck, even just more than once), but I hope you had fun regardless :D We definitely tried our hardest to make it worth it!" : "...I mean it. Go on, keep playing!"];
    Jumpscares = [];
    VoiceLines = [];
    Image = FB_PsychicFriendFredbear;
}

Character = UnknownEnum.Value_56;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's (2014)";
    Desc = ["Every employee needs a good trainer, and that's especially true with how dangerous incompetence can be at Freddy Frickbear's Pizza. As such, the company's best night guards are rewarded with the secondary responsibility of advising new employees! Rumor has it that the tradition started with an especially eager employee decades ago, who took it upon himself to help his coworkers through the night, having picked up a wide range of tips and tricks thanks to his own storied history at the chain. Unfortunately, nobody who has come after him seems to quite have the knack for it that he did, especially with how few of them last much longer than one night. Cut them some slack - it's hard to talk and survive the night at the same time!", "I'm honestly not sure where the idea for the bit of Phone Guy dying every night came from. I think it might've been a similar thought process to the night guards early on where I couldn't settle on who I wanted them to be so I just made them multiple characters in one."];
    Jumpscares = [];
    VoiceLines = [
    {
        LineID: vocPhoneGuy1,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: vocPhoneGuy2,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: vocPhoneGuy3,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: vocPhoneGuy4,
        LineType: UnknownEnum.Value_1
    }, 
    {
        LineID: vocPhoneGuy5,
        LineType: UnknownEnum.Value_1
    }];
    Image = FB_PhoneGuy;
}

Character = UnknownEnum.Value_57;

with (ExtrasDatabase[Character])
{
    Debut = "FNAF World (2016)";
    Desc = ["Mendo is a uniquely utilitarian creation of R&D, being designed to maximize function over form as a company-wide vendor for employees, always eager to assist. While primarily known as the friendly virtual endoskeleton seen in the shop systems of employees' tablets, there is actually a singular physical Mendo animatronic out there, being the one who processes all transactions made through the system. While few have seen this physical Mendo, fewer knowing where exactly he's being housed, rumors spread among employees have conjured visions of a being more server than an animatronic, a giant machine bound by thousands of cables, devoid of all but the desire to serve. In that way, he's the company's perfect employee.", "I wanted to use this description to thank my buddy Zizou for introducing me to the lerp function in GameMaker, which is what's used to achieve the cool bouncy effect a lot of characters' animations have. The same thing is used for a lot of the shopkeepers in Gimmiko, which was a direct inspiration for how Mendo's animated here! You should go check out Gimmiko, by the way. I don't know if it's out by the time you're reading this, but if it is, go buy it. If it isn't, go wishlist it. There's a surprising amount of overlap in people involved with that game and people involved with this one!"];
    Jumpscares = [];
    VoiceLines = [];
    Image = FB_Mendo;
}

Character = UnknownEnum.Value_58;

with (ExtrasDatabase[Character])
{
    Debut = "Freddy Fazbear's Pizzeria Simulator (2017)";
    Desc = ["Once a simple Candy Cadet, this vendor bot found himself narrowly avoiding certain doom when his original location went up in flames. In the heat of the moment, he grabbed any loose pieces of company property he could get his claws on and hightailed it out of there. With a new lease on his artificial life, he decided dispensing candy wasn't doing enough good for the world - and so, from that day forward, he decided to become an upgrade salesman, rolling from location to location, offering the trinkets he's gathered to anyone willing to pay. Much to the company's chagrin, it seems a lot of the property he saved was property they would've rather been lost in the fire.", "The upgrade system actually wasn't conceptualized until around halfway through the game's development, shortly after the demo was finished and released - we figured there should be a better use for the money you get from salvages than just being a number that goes up, so the upgrade system was added to be that use, as well as to add a bit of extra variety to repeat playthroughs. (And repeat playthroughs are what this whole game is designed around, so anything to spice them up is welcome!) Candy Cadet was one of a few characters we had considered as the shopkeeper to sell these upgrades, though I think we ended up settling on him just because the other FNaF shopkeepers (i.e. Lolbit and Mendo) were better fits for the office shop instead, and Candy Cadet not only stood out the most but was also our personal favorite of any remaining options. Maybe in another universe, Gumball Swivelhands could've been the one manning the upgrade shop instead..."];
    Jumpscares = [];
    VoiceLines = [
    {
        LineID: voc_UpgradeCadet_ComeGet,
        LineType: UnknownEnum.Value_0
    }];
    Image = FB_UpgradeCadet;
}

Character = UnknownEnum.Value_59;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's (2014)";
    Desc = ["These heavy-footed hunks of metal lurk in the abandoned Freddy's locations, making sure any trespassers who get a little too greedy are properly dealt with. With the eyes of a hawk and auditory sensors so fine-tuned that they can pick up even your smallest movements (which is impressive, considering none of them have ears), you'd be wise to steer clear of them if you hear one nearby. That being said, they are also fair - once a perpetrator is caught, they'll most likely just be let off with a small fine.", "Endo Chaser is the last remnant of an idea I had SUPER early on in development - Originally the 3D salvage sections were going to be randomly-generated mazes that you'd have to run through, with the idea being that you had to grab as many valuable items around the building as possible to make money while being chased down by the animatronics inside of it. Even if it was scaled back, I'm glad this idea still made it into the final game to some extent!"];
    Jumpscares = [
    {
        JumpID: 0,
        JumpSprite: sJumpscareEndo,
        JumpSide: 0,
        JumpSideVertical: -1
    }];
    VoiceLines = [];
    Image = FB_EndoChaser;
}

Character = UnknownEnum.Value_65;

with (ExtrasDatabase[Character])
{
    Debut = "Five Nights at Freddy's 2 (2014)";
    Desc = ["Oh hey, that's me!", "A funny thing about this game is that despite releasing after the second movie, pretty much everything about it and its plot was already set in stone long before it released, meaning Charlie isn't anything like her movie counterpart in regards to her personality OR her design here. The same goes for a lot of other characters in the game. (Though, for the record, Mike and Michael were always planned to be two seperate characters in this game from the very start of its development, so I kinda called that.)"];
    Jumpscares = [];
    VoiceLines = [];
    Image = FB_Charlie;
}

array_push(ExtrasDatabase, 
{
    Name: "The Fan",
    Debut: "Five Nights at Freddy's (2014)",
    Desc: ["An essential fixture of any self-respecting office! Watch the fingers.\n\nYou unlocked this by filling in every gallery entry. Congratulations!", "This entry wasn't originally intended to be in the game, but Zach made a fan icon so we'd have something to represent overheat deaths in the stats menu and from there I thought it'd be funny to throw it in the character gallery as a bonus for getting all the other gallery entries. Plus, it doubles as a quirky little FNAF World reference!\n\nNow, there may or may not be two other secret gallery entries that can be unlocked by 100%ing other parts of the game... If you're up to the challenge, try finding them!"],
    Jumpscares: [],
    VoiceLines: [],
    Image: FB_Fan
});
array_push(ExtrasDatabase, 
{
    Name: "Henry Emily",
    Debut: "Five Nights at Freddy's: The Silver Eyes (2015)",
    Desc: ["Henry was once just a lowly software developer, barely scraping by with his startup brand EmilySoft, desperately searching for a way he could turn his rudimentary arcade games into a living for himself. Fortunately, a chance meeting with a roboticist exhibiting his inventions at a local amusements expo would soon become a lifelong business partnership, and the eventual creation of Freddy Fazbear's Pizza! Even after tragedy after tragedy, including the death of his daughter and the disappearance of that business partner, he seems to be determined to keep the company alive at all costs - including but not limited to the reputation of the brand and the safety of his employees. Some say he's just sentimental to an unhealthy degree, but could there be a deeper reason...?\n\nYou unlocked this by getting every trophy. Congratulations!", "Wait, seriously? You got EVERY trophy!? Wow, congratulations! ...I really don't have much left to say at this point, but I hope you enjoyed your time playing this game :D"],
    Jumpscares: [],
    VoiceLines: [],
    Image: FB_Henry
});
array_push(ExtrasDatabase, 
{
    Name: "William Afton",
    Debut: "Five Nights at Freddy's 2 (2014)",
    Desc: ["A shrewd businessman and brilliant roboticist, William Afton is one of the two minds that originally founded the Freddy's brand. Many remarked a While his contributions to the company are unquantifiable, current management tends to sweep him under the rug - both due to the many accounts of his generally unpleasant demeanor, and the bad PR that came with his sudden disappearance in the mid-90's. Despite how employees describe him, he actually seemed to get along great with the kids!\n\nYou unlocked this by beating every Custom Night challenge. Congratulations!", "Congratulations on beating all the custom night challenges! This particular portrait actually wasn't intended to be in the game at first. In fact, this design of William Afton was initially sketched out for a completely DIFFERENT Frickbear's-related project idea...but I figured it'd be nice to include in the game one way or another! This is also technically like the third variant of Afton that gets its own extras menu page."],
    Jumpscares: [],
    VoiceLines: [],
    Image: FB_William
});
CustomPortraits = import_portraits();
CustomInfo = import_extras();

for (var i = 0; i < (global.GuardAmount - 4); i++)
{
    array_push(ExtrasDatabase, 
    {
        Name: CustomInfo[i].FULL_NAME,
        Debut: "",
        Desc: [CustomInfo[i].DESCRIPTION, CustomInfo[i].DEV_NOTES],
        Jumpscares: [],
        VoiceLines: [],
        Image: CustomPortraits[i]
    });
}

UnlockedArray = [];
OverGUISurf = -1;
texturegroup_load("FinalBossJumpscare");

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
    Value_50,
    Value_51,
    Value_52,
    Value_53,
    Value_54,
    Value_55,
    Value_56,
    Value_57,
    Value_58,
    Value_59,
    Value_60,
    Value_61,
    Value_62,
    Value_63,
    Value_64,
    Value_65,
    Value_66,
    Value_67,
    Value_68,
    Value_69
}
