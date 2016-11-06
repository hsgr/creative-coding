
// By Ioannis Zannos
Record {
        *start {
                {
                        Server.default.prepareForRecord;
                        0.1.wait;
                        Server.default.record;
                }.fork;
        }

        *stop { Server.default.stopRecording; }
}
