function [P1,f] = fft_recorder(array,fs)
    array = fft(array);
    P2 = abs(array/length(array));
    P1 = P2(1:length(array)/2+1);
    P1(2:end-1) = 2*P1(2:end-1);
    f = fs*(0:(length(array)/2))/length(array);
end

