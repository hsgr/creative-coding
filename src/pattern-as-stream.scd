
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
a = Pn(Pshuf([1, 2, 2, 3, 3, 3], 4)).asStream;
{
    loop {
        Synth(\help_sinegrain, [\freq, a.next * 600 + 300]);
        0.2.wait;
    }
}.fork; // fork is alternative syntax for Routine
)
