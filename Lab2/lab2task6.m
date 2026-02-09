clear all;
[sig fs] = audioread('guitar.wav');
[sig2 fs2] = audioread('bass.wav');

sound(sig, fs)
sound(sig2, fs2)



N = round(0.02 * fs);
n_seg = buffer(sig, N);
Energy = sum(n_seg.^2, 1);
T = 0.2;


figure(1);
clf;
plot(sig);
xlabel('Sample no');
ylabel('signal {v}')
title('guitar')
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


N2 = round(0.02 * fs2);
n_seg2 = buffer(sig2, N2);
Energy2 = sum(n_seg2.^2, 1);
T = 0.2;

figure(4);
clf;
plot(sig2);
xlabel('Sample no');
ylabel('signal {v}')
title('bass')
figure(5)
plot(Energy2);
findpeaks(Energy2,SortStr="descend",NPeaks=2)
[pks, locs] = findpeaks(Energy2, ...
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

figure(6)
plot_spec(Energy2, 1/T)