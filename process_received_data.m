function processed_data = process_received_data(rx_fname)
    % Correct for phase and frequency offset in the received data and
    % return that corrected array (decoded with known bits removed).
    % Ideally, most of the processing should happen within functions
    % this function calls.
    % Input: rx_fname        : The name of the file containing the raw 
    %                          received data collected by the USRP.
    % Output: processed_data : An array containing the corrected and
    %                          decoded data bits.
    
    % Constants associated with the transmission; both the transmit and
    % receive sides should know these values.
    % The size of the pulse to convolve the signal with.
    pulse_size = 50;
    % The size of the header (made up of known bits of initial value +1+j)
    % at the beginning of the original transmission. There should be this
    % number of known bits in both the real and imaginary domains.
    header_size = 500;
    % The size of the data bits to decode, not including the header.
    data_size = 1000;
    
    % Actual data processing.
    % Process the raw data file into a more usable array.
    raw_data_array = process_raw_data_file(rx_fname);
    % TODO Apply frequency offset correction
    freq_corrected_data = synchronize_carriers(raw_data_array); % This line should call that function
    % Remove any noise from the beginning of the data. This array will
    % still include the known bits at the beginning.
    trimmed_data = trim_data(pulse_size, header_size, data_size, freq_corrected_data);
    % Correct for any rotation in the data by using the known bits.
    rotated_data = rotate_data(header_size, trimmed_data);
    % Unpack (remove known bits, downsample, etc.) and decode.
    processed_data = unpack_data(pulse_size, header_size, rotated_data); % This line should call that function.
end 