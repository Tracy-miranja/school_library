class person
    def initialize(name="Unknown", age, parent_permission=true)
        @id = id
        @name = name
        @age = age
        @parent_permission = parent_permission
    end

    def id
        @id
    end
    def name
        @name
    end

    def age
        @age
    end

    def name=(value)
        @name=value
    end

    def age=(value)
        @age = value
    end

    def of_age?
        @age >= 18
      end
        
      def can_use_services?
        of_age? || @parent_permission
      end
end
