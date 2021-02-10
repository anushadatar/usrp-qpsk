function prepared_data = add_known_bits(header_size, transmit_data)
    % Add known bits to information to transmit across the channel. 
    % Input : header_size =   The number of bits in known bits. Note that
    %                         the system assumes that the receive side
    %                         already knows this value.
    %         transmit_data = An array of individual bits to transmit, 
    %                         without known bits
    % Output: prepared_data = An array of packed data ready to complete
    %                         final processing on and save to a file.

    % Create known data vector.
    known_data = ones(1, header_size);
    prepared_data = horzcat(known_data, transmit_data);
end
