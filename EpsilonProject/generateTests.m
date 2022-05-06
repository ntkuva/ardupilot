
configurations = ["setParametersForHealth", "setParametersForHealthTMR", "setParametersForAffinity"];
faults = ["SIM_BARO_FREEZE", "SIM_BARO_GLITCH", "SIM_BARO_NOISE"];
faultValues = {["1"] ["5" "10" "20"] ["5" "10" "20"]};
faultTimes = ["0" "1" "2" "3"];

for c = 1:configurations.length()
    for f = 1:faults.length()
        fvs = faultValues{f};
        for fv = 1:fvs.length()
            for ft = 1:1:faultTimes.length()
                fprintf("runBaroFaultTest(self, %s, %s, %s, %s)\n", configurations(c), faultTimes(ft), faults(f), fvs(fv));
            end
        end
    end
end
    

