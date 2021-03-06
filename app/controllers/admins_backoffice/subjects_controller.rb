class AdminsBackoffice::SubjectsController < AdminsBackofficeController
  before_action :set_subject, only: [:edit,:update, :destroy]
  def index

    @subjects = Subject.all.page params[:page] 

  end  

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(params_subject)
    if @subject.save
      redirect_to admins_backoffice_subjects_path  notice: "Assunto/Área Criado com sucesso"
     
    else
      render :new
      flash[:error] = "Something went wrong"

    end
  end  
  def edit;end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update params_subject
      redirect_to admins_backoffice_subjects_path, notice: "Assunto/Área atualizado com sucesso"
    else
      render :edit
    end
    
  end

  def destroy
    @subject = Subject.find(params[:id])
    if @subject.destroy
      flash[:success] = 'Object was successfully deleted.'
      redirect_to admins_backoffice_subjects_path
    else
      flash[:error] = 'Something went wrong'
      render :index
    end
  end
  

  private
  def params_subject
    params.require(:subject).permit(:description)
  end
  
  

  def set_subject
    @subject = Subject.find(params[:id])
  end

end
