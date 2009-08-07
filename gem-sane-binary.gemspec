SPEC = Gem::Specification.new do |s|
  s.name          = "gem-sane-binary"
  s.version       = "0.1.1"
  s.date          = "2009-08-07"
  s.author        = "Loren Segal"
  s.email         = "lsegal@soen.ca"
  s.homepage      = "http://gnuu.org"
  s.platform      = Gem::Platform::RUBY
  s.summary       = "RubyGems plugin to allow gem install to generate executables that work for both Ruby 1.8 and 1.9" 
  s.files         = Dir.glob("{lib}/**/*") + ['README.md', 'Rakefile']
  s.require_paths = ['lib']
  s.executables   = []
  s.has_rdoc      = false
  s.rubyforge_project = 'gem-sane-binary'
end