function package_data(N, symbol_period, header_size)
    % Format a transmit file ('tx.dat') for the usrp to send.
    % Input Parameters: 
    % N             : Number of random data bits to generate
    % symbol_period : Number of samples between rectangular pulse
    %                 symbols
    % header_size   : Number of bits in known data header.
    % Returns: 
    % 'tx.dat'      : File saved with data ready to be transmitted via
    %                 usrp
   
    % GENERATE BITS
    I_raw = sign(randn(N,1))';
    Q_raw = sign(randn(N,1))';
    I = add_known_bits(header_size, I_raw)';
    Q = add_known_bits(header_size, Q_raw)';
    bits = I + 1i*Q;

    % CREATE DATA
    pulse = ones(symbol_period, 1);
    x = zeros(symbol_period*length(bits),1);
    x(1:symbol_period:end) = bits;
    x_tx = conv(pulse, x);
    
    % CREATE ARRAY FOR FILE
    x_tx = [zeros(100000, 1); x_tx; zeros(100000, 1)];
    tmp = zeros(length(x_tx)*2, 1);
    tmp(1:2:end) = real(x_tx);
    tmp(2:2:end) = imag(x_tx);
    
    stem(x_tx)
    
    % SAVE DATA TO FILE
    f = fopen('tx.dat', 'wb');
    fwrite(f, tmp, 'float32');
    fclose(f);
end