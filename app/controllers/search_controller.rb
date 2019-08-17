class SearchController < ApplicationController
  def index
    # @reviews = Review.all
    # 検索オブジェクト
    @search = Review.ransack(params[:q])
    # 検索結果
    @search_result = @search.result
  end
end
