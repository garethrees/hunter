# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "hunter/version"

Gem::Specification.new do |s|
  s.name        = "hunter"
  s.version     = Hunter::VERSION
  s.authors     = ["Gareth Rees"]
  s.email       = ["gareth.h.rees@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Hunter hunts for a pattern in your log files}
  s.description = %q{Hunter was made to look through log archive directories and inside each log count the number of hits on an email tracking gif}

  s.rubyforge_project = "hunter"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
