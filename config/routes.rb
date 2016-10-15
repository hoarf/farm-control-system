Rails.application.routes.draw do

  resources :entries
  resources :inventories
  scope 'path_names': { new: 'novo', edit: 'editar' } do

    resources :partners, path: 'contatos'

    resources :facts, path: 'livrodiario'

    resources :accounts, path: 'contas'

    resources :farms, path: 'fazendas', only: [:show]

    devise_for :users, path: 'usuarios', path_names: {
                 sign_in: 'entrar',
                 sign_out: 'sair',
                 confirmation: 'confirmacao',
                 unlock: 'desbloqueio',
                 registration: 'registrar',
                 sign_up: 'cadastrar'
               }

  end

  root 'farms#show'

  get 'livrodiario' => 'facts#index', as: :livrodiario

end
