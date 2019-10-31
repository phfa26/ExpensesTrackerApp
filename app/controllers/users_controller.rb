class UsersController < ApplicationController

  before_action :check_if_logged_in, except: [:create, :new]

  def new
    @user = User.new
  end

  def create
    user = User.create user_params # strong params

    if user.persisted?
      # Account created successfully!
      session[:user_id] = user.id # Log in the new user!!
      Category.create(name:'Auto & Transport', user_id: user.id)
      Category.create(name:'Entertainment', user_id: user.id)
      Category.create(name:'Education', user_id: user.id)
      Category.create(name:'Personal Care', user_id: user.id)
      Category.create(name:'Helth & Fitness', user_id: user.id)
      Category.create(name:'Food & Dining', user_id: user.id)
      Category.create(name:'Bills', user_id: user.id)
      Category.create(name:'Groceries', user_id: user.id)
      Category.create(name:'Rent', user_id: user.id)
      Category.create(name:'Miscellaneous', user_id: user.id)
      Category.create(name:'Others', user_id: user.id)
      redirect_to user_path # go to the show page for this user
   
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_path
    end

  end

  def show
    @user = User.find_by id: @current_user.id
    @expenses = @user.expenses.order(:when).reverse_order.limit(5)
    @show_size = @expenses.size.to_s
    @show_total_size = @user.expenses.size.to_s
    @expense = Expense.new

    @used_categories = Category.where(:user_id => @current_user.id )

    puts '+=+=+=+=+=+=+=+=+=+=+=+='
    @used_categories.each do |category|
      expenses = Expense.where(:user_id => @current_user.id ).where(:category_id => category.id )
      @acc = 0
      expenses.each do |value|
        @acc += value.value.to_i
      end
      puts '-----'
      puts @acc 
      puts '-----'
    end
    puts '+=+=+=+=+=+=+=+=+=+=+=+='

    @used_categories.each do |entry|

    end
  end

  def edit
    @user = User.find_by id: @current_user.id
  end

  def update
    @user = User.find params[:id]
    @user.save

    if @user.update(user_params)
      redirect_to( user_path( @user.id ) )
    else
      flash[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
  end

  private
  # strong params, the doorman for the form fields
  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation)
  end
end
