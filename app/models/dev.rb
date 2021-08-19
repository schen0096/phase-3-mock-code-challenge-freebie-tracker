require 'pry'

class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def received_one?(item_name)
        if self.freebies.map {|freebie| freebie.item_name}.include? item_name
            return true
        else 
            return false
        end
    end

    def give_away(dev, freebie)
        freebie.update(dev_id: dev.id)
    end

end
