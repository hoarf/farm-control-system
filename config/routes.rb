Rails.application.routes.draw do

  scope 'path_names': { new: 'novo', edit: 'editar' } do

    resources :partners, path: 'contatos'
    resources :facts, path: 'livrodiario'
    resources :entries, path: 'entradas'
    resources :inventories, path: 'estoques'
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
  get 'livrorazao' => 'accounts#index', as: :livrorazao
  get 'getafarm' => 'other#farmyourself', as: :getafarm

end
