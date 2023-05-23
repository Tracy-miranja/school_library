require './namable_class.rb'

class BaseDecorator <Nameable
    def initialize(nameable)
        @nameable = nameable
        super()
    end
    
    def correct_name
        @nameable.correct_name
    end
end

class CapitalizeDecorator <BaseDecorator
    def correct_name
        @nameable.correct_name.capitalize
    end
end

class TrimmerDecorator <BaseDecorator
    def correct_name
        name = @nameable.correct_name.capitalize
        name.length > 10 ? name[0..9] : name
    end
end 

