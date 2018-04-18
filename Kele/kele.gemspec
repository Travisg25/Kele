Gem::Specification.new do |s|
  s.name        = 'Kele'
  s.version     = '0.0.1'
  s.date        = '2018-04-17'
  s.summary     = "Kele API Client!"
  s.description = "A client for the Bloc API"
  s.authors     = ["Travis Grossman"]
  s.email       = 'hamhockg25@gmail.com'
  s.files       = ["lib/kele.rb", "lib/roadmap.rb"]
  s.homepage    =
    'http://rubygems.org/gems/kele'
  s.license       = 'MIT'
  s.add_runtime_dependency 'httparty', '~> 0.13'

end
