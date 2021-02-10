function  [trimmed_data, known_sig] = find_data_start(received_data, pulse_size, header_size)
    % TDODO Docstring

    pulse = ones(pulse_size,1);
    convolved_data = conv(received_data, pulse);
    known_sig = ones(header_size.*pulse_size,1)';
    [xCorr,lags] = xcorr(convolved_data,known_sig);    
    [~,I] = max(abs(xCorr));
    max_time = lags(I) + header_size*pulse_size;
    trimmed_data = received_data(max_time:end);
    
end
