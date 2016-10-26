
s.boot;

n = NetAddr("127.0.0.1", 47120);  // open 47120 on localhost server

(
SynthDef(\blip, { | freq = 440, amp = 0.85, att = 0.01, rel = 0.06, ffreq = 1000 |
    var sig, env, lfo;
    sig = SinOsc.ar(freq, 0, amp);
    env = EnvGen.ar(Env.perc(att, rel), doneAction:2);
    lfo = SinOsc.kr(rel * ffreq);

    Out.ar(0, Pan2.ar(RHPF.ar(sig*env, ffreq), SinOsc.kr(211*lfo)))
}).add;
)

Synth(\blip);

(
f = fork {
    loop {
        256 do: { |i|
            n.sendMsg("/sc3p5", i.asFloat); // send OSC message to P5
            Synth(\blip, [\freq, 440+i, \ffreq, 1000+i*2]);
            ((i+1).reciprocal*2).wait;
        }
    }
};
)

f.stop;
