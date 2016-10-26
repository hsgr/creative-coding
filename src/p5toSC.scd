
thisProcess.openUDPPort(12000); // open port 12000 to rcv from p5
thisProcess.openPorts; // list all open ports
o = OSCFunc({|msg, time, addr, recvPort| \matching.postln; msg.postln; }, '/test');
o.free;
