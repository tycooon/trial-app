# encoding: utf-8

class StatementsController < ApplicationController
  respond_to :json
  before_filter :find_statement, only: %w[show update destroy]

  def index
    respond_with Statement.for_date(params[:date])
  end

  def show
    respond_with @statement
  end

  def create
    respond_with Statement.create!(params[:statement])
  end

  def update
    respond_with @statement.update_attributes(params[:statement])
  end

  def destroy
    respond_with @statement.destroy
  end

  private

  def find_statement
    @statement = Statement.present.find(params[:id])
  end
end
