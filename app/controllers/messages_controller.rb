class MessagesController < ApplicationController

	def index
		@group = Group.find(params[:group_id])
		@members = @group.users
	end

	def create
	end
end
