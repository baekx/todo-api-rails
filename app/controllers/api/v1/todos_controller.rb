module Api
	module V1
		class TodosController < ApplicationController
			def index
				todos = Todo.all
				render status: 200, json: { todos: todos }
			end

			def new
				todo = Todo.new
			end

			def create
				todo = Todo.new(todo_params)
				if todo.save
					render status: 200, json: { todo: todo }
				else
					render status: 400, json: { data: todo.errors }
				end
			end

			def show
				todo = Todo.find(params[:id])
				if todo.present?
					render status: 200, json: { todo: todo }
				else
					render status: 400, json: { data: todo.errors }
				end
			end

			def edit
				todo = Todo.find(params[:id])
			end

			def update
				todo = Todo.find(params[:id])
				if todo.update(todo_params)
					render status: 200, json: { todo: todo }
				else
					render status: 400, json: { data: todo.errors }
				end
			end

			private
			def todo_params
				params.permit(:title, :user_id, :description)
			end
		end
	end
end
