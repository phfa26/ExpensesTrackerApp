class ExpensesController < ApplicationController
  before_action :check_if_logged_in  
  def new
      @expense = Expense.new
      @categories = Category.where(:user_id => @current_user.id ).order('LOWER(name)').all
  end

  def index
    @user = User.find_by id: @current_user.id
    @expenses = @user.expenses.order(:when).reverse_order
  end
  
  def create
    form_params = params.require(:expense).permit(:name, :when, :value, :category_id)

    expense = Expense.new 
    expense.name = form_params[:name] 
    expense.when = form_params[:when]
    expense.value = form_params[:value]
    expense.category_id = form_params[:category_id]
    expense.user_id = @current_user.id
    expense.save

    if expense.persisted?
        flash[:error] = 'Expense successfully created! '
        # Expense added successfully!
        redirect_to user_path # go to the show page for this user 
      else
        flash[:errors] = expense.errors.full_messages
        redirect_to new_expense_path
      end
  end
      
  def update
    
    form_params = params.require(:expense).permit(:name, :when, :value, :category_id)

    expense = Expense.find(params[:id])
    expense.name = form_params[:name] 
    expense.when = form_params[:when]
    expense.value = form_params[:value]
    expense.category_id = form_params[:category_id]
    expense.user_id = @current_user.id
    expense.save
    if expense.save
      flash[:error] = 'Expense updated successfully! '
      # Expense updated successfully!
      redirect_to user_path # go to the show page for this user 
    else
      flash[:errors] = expense.errors.full_messages
      redirect_to "/expenses/#{expense.id.to_s}/edit"
    end
  end

  def edit
    @expense = Expense.find(params[:id])
    @categories = Category.where(:user_id => @current_user.id ).order('LOWER(name)').all
  end
  
  def destroy
    expense = Expense.find(params[:id])
      expense.destroy
    redirect_to '/user'
  end

end
  