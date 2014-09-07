class CommentsController < ApplicationController
  before_filter :load_picture

  # load the picture for all the methods.
  def load_picture
    @picture = Picture.get(params[:picture_id])
    if(!@picture)
      redirect_to '/'
    end
  end

  # GET /picture/:id/comments
  # GET /picture/:id/comments.json
  def index
    @comments = @picture.comments

    respond_to do |format|
      format.html {  render :layout => !request.xhr? }
    end
  end

  # GET /picture/:id/comments/new
  # GET /picture/:id/comments/new.json
  def new
    @comment = @picture.comments.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # POST /picture/:id/comments
  # POST /picture/:id/comments.json
  def create
    @picture = Picture.get(params[:picture_id])
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        format.html { redirect_to picture_url(@picture), notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created}
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
end
