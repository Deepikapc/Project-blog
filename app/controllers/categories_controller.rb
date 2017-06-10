class CategoriesController < ApplicationController
	def index
		@categories = Category.all
		#puts "Category====>#{categories.inspect}"
	end
	def new
		@category = Category.new
    @comment = Comment.new
	end

	def create
		@category = Category.new(params[:category].permit(:name))
		#puts "new =======>#{@category}"
		if @category.save
			redirect_to categories_path,notice:"Successfully created Record #{@category.name}"
		else
			render action:new
		end
  end

  def show

     @category = Category.find(params[:id])
     @article = Article.where('category_id = ?',@category.id)
     if @article.empty?
      redirect_to categories_path ,notice:"Record not found"
    end
  end

  def edit
  	@category = Category.find(params[:id])
  end

  def update
  	@category = Category.find(params[:id])
    if @category.update_attributes(params[:category].permit(:name))
    	redirect_to categories_path(@category.id) , notice:"Successfully updated Record"
    else
    	render action: "edit" 
    end   
  end
  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_path
  end
  
end
