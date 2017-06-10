class CartLineItem < ActiveRecord::Base
	validates_presence_of :article_id,:user_id,:quantity
	#validates_numericality_of :article_id,:user_id,:greater_than:0
	validates_numericality_of :quantity,within: 1..5

	belongs_to :article
	belongs_to :user

end
