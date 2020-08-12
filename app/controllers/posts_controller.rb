class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :nav_tags
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    if current_user
      @comment = Comment.new
      @user = User.find(current_user.id)
      @posts = @user.posts
    else 
      redirect_to new_user_session_path
    end
  end

  def favourite
  # find post from id
    @post = Post.find(params[:id])
    @current_user_found= User.find(current_user.id)
    
    if @current_user_found.favourite_words.include?(@post.id.to_s)
     #if user has already favourited prompt error
      redirect_to post_path(@post), alert: "Already favourited this word"
    else
      
      @current_user_found.favourite_words << @post.id
      if @current_user_found.save

        redirect_to post_path(@post), notice: "You favourited this word"
      else
          redirect_to post_path(@post), notice: "Try again"
      end
    end

    
    # if @current_user_found.favourite_words.include?(@post.id.to_s)
    #  #if user has already favourited prompt error
    #   redirect_to post_path(@post.id), alert: "Already favourited this word"
    # else
      
    #   @current_user_found.favourite_words << @post.id
    #   if @current_user_found.save

    #     redirect_to post_path(@post.id), notice: "You favourited this word"
    #   else
    #       redirect_to post_path(@post.id), notice: "Try again"
    #   end
    # end
  end

  def word_of_day
    @post = Post.where(word_of_day: true)
  end

  # search function; turns table col to downcase, matches query.downcase
  def search
    @posts = Post.order("lower(word) ASC").where(
      Post.arel_table[:word]
      .lower
      .matches("%#{params[:query].downcase}%")
    )
  end

  # GET /posts/new
  def new
    @post = Post.new
  end


  def follow
    # find user from id
    @user = User.find(params[:id])

    @current_user_found= User.find(current_user.id)
    
    if @current_user_found.following.include?(@user.id.to_s)
     #if user is already following prompt error
      redirect_to show_profile_path(@user.id), alert: "Already Following this user"
    else
      
      @current_user_found.following << @user.id
      if @current_user_found.save

        redirect_to show_profile_path(@user.id), notice: "Now following user"
      else
          redirect_to show_profile_path(@user.id), notice: "couldnot follow user"
      end
    end
  end
  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    @post['user_id'] = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    @post['user_id'] = current_user.id
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:word, :description, :example, :pronunciation, :meaning, tag_ids: [])
    end

    def nav_tags
      @tags = Tag.all
    end
end
