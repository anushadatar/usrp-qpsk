function corr_data = costas_loop(data)
    % Apply costas loop correction to the input data. While this
    % implementation is generally functional, it will require additional
    % tuning (likely with a large dataset) to become reliable.
    % Input Parameters:
    % data      : The original complex vector of data to correct.
    % Returns:
    % corr_data : The corrected data.
    
    % Normalize data values.
    data = data./(rms(data));
    % Tunable parameters for the controller.
    beta = 1;
    alpha = 0.1;
    psi = 0;
    err_sum = 0;
    corr_data = zeros(size(data));
    for k = 1:length(data)
        corr_data(k) = data(k)*exp(1j*psi);
        err = -real(corr_data(k))*imag(corr_data(k));
        err_sum = err_sum + err;
        d = beta*err + alpha*err_sum;
        psi = psi + d;
        % Warp values around.
        if (psi < -pi)
            psi = psi + 2*pi;
        end
        
        if (psi > pi)
            psi = psi - 2*pi;
        end
    end
end