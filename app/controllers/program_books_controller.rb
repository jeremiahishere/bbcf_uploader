class ProgramBooksController < ApplicationController
  def search

  end

  def show
    @program = Program.find_by_id(params[:program_id])
    @instrument = Instrument.find_by_id(params[:instrument_id])
    @parts = Part.instrument_in_program(@program, @instrument)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parts }
    end
  end
end
