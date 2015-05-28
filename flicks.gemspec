Gem::Specification.new do |s|
  s.name        = "flicks"
  s.version     = "1.0.0"
  s.author      = "Carter De Angelis"
  s.email       = "carterdea123+pragstudio@gmail.com"
  s.summary     = "Plays and reviews movies"
  s.description   = File.reaf(File.join(File.dirname(__FILE__), 'README'))
  s.homepage    = "http://www.carterdea.com"

  s.files       = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.text_files  = DIR["spec/**/*"]
  s.executables = ['flicks']

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec'
end