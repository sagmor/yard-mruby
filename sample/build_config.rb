MRuby::Build.new do |conf|
  toolchain :gcc
  enable_debug

  conf.gem '.'

  conf.enable_test
end

