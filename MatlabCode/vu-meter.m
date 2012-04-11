clearall; clc; close all;

try
% Initialize serial port
s = serial('COM30');
set(s,'BaudRate', 1200);
set(s,'DataBits', 8);
set(s,'StopBits', 1);
fopen(s);
s.ReadAsyncMode = 'continuous';

% Various variables
numberOfDatas = 100000;
data = zeros(1, numberOfDatas);
i = 1;

% Main graph figure
figure(1);
holdon;
title('Incomming Data from External Device');
xlabel('Data Number');
ylabel('Analog Voltage (0-1023)');

% Start asynchronous reading
readasync(s);
while(i<=numberOfDatas)

% Get the data from the serial object
data(i) = fscanf(s, '%d');

% Plot the data
figure(1);
stem(i, data(i), 'm*');

% Ensure there are always 10 tick marks on the graph
if(i>10)
xlim([i-10 i]);
end

% Draw and flush
drawnow;

%Increment the counter
i=i+1;
end

% Give the external device some time…
pause(10);
return;
catch
stopasync(s);
fclose(s);
fprintf(1, 'Sorry, too much data accumulated.');
return
end
