class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	 end

	def new
		@article = Article.new	
	end

	def create
     @article = Article.new(article_params)
     @publish_date = Article.where('publish_date < ?',Date.today).pluck(:publish_date)
	   if @article.save
	   	redirect_to articles_path
	   else
	   	render new_article_path,notice: "Previous Dates Are #{@publish_date}"
	   end
	end

	def show
		@comment = Comment.new
		@cart_line_item = CartLineItem.new
		begin
	  @article = Article.find(params[:id])
   	  @category = Category.find(@article.category_id).name
	  #puts "catrgory name=====>#{@category.inspect}"
	  rescue ActiveRecord::RecordNotFound
		redirect_to articles_path,notice: "Record Not Found"
	  end
   end
	
	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(article_params)
			redirect_to articles_path, notice:"#{@article}updated successfully"
		else
			render action: "edit"
		end
	end
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	private
	def article_params
		params[:article].permit(:title,:body,:category_id,:publish_date)
	end
end
