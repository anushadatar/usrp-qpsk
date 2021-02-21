function tx = unpack_tx(file, pulse_size, header_size)
    % Unpack the raw transmitted data file for comparison.
    % file          : File containing raw data to unpack.
    % symbol_period : Number of samples between rectangular pulse
    %                 symbols.
    % header_size   : Number of bits in known data header.
    % Returns: 
    % tx            : Unpacked complex vector of data bits.

    tx_raw = process_raw_data_file(file);
    tx = tx_raw(100001:100001 + 1500*50 - 1);

    % Decode bits.
    bits_i = [];
    bits_q = [];
    for i=pulse_size/2:pulse_size:length(tx)
        bits_i = [bits_i real(tx(i))];
        bits_q = [bits_q imag(tx(i))];
    end
    % Return the values as a single complex vector.
    tx = bits_i + 1j*bits_q;
    tx = tx(header_size+1:end);
end