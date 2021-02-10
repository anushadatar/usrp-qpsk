function  [trimmed_data, known_sig] = trim_data(received_data, pulse_size, header_size)
    % TODO Docstring
    % Find the beginning of the known data in the header 
    known_sig = ones(header_size.*pulse_size,1)';
    [xCorr,lags] = xcorr(received_data,known_sig);    
    [~,I] = max(abs(xCorr));
    max_time = lags(I) + header_size*pulse_size;
    trimmed_data = received_data(max_time:end); 
end
