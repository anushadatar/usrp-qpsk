function raw_data_array = process_raw_data_file(rx_fname)
    % TODO docstring
    raw_data_file = fopen(rx_fname, 'r');
    raw_data_tmp = fread(raw_data_file,'float32');
    fclose(raw_data_file);
    rx = raw_data_tmp(1:2:end)+1i*raw_data_tmp(2:2:end);
end 