class TromplersController < ApplicationController
  # GET /tromplers
  # GET /tromplers.json
  def index
    @tromplers = Trompler.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tromplers }
    end
  end

  # GET /tromplers/1
  # GET /tromplers/1.json
  def show
    @trompler = Trompler.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trompler }
    end
  end

  # GET /tromplers/new
  # GET /tromplers/new.json
  def new
    @trompler = Trompler.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trompler }
    end
  end

  # GET /tromplers/1/edit
  def edit
    @trompler = Trompler.find(params[:id])
  end

  # POST /tromplers
  # POST /tromplers.json
  def create
    @trompler = Trompler.new(params[:trompler])

    respond_to do |format|
      if @trompler.save
        format.html { redirect_to @trompler, notice: 'Trompler was successfully created.' }
        format.json { render json: @trompler, status: :created, location: @trompler }
      else
        format.html { render action: "new" }
        format.json { render json: @trompler.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tromplers/1
  # PUT /tromplers/1.json
  def update
    @trompler = Trompler.find(params[:id])

    respond_to do |format|
      if @trompler.update_attributes(params[:trompler])
        format.html { redirect_to @trompler, notice: 'Trompler was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trompler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tromplers/1
  # DELETE /tromplers/1.json
  def destroy
    @trompler = Trompler.find(params[:id])
    @trompler.destroy

    respond_to do |format|
      format.html { redirect_to tromplers_url }
      format.json { head :no_content }
    end
  end
end
