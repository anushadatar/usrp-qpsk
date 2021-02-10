function rotated_data = rotate_data(header_size, received_data, pulse_size)
    % Determine and correct for the phase offset in the data by observing
    % the change in the value of the known bits at the beginning of the
    % data (originally all set to +1+j) and rotating all of the data to 
    % reflect the phase offset of those known bits.
    % Input : header_size =   The number of known bits to extract from the
    %                         beginning of the received signal. Note that
    %                         the system assumes that both sides already
    %                         know this value.
    %         received_data = The data received over the channel to
    %                         interpret the known data from. Note that this
    %                         function expects that the first bit in this
    %                         value is the first known bit; the data may
    %                         require trimming prior to this operation to
    %                         ensure that is the case, and any frequency
    %                         offset should be corrected for (i.e. the data
    %                         should be unsmeared).
    % Output: rotated_data =  The data with the angle corrected (with a
    %                         correction factor indicated by the change in
    %                         the known bits.
    % Extract the average value of the bits in the header of the data.
    known_bits = received_data(1:header_size*pulse_size); 
    average_known_bit_value = mean(known_bits);
    
    % Find angle of rotation of known bits.
    if real(average_known_bit_value) > 0
        if imag(average_known_bit_value) > 0
            offset_angle = 0;
        else
            offset_angle = -3*pi/2;
        end
    else
        if imag(average_known_bit_value) > 0
            offset_angle = -pi/2;
        else
            offset_angle = -pi;
        end
    end
    
    % Correct the data accordingly.
    rotated_data=received_data.*exp(1i*offset_angle);
end
