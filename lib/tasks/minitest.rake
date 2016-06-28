WARN = false

Rake::TestTask.new do |t|
  t.name = "spec"
  t.libs << "test"
  t.pattern = "test/**/*_spec.rb"
  t.verbose = true
  t.warning = WARN
end

Rake::TestTask.new do |t|
  t.name = "spec:controllers"
  t.libs << "test"
  t.pattern = "test/controllers/*_spec.rb"
  t.verbose = true
  t.warning = WARN
end
