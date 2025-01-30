defmodule ElixirApiWeb.Router do
  use ElixirApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ElixirApiWeb do
    pipe_through :api

    # Anagrams Controller
    scope "/anagrams" do
      get("/", AnagramsController, :index)
      get("/words", AnagramsController, :getWords)
    end
  end
end
