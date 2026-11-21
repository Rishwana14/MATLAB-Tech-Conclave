clc;
clear;
close all;

% Step 1: Define sampling frequency and time
fs = 1000;                   % Sampling frequency (Hz)
t = 0:1/fs:5;                % 5 seconds time duration

% Step 2: Generate clean ECG-like signal
ecg_clean = 1.2*sin(2*pi*1.2*t) + 0.25*sin(2*pi*3*t);

figure;
plot(t, ecg_clean);
title('Ideal Clean ECG Signal');
xlabel('Time (seconds)');
ylabel('Amplitude');

% Step 3: Add noise (real-world effect)
powerline = 0.3*sin(2*pi*50*t);      % 50 Hz noise
baseline = 0.5*sin(2*pi*0.2*t);      % Baseline drift
random_noise = 0.4*randn(size(t));   % Random noise

ecg_noisy = ecg_clean + powerline + baseline + random_noise;

figure;
plot(t, ecg_noisy);
title('Raw ECG with Noise (Before Filtering)');
xlabel('Time (seconds)');
ylabel('Amplitude');

% Step 4: High-pass filter (remove baseline drift)
hp = designfilt('highpassiir','FilterOrder',4, ...
    'HalfPowerFrequency',0.5,'SampleRate',fs);

ecg_hp = filtfilt(hp, ecg_noisy);

% Step 5: Low-pass filter (remove high frequency noise)
lp = designfilt('lowpassiir','FilterOrder',4, ...
    'HalfPowerFrequency',40,'SampleRate',fs);

ecg_filtered = filtfilt(lp, ecg_hp);

figure;
plot(t, ecg_filtered);
title('Filtered ECG (After VLSI Equivalent)');
xlabel('Time (seconds)');
ylabel('Amplitude');

% Step 6: Compare before and after
figure;

subplot(2,1,1);
plot(t, ecg_noisy);
title('Before Filtering');

subplot(2,1,2);
plot(t, ecg_filtered);
title('After Filtering');
% Step 7: Calculate SNR improvement

snr_before = snr(ecg_noisy, ecg_noisy - ecg_clean);
snr_after  = snr(ecg_filtered, ecg_filtered - ecg_clean);

disp(['SNR Before Filtering: ', num2str(snr_before), ' dB']);
disp(['SNR After Filtering: ', num2str(snr_after), ' dB']);
% Step 8: Frequency spectrum comparison

figure;

subplot(2,1,1);
fft_before = abs(fft(ecg_noisy));
f = linspace(0, fs, length(fft_before));
plot(f, fft_before);
xlim([0 100]);
title('Frequency Spectrum Before Filtering');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

subplot(2,1,2);
fft_after = abs(fft(ecg_filtered));
plot(f, fft_after);
xlim([0 100]);
title('Frequency Spectrum After Filtering');
xlabel('Frequency (Hz)');
ylabel('Magnitude');
% Step 9: Add amplifier gain (simulate VLSI amplifier)

gain = 500;   % Amplifier gain (like instrumentation amplifier)

ecg_amplified = gain * ecg_filtered;

figure;
plot(t, ecg_amplified);
title('Amplified ECG Signal (After VLSI Gain Stage)');
xlabel('Time (seconds)');
ylabel('Amplitude');
figure;

subplot(2,1,1);
plot(t, ecg_filtered);
title('Filtered ECG');

subplot(2,1,2);
plot(t, ecg_amplified);
title('Filtered + Amplified ECG');