class ConversionsController < ApplicationController
  def create
    encoded_file = ConversionRepository.convert_file(
      old_file_type: params[:old_file_type],
      new_file_type: params[:new_file_type],
      encoded_file: params[:encoded_file]
    )
    conversion = Conversion.create!(
      old_file_type: params[:old_file_type],
      new_file_type: params[:new_file_type],
      encoded_file: encoded_file
    )

    render json: { }
    binding.pry
  end
end
