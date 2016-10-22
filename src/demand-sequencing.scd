
(
    {
        var freq;
        freq = Duty.kr(
                Drand([0.01, 0.2, 0.4], inf), // demand ugen as durations
                0,
                Dseq([204, 400, 201, 502, 300, 200], inf)
            );
        SinOsc.ar(freq * [1, 1.01]) * 0.1

    }.play;
)
