module ::DiscourseAtomReceiver
  PLUGIN_NAME = "discourse-atom-receiver"

  class Engine < ::Rails::Engine
    engine_name DiscourseAtomReceiver::PLUGIN_NAME
    isolate_namespace DiscourseAtomReceiver
  end
end
