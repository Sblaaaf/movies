# class ListsController < ApplicationController
#   before_action :set_list, only: %i[ show edit update destroy ]

#   def index
#     @lists = List.all
#   end

#   def show
#   end

#   def new
#     @list = List.new
#   end

#   def edit
#   end

#   def create
#     @list = List.new(list_params)
#     if @list.save
#       redirect_to list_url(@list), notice: "Created ! Well done"
#     else
#       render :new, status: :unprocessable_entity
#     end
#   end

#   def update
#     if @list.update(list_params)
#       redirect_to list_url(@list), notice: "Updated !"
#     else
#       render :edit, status: :unprocessable_entity
#     end
#   end


#   def destroy
#     @list.destroy!
#     redirect_to lists_url, notice: "Destroyed !"
#   end

#   private

#   def set_list
#     @list = List.find(params[:id])
#   end

#   def list_params
#     params.require(:list).permit(:name)
#   end
# end


class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to @list, notice: 'List was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
