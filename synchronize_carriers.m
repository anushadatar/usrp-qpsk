function corr_data = synchronize_carriers(data)
    % Correct for frequency and phase offset of a carrier on the receiving
    % end of the system.
    % Input : data = Original received data.
    % Output: corr_data = Data corrected for frequenct and phase offset.

    % CREATE FFT
    N = length(real(y));
    frequencies_shifted = (linspace(-pi, pi-2/N*pi, N) + pi/N*mod(N,2));
    f = fftshift(fft(data.^4));

    % FIND OFFSET AND ANGLE OF PULSE
    [~,I] = max(abs(f));
    f_delta = frequencies_shifted(I) / 4;
    a_delta = (angle(f(I))) / 4;

    % APPLY PHASE CORRECTION
    samples = 0:1:N-1;
    exponent = exp(1i*(f_delta.*samples + aoffset));
    corr_data = data.*exponent;
end