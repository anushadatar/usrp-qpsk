# QPSK Communication
*Mark Goldwater and Anusha Datar*

Olin College SP21 Principles of Wireless Communications Lab 1.
# Summary
This repository contains code and documentation associated with a 
communication system that uses the QPSK (4-QAM) communication scheme to send and
receive information between two USRP B210 radios. Our [final report](https://github.com/anushadatar/usrp-qpsk/blob/main/docs/report.pdf) includes
more details about our implementation and the theoretical background that
informed it. The main function associated with preparing transmit data is
[package_data](https://github.com/anushadatar/usrp-qpsk/blob/main/package_data.m), and the main function associated with correcting and
decoding received data is [process_received_data](https://github.com/anushadatar/usrp-qpsk/blob/main/process_received_data.m).
