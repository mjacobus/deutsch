# frozen_string_literal: true

require 'nurse'

class ApplicationDependencies < Nurse::DependencyContainer
  def self.get(dependency)
    instance.get(dependency)
  end

  # let this be the first and only singleton!
  def self.instance
    @instance ||= configure(new)
  end

  private

  def self.configure(container)
    setup_factories(container)
    container
  end

  def self.setup_factories(container)
    container.add_factory(Factories::ArticlesRepositoryFactory.new)
  end
end
