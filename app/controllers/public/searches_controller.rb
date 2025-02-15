class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

	def search
		@model = params[:model]&.downcase 
		@content = params[:content]
		@method = params[:method]
		if @model == 'user'
			@records = User.search_for(@content, @method)
		elsif @model == 'subsc'
			@records = Subsc.search_for(@content, @method)
		else
      @records = []
		end
		render 'public/homes/top'
	end
end

