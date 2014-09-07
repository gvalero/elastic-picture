class CommentsController < ApplicationController
  # GET /picture/:id/comments
  # GET /picture/:id/comments.json
  before_filter :load_picture

  def load_picture
    @picture = Picture.get(params[:picture_id])
    if(!@picture)
      redirect_to '/'
end
  end

  def index
    @comments = @picture.comments

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
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
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end
end
