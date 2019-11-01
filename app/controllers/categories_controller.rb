class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :check_if_logged_in  

  def index
    
    @categories = Category.where(:user_id => @current_user.id ).order(:name)

  end

  def show
    redirect_to '/user'
  end

  def new
    @category = Category.new
  end

  def edit
    @categorie = Category.find(params[:id])
  end

  def create
    form_params = params.require(:category).permit(:name)

    @category = Category.new
    @category.name = form_params[:name]
    @category.user_id = @current_user.id  
    @category.save

      if @category.save
        flash[:error]=['Category successfully created! ']
        redirect_to '/categories'
      else
        flash[:error]=@category.errors.full_messages
        redirect_to '/categories/new'
      end
  end

  def update
   
    form_params = params.require(:category).permit(:name)

    category = Category.find(params[:id])
    category.name = form_params[:name] 
    category.save
    if category.save
      flash[:error] = ['Category successfully updated!']
      # Category updated successfully!
      redirect_to "/categories" # go to the show page for this user 
    else
      flash[:error] = category.errors.full_messages
      puts flash[:error]
      redirect_to "/categories/#{category.id.to_s}/edit"
    end
  end

  def destroy
    used = Expense.find_by category_id: @category.id

    if used.nil?
      @category.destroy
      redirect_to "/categories"
    else
      flash[:error] = 'Used categories cannot be deleted, please edit/delete related expenses first.'
      redirect_to "/categories/#{@category.id.to_s}/edit"
    end
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.fetch(:category, {})
    end
end
