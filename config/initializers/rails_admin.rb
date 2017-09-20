RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)
  config.authorize_with do
    redirect_to main_app.root_path unless current_user.admin?
  end

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    bulk_delete
    show
    edit
    delete

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  ## Configuración de los modelos
  config.excluded_models = ["Review", "BookList", "ListedBook"]

  config.model 'Book' do
    label "Libro"
    label_plural "Libros"
    object_label_method :titulo
    list do
      exclude_fields :id, :reviews, :created_at, :updated_at, :image
    end
    edit do
      exclude_fields :id, :reviews, :created_at, :updated_at
    end
  end

  config.model 'Genre' do
    label "Género"
    label_plural "Géneros"
    object_label_method :nombre
    list do
      exclude_fields :id, :books, :created_at, :updated_at
    end
    edit do
      exclude_fields :id, :books, :created_at, :updated_at
    end
  end

  config.model 'Author' do
    label "Autor"
    label_plural "Autores"
    object_label_method :nombre
    list do
      exclude_fields :id, :books, :created_at, :updated_at
    end
    edit do
      exclude_fields :id, :books, :created_at, :updated_at
    end
  end

  config.model 'User' do
    label "Usuario"
    label_plural "Usuarios"
    object_label_method :user_name
    list do
      field :user_name
      field :email
      field :admin
    end
    edit do
      field :user_name
      field :email
      field :admin
    end
  end

  config.model 'BaseList' do
    label "Listado base"
    label "Listados base"
    object_label_method :nombre
    list do
      field :nombre
    end
    edit do
      field :nombre
    end
  end
end
