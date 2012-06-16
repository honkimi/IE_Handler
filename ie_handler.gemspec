# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ie_handler"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["kiminari.homma"]
  s.date = "2012-06-16"
  s.description = "IE Handler enable you to handle IE using Ruby.\nIt has simple syntax and strong methods.\nCurrently we support only IE, but we plan to extend other MS products in the\nfuture."
  s.email = ["u533u778@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "lib/ie_handler.rb", "script/console", "script/destroy", "script/generate", "test/test_helper.rb", "test/test_ie_handler.rb", ".gemtest"]
  s.homepage = "https://github.com/honkimi/IE_Handler"
  s.post_install_message = "PostInstall.txt"
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "ie_handler"
  s.rubygems_version = "1.8.10"
  s.summary = "IE Handler enable you to handle IE using Ruby"
  s.test_files = ["test/test_ie_handler.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_development_dependency(%q<newgem>, [">= 1.5.3"])
      s.add_development_dependency(%q<hoe>, ["~> 3.0"])
    else
      s.add_dependency(%q<rdoc>, ["~> 3.10"])
      s.add_dependency(%q<newgem>, [">= 1.5.3"])
      s.add_dependency(%q<hoe>, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<rdoc>, ["~> 3.10"])
    s.add_dependency(%q<newgem>, [">= 1.5.3"])
    s.add_dependency(%q<hoe>, ["~> 3.0"])
  end
end
