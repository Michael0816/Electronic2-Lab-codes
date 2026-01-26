function [sig] = sine_gen(amp, f, fs, T, phi)
%sinewave generation: amplitude(amp), frequency(f), sampling
%frequency(fs),duration for sampling(T).

    dt = 1/fs;
    t = 0:dt:T;
    sig = amp*sin(2*pi*f*t + phi);