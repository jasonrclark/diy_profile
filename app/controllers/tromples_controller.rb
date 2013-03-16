class TromplesController < ApplicationController

  # Purposefully heavy action for generating interesting load
  def tromp
    start = Time.now
    fib(30)
    fib_duration = Time.now - start

    start = Time.now
    n_plus_one_much?
    database_duration = Time.now - start

    # Record our tromp and get out...
    Tromple.create!({
      :name => "TROMP TROMP TROMP #{fib_duration}, #{database_duration}",
      :intensity => 11})

    redirect_to :action => :index
  end

  def fib(n)
    return n if (0..1).include? n
    fib(n-1) + fib(n-2) if n > 1
  end

  def n_plus_one_much?
    Trompler.all.each do |t|
      Trompler.find(t.id)
    end
  end

  # GET /tromples
  # GET /tromples.json
  def index
    @tromples = Tromple.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tromples }
    end
  end

  # GET /tromples/1
  # GET /tromples/1.json
  def show
    @tromple = Tromple.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tromple }
    end
  end

  # GET /tromples/new
  # GET /tromples/new.json
  def new
    @tromple = Tromple.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tromple }
    end
  end

  # GET /tromples/1/edit
  def edit
    @tromple = Tromple.find(params[:id])
  end

  # POST /tromples
  # POST /tromples.json
  def create
    @tromple = Tromple.new(params[:tromple])

    respond_to do |format|
      if @tromple.save
        format.html { redirect_to @tromple, notice: 'Tromple was successfully created.' }
        format.json { render json: @tromple, status: :created, location: @tromple }
      else
        format.html { render action: "new" }
        format.json { render json: @tromple.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tromples/1
  # PUT /tromples/1.json
  def update
    @tromple = Tromple.find(params[:id])

    respond_to do |format|
      if @tromple.update_attributes(params[:tromple])
        format.html { redirect_to @tromple, notice: 'Tromple was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tromple.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tromples/1
  # DELETE /tromples/1.json
  def destroy
    @tromple = Tromple.find(params[:id])
    @tromple.destroy

    respond_to do |format|
      format.html { redirect_to tromples_url }
      format.json { head :no_content }
    end
  end
end
