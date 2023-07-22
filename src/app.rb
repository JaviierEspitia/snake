require_relative 'view/ruby2d'
require_relative 'model/state'

initial_state = Model::initial_state

view = View::Ruby2dView.new

view.render(initial_state)