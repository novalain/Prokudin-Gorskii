# Prokudin-Gorskii
Colorization of the [Prokudin-Gorskii](http://www.loc.gov/pictures/collection/prok/) collection with automatic cropping and whitebalancing. The program has support for SSD (Sum of squared differences and NCC (Normalized cross correlation) and uses Image Pyramids to speed up the calculation process on big images.

To toggle between NCC and SSD, simply change the fourth parameter on the `pyramidAlign` function.

```matlab
% Get the displacement for each channel
% Fourth parameter 'ssd' or 'ncc' only
dispR = pyramidAlign(cG, cR, level, 'ssd');
dispB = pyramidAlign(cG, cB, level, 'ssd');
```

![GitHub Logo](/images/out/ft2.png)

Made in course TNM087 (Image Processing and Analysis) at Linköping University. 
[Here](https://github.com/novalain/Prokudin-Gorskii/blob/master/images/report/micno751_report_lab4_tnm087.pdf?raw=true) is a detailed report of the project.
