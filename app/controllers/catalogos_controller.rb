class CatalogosController < ApplicationController
  before_action :set_catalogo, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  # GET /catalogos
  # GET /catalogos.json
  def index
    @q = Catalogo.ransack(params[:q])
    @catalogos = @q.result.page(params[:page]).per(10)
  end

  # GET /catalogos/1
  # GET /catalogos/1.json
  def show
  end

  # GET /catalogos/new
  def new
    @catalogo = Catalogo.new
    @tipos = TipoCatalogo.all.collect{|t|[t.nome,t.id]}
  end

  # GET /catalogos/1/edit
  def edit
    @tipos = TipoCatalogo.all.collect{|t|[t.nome,t.id]}
  end

  # POST /catalogos
  # POST /catalogos.json
  def create
    @catalogo = Catalogo.new(catalogo_params)

    respond_to do |format|
      if @catalogo.save
        format.html { redirect_to @catalogo, notice: 'Catalogo foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @catalogo }
      else
        format.html { render :new }
        format.json { render json: @catalogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalogos/1
  # PATCH/PUT /catalogos/1.json
  def update
    respond_to do |format|
      if @catalogo.update(catalogo_params)
        format.html { redirect_to @catalogo, notice: 'Catalogo foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @catalogo }
      else
        format.html { render :edit }
        format.json { render json: @catalogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogos/1
  # DELETE /catalogos/1.json
  def destroy
    @catalogo.destroy
    respond_to do |format|
      format.html { redirect_to catalogos_url, notice: 'Catalogo foi apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_catalogo
    @catalogo = Catalogo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def catalogo_params
    params.require(:catalogo).permit!
  end
end
