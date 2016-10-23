s.boot; //start the server
s.volume.gui
s.volume_(-20);
s.meter;
(
{
	Pan2.ar(LFNoise1.ar(200), LFPulse.kr(1).range(-1,1))
}.play
)

Function
y = f(x)
///
(
var a, b, c; // local vars
a = { [100, 200, 300].choose };    // a Function
b = { 10.rand + 1 };    // another Function
c = a + b;     // c is a Function.
c.value.postln;    // evaluate c and print the result
)
a.value;

//

f = { arg a, b; (a * b).postln }; // |a, b| are the arguments
f.value(3, 10);

//

SynthDef(\def_noArgs, { Out.ar(0, LPF.ar(PinkNoise.ar(1), 550))}).add;
a = Synth(\def_noArgs); // play the sound
a.free; // stop the sound and release the Synth
        // (check the incremental values on the Post Window)

(
SynthDef.new("name_of_def", { | freq=440, amp=0.1, lfo=1.0 |
	var signal, envelope, panning;

	signal = SinOsc.ar(freq, 0.0, amp);
	envelope = EnvGen.ar(Env.perc(0.05, 5.0));
	panning = SinOsc.kr(lfo).range(-1,1);

	Out.ar(0, Pan2.ar(signal*envelope, panning));
}).add;
)


a = Synth("name_of_def");
a.set('freq', 550);

////

(
var window, button;
window = Window("my window", Rect(0, 0, 200, 300));
button = Button(window, Rect(50, 50, 100, 100));

button.states_([
	["start", Color.white, Color.blue],
	["stop", Color.white, Color.red ],
	["pause", Color.white, Color.green ]
]);
button.action_({ |v| v.value.postln });
window.front;
)


(
s.waitForBoot({
	w = Window.new;
	b = Button(w, Rect(20, 20, 80, 26))
	      .states_([["play", Color.black, Color.rand]])
	      .mouseDownAction_({
		a = {EnvGen.kr(Env.adsr, doneAction:2) * SinOsc.ar(440, 0, 0.4)}.play;
	})
	.action_({ // an action sets the value to the View when something happens (ie. a button pressed)
		a.release(0.3); // set the action to release the sound
	});
	w.front;
})
)

////////////////////////

SynthDef(\noise, { | amp = 0.2 | Out.ar(0, PinkNoise.ar(amp)); }).add;
a = Synth(\noise);
a.set(\amp, 0.1); // set the argument while the Synth is playing
a.free;

(
var w, butt, sound; // w is not an interpreter's var -- it's a local var
// define a window
w = Window.new("first piece", Rect(0, 0, 200, 200));
w.front; // make the window
// make the button
butt = Button(w, Rect(0, 0, 100, 100));
//define the states of the button
butt.states = [["start"], ["stop"]];

butt.action = { | v |
    if (v.value == 1)  {
      sound = Synth('noise');
      w.onClose({
		  { butt.value = 0 }.defer;
      });
    }{
      sound.free;
    }
};
)

thisProcess.nowExecutingPath.dirname
