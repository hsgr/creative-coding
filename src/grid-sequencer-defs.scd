
// sounds files from freesound.org
/*
http://www.freesound.org/people/datasoundsample/sounds/41947/
http://www.freesound.org/people/datasoundsample/sounds/41948/
http://www.freesound.org/people/datasoundsample/sounds/41942/
http://www.freesound.org/people/datasoundsample/sounds/41944/
*/
(
// make sure to boot the server before loading the samples
s.waitForBoot {
        // load samples from relative path
        p = (thisProcess.nowExecutingPath.dirname++"/samples/*").pathMatch;
        // collect samples to buffers
        c = p.collect{|item| Buffer.read(s, item) };
}
)
// define the SynthDef (synth definition)
(
// buffdrums
SynthDef(\buffdrums, { |bufnum=0, pan=0.0, amp=0.5|
        Out.ar(0, Pan2.ar(PlayBuf.ar(1, bufnum, doneAction: 2), pan, amp))
}).add;

)
// play drum hits
Synth(\buffdrums, [\bufnum, c[0]]);
Synth(\buffdrums, [\bufnum, c[1]]);
Synth(\buffdrums, [\bufnum, c[2]]);
Synth(\buffdrums, [\bufnum, c[3]]);
