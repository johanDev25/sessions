class PostsController < ApplicationController


	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end
    
	def create
		@post = Post.new(post_params)
		@Post.user = current_user
		if @Post.save
			redirect_to posts_path, notice: "El post fue publicado con exito"
		else
		    render :new
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		post = Post.find(params[:id])
		if Post.update(post_params)
		redirect_to posts_path, notice: "El post a sido modificado con exito"
	    else
        render :edit   
	    end
	end

	def destroy
		post = Post.find(params[:id])
		post.destroy

		redirect_to posts_path, notice: "El post fue eliminado con exito"
	end

	private
  
	def post_params
		params.require(:post).permit(:name, :body)
	end
end
