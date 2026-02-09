% capture and analyse microphone sound signal
clear all
ports = serialportlist;
pb = PyBench(ports(end));

fs = 8000;
pb = pb.set_samp_freq(fs);

N = 1000;
while true
    samples = pb.get_mic(N);
    data = samples - mean(samples);
    figure(1);
    clf
    plot(data);
    xlabel('Sample no');
    ylabel('Signal voltage (v)');
    title('Microphone Signal');
    figure(2);
    clf
    plot_spec(data, fs)
end





