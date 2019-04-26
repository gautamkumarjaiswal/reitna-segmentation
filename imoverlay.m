function out = imoverlay(in, mask, color)
% If the user doesn't specify the color, use white.
DEFAULT_COLOR = [1 1 1];
if nargin < 3
    color = DEFAULT_COLOR;
end

% Force the 2nd input to be logical.
mask = (mask ~= 0);

% Make the uint8 the working data class.  The output is also uint8.
in_uint8 = im2uint8(in);
color_uint8 = im2uint8(color);

% Initialize the red, green, and blue output channels.
if ndims(in_uint8) == 2
    % Input is grayscale.  Initialize all output channels the same.
    out_red   = in_uint8;
    out_green = in_uint8;
    out_blue  = in_uint8;
else
    % Input is RGB truecolor.
    out_red   = in_uint8(:,:,1);
    out_green = in_uint8(:,:,2);
    out_blue  = in_uint8(:,:,3);
end

% Replace output channel values in the mask locations with the appropriate
% color value.
out_red(mask)   = color_uint8(1);
out_green(mask) = color_uint8(2);
out_blue(mask)  = color_uint8(3);

% Form an RGB truecolor image by concatenating the channel matrices along
% the third dimension.
out = cat(3, out_red, out_green, out_blue);
