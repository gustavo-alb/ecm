class <%=plural_table_name.camelize%>Controller < ApplicationController
  before_action :set_<%=singular_table_name%>, only: [:show, :edit, :update, :destroy]

  # GET /<%=plural_table_name%>
  # GET /<%=plural_table_name%>.json
  def index
    @q = <%=singular_table_name.camelize%>.ransack(params[:q])
    @<%=plural_table_name%> = @q.result.page(params[:page]).per(10)
  end

  # GET /<%=plural_table_name%>/1
  # GET /<%=plural_table_name%>/1.json
  def show
  end

  # GET /<%=plural_table_name%>/new
  def new
    @<%=singular_table_name%> = <%=singular_table_name.camelize%>.new
  end

  # GET /<%=plural_table_name%>/1/edit
  def edit
  end

  # POST /<%=plural_table_name%>
  # POST /<%=plural_table_name%>.json
  def create
    @<%=singular_table_name%> = <%=singular_table_name.camelize%>.new(<%=singular_table_name%>_params)

    respond_to do |format|
      if @<%=singular_table_name%>.save
        format.html { redirect_to @<%=singular_table_name%>, notice: '<%=singular_table_name.camelize%> foi criado com sucesso.' }
        format.json { render :show, status: :created, location: @<%=singular_table_name%> }
      else
        format.html { render :new }
        format.json { render json: @<%=singular_table_name%>.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /<%=plural_table_name%>/1
  # PATCH/PUT /<%=plural_table_name%>/1.json
  def update
    respond_to do |format|
      if @<%=singular_table_name%>.update(<%=singular_table_name%>_params)
        format.html { redirect_to @<%=singular_table_name%>, notice: '<%=singular_table_name.camelize%> foi atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @<%=singular_table_name%> }
      else
        format.html { render :edit }
        format.json { render json: @<%=singular_table_name%>.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /<%=plural_table_name%>/1
  # DELETE /<%=plural_table_name%>/1.json
  def destroy
    @<%=singular_table_name%>.destroy
    respond_to do |format|
      format.html { redirect_to <%=plural_table_name%>_url, notice: '<%=singular_table_name.camelize%> foi apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_<%=singular_table_name%>
    @<%=singular_table_name%> = <%=singular_table_name.camelize%>.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def <%=singular_table_name%>_params
    params.require(:<%=singular_table_name%>).permit!
  end
end
