Rails.application.routes.draw do

  root 'farms#show'

  scope 'path_names': { new: 'novo', edit: 'editar' } do

    resources :partners,    path: 'contatos'
    resources :facts,       path: 'livrodiario' do
      resources :moves,       path: 'movimentos',   only: [:index]
    end
    resources :entries,     path: 'entradas',       only: []
    resources :inventories, path: 'estoques' do
      resources :entries,   path: 'entradas',       only: [:index]
    end
    resources :accounts,    path: 'contas' do
      resources :credits,   path: 'creditos',       only: [:index]
      resources :debits,    path: 'debitos',        only: [:index]
    end
    resources :farms,       path: 'fazendas',       only: [:show]

    devise_for :users, path: 'usuarios', path_names: {
                 sign_in: 'entrar',
                 sign_out: 'sair',
                 confirmation: 'confirmacao',
                 unlock: 'desbloqueio',
                 registration: 'registrar',
                 sign_up: 'cadastrar'
               }

  end

  get 'livrodiario'              => 'facts#index',        as: :livrodiario
  get 'livrorazao'               => 'accounts#index',     as: :livrorazao
  get 'getafarm'                 => 'other#farmyourself', as: :getafarm

end
