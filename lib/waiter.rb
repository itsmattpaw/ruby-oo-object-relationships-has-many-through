class Waiter
    attr_accessor :name, :experience
    @@all = []

    def initialize(name, exp)
        @name = name
        @experience = exp
        @@all << self
    end
    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end
    def meals
        Meal.all.select{|m| m.waiter == self}
    end
    def best_tipper
        best = meals.max do |a, b|
            a.tip <=> b.tip
        end
        best.customer
    end

end