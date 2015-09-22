MRuby::Gem::Specification.new('sample') do |spec|
  spec.license = 'MIT'
  spec.author  = 'TODO: Put your name here'
  spec.summary = %q{TODO: Write a short summary of your gem.}
  spec.version = '0.1.0'

  # Add your runtime dependencies here
  # spec.add_dependency('mruby-math', :core => 'mruby-math')


  # Add your test dependencies here
  if build.test_enabled?
    spec.add_dependency('mruby-spec', :github => 'sagmor/mruby-spec')
  end
end
