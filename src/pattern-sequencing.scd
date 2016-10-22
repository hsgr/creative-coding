
(
s.waitForBoot{
        // all sounds (buffers) are loaded from the same synthdef
        SynthDef(\buff_pat, { |bufnum=0| Out.ar(0, PlayBuf.ar(1, bufnum, doneAction: 2)) }).add;
        // path to samples
        p = (thisProcess.nowExecutingPath.dirname++"/samples/*").pathMatch;
        // collect samples to buffers
        c = p.collect{|item| Buffer.read(s, item) };

        s.sync; // to wait for asynchronous things to complete

        p = Ppar([
                Pbind(\instrument, \buff_pat, \dur, 0.25, \bufnum, Prand(c.collect(_.bufnum)))
                ], inf // repeat for ever
        ).play;
};
)
