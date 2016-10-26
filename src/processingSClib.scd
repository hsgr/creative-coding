
s.waitForBoot{

  SynthDef("lftri", { | freq = 400, amp = 0.1 |
    Out.ar(0, FreeVerb.ar(LFTri.ar(freq, 0, amp))!2)
  }).add;

  SynthDef("lfsaw", { | freq = 400, amp = 0.1 |
    Out.ar(0, FreeVerb.ar(LFSaw.ar(freq, 0, amp))!2)
  }).add;

}
