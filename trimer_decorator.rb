require_relative './base_decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    name = @nameable.correct_name.capitalize
    name.length > 10 ? name[0..9] : name
  end
end