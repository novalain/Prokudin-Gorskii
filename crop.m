function cropped = crop(img, percent)
	[width, height] = size(img);
	marginw = round(percent * width);
    marginh = round(percent * height);
    cropped = img(marginw:width-marginw, marginh:height-marginh);
end



