
(
SynthDef(\def_args, { | freq = 440 |
    Out.ar(0,
        Pan2.ar(
            SinOsc.ar(freq, 0, 0.2) * Line.kr(1, 0, 1, doneAction: 2) // Line releases the Synth
        )
    )
}).add;
)

a = Synth(\def_args);
a = Synth(\def_args, [\freq, 330]); // change the frequency
