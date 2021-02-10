function  [trimmed_data] = trim_data(pulse_size, header_size, data_size, received_data)
    % TODO Docstring
    % Find the beginning of the known data in the header 
    known_data = ones(header_size.*pulse_size,1)';
    [xCorr,lags] = xcorr(received_data,known_data);    
    [~,I] = max(abs(xCorr));
    max_time = lags(I);
    trimmed_data = received_data(max_time:max_time + (data_size + header_size)*pulse_size); 
end
