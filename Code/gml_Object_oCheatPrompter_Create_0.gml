PreviousInputs = [];
CurrentLine = "";
BackspaceHeld = 0;
TimeSinceLastInput = 0;
array_push(PreviousInputs, 
{
    Text: "Welcome to the command prompt!",
    LineColor: 65280
});
array_push(PreviousInputs, 
{
    Text: "Press F12 again to quit.",
    LineColor: 65280
});

function output(arg0, arg1)
{
    array_push(PreviousInputs, 
    {
        Text: arg0,
        LineColor: arg1
    });
}

PrompterOffset = 0;
keyboard_string = "";
