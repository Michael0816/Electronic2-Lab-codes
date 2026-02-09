clear all;
[sig fs] = audioread('two_drums.wav');
sound (sig, fs)

N = round(0.02 * fs);
n_seg = buffer(sig, N);
Energy = sum(n_seg.^2, 1);
T = 0.02;


figure(1);
clf;
plot(sig);
xlabel('Sample no');
ylabel('signal {v}')
title('Two Drum')
figure(2)
plot(Energy);
findpeaks(Energy,SortStr="descend",NPeaks=2)
[pks, locs] = findpeaks(Energy, ...
    'SortStr', 'descend', ...
    'NPeaks', 2);
text(locs, pks, {'Peak 1','Peak 2'}, ...
    'VerticalAlignment','bottom', ...
    'HorizontalAlignment','left', ...
    'FontSize', 10, ...
    'Color', 'r')
xlabel('Segment no');
ylabel('Energy');
title('Energy of the signal in each segment')

figure(3)
plot_spec(Energy, 1/T)