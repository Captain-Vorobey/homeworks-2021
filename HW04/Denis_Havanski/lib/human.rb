# frozen_string_literal: true

class Human
  attr_reader :name, :surname

  def initialize(name: :name, surname: :surname)
    @name = name
    @surname = surname
  end
end
