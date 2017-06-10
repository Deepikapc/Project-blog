class Article < ActiveRecord::Base
	validate :publish_date_cant_less_than_today_date
	belongs_to :category
	has_many :comments
	has_many :cart_line_items

	def publish_date_cant_less_than_today_date
        if !self.publish_date.nil?
        	if self.publish_date < Date.today
        		self.errors.add(:publish_date,"Date cant be less than todays date")
        	end

        end
	end

end
