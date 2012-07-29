load "lib/ermahgerd/version.rb"

spec = Gem::Specification.new do |s|
  s.name = 'ermahgerd'
  s.version = Ermahgerd::VERSION

  s.summary = %{
    Translate English into Ermahgerd-lish. ERMAHGERD, I LERV RERBER!
  }.strip

  s.description = %{
    A Ruby ERMAHGERD translator, based on http://ermahgerd.jmillerdesign.com/.
  }.strip

  s.files = Dir['lib/**/*.rb'] + Dir['test/**/*.rb'] + %w[
    README.md
    Rakefile
    ermahgerd.gemspec
  ]

  s.require_path = 'lib'
  s.required_ruby_version = ">= 1.9.2"

  s.author = "Dan Bernier"
  s.email = "danbernier@gmail.com"
  s.homepage = "https://github.com/danbernier/ermahgerd"
end
