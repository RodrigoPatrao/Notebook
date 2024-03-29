class KindsController < ApplicationController
  before_action :set_kind, only: [:show, :edit, :update, :destroy]

  # GET /kinds
  # GET /kinds.json
  def index
    @kinds = Kind.order(:description).page params[:page]
  end

  # GET /kinds/1
  # GET /kinds/1.json
  def show
  end

  # GET /kinds/new
  def new
    @kind = Kind.new
  end

  # GET /kinds/1/edit
  def edit
  end

  # POST /kinds
  # POST /kinds.json
  def create
    @kind = Kind.new(kind_params)

    respond_to do |format|
      if @kind.save
        format.html { redirect_to kinds_path, flash:{ success: "Tipo '#{@kind.description}' criado com sucesso."} }
        format.json { render :show, status: :created, location: @kind }
      else
        format.html { render :new, flash:{ danger: "Erro ao criar Tipo '#{@kind.description}'."} }
        format.json { render json: @kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kinds/1
  # PATCH/PUT /kinds/1.json
  def update
    respond_to do |format|
      if @kind.update(kind_params)
        format.html { redirect_to kinds_path, flash:{ success: "Tipo '#{@kind.description}' atualizado com sucesso."} }
        format.json { render :show, status: :ok, location: @kind }
      else
        format.html { render :edit, flash:{ danger: "Erro ao atualizar Tipo '#{@kind.description}'."} }
        format.json { render json: @kind.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kinds/1
  # DELETE /kinds/1.json
  def destroy
    @kind.destroy
    respond_to do |format|
      format.html { redirect_to kinds_path, flash:{ success: "Tipo '#{@kind.description}' excluído com sucesso."} }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kind
      @kind = Kind.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kind_params
      params.require(:kind).permit(:description)
    end
end
