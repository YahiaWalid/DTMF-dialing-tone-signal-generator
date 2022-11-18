clc                 % Clearing Screen
clear all           % Clearing previous variables

s = 8192;   %suitable sampling frequency to give best sound
 
A = 0.15;   %amplitude of each tone
 
%high frequencies
h1 = 2*pi*1209/s;
h2 = 2*pi*1336/s;
h3 = 2*pi*1477/s;
 
%low frequencies
l1 = 2*pi*697/s;
l2 = 2*pi*770/s;
l3 = 2*pi*852/s;
l4 = 2*pi*941/s;
 
%generating 1000 sample rates
 
z=zeros(1,1000); %time between each tone and another
 
N=1000;
n = 0 : N-1;     %vector from 0 to 999
 
%representing each digit by the sum of two sinusoids
one   = A.*[ sin(n*l1) + sin(n*h1), z ];
two   = A.*[ sin(n*l1) + sin(n*h2), z ];
three = A.*[ sin(n*l1) + sin(n*h3), z ];
four  = A.*[ sin(n*l2) + sin(n*h1), z ];
five  = A.*[ sin(n*l2) + sin(n*h2), z ];
six   = A.*[ sin(n*l2) + sin(n*h3), z ];
seven = A.*[ sin(n*l3) + sin(n*h1), z ];
eight = A.*[ sin(n*l3) + sin(n*h2), z ];
nine  = A.*[ sin(n*l3) + sin(n*h3), z ];
zero  = A.*[ sin(n*l4) + sin(n*h2), z ];
 
 
 
%getting number from user
user_input = 'Enter the phone number.\n';       
x = input(user_input)
 
%breaking string of numbers into a vector....ex: "123" --> [ 1 2 3 ]
number = num2str(x)-'0';
 
%declatring the variable which will contain te final sound to be played
sound_vector = [];
 
%iterating over the vector of number to give each number its frequency
for i = 1:numel(number)                         
    
    %concatenating each number to the prev declared vector
    
    if number(i) == 1
    sound_vector = [sound_vector one];
    
    elseif number(i) == 2
    sound_vector = [sound_vector two];
    
    elseif number(i) == 3
    sound_vector = [sound_vector three];
    
    elseif number(i) == 4
    sound_vector = [sound_vector four];
    
    elseif number(i) == 5
    sound_vector = [sound_vector five];
    
    elseif number(i) == 6
    sound_vector = [sound_vector six];
    
    elseif number(i) == 7
    sound_vector = [sound_vector seven];
    
    elseif number(i) == 8
    sound_vector = [sound_vector eight];
    
    elseif number(i) == 9
    sound_vector = [sound_vector nine];
    
    elseif number(i) == 0
    sound_vector = [sound_vector zero];
    
    end 
end
 
%playing the sound
sound(sound_vector)
