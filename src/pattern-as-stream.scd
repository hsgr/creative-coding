
// sound example
(
SynthDef(\help_sinegrain,
    { arg out=0, freq=440, sustain=0.05;
        var env;
        env = EnvGen.kr(Env.perc(0.01, sustain, 0.2), doneAction:2);
        Out.ar(out, SinOsc.ar(freq, 0, env))
    }).add;
)

(
var a;
a = Pn(Pshuf([1, 2, 2, 3, 3, 3], 4)).asStream; // repeat pattern four times

{
    loop {
        Synth(\help_sinegrain, [\freq, a.next * 600 + 300]); // sets the next value of the pattern
        0.2.wait;
    }
}.fork; // fork is alternative syntax for Routine
)
