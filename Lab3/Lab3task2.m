f = (0:0.1:20);
f1 = 0;
f2 = 5;
f3 = 20;
D = [0.038 1.19 43 1000];

s1 = 1i*2*pi*f1;
G1 = 1000./abs(polyval(D,s1));
Gdb1 = 20*log10(G1);

s2 = 1i*2*pi*f2;
G2 = 1000./abs(polyval(D,s2));
Gdb2 = 20*log10(G2);

s3 = 1i*2*pi*f3;
G3 = 1000./abs(polyval(D,s3));
Gdb3 = 20*log10(G3);



s = 1i*2*pi*f;
G = 1000./abs(polyval(D,s));
Gdb = 20*log10(G);
figure(1);
plot(f,Gdb);

xlabel('Frequency(Hz)')
ylabel('Gain(dB)')
title('Frequency Response - Theoretical')
