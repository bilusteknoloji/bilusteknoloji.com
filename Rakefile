task :default => [:run_server]

desc "run server"
task :run_server do
  system %{
    bin/middleman server
  }
end


desc "build site"
task :build do
  system %{
    bin/middleman build --clean --verbose
  }
end
