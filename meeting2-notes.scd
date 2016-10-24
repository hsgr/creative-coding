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

thisProcess.nowExecutingPath.dirname ++ "/relative-path"

//////////////////////////

(
// make sure to boot the server before loading the samples
s.waitForBoot {
	// load samples from relative path (make a subfolder in the working directory with name 'samples')
	p = (thisProcess.nowExecutingPath.dirname++"/samples/*").pathMatch;
	// collect samples to buffers
	c = p.collect{|item| Buffer.read(s, item) };
}
)
// check if buffers are OK!!!
c

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



/// STEP SEQUENCER


(
w = Window.new("Grid");

a = [
	Button(w)
	.states_([["", Color.black, Color.green], ["", Color.black, Color.yellow]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.green], ["", Color.black, Color.yellow]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.green], ["", Color.black, Color.yellow]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.green], ["", Color.black, Color.yellow]])
	.action_({ | butt | butt.value })
];

b = [
	Button(w)
	.states_([["", Color.black, Color.white], ["", Color.black, Color.red]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.white], ["", Color.black, Color.red]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.white], ["", Color.black, Color.red]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.white], ["", Color.black, Color.red]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.white], ["", Color.black, Color.red]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.white], ["", Color.black, Color.red]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.white], ["", Color.black, Color.red]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.white], ["", Color.black, Color.red]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.white], ["", Color.black, Color.red]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.white], ["", Color.black, Color.red]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.white], ["", Color.black, Color.red]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.white], ["", Color.black, Color.red]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.white], ["", Color.black, Color.red]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.white], ["", Color.black, Color.red]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.white], ["", Color.black, Color.red]])
	.action_({ | butt | butt.value }),
	Button(w)
	.states_([["", Color.black, Color.white], ["", Color.black, Color.red]])
	.action_({ | butt | butt.value })
];

w.layout_( GridLayout.rows(
	[ a[0], a[1], a[2], a[3] ],
	[ b[0], b[1], b[2], b[3] ],
	[ b[4], b[5], b[6], b[7] ],
	[ b[8], b[9], b[10], b[11] ],
	[ b[12], b[13], b[14], b[15] ]
)).front;
)

//a[0].valueAction = 1;
//b[0].value;
{ 	Button(w)
	.states_([["", Color.black, Color.green], ["", Color.black, Color.yellow]])
	.action_({ | butt | butt.value })
}!5

(
t = 0.67;
r = Routine {
	loop {
		4 do: { |i|
			a[i].valueAction  = 1; // switch on the current beat
			a[(i+1)%4].valueAction  = 0; // switch off all other beats
			a[(i+2)%4].valueAction  = 0;
			a[(i+3)%4].valueAction  = 0;
			// play the sounds
			4 do: { |j|
				if( (b[j].value==1) && (i==j) ){
					Synth(\buffdrums, [\bufnum, c[3]]);
				};
				if( (b[j+4].value==1) && (i==j) ){
					Synth(\buffdrums, [\bufnum, c[2]]);
				};
				if( (b[j+8].value==1) && (i==j) ){
					Synth(\buffdrums, [\bufnum, c[1]]);
				};
				if( (b[j+12].value==1) && (i==j) ){
					Synth(\buffdrums, [\bufnum, c[0]]);
				};
			};
			t.wait; // t values below ~0.04 will not produce accurate sequencing
		};
	};
};
// start the routine
r.play(AppClock); // AppClock is used with GUI
)
// stop the routine
r.stop;


(
f = {
	loop {
		10 do: { |i|
			i.postln;
			0.1.wait;
		}
	}
}.fork; // don't need play message -- equivalent to Routine
)
f.stop

//// add a reverb to the synthdef

(
// buffdrums
SynthDef(\buffdrums, { |bufnum=0, pan=0.0, amp=0.5|
	var signal;

	signal = PlayBuf.ar(1, bufnum, doneAction: 2);

	Out.ar(0, Pan2.ar(FreeVerb.ar(signal, 0.6, 0.8), pan, amp))
}).add;
)

t = 0.35;

// pattern
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

s.makeGui


///
Platform.userExtensionDir

Record.start
Record.stop