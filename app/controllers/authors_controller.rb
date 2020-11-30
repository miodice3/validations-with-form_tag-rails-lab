class AuthorsController < ApplicationController
  def show #
    @author = Author.find(params[:id])
  end

  def new #
    @author = Author.new
  end

  # def create #Define the "valid path" for the create and update controller actions.
  #   @author = Author.create(author_params)

  #   redirect_to author_path(@author)
  # end
  
  def create #Define the "valid path" for the create and update controller actions.
    @author = Author.new(author_params)

    if @author.valid?
      @author.save
      redirect_to author_path(@author)
    else
      render :new
    end
  end

  def edit
  end

  private

  def author_params
    params.permit(:name, :email, :phone_number)
  end
end

# invalid submissions
#     renders an error list (FAILED - 2)
#     prefills fields (FAILED - 3)
#     has error class on bad fields (FAILED - 4)
