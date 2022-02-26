class QueriesController < ApplicationController
  def create
    facts = ChuckFactsService.call(params[:type], params[:query])
    @query = Query.new(facts: facts)
    @query.input = params[:type] == "random" ? nil : params[:query]
    @query.send("#{params[:type]}!")

    respond_to do |format|
      if @query.save
        format.html { redirect_to root_path }
        format.json
      else
        format.html { render :show }
        format.json
      end
    end
  end
end
