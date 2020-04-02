defmodule RefugeWeb.Router do
  use RefugeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RefugeWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/bears", BearController
  end

  # Other scopes may use custom stacks.
  # scope "/api", RefugeWeb do
  #   pipe_through :api
  # end
end
