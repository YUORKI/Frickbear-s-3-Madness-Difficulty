function has(arg0)
{
    if (!is_array(arg0))
        return global.UnlockedAnimatronics[arg0];
    
    for (var i = 0; i < array_length(arg0); i++)
    {
        if (!global.UnlockedAnimatronics[arg0[i]])
            return false;
    }
    
    return true;
}

ConceptArt = [];
array_push(ConceptArt, 
{
    Image: sNOTHING,
    Name: "",
    Description: "",
    Unlocked: false
});
array_push(ConceptArt, 
{
    Image: CA_EarlyMechanics,
    Name: "Early Concepts - Mechanics",
    Description: "The original ideas for the game's animatronic roster and their mechanics before it took a pretty drastic shift in direction. This is some of the first concept art ever drawn up for the game, dating back to around 2022! You can tell because the designs here are much more inline with Frickbear's 2's art style.\n\nDrawn by SpookyRick.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_EarlyMockup,
    Name: "Early Concepts - Dayshift Mockup",
    Description: "Early mockup for the more Pizzeria Simulator-inspired original vision for the game.\n\nDrawn by SpookyRick.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_EarlyOverworldSprites,
    Name: "Early Concepts - Dayshift Sprites",
    Description: "Early theoretical overworld sprites for the player character. Originally, your character's face would change depending on your morality.\n\nDrawn by SpookyRick.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_EarlyTalksprites,
    Name: "Early Concepts - Talksprites",
    Description: "Despite the complete shift in direction after these sprites were made, three of these guys actually wound up sticking around as major characters all the way into the final game! Michael's design went pretty much unchanged, although you can probably notice how much Vanny and Vanessa's changed.\n\nDrawn by SpookyRick.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_OldArseScreenshot,
    Name: "Early Concepts - Earliest Screenshot",
    Description: "The earliest known screenshot of the game! Fun fact: The Withered Freddy sprite here was the single oldest asset in the game before it was replaced a mere two weeks before the game's release.\n\nDrawn by SpookyRick.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_EarlyAnimatronicDesigns,
    Name: "Early Animatronic Designs",
    Description: "These designs date all the way back to 2022! They were originally going to be the basis for this game's animatronics, before they got completely redone in mid-2024. Even if the game was being prototyped in 2022, that point in 2024 was when it REALLY started development.\n\nDrawn by SpookyRick",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_4)
});
array_push(ConceptArt, 
{
    Image: CA_OldJumpscares,
    Name: "Early Jumpscare Sprites",
    Description: "SUPER early jumpscare sprites based on the pre-redesign animatronic designs. I only wound up finishing these eight before the stylistic shift occured.\n\nDrawn by SpookyRick",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0([UnknownEnum.Value_5, UnknownEnum.Value_8, UnknownEnum.Value_9])
});
array_push(ConceptArt, 
{
    Image: CA_BuildingMapEARLY,
    Name: "Building - Early Map",
    Description: "VERY early sketch of the map layout, back when the game was envisioned as more of a Pizzeria Simulator-type game.\n\nDrawn by SpookyRick.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_BuildingMap,
    Name: "Building - Later Map",
    Description: "The map was pretty much finalized by the third sketch, although the version ingame still saw some small changes to make the camera views more readable.\n\nDrawn by SpookyRick.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_BuildingExterior,
    Name: "Building - Exterior",
    Description: "The design for the pizzeria in the final game actually wound up being almost 1-to-1 with the concept art, which the exception of the awning which was left out so the sign would be more visisble.\n\nDrawn by SpookyRick.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_Showstage,
    Name: "Building - Showstage",
    Description: "Sketch for the original layout of the showroom when I was still in the process of modelling it.\n\nDrawn by SpookyRick.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_OutsideBuilding,
    Name: "Title Screen Character Concepts",
    Description: "Even though the idea of adding characters to the title screen as you beat the different endings was one we had in mind since super early on in development, the idea wasn't actually implemented until the very last week of development!\n\nDrawn by Cactus Companion.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_64)
});
array_push(ConceptArt, 
{
    Image: CA_CactusGuards,
    Name: "Guards - Early Concepts",
    Description: "Some of the first concepts for the playable guards drawn by Cactus and based on some vague descriptions of what I had in mind for them. These were actually made before Vanessa was even planned for the game.\n\nDrawn by Cactus Companion.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0([UnknownEnum.Value_66, UnknownEnum.Value_67, UnknownEnum.Value_68, UnknownEnum.Value_69])
});
array_push(ConceptArt, 
{
    Image: CA_Guards,
    Name: "Guards - Second Pass",
    Description: "And here are my own initial sketches for the four guards! These are a lot closer to the finalized designs.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0([UnknownEnum.Value_66, UnknownEnum.Value_67, UnknownEnum.Value_68, UnknownEnum.Value_69])
});
array_push(ConceptArt, 
{
    Image: CA_BonusNightguards,
    Name: "Guards - Extra Characters",
    Description: "A few other contenders for playable night guards were conceptualized before we settled on the four we have now.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0([UnknownEnum.Value_66, UnknownEnum.Value_67, UnknownEnum.Value_68, UnknownEnum.Value_69])
});
array_push(ConceptArt, 
{
    Image: CA_GuardExpressions,
    Name: "Guards - Scrapped Expressions",
    Description: "Guards were going to have different expressions based on how intense of a situation they were in. This idea wasn't fully realized since it would've required programming a complex panic meter system, but each guard does still have a special \"scared\" sprite used during boss fights.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0([UnknownEnum.Value_68, UnknownEnum.Value_49])
});
array_push(ConceptArt, 
{
    Image: CA_ClarkFixyOriginal,
    Name: "Clark Fixy - Initial Design",
    Description: "The original design for Clark Fixy, a character who doesn't actually appear in the flesh anywhere in the game, but Cactus had an attatchment to and wanted to design for fun. This version of him does technically appear in the form of a signature on his employee memos.\n\nDrawn by Cactus Companion.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_ClarkFixyZached,
    Name: "Clark Fixy - Zached Design",
    Description: "A redesigned human Clark Fixy more consistent with the other human characters in the game.\n\nDrawn by Zachary Attackary.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_ClarkColored,
    Name: "Clark Fixy - Finalized Design",
    Description: "The third and final pass of the Clark Fixy design.\n\nDrawn by Cactus Companion.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_FredsweeperFrank,
    Name: "Fredsweeper Frank - Zached Design",
    Description: "Another hypothetical design for a character who only appears through memos in the final game! ...Or does he?\n\nDrawn by Zachary Attackary.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_GuardsRepo,
    Name: "Guard Multiplayer Game Concept 1",
    Description: "Concept art for a REPO-style game starring the Frickbear's guards conceptualized by Cactus. These were made primarily for fun; I don't think we were intending to actually turn these into a full game at any point in this game's development.\n\nDrawn by Cactus Companion.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_GuardsRepo2,
    Name: "Guard Multiplayer Game Concept 2",
    Description: "From right to left, the characters here are meant to be Joe Guard (the scrapped player character from this game's earlier iterations), Fredsweeper Frank, Clark Fixy, and the dishwasher lady William makes reference to in one of the William's Woods memos.\n\nDrawn by Cactus Companion.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_MichaelEarly2,
    Name: "Michael - Early Concepts",
    Description: "Some early drawings of Michael's design. Surprisingly, he didn't change much between this and his final version.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_50)
});
array_push(ConceptArt, 
{
    Image: CA_MichaelEarly1,
    Name: "Michael - More Concepts",
    Description: "While Michael's corpse design went pretty much completely unchanged since its conception, his living design wound up getting repurposed as the base for Mike Schmidt.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_50)
});
array_push(ConceptArt, 
{
    Image: CA_GoodEndscreen,
    Name: "Good Route - Early Endscreen",
    Description: "Original concept for the good route's endscreen. The final version is basically the same general idea, just presented a bit differently.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_50)
});
array_push(ConceptArt, 
{
    Image: CA_Nightmares,
    Name: "Good Route - Nightmares",
    Description: "Before their more plushie-esque designs were decided on, the Nightmares were originally going to look a bit closer to their orignial counterparts.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_50)
});
array_push(ConceptArt, 
{
    Image: CA_Vanny_Pass1,
    Name: "'Vannabelle' - First Pass",
    Description: "While at first Vanny was never intended to be seen maskless ingame, this drawing eventually made me change my mind and sneak her into the evil route's endscreen. Her design changed quite a bit before that point though, as you'll see in the next couple images.\n\nDrawn by KaiTheGuy123.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_62)
});
array_push(ConceptArt, 
{
    Image: CA_Vanny_Pass2,
    Name: "'Vannabelle' - Second Pass",
    Description: "Zach's take on the unmasked Vanny design! This one was meant to be a lot more inline with the general design philosophy for this game's human characters - namely implementing more elements from Vanny's masked self into her unmasked self.\n\nDrawn by Zachary Attackary.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_62)
});
array_push(ConceptArt, 
{
    Image: CA_Vanny_Pass3,
    Name: "'Vannabelle' - Third Pass",
    Description: "Finally, my own take! This is the version of the design that wound up appearing in the endscreen.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_62)
});
array_push(ConceptArt, 
{
    Image: CA_Vanny_Pass4,
    Name: "'Vannabelle' - Final Pass",
    Description: "One more just for good measure.\n\nDrawn by KaiTheGuy123.",
    Unlocked: global.ClearedEndings[3][UnknownEnum.Value_3] > 0
});
array_push(ConceptArt, 
{
    Image: CA_EvilEndscreen,
    Name: "Evil Route - Early Endscreen",
    Description: "Originally, my idea was that the evil route would end with your player character being possessed by Afton and taking over from Vanny after her death, although I eventually went with a different idea. This sketch is a remnant of that original ending.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_62)
});
array_push(ConceptArt, 
{
    Image: CA_SalvageOLD,
    Name: "Evil Route - Early Salvage",
    Description: "Salvage was always envisioned as a fusion between the four scrap animatronics with a cool cloak, although it took a while for me to settle on a design I was happy with.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_49)
});
array_push(ConceptArt, 
{
    Image: CA_Salvage,
    Name: "Evil Route - Finalized Salvage",
    Description: "These sketches came quite a while later, and at this point I finally had a vision for Salvage's fight I was happy with. Originally you were going to be able to punch him in the face, though this idea never wound up getting used.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_49)
});
array_push(ConceptArt, 
{
    Image: CA_WilliamOLD,
    Name: "William Afton - OLD Concept",
    Description: "The first sketch for what a hypothetical Frickbear's William Afton could have looked like.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0([UnknownEnum.Value_49, UnknownEnum.Value_50, UnknownEnum.Value_61])
});
array_push(ConceptArt, 
{
    Image: CA_William,
    Name: "William Afton - Early Concepts",
    Description: "A couple ideas for what Frickbear's William Afton could have looked like that were ran through before we ultimately settled on one.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0([UnknownEnum.Value_49, UnknownEnum.Value_50, UnknownEnum.Value_61])
});
array_push(ConceptArt, 
{
    Image: CA_HenryWilliam2,
    Name: "Henry & William",
    Description: "Hypothetical Frickbear's designs for Henry Emily and William Afton. These two designs do both technically appear in the final game, but to a much smaller extent than originally planned.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0([UnknownEnum.Value_49, UnknownEnum.Value_50, UnknownEnum.Value_61])
});
array_push(ConceptArt, 
{
    Image: CA_HenryWilliam,
    Name: "Henry & William - Photograph",
    Description: "Sketch for a photo that was going to appear alongside the newspaper in the first salvage location.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0([UnknownEnum.Value_49, UnknownEnum.Value_50, UnknownEnum.Value_61])
});
array_push(ConceptArt, 
{
    Image: CA_Henry_ImOld,
    Name: "Henry - Old",
    Description: "Sketch of what Henry would've probably looked like shortly before the events of the game.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0([UnknownEnum.Value_49, UnknownEnum.Value_50, UnknownEnum.Value_61])
});
array_push(ConceptArt, 
{
    Image: CA_MCMPaper,
    Name: "Scrapped MCM Page",
    Description: "There was originally going to be an additional document found in the Talbert Files referencing MCM, serving as really the only acknowledgement of Secret of the Mimic in the entire game...but then we realized this would be a pretty huge superfluous piece of the FNaF lore to drop at the very end of the game, so it wasn't included in the final game.\n\nDrawn by Zachary Attackary.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_64)
});
array_push(ConceptArt, 
{
    Image: CA_MCI,
    Name: "Missing Children",
    Description: "None of the missing children (with the sole exception of Susie) had any kind of firm design right up until they needed to be given them for the Talbert Files scene.\n\nDrawn by Zachary Attackary.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_64)
});
array_push(ConceptArt, 
{
    Image: CA_Charlie,
    Name: "Charlie",
    Description: "Charlie was actually a very last-minute addition to the game - her design, extras menu page and the little scene involving her were all only finished within the last month of development! This sketch, however, dates back quite a bit further than that.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_65)
});
array_push(ConceptArt, 
{
    Image: CA_FredbearEarly,
    Name: "Fredbear - Early Sketches",
    Description: "It took a while before I settled on a Fredbear design I was happy with; I always knew I wanted him to feel as Off as possible, but I wasn't quite sure how I'd convey that just yet.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_55)
});
array_push(ConceptArt, 
{
    Image: CA_FredbearFinalized,
    Name: "Fredbear - Final Sketch",
    Description: "At this point Fredbear's design was pretty much 100% finalized, to the point that this very sketch was the primary reference used when making the model. He's still a little off, but looks way more grounded in reality now. (Arguably, being grounded in reality still makes him look off when everyone else is so cartoony.)\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_55)
});
array_push(ConceptArt, 
{
    Image: CA_FredbearStuff2,
    Name: "Fredbear - Misc. Concepts 1",
    Description: "Various concepts for the transition screen during the first part of Fredbear's boss fight.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_55)
});
array_push(ConceptArt, 
{
    Image: CA_FredbearStuff1,
    Name: "Fredbear - Misc. Concepts 2",
    Description: "Various concepts for his attacks during the final portion of the boss fight.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_55)
});
array_push(ConceptArt, 
{
    Image: CA_FredbearDevelopment1,
    Name: "Fredbear - Model Development 1",
    Description: "Every self-respecting FNaF fangame extras menu has a model progress section.\n\nModelled by Marco Antonio.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_55)
});
array_push(ConceptArt, 
{
    Image: CA_FredbearDevelopment2,
    Name: "Fredbear - Model Development 2",
    Description: "Modelled by Marco Antonio.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_55)
});
array_push(ConceptArt, 
{
    Image: CA_FredbearDevelopment3,
    Name: "Fredbear - Model Development 3",
    Description: "Modelled by Marco Antonio.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_55)
});
array_push(ConceptArt, 
{
    Image: CA_FredbearDevelopment4,
    Name: "Fredbear - Model Development 4",
    Description: "Modelled by Marco Antonio.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_55)
});
array_push(ConceptArt, 
{
    Image: CA_FredbearDevelopment5,
    Name: "Fredbear - Model Development 5",
    Description: "Modelled by Marco Antonio.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_55)
});
array_push(ConceptArt, 
{
    Image: CA_FredbearDevelopment6,
    Name: "Fredbear - Model Development 6",
    Description: "Spooky!\n\nModelled by Marco Antonio.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_55)
});
array_push(ConceptArt, 
{
    Image: CA_FredbearAds,
    Name: "Fredbear - Popups",
    Description: "Fredbear's popups were more intended to be reminiscent of those you'd see a malicious computer virus produce, compared to Helpy's which are just basic popup ads.\n\n1-6 made by Cactus Companion. 7 made by SpookyRick. 8 made by R__K. 9 made by Zachary Attackary. 10 made by FazieFunbear. 11-12 made by Wyat_t. 13 made by Marco Antonio.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_55)
});
array_push(ConceptArt, 
{
    Image: CA_FredbearGameOver,
    Name: "Fredbear - Game Over Screen",
    Description: "I thought the juxtaposition between the realistic implied gore and the goofy \"Oops!\" in big stupid red text would be really funny.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_55)
});
array_push(ConceptArt, 
{
    Image: CA_Buddies,
    Name: "Fredbear - Buddies",
    Description: "It's probably pretty obvious but FNAF 1 Remake was actually a huge inspiration for the visual direction for Fredbear!\n\nDrawn by Marco Antonio.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_55)
});
array_push(ConceptArt, 
{
    Image: CA_SpringBonnieFinalized,
    Name: "Spring Bonnie",
    Description: "At one point, Fredbear was meant to come alongside a matching Spring Bonnie in his boss fight, although this was ultimately scrapped - mainly because we couldn't find enough for Spring Bonnie to do to justify a whole extra model to be made.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_55)
});
array_push(ConceptArt, 
{
    Image: CA_FoxyRun,
    Name: "Misc - Scrapped Foxy Run",
    Description: "Foxy WAS supposed to have a running animation at one point, although we quickly realized this would be a lot of work for something players would basically never get to see.\n\nAnimated by Wyat_t.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_3)
});
array_push(ConceptArt, 
{
    Image: CA_HelpyAds,
    Name: "Misc - Helpy Ads",
    Description: "1-5 made by SpookyRick. 6-11 made by Cactus Companion. 12-13 made by Zizou. 14 made by paige. 15-18 made by Zachary Attackary. 19-20 made by Ryon. 21-24 made by Krusha. 25 made by nixliz. 26-28 made by zombea. 29 made by DizzyDitzy. 30 made by FazieFunbear. 31 made by Marco Antonio. 32 made by R__K. 33-34 made by Kirbo. 35 made by G-Zone.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_30)
});
array_push(ConceptArt, 
{
    Image: CA_HelpyAdsOLD,
    Name: "Misc - Early Helpy Ads",
    Description: "Only one of these wound up making it into the game unchanged.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_30)
});
array_push(ConceptArt, 
{
    Image: CA_HelpyUnusedRender,
    Name: "Misc - Early Helpy Render",
    Description: "A scrapped version of Helpy's extras menu render, featuring a different pose.\n\nModelled by Orca.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_30)
});
array_push(ConceptArt, 
{
    Image: CA_MusicManMinigame,
    Name: "Misc - Music Man Minigame Concept",
    Description: "A couple minigame ideas were tossed around beyond the ones that made it into the final game - one of these was a Music Man-themed rhythm game.\n\nDrawn by Zachary Attackary.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_31)
});
array_push(ConceptArt, 
{
    Image: CA_Lolbit,
    Name: "Misc - Early Lolbit Sketches",
    Description: "A couple early ideas for Lolbit's extras menu portrait before the final one was settled on.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_25)
});
array_push(ConceptArt, 
{
    Image: CA_PaperBidybab,
    Name: "Misc - Paper Bidybab",
    Description: "The raw sprite used for one of the Bidybabs on the left hall camera. The reason  this specific Bidybab is so abstract compared to the others is purely because by the time all the other sprites were done the only space left on that camera was on the wall, so Zach had to get creative.\n\nDrawn by Zachary Attackary.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_26)
});
array_push(ConceptArt, 
{
    Image: CA_LolzHaxConcept,
    Name: "Misc - Early LolzHax Sketch",
    Description: "At first, the secret animatronics were intended to only be summoned in through LolzHax and not be available on their own, with this portrait reflecting that. However, once they were split off into their own character slots, LolzHax's portrait needed to be changed to match.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0([UnknownEnum.Value_39, UnknownEnum.Value_40, UnknownEnum.Value_41, UnknownEnum.Value_44, UnknownEnum.Value_43, UnknownEnum.Value_42, UnknownEnum.Value_45])
});
array_push(ConceptArt, 
{
    Image: CA_LolzHaxCar,
    Name: "Misc - LolzHax Concept Art",
    Description: "Concept art.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_39)
});
array_push(ConceptArt, 
{
    Image: CA_LolzHaxDie,
    Name: "Goofs - LolzHax Funeral",
    Description: "They got him.\n\nDrawn by Zachary Attackary.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_39)
});
array_push(ConceptArt, 
{
    Image: CA_TipsyBird2,
    Name: "Extra - Tipsy Bird",
    Description: "Early in development, the fourth salvage location was planned to be a lot more expansive, letting you explore not only the house but also the nearby Jr.'s location, which in the Frickbear's universe we decided was a chain of Freddy Fazbear-themed bars. Tragically, this idea being scrapped meant I couldn't include the giant billboard of its sexy bird mascot.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0([UnknownEnum.Value_8, UnknownEnum.Value_30])
});
array_push(ConceptArt, 
{
    Image: CA_TipsyBird1,
    Name: "Extra - Tipsy Bird 2",
    Description: "While this design didn't get to be used for its original purpose, she does still appear as a Helpy ad in the final game! Another fun tidbit is that Tipsy Bird's design is directly based on my best recollection of a mascot I remember seeing on a billboard while my family was driving to my grandma's as a kid. Unfortunately, I have never seen this billboard since, so I can only assume the sexy chicken is lost media.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0([UnknownEnum.Value_8, UnknownEnum.Value_30, UnknownEnum.Value_46])
});
array_push(ConceptArt, 
{
    Image: CA_TipsyBird3,
    Name: "Extra - Tipsy Bird 3",
    Description: "One more for good measure. This was technically the first time Frickbear William's design was shown anywhere publicly.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0([UnknownEnum.Value_8, UnknownEnum.Value_30, UnknownEnum.Value_46]) && global.UnlockedTrophies[UnknownEnum.Value_37]
});
array_push(ConceptArt, 
{
    Image: CA_FreddySoup,
    Name: "Goofs - Freddy Soup",
    Description: "Zach drew this for me when I was sick :D\n\nDrawn by Zachary Attackary.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_AlbumCover,
    Name: "Goofs - This is FNAF",
    Description: "I'm Freddy Fazbear... I'm gonna get you and I'm gonna make you scared...\n\nDrawn by Wyat_t.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_Plushtrap,
    Name: "Goofs - Plushtrap Lore",
    Description: "This is his lore.\n\nDrawn by Cactus Companion.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_21)
});
array_push(ConceptArt, 
{
    Image: CA_BidybabsPackItUp,
    Name: "Goofs - Alright, Bidybabs...",
    Description: "Alright Bidybabs, pack it up...\n\nDrawn by Zachary Attackary.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_26)
});
array_push(ConceptArt, 
{
    Image: CA_IDoNotCareForFiveNightsAtFrickbears3,
    Name: "Goofs - I Do Not Care For Frickbear's 3.",
    Description: "It insists upon itself.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0([UnknownEnum.Value_46, UnknownEnum.Value_14, UnknownEnum.Value_27, UnknownEnum.Value_56])
});
array_push(ConceptArt, 
{
    Image: PA_PrideMonth,
    Name: "Goofs - Pride Month Special",
    Description: "Made for Pride Month in 2025.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_67)
});
array_push(ConceptArt, 
{
    Image: CA_FangameBossesPlayingPoker,
    Name: "Goofs - Bosses Playing Poker",
    Description: "The funny thing is that all the notable fangame bosses I could think of at the time this was drawn also happened to all be made by people I know.\n\nGoldenfriedrich created by Ryon.\nPAL created by FazieFunbear.\nBuddy created by Marco Antonio.\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_49)
});
array_push(ConceptArt, 
{
    Image: CA_BagOfRemnant,
    Name: "Goofs - Bag of Remnant",
    Description: "Based on that one absolutenutcase comic.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_49)
});
array_push(ConceptArt, 
{
    Image: CA_MedicatedFritz,
    Name: "Goofs - Medicated Fritz",
    Description: "This is what he'd look like.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_69)
});
array_push(ConceptArt, 
{
    Image: CA_CarmouleGamePosterPrototype,
    Name: "Promo - Early Key Art",
    Description: "An older concept for the game's key art. I still think this looked pretty cool (and I thought the fact that it kinda sneakily spoils Salvage's design was really cheeky), although I definitely feel like the art we went encapsulates the game's general essence way better. I mean, this one doesn't even have any of the animatronics in it!\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0([UnknownEnum.Value_62, UnknownEnum.Value_63])
});
array_push(ConceptArt, 
{
    Image: CA_CarmouleGamePoster1,
    Name: "Promo - Key Art Pass 1",
    Description: "The original sketch for the game's cool promotional artwork! The final one's composition is mostly the same, although most of the featured animatronics were swapped out.\n\nDrawn by Carmoule.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_CarmouleGamePoster2,
    Name: "Promo - Key Art Pass 2",
    Description: "This one was done by me! We decided it'd be good to represent the game's eclectic character roster in the artwork, so most animatronics were swapped out for their quirkier variants.\n\nDrawn by Carmoule and SpookyRick.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_CarmouleGamePosterFINAL,
    Name: "Promo - Full Key Art",
    Description: "The finished product! A modified version of this artwork is used for the game's GameJolt thumbnail and banner.\n\nDrawn by Carmoule.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_PotentialBanners,
    Name: "Promo - Banner Concepts",
    Description: "Concepts for a potential banner for the game's Gamejolt page. Neither of these got super far before we decided to just use the game's key art instead.\n\nDrawn by SpookyRick.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: CA_TrailerStoryboard,
    Name: "Promo - Trailer Storyboards",
    Description: "We were going to make three different variants of the trailer at first, with each having a different nightguard during the animated bit and each being posted to a different social media platform. This was sadly a bit too ambitious, and only the Mike variant of the trailer wound up being made.\n\nDrawn by Wyat_t.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0([UnknownEnum.Value_66, UnknownEnum.Value_67, UnknownEnum.Value_68])
});
array_push(ConceptArt, 
{
    Image: CA_JeremyTrain,
    Name: "Collab - Jeremy GIMMIKO Train Sprite",
    Description: "Jeremy's train passenger sprite from GIMMIKO.\n\nDrawn by Zizou.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_66)
});
array_push(ConceptArt, 
{
    Image: CA_DreadbearAirbud,
    Name: "Collab - Dreadbear & Air Budd",
    Description: "There's a lot of overlap in the voice casts of this game and GIMMIKO! Both characters here were voiced by Zach.\n\nDrawn by Zachary Attackary.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_38)
});
array_push(ConceptArt, 
{
    Image: CA_StupidHorseChannelBetters,
    Name: "Collab - Stupid Horse Channel Betters",
    Description: "Icons for four Frickbear's characters who appear as playable betters in Stupid Horse Channel! ...A game which probably will not be out yet by the time this game is. The characters on display here are Fritz, Billy (the protagonist of Frickbear's 1), Clark Fixy, and Dark Fixy.\n\nDrawn by Zizou.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_69)
});
array_push(ConceptArt, 
{
    Image: CA_TMNRodney,
    Name: "Collab - TMN Rodney",
    Description: "You're really gonna do five nights of this? ...I guess that's not TOO MANY NIGHTS.\n\nDrawn by SpookyRick.",
    Unlocked: gml_Script_has@gml_Object_oExtras_ConceptArtGallery_Create_0(UnknownEnum.Value_46)
});
array_push(ConceptArt, 
{
    Image: PA_Friedrichs,
    Name: "Collab - Friedrich's x Frickbear's",
    Description: "Drawn as part of an art trade I did with ryon, who you may know as the creator of Five Nights at Friedrich's! This drawing was inspired by photos of world leaders shaking hands, and as such a lot of thought was put into who in the picture would be in the front. That sorta thing communicates diplomatic power, you see.\n\nDrawn by ryon and SpookyRick.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: PA_FriedrichPoster,
    Name: "Collab - Friedrich's Poster",
    Description: "The Frickbear's poster that appears as an easter egg in Five Nights at Friedrich's! This poster already appears in THAT game's extras menu, but you get to look at it here too.\n\nDrawn by SpookyRick.",
    Unlocked: true
});
array_push(ConceptArt, 
{
    Image: PA_ManagementWanted,
    Name: "Collab - Management Wanted",
    Description: "I'm better than you are, so I should do the review.\n\nDrawn by SpookyRick, Freddy Frickbear model by the Management Wanted team.",
    Unlocked: true
});
Selected = 0;
OptionsSurf = -1;
PreviousImage = sNOTHING;
ImageSize = 0;
PreviousImageSize = 0;
DefaultImageX = 430;
ImageX = DefaultImageX;
ImageOffsetX = 0;
ImageOffsetY = 0;
ImageOffsetSize = 0;
ViewMode = false;
LastMouseX = 0;
LastMouseY = 0;
OptionsOffset = 0;
OptionsDragged = false;

function switch_page(arg0)
{
    PreviousImage = ConceptArt[Selected].Image;
    PreviousImageSize = ImageSize;
    ImageSize = 0;
    Selected = arg0;
    global.ExtrasNotifs.ConceptArtNotifs[arg0] = false;
    audio_play_sound(sfxBump, 5, false);
}

Active = true;
Frame = 0;
texturegroup_load("ConceptArt");

enum UnknownEnum
{
    Value_3 = 3,
    Value_4,
    Value_5,
    Value_8 = 8,
    Value_9,
    Value_14 = 14,
    Value_21 = 21,
    Value_25 = 25,
    Value_26,
    Value_27,
    Value_30 = 30,
    Value_31,
    Value_37 = 37,
    Value_38,
    Value_39,
    Value_40,
    Value_41,
    Value_42,
    Value_43,
    Value_44,
    Value_45,
    Value_46,
    Value_49 = 49,
    Value_50,
    Value_55 = 55,
    Value_56,
    Value_61 = 61,
    Value_62,
    Value_63,
    Value_64,
    Value_65,
    Value_66,
    Value_67,
    Value_68,
    Value_69
}
