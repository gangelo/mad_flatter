### 3.0.8 [2024-08-09]

Changes

- Update ruby gems.
- Update rexml gem to patch CVE.

### 3.0.7 [2024-02-18]

Changes

- Update ruby gems.

### 3.0.6 [2024-01-18]

Changes

- Update ruby gems.

### 3.0.5 [2023-12-27]

Enhancements

- Add github actions for testing and rubocop
- Add ability to run rake tasks.

Changes

- Update ruby gems.

### 3.0.4 [2023-12-02]

Changes

- Update ruby gems.
- DRY up spec shared examples.

### 3.0.3 [2023-12-02]

Changes

- Update ruby gems.

### 3.0.2 [2023-11-01]

Changes

- Update ruby gems.

### 3.0.1 [2023-08-29]

Changes

- Update ruby gems.

### 3.0.0 [2023-08-17]

Breaking changes

- Minimum Ruby version now is 3.0.1

Changes

- Update ruby gems.

### 2.1.0

Changes

- Limit ruby version to Gem::Requirement.new(">= 2.3.1", "< 4.0").
- Update ruby gems.

### 2.0.0

Changes

- Add spec coverage.
- Update README.md.

Breaking changes

- Remove unused Module HashRetrievable.

Bug Fixes

- Fix bug that raised an error when :namespace option is not a Symbol due cut & paste error from validation routine that checked the :metadata option for validity.
- Fix bug when checking `MadFlatter::Service#options.namespace? an error was raised if option :namespace was not passed as an option since it is optional.

### 1.0.1-beta

Bug Fixes

- Fix bug requiring support codez in lib/mad_flatter.rb.

### 1.0.0-alpha

Initial release.
