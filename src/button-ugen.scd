
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
