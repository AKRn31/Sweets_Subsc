class Public::SearchesController < ApplicationController
  before_action :authenticate_user!

	def search
    puts "🔍 デバッグ: search アクションが実行されました"  # ← 追加
    puts "🔍 受け取った params: #{params.inspect}"  # ← 追加
		@model = params[:model]&.downcase 
		@content = params[:content].to_s.strip
		@method = params[:method].to_s
		puts "🔍 @model = #{@model}, @content = #{@content}, @method = #{@method}"  # ← 追加
		if @model == 'user'
			@records = User.search_for(@content, @method)
		elsif @model == 'subsc'
			@records = Subsc.search_for(@content, @method)
		else
      @records = []
		end
		puts "🔍 @records の中身: #{@records.inspect}"  # ← 追加
	end
end

