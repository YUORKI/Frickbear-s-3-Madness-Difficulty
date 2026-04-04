Frame = -120;
Offset = 360;
TextOrder = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~ ¡¿áéíóú™";
CostFont = font_add_sprite_ext(sSalvageSheet_Font, TextOrder, true, 0);
TextArray = ["The company's new president is putting in one hell of an effort to save what little face we have left before the sale goes through. All the documents in this folder were supposed to be destroyed, and I was the one put in charge of destroying them.\n\n...But screw him. I've put up with being a corporate slave long enough. People deserve the truth, and even if it costs me my job, even if it costs me everything...they'll get it.\n\nThis folder contains everything. Documentation on every single tragedy the company so desperately wants covered up. Do with it what you will.\n\n-Clark", "", "", "", "", "", "", "", "LOG ENTRY - 9/12/04\n   We've been hemorrhaging money for close to two decades now. Our cost-cutting measures bought us some time, but it certainly didn't do any favors for our reputation. By all means, this company is a sinking ship.\n...But I'm its captain, and you know how the saying goes. The fact of the matter is that my job here is far from over. Those spirits are still trapped inside my machines, and if this company goes under...", "...They'll still be there.\nAt first, I found the very concept of this almost impossible to fathom, but it's thanks to...well, let's call him a friend...that I've finally begun to wrap my head around it. In fact...that same friend seems to know how they can be set free. It does pain me to do this to my own creations...but it's what needs to be done. The pieces have been put in place.\nThings will be made right soon enough.", "LOG ENTRY - 9/17/04\n   It didn't work. I was so sure that it would. Everything was set up properly. The execution went exactly how we planned it. It should have worked. Why didn't it work?\n   I've begun seeing them here, out there, everywhere. Around the corners, down hallways, shadows dancing in the fringes of my vision, even in the corners of my own home. Anywhere the light doesn't reach.   These four have had their bodies", "laid to rest. Their killer has long since faced justice for what he's done. Their cages have been reduced to nothing but ash. By all our knowledge, there isn't anything more they could need...and yet, this puzzle hasn't been completed. At first, I thought, \"what more could they want?\" ...But no, that isn't the question we need to be asking. I've worked with plenty of children, and if they want something, they'll let you know it, bless their little hearts.", "No, what I should be asking is...If the picture isn't complete, then what's the missing piece?\n\n...I'll need to dig deeper.", "LOG ENTRY - 10/24/04\nI've finally found it.\nMy hands are shaking as I write this. Perhaps I should calm myself, but I find myself unable to wait to document this revelation. There was one last loose end we had yet to tie up. Someone we had forgotten about. ...I'll be doing this one on my own. My associate has been of great help, but I do not wish to burden him with this. After all, this has always been my cross to bear.", "It is entirely possible that I won't make it back to tell the tale, but that does not concern me any longer. As long as those four can finally move on...\n...As long as she can move on.\n\nIt's time I finally tie this last loose end."];
CurrentPage = 0;
PageTurn = array_create(ceil(array_length(TextArray) / 2) + 2, 0);
CurrentPage = 0;

function draw_page(arg0)
{
    var FoldPercent = cos(PageTurn[arg0] * pi);
    
    if (arg0 == 0)
    {
        draw_sprite_ext(sTalbert_Folder, (FoldPercent > 0) ? 2 : 0, 320, Offset, FoldPercent, 1, 0, c_white, 1);
    }
    else if (arg0 == (array_length(PageTurn) - 1))
    {
        draw_sprite_ext(sTalbert_Folder, (FoldPercent > 0) ? 1 : 3, 320, Offset, FoldPercent, 1, 0, c_white, 1);
    }
    else if (arg0 == 1)
    {
        draw_set_font(global.FontW97Black);
        draw_sprite_ext(sTalbert_Paper, 1, 320, Offset, FoldPercent, 1, 0, c_white, 1);
        
        if (FoldPercent > 0 && ((arg0 * 2) - 2) < array_length(TextArray))
            draw_text_ext_transformed(320 + (15 * FoldPercent), Offset + 28, TextArray[(arg0 * 2) - 2], 14, 262, FoldPercent, 1, 0);
    }
    else if (arg0 == 2)
    {
        draw_sprite_ext(sTalbert_Paper, (FoldPercent > 0) ? 2 : 3, 320, Offset, FoldPercent, 1, 0, c_white, 1);
    }
    else if (arg0 == 3)
    {
        draw_sprite_ext(sTalbert_Paper, (FoldPercent > 0) ? 4 : 5, 320, Offset, FoldPercent, 1, 0, c_white, 1);
    }
    else if (arg0 == 4)
    {
        draw_sprite_ext(sTalbert_Paper, (FoldPercent > 0) ? 6 : 7, 320, Offset, FoldPercent, 1, 0, c_white, 1);
    }
    else
    {
        draw_sprite_ext(sTalbert_Paper, 0, 320, Offset, FoldPercent, 1, 0, c_white, 1);
        draw_set_font(CostFont);
        draw_set_halign(fa_left);
        shader_set(shRecolor);
        var Pal = [16777215, 13482425, 14050148, 0];
        replace_color(13695200, 7389320, 5662772, 3354368, Pal[0], Pal[1], Pal[2], Pal[3]);
        
        if (FoldPercent > 0 && ((arg0 * 2) - 2) < array_length(TextArray))
            draw_text_ext_transformed(320 + (31 * FoldPercent), Offset + 45, TextArray[(arg0 * 2) - 2], 24, 262, FoldPercent, 1, 0);
        
        if (FoldPercent < 0 && ((arg0 * 2) - 1) < array_length(TextArray))
            draw_text_ext_transformed(334 + (277 * FoldPercent), Offset + 45, TextArray[(arg0 * 2) - 1], 24, 262, FoldPercent * -1, 1, 0);
        
        shader_reset();
    }
}

audio_play_sound(sfxCreepyKidLaugh, 50, false);
application_surface_draw_enable(true);
