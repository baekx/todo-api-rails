module Api
	module V1
		class TodosController < ApplicationController
			before_action :set_todo, only: [:show, :edit, :update, :destroy]
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
				if @todo.present?
					render status: 200, json: { todo: @todo }
				else
					render status: 400, json: { data: @todo.errors }
				end
			end

			def edit
			end

			def update
				if @todo.update(todo_params)
					render status: 200, json: { todo: @todo }
				else
					render status: 400, json: { data: @todo.errors }
				end
			end

			def destroy
				if @todo.present?
					@todo.destroy
					render status: 200, json: { message: '削除しました' }
				else
					render status: 400, json: { data: @todo.errors }
				end
			end

			private
			def todo_params
				params.permit(:title, :user_id, :description)
			end

			def set_todo
				@todo = Todo.find(params[:id])
			end
		end
	end
end
