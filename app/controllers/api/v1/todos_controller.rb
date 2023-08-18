module Api
    module V1
        class TodosController < ApplicationController
            def index
                todos = Todo.all
                render status: 200, json: { todos: todos }
            end
        end
    end
end
