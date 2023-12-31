# frozen_string_literal: true
# Represents a snake in the game.
class Snake
  SIZE = 20

  attr_reader :x, :y
  attr_accessor :length, :direction

  def initialize
    @x = 0
    @y = 0
    @tail = []
    @length = 1
    @direction = 'right'
  end

  def move
    @tail.unshift([@x, @y])
    @tail.pop if @tail.size == @length

    case @direction
    when 'right' then @x += SIZE
    when 'left' then @x -= SIZE
    when 'bottom' then @y += SIZE
    when 'top' then @y -= SIZE
    end
  end

  def eat?(food)
    @x == food.x && @y == food.y
  end

  def draw
    Gosu.draw_rect(@x, @y, SIZE, SIZE, Gosu::Color::WHITE)
    @tail.each do |tail|
      Gosu.draw_rect(tail.first, tail.last, SIZE, SIZE, Gosu::Color::WHITE)
    end
  end
end
