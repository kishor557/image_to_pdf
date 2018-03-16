require "image_to_pdf/version"
require 'rmagick'
require 'open-uri'
require 'uri'

## Converts image to pdf
module ImageToPdf

  # working in progress: accepts image urls and converts into pdf
  def self.is_url?(str)
    begin
      res = open(str).status
      true if res[0] == "200"
    rescue => e
      false
    end   
  end
  
  def self.to_pdf(path, filename, filep=".")
    img = Magick::ImageList.new(path)

    img = Magick::ImageList.new(path)
    if %w(GIF PNG JPEG SVG).include? img.format
      img.write(filep + "/" + filename + ".pdf")
      STDOUT.puts "\033[107;31m Your file saved in #{path}\033[0m"
    else
#      raise StandardError, "Please enter valid PDF file path!"
       STDOUT.puts "Error: Please enter valid PDF file path!"
    end
  end
  
  def self.convert(path)
    if is_url?(path)
      filename = path.split("/").last
      filename = "sample" if filename.empty?
      downloaded_file = URI.parse("#{path}").open

      File.open(filename, 'wb') { |f| f.write(downloaded_file.read) }   
      f = File.open(filename, "r")
      name = File.basename(f,File.extname(f))
      to_pdf(f.path, name)
      File.delete(f)
    else
      extn = File.extname path
      filep = File.dirname(path)
      filename = File.basename path, extn
      to_pdf(path, filename, filep)
    end

  end

end
