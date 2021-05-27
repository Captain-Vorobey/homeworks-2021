# frozen_string_literal: true

module Repository
  @all_homeworks = []

  def self.show_all_hw
    @all_homeworks
  end

  def self.add_into_all_hw(homework)
    @all_homeworks << homework
  end
end
