class TipoCatalogosController < ApplicationController
  before_action :set_tipo_catalogo, only: [:show, :edit, :update, :destroy]

  # GET /tipo_catalogos
  # GET /tipo_catalogos.json
  def index
    @q = TipoCatalogo.ransack(params[:q])
    @tipo_catalogos = @q.result.page(params[:page]).per(10)
  end

  # GET /tipo_catalogos/1
  # GET /tipo_catalogos/1.json
  def show
  end

  # GET /tipo_catalogos/new
  def new
    @tipo_catalogo = TipoCatalogo.new
  end

  # GET /tipo_catalogos/1/edit
  def edit
  end

  # POST /tipo_catalogos
  # POST /tipo_catalogos.json
  def create
    @tipo_catalogo = TipoCatalogo.new(tipo_catalogo_params)

    respond_to do |format|
      if @tipo_catalogo.save
        format.html { redirect_to @tipo_catalogo, notice: 'TipoCatalogo foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @tipo_catalogo }
      else
        format.html { render :new }
        format.json { render json: @tipo_catalogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_catalogos/1
  # PATCH/PUT /tipo_catalogos/1.json
  def update
    respond_to do |format|
      if @tipo_catalogo.update(tipo_catalogo_params)
        format.html { redirect_to @tipo_catalogo, notice: 'TipoCatalogo foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @tipo_catalogo }
      else
        format.html { render :edit }
        format.json { render json: @tipo_catalogo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_catalogos/1
  # DELETE /tipo_catalogos/1.json
  def destroy
    @tipo_catalogo.destroy
    respond_to do |format|
      format.html { redirect_to tipo_catalogos_url, notice: 'TipoCatalogo foi apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tipo_catalogo
    @tipo_catalogo = TipoCatalogo.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def tipo_catalogo_params
    params.require(:tipo_catalogo).permit!
  end
end
