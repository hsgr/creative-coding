
SynthDef(\def_noArgs, { Out.ar(0, LPF.ar(PinkNoise.ar(1), 550))}).add;

a = Synth(\def_noArgs); // play the sound
a.free; // stop the sound and release the Synth
        // (check the incremental values on the Post Window)
