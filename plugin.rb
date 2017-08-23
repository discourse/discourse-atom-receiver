# name: discourse-atom-receiver
# about: Receives pings when files have changed in the atom editor
# version: 0.1
# author: Robin Ward

load File.expand_path('../lib/discourse_atom_receiver/engine.rb', __FILE__)

Discourse::Application.routes.append do
  mount ::DiscourseAtomReceiver::Engine, at: '/atom-file-changed'
end
