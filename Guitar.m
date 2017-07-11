%% Coursework guitar, with and without delay/flanger
%Read an audio file of choice
%X=Data file, Fs=Sample rate of the file
 [x,Fs] = audioread('guitar.wav');
 %Plays the audio file without delay
 sound(x,Fs); 
 %Pauses for 1.5 seconds before playing delayed version
 pause(15);  
 %% Delay/Flanger parameters and variables
 %Adjust the delay time between original output and delay output, also adjusts the flanger sweep
 delay = 0.003; 
 %Delay/flanger volume in the mix compared to original output
 delaymix = 0.70; 
 %Used to adjust delay repeats after audio, only for delay
 R = 100; 
 %Used for experimenting with delay further
 %Fs= 8000; 
 %Set delay time*sample rate as a variable and round to nearest int
 D = round(delay*Fs);  
 %Rate of flanger in Hz
 %Higher rate = Faster
 %Slower rate = Pink Floyd
 rate=2;
 
 %create simple vector between 1 and length of x
 len = 1:length(x);
 %sine function dividing the rate(hz) by sample rate
 %Philipp seifried maths behind flanger
 %2*PI*audio/frequency*(rate divided by frequency)
 sine_fun = sin(2*pi*len*(rate/Fs));
 %y becomes a copy of the original audio data
 %creates an array the same size as x data
 y = zeros(size(x));

%create a single delay effect
%  for i=D+1:length(x) 
%    %x(i) is the original signal
%    %D is the delay with adjusted time between
%    y(i) = x(i) - delaymix*x(i-D);  
%  end  

%create a flanger effect
%creates a list between i and length of x
for i=D+1:length(x)
    %Takes sine function with i position of vector and gets absolute value
    new_sine=(sine_fun(i));
    %Flanger takes new sine effect and multiplys by delay time and sample
    %rate which is rounded to its highest value 
    flan=ceil(new_sine*D);
    %Same as the delay effect, only using flanger delay instead of delay
    %delaymix can be altered to - or + depending on preference of sound
    y(i) = x(i)+ delaymix*x(i-flan);
end    
%% Flanger version of audio file  
 sound(y,Fs);  