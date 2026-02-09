clear all;
ports = serialportlist;
pb = PyBench('COM3');
x_dcL = 0.5;
x_dcH = 1.62;
x_dc = [0:0.1:2.5];
y_dc = zeros(size(x_dc));
for i = [1: length(x_dc)]
    n = 0;
    pb.dc(x_dc(i))
    pause(0.5)
    for k = [1:10]
        n = n + pb.get_one();
    end 
    y_dc(i) = mean(n);
end

plot(x_dc, y_dc)