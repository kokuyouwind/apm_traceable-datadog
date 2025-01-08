# frozen_string_literal: true

require_relative 'lib/apm_traceable/datadog/version'

Gem::Specification.new do |spec|
  spec.name = 'apm_traceable-datadog'
  spec.version = ApmTraceable::Datadog::VERSION
  spec.authors = ['kokuyouwind']
  spec.email = ['kokuyouwind@gmail.com']

  spec.summary = 'APM Traceable gem Plugin for Datadog'
  spec.description = 'APM Traceable gem Plugin for Datadog'
  spec.homepage = 'https://github.com/kokuyouwind/apm_traceable-datadog'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/kokuyouwind/apm_traceable-datadog'
  spec.metadata['changelog_uri'] = 'https://github.com/kokuyouwind/apm_traceable-datadog'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '>= 7.0.0'
  spec.add_dependency 'apm_traceable', '>= 1.0.0'
  spec.add_dependency 'datadog', '>= 2.2.0'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
