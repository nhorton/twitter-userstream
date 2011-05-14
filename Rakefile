begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "twitter-userstream"
    s.description = s.summary = "Eventmachine-based Twitter Userstream client"
    s.email = "noah@involver.com"
    s.homepage = "https://github.com/nhorton/twitter-userstream"
    s.authors = ["Joshua Hull", "Fabien Penso", "Noah Horton"]
    s.files = FileList["[A-Z]*", "{lib}/**/*", "{bin}/**/*", "{image}/**/*"]
    s.add_dependency 'eventmachine', ">= 0.12.10"
    s.add_dependency 'em-http-request', ">= 0.2.7"
    s.add_dependency 'yajl-ruby', ">= 0.7.5"
    s.add_dependency 'load_path_find', ">= 0.0.5"
    s.add_dependency 'oauth', ">= 0.4.0"
    s.executables = ['chirp_growl']
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
