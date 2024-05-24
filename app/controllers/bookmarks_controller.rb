# class BookmarksController < ApplicationController
#   before_action :set_bookmark, only: %i[ show edit update destroy ]

#   def index
#     @bookmarks = Bookmark.all
#   end

#   def show
#   end

#   def new
#     @bookmark = Bookmark.new
#   end

#   def edit
#   end

#   def create
#     @bookmark = Bookmark.new(bookmark_params)
#     if @bookmark.save
#       redirect_to bookmarks_path
#     else
#       render :new, status: :unprocessable_entity
#     end
#   end

#   def update
#     if @bookmark.update(bookmark_params)
#       redirect_to bookmark_path(@bookmark)
#     else
#       render :edit, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     @bookmark.destroy!
#     redirect_to bookmarks_url, notice: "Destroyed !"
#   end

#   private
#     def set_bookmark
#       @bookmark = Bookmark.find(params[:id])
#     end

#     def bookmark_params
#       params.require(:bookmark).permit(:comment, :movie_id, :list_id)
#     end
# end

class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark created !'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: 'Bookmark deleted !'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id)
  end
end
