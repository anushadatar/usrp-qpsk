function corr_data = costas_loop(data)
    % TODO DOC
    
    data = data./(rms(data));
    
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
        psi
        if (psi < -pi)
            psi = psi + 2*pi;
        end
        
        if (psi > pi)
            psi = psi - 2*pi;
        end
    end
end