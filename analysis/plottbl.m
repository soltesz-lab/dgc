#! /usr/bin/octave -qf
args = argv ();

DGC_results = load(args{1});

input_resistance=DGC_results(:,2);
membrane_tau=DGC_results(:,6);
spike_threshold=DGC_results(:,9);
spike_amplitude=DGC_results(:,10);
spike_ahp=DGC_results(:,11);
rel_amplitude_dend1=DGC_results(:,12);
rel_amplitude_dend2=DGC_results(:,13);
rel_amplitude_dend3=DGC_results(:,14);
rel_amplitude_dend4=DGC_results(:,15);
rel_amplitude_dend5=DGC_results(:,16);
number_of_spikes=DGC_results(:,17);
mean_firing_rate=DGC_results(:,18);
mean_isi=DGC_results(:,19);
isi_adaptation4=DGC_results(:,24);

h = figure(1);

subplot(3, 2, 1)
hist(input_resistance,50);
title(sprintf("Input resistance [MOhm]; mean = %g std = %g",
      mean(input_resistance),std(input_resistance)));

subplot(3, 2, 2)
hist(membrane_tau,50);
title(sprintf("Membrane time constant [ms]; mean = %g std = %g",
      mean(membrane_tau),std(membrane_tau)));

subplot(3, 2, 3)
hist(spike_amplitude,50);
title(sprintf("Rel. AP amplitude [mV]; mean = %g std = %g",
      mean(spike_amplitude),std(spike_amplitude)));

subplot(3, 2, 4)
hist(spike_threshold,50);
title(sprintf("AP threshold [mV]; mean = %g std = %g",
      mean(spike_threshold),std(spike_threshold)));

subplot(3, 2, 5)
hist(spike_ahp,50);
title(sprintf("Fast AHP [mV]; mean = %g std = %g",
      mean(spike_ahp),std(spike_ahp)));

subplot(3, 2, 6)
hist(isi_adaptation4,50);
title(sprintf("ISI adaptation 4; mean = %g std = %g",
      mean(isi_adaptation4),std(isi_adaptation4)));

print (h, "DGC_results1.pdf", "-dpdf")

h = figure(2);

s = subplot(2, 2, 1)
rel_amplitude_dend1_mean = mean(rel_amplitude_dend1);
rel_amplitude_dend1_stdev = std(rel_amplitude_dend1);
rel_amplitude_dend2_mean = mean(rel_amplitude_dend2);
rel_amplitude_dend2_stdev = std(rel_amplitude_dend2);
rel_amplitude_dend3_mean = mean(rel_amplitude_dend3);
rel_amplitude_dend3_stdev = std(rel_amplitude_dend3);
rel_amplitude_dend4_mean = mean(rel_amplitude_dend4);
rel_amplitude_dend4_stdev = std(rel_amplitude_dend4);
rel_amplitude_dend5_mean = mean(rel_amplitude_dend5);
rel_amplitude_dend5_stdev = std(rel_amplitude_dend5);


rel_amplitude_dend_means = [rel_amplitude_dend1_mean,
                            rel_amplitude_dend2_mean,
                            rel_amplitude_dend3_mean,
                            rel_amplitude_dend4_mean,
                            rel_amplitude_dend5_mean,];
rel_amplitude_dend_stds = [rel_amplitude_dend1_stdev,
                           rel_amplitude_dend2_stdev,
                           rel_amplitude_dend3_stdev,
                           rel_amplitude_dend4_stdev,
                           rel_amplitude_dend5_stdev];
errorbar([50,100,150,200,250],rel_amplitude_dend_means, ...
         rel_amplitude_dend_stds);
axis([0 300 0 1]);
set(s,'XTick',0:50:250);
set(s,'YTick',0:0.2:1);
title("Amplitude of dendritic AP rel. to soma");

subplot(2, 2, 2)
hist(number_of_spikes,20);
title(sprintf("Number of spikes; mean = %g",mean(number_of_spikes)));

subplot(2, 2, 3)
hist(mean_firing_rate,50);
title(sprintf("Mean firing rate [Hz]"));

subplot(2, 2, 4)
hist(mean_isi,50);
title(sprintf("Mean ISI [ms]"));


print (h, "DGC_results2.pdf", "-dpdf")
