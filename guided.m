% script to test guided filter
% calling filtered = guilded_filter(input, guide, epsilon, win_size)
function val= guided(original1)

original = double(original1);
original = original / 255;

sd = sqrt(.01);
win_size = 1;

input=original;
guide = histeq(input);

filtered = guided_filter(input, guide, .1, win_size);

val=filtered;
