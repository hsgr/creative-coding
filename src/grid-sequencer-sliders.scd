
(
w = Window.new("Grid"); // a, b, w are interpreter's vars

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
        [ b[0], b[1], b[2], b[3], [ p = Slider(w), rows:4] ], // control amp with p
        [ b[4], b[5], b[6], b[7] ],
        [ b[8], b[9], b[10], b[11] ],
        [ b[12], b[13], b[14], b[15] ],
        [
                [
                        k = Slider(w) // bufnum = 3
                        .orientation_(\horizontal)
                        .value_(0.5),
                        columns:4
                ]
        ],
        [
                [
                        l = Slider(w) // bufnum = 2
                        .orientation_(\horizontal)
                        .value_(0.5),
                        columns:4
                ]
        ],
        [
                [
                        m = Slider(w) // bufnum = 1
                        .orientation_(\horizontal)
                        .value_(0.5),
                        columns:4
                ]
        ],
        [
                [
                        n = Slider(w) // bufnum = 0
                        .orientation_(\horizontal)
                        .value_(0.5),
                        columns:4
                ]
        ]
)).front;
)

//a[0].valueAction = 1;
//b[0].value;

(
t = 0.3;
r = Routine {
        loop {
                4 do: { |i|
                        a[i].valueAction  = 1; // switch on the current beat
                        a[(i+1)%4].valueAction  = 0; // switch off all other beats
                        a[(i+2)%4].valueAction  = 0;
                        a[(i+3)%4].valueAction  = 0;
                        // play the sounds
                        4 do: { |j|
                                // control panning
                                if( (b[j].value==1) && (i%4==j) ){
                                        Synth(\buffdrums, [\bufnum, c[3], \pan, (k.value * 2 - 1)]);
                                };
                                if( (b[j+4].value==1) && (i%4==j) ){
                                        Synth(\buffdrums, [\bufnum, c[2], \pan, (l.value * 2 - 1)]);
                                };
                                if( (b[j+8].value==1) && (i%4==j) ){
                                        Synth(\buffdrums, [\bufnum, c[1], \pan, (m.value * 2 - 1)]);
                                };
                                if( (b[j+12].value==1) && (i%4==j) ){
                                        Synth(\buffdrums, [\bufnum, c[0], \pan, (n.value * 2 - 1)]);
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
