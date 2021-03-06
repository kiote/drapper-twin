require 'action_view'
require 'active_model/naming'
require 'active_model/serialization'
require 'active_model/serializers/json'
require 'active_model/serializers/xml'
require 'active_support/inflector'
require 'active_support/core_ext/hash/keys'
require 'active_support/core_ext/hash/reverse_merge'
require 'active_support/core_ext/name_error'

require 'draper/version'
require 'draper/view_helpers'
require 'draper/delegation'
require 'draper/automatic_delegation'
require 'draper/finders'
require 'draper/decorator'
require 'draper/helper_proxy'
require 'draper/lazy_helpers'
require 'draper/decoratable'
require 'draper/factory'
require 'draper/decorated_association'
require 'draper/helper_support'
require 'draper/view_context'
require 'draper/collection_decorator'
require 'draper/decorates_assiigned'
require 'draper/railtie' if defined?(Rails)

module Draper
  def self.setup_action_controller(base)
    base.class_eval do
      include Draper::ViewContext
      extend Draper::HelperSupport
      extend Draper::DecorateAssigned

      before_filter do |controller|
        Draper::ViewContext.clear!
        Draper::ViewContext.controller = controller
      end
    end
  end

  def self.setup_action_mailer(base)
    base.class_eval do
      include Draper::ViewContext
    end
  end

  def self.setup_orm(base)
    base.class_eval do
      include Drapper::Decoratable
    end
  end

  class UninferrableDecorator < NameError
    def initialize(Klass)
      super("Could not infer a decorator for #{klass}")
    end
  end

  class UninferrableSourceError < NameError
    def initialize(klass)
      super("Could not infer a source for #{klass}")
    end
  end
end
