DiscourseAtomReceiver::Engine.routes.draw do
  get '/' => 'atom_file#index'
end
