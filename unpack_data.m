function processed_data = unpack_data(pulse_size, header_size, rotated_data)
    % Take the rotated complex data, remove the known bits, and decode it
    % into a single vector of complex values. This is the final processing
    % required following frequency and phas correction.
    % Input Parameters:
    % pulse_size   : The width of each data bit.
    % header_size  : The number of bits in the known data header.
    % rotated_data : The rotated and corrected data to unpack.
    % Returns:
    % processed_data : Unpacked data as a single complex vector.

    % Remove known data bits.
    trimmed_data = rotated_data((header_size*pulse_size):end);
    % Decode bits.
    bits_i = [];
    bits_q = [];
    for i=pulse_size/2:pulse_size:length(trimmed_data)
        bits_i = [bits_i real(trimmed_data(i))];
        bits_q = [bits_q imag(trimmed_data(i))];
    end
    % Return the values as a single complex vector.
    processed_data = bits_i + 1j*bits_q;
end