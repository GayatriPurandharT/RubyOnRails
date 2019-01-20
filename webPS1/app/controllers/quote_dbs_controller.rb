class QuoteDbsController < ApplicationController
  before_action :set_quote_db, only: [:show, :edit, :update, :destroy]

  # GET /quote_dbs
  # GET /quote_dbs.json
  def import
    @uploaded_io = params[:q].read()
    Hash.from_xml(@uploaded_io).each do |key, value|
      value.each do |column|
        column.delete("id")
        puts column
        @quote_db = QuoteDb.new(column)
          
            @quote_db.save       
            
            
        #puts params[:column][:quote]        
      end
      
    end
      
  end
  def index
    if cookies[:test]==nil
      @quote_dbs = QuoteDb.all
    else
      str=cookies[:test]
      puts str.split(" ")
      @quote_dbs = QuoteDb.where.not(id: str.split(" "))
      puts @quote_dbs
    end
  end
    def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      puts @quote_db
      @results = QuoteDb.where('lower(quote) LIKE :search OR lower(author) LIKE :search', search: "%#{@parameter}%")
      if cookies[:test]==nil
        @results = @results.where.not(id: cookies[:test].split(" "))
      end
    end
  end
  def del
    cookies.permanent[:test] =" "
    respond_to do |format|
      format.html { redirect_to quote_dbs_url, notice: 'Personalization deleted.' }
      format.json { head :no_content }
    end
  end
  def kill
    if cookies[:test]==nil
      cookies.permanent[:test] =" "
    end

    cookies.permanent[:test]=cookies[:test]+" "+params[:id]
    #puts @quote_db
    respond_to do |format|
      format.html { redirect_to quote_dbs_url, notice: 'Quote db was successfully destroyed.' }
      format.json { head :no_content }
    end#format.html { redirect_to @quote_db, notice: 'Quote db was successfully created.' }
    #ormat.json { head :no_content }
  end
  # GET /quote_dbs/1
  # GET /quote_dbs/1.json
  def show
  end

  # GET /quote_dbs/new
  def new
    @quote_db = QuoteDb.new
  end

  # GET /quote_dbs/1/edit
  def edit
  end

  # POST /quote_dbs
  # POST /quote_dbs.json
  def create
    @option=QuoteDb.select(:category).map(&:category).uniq

    if params[:quote_db1][:category] != nil
      params[:quote_db][:category]=params[:quote_db1][:category]
    end
    @quote_db = QuoteDb.new(quote_db_params)

    respond_to do |format|
      if @quote_db.save
        format.html { redirect_to @quote_db, notice: 'Quote db was successfully created.' }
        format.json { render :show, status: :created, location: @quote_db }
      else
        format.html { render :new }
        format.json { render json: @quote_db.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quote_dbs/1
  # PATCH/PUT /quote_dbs/1.json
  def update
    respond_to do |format|
      if @quote_db.update(quote_db_params)
        format.html { redirect_to @quote_db, notice: 'Quote db was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote_db }
      else
        format.html { render :edit }
        format.json { render json: @quote_db.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quote_dbs/1
  # DELETE /quote_dbs/1.json
  def destroy
    @quote_db.destroy
    respond_to do |format|
      format.html { redirect_to quote_dbs_url, notice: 'Quote db was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def export
    data = QuoteDb.all.to_json
    send_data data, :type => 'application/json; header=present', :disposition => "attachment; filename=users.json"
  end
  def export_xml
    data = QuoteDb.all.to_xml
    send_data data, :type => 'application/xml; header=present', :disposition => "attachment; filename=users.xml"
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_quote_db
    @quote_db = QuoteDb.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def quote_db_params
    params.require(:quote_db).permit(:quote, :author, :category)
  end
end