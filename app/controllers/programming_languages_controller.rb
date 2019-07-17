class ProgrammingLanguagesController < ApplicationController

  def index
    @programming_language = ProgrammingLang.new(programming_language_params[:language])
    # @programming_language.name = programming_language_params[:language]

    case programming_language_params[:my_type]

    # doing search with type. It can be: 1 - Name, Type - 2, Designed by - 3
      when "1"
           @result = @programming_language.search_by_name
      when "2"
          @result = @programming_language.search_by_type
      when "3"
          @result = @programming_language.search_by_designed
      else
          @result
      end
    end

    # check if present
    if (@result.present? && @result.is_a?)
      respond_to do |format|
          format.html { render "index", locals:{result: @result}, status: :ok }
    end
  end

  private
  def programming_language_params
    params.permit(:language, :my_type)
  end
end
