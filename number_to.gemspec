spec = Gem::Specification.new do |s| 
  s.name = 'number_to'
  s.version = '0.0.1'
  s.author = 'Dan Corrigan'
  s.email = 'dcorrigan@scribenet.com'
  s.homepage = 'http://www.scribenet.com'
  s.platform = Gem::Platform::RUBY
  s.summary = 'Convenience methods for converting fixnums to various string equivalents.'
  s.require_paths << 'lib'
  s.files = Dir.glob("{lib}/**/*")
  s.add_development_dependency('rake')
  s.add_development_dependency('rspec')
  s.add_development_dependency('pry')
  s.add_development_dependency('minitest', '> 5.0.0')
end
