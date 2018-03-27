# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'image_to_pdf/version'

Gem::Specification.new do |spec|
  spec.name          = "image_to_pdf"
  spec.version       = ImageToPdf::VERSION
  spec.authors       = ["Venkat"]
  spec.email         = ["venkat@param-solutions.com"]

  spec.summary       = %q{Converts image to pdf}
  spec.description   = %q{image_to_pdf accepts jpeg/png/gif/svg path as input and converts into a pdf file}
  spec.homepage      = "https://github.com/kishor557/image_to_pdf"
  spec.license       = "MIT"

#  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
#  spec.bindir        = "exe"
#  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }

  spec.files       = Dir['lib/**/*.rb'] + Dir['bin/*'] +
                  ['README.md', 'LICENSE.txt', 'image_to_pdf.gemspec']
  spec.executables = ['image_to_pdf']

  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'rmagick', '~> 2.10', '>= 2.10.0'
end
