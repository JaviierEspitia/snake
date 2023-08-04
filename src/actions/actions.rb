module Actions
  def self.move_snake(state)
    next_direction = state.next_direction
    next_position = calc_next_position(state)
    # verificar que la siguiente casilla sea valida
    if position_is_valid?(state, next_position)
      move_snake_to(state, next_position)
    else
      end_game(state)
    end
    # si no es valida terminamos el juego
    # si es valida movemos la serpiente

  end

  private

  def calc_next_position(state)
    curr_position = state.snake.positions.first
    case state.next_direction
    when UP
      # decrementar fila
      return Model::Coord.new(
          curr_position.row - 1,
          curr_position.col)
    when RIGHT
      # incrementar col
      return Model::Coord.new(
          curr_position.row,
          curr_position.col + 1)
    when DOWN
      # incrementar fila
      return Model::Coord.new(
          curr_position.row + 1,
          curr_position.col)
    when LEFT
      # decrementar col
      return Model::Coord.new(
          curr_position.row,
          curr_position.col - 1)
    end
  end



  def position_is_valid?(state, position)
    # verify snake in grid

    is_invalid = ((position.row >= state.grid.rows || position.row < 0) || (position.col >= state.grid.cols || position.col < 0))
    return false if is_invalid
    # verify that snake is not take self
    return !(state.snake.positions.include? position)
  end

  def move_snake_to(state, next_position)
    # first position is the snake head
    new_positions = [next_position] + state.snake.positions[0...-1] # with three points exclude the end position
    state.snake.positions = new_positions
    return state
  end

  def end_game(state)
    state.game_finished = true
    return state
  end

  # def calc_next_position(state)
  #   curr_position = state.snake.positions.first
  #   movements = {
  #     UP: coord_position(curr_position.row - 1, curr_position.col),
  #     RIGHT: coord_position(curr_position.row, curr_position.col + 1),
  #     DOWN: coord_position(curr_position.row + 1, curr_position.col),
  #     LEFT: coord_position(curr_position.row, curr_position.col - 1)
  #   }
  #   puts movements[state.next_direction]
  # end

end
