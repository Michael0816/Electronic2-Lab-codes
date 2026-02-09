clear all;
ports = serialportlist;
pb = PyBench('COM3');

max_x = 1.55;
min_x = 1.45;
f_sig = [1:1:20];
G_plot = zeros(1, length(f_sig));
for k = 1:length(f_sig)
    pb = pb.set_sig_freq(f_sig(k));
    pb = pb.set_max_v(max_x);
    pb = pb.set_min_v(min_x);

    pb.sine();
    pause(2)

    pb = pb.set_samp_freq(100);
    N = 300;
    y = pb.get_block(N);
    x_pk2pk = max_x - min_x;
    y_pk2pk = max(y) - min(y);
    G = y_pk2pk/x_pk2pk;
    G_dB = 20*log10(y_pk2pk/x_pk2pk);
    G_plot(k) = G_dB;
end 
plot(G_plot)




