class TodoController < ApplicationController

	def index
		@todos = Todo.where(completed: false)
		@completes = Todo.where(completed: true)
	end

	def new
		@todo = Todo.new
	end

	def todo_params
		params.require(:todo).permit(:name, :completed)
	end


	def create
		@todo = Todo.new(todo_params)
		if @todo.save
			redirect_to todo_index_path, :notice => "Your To Do item was created!"
		else
			render "new"
		end
	end

	def complete
		@todo = Todo.find(params[:id])
		if @todo.update_column(:completed, true)
			redirect_to todo_index_path, :notice => "Your To Do item was marked as done!"
		else
			redirect_to todo_index_path, :notice => "Your To Do item was unable to be marked as done!"
		end
	end

	def show
		@todo = Todo.find(params[:id])
		render "show"
	end

	def edit
		@todo = Todo.find(params[:id])
		render "edit"
	end

	def update
		@todo = Todo.find(params[:id])
		if @todo.update(todo_params)
			redirect_to todo_index_path, :notice => "Your To Do item was updated!"
		else
			render :edit, :notice => "Your To Do item was not updated!"
		end
	end


	def destroy
		@todo = Todo.find(params[:id])
		@todo.destroy

		redirect_to todo_index_path, :notice => "Your To Do item was destroyed!"
	end



end
