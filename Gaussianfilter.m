%% --- calculate envelope image, i.e., to obtain envelope at each T
function EnvelopeImage = EnvelopeImageFcn(WinWave, fs, TPoint, StaDist)
%% new code for group velocity analysis using frequency domain Gaussian filter
% [input] WinWave: input waveform vector
%         fs: sample frequency of the waveform
%         TPoint: input period vector for calculating envelope function,
%                 e.g. TPoint = 2:1:40;
%         StaDist: propagation distance from source to station (km)
% [output] EnvelopeImage: envelope function of each period for the input trace

alfa = [0 100 250 500 1000 2000 4000 20000; 5  8  12  20  25  35  50 75];
guassalfa = interp1(alfa(1,:), alfa(2, :), StaDist);

NumCtrT = length(TPoint);
PtNum = length(WinWave);

nfft = 2^nextpow2(max(PtNum,1024*fs));
xxfft = fft(WinWave, nfft);
fxx = (0:(nfft/2))/nfft*fs; 
IIf = 1:(nfft/2+1);
JJf = (nfft/2+2):nfft;

EnvelopeImage = zeros(NumCtrT, PtNum);
for i = 1:NumCtrT
    CtrT = TPoint(i);
    fc = 1/CtrT;                
    Hf = exp(-guassalfa*(fxx - fc).^2/fc^2);
    yyfft = zeros(1,nfft);
    yyfft(IIf) = xxfft(IIf).*Hf';
    yyfft(JJf) = conj(yyfft((nfft/2):-1:2));
    yy = real(ifft(yyfft, nfft));
    EnvelopeImage(i, 1:PtNum) = yy(1:PtNum);
%     filtwave = abs(hilbert(yy(1:nfft)));
%     EnvelopeImage(i, 1:PtNum) = filtwave(1:PtNum);
end
