
// SENDING TO PD
b = NetAddr.new("127.0.0.1", 6000); // address and port to send to pd
b.sendMsg("/hello", \asymbol); // send to path \hello
b.sendMsg("/there", *["pack it", 10.rand]); // use asterisk (*) to send an array

// RECEIVING FROM PD
thisProcess.openUDPPort(9000);
thisProcess.openPorts;
// receiving messages from pd in the path '/test' -- no port is needed
o = OSCFunc({ arg msg, time, addr, recvPort; [msg, time, addr, recvPort].postln; }, '/test'); // create OSC responder
o.free;
