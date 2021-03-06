# program to convert images to ASCII art

require "mini_magick"

# load image file, rezize to fit screen, and assign pixel matrix
image = MiniMagick::Image.open("ascii-pineapple.jpg")
image.resize "300x300"
pixels = image.get_pixels

# ASCII characters from least bold - most bold
ASCII_CHARS = "`^\",:;Il!i~+_-?][}{1)(|\\/tfjrxnuvczXYUJCLQ0OZmwqpdbkhao*#MW&8%B@$"

# map ASCII characters to 'rgb' tuples
(0..(pixels.length - 1)).each do |i|
  (0..pixels[i].length - 1).each do |j|
    rgb = pixels[i][j]
    brightness = (rgb.inject(:+)) / 3
    index = (brightness.to_f / 255 * 65).round
    if index == 0
      print " " * 2
    else
      print ASCII_CHARS[index] * 2
    end
  end
  print "\n"
end
