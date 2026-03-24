Screen = "Title";
Timer = 0;
TextStorage = ["There once lived a boy.", "This boy was very sad. He was a crybaby who had no friends.", "'WAHHH! I'm a crybaby who has no friends!', cried the boy.", "'If only someone would show up to my birthday party...'", "'Oh, who am I kidding? It's just gonna be me and those dumb robots again!'", "If only somebody would come to the boy's birthday party...", "Yes, if only someone could make his day, maybe he wouldn't be so sad anymore!", "Well, what are you waiting for? Let's make things right, shall we?"];
TextNum = 0;
TextType = 0;
FadeVal = 0;
Pal = [13695200, 7389320, 5662772, 3354368];

function col(arg0)
{
    return Pal[clamp(arg0 + round(FadeVal), 0, 3)];
}
