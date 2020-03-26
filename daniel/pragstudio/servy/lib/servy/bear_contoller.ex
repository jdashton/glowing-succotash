defmodule Servy.BearController do

  alias Servy.Wildthings
  alias Servy.Bear
  import Enum, only: [filter: 2, sort: 2, map: 2, join: 1]

  defp bear_item(bear) do
    "<li>#{ bear.name } - #{ bear.type }</li>"
  end

  def index(conv) do
    items =
      Wildthings.list_bears()
      |> filter(&Bear.is_grizzly/1)
      |> sort(&Bear.order_asc_by_name/2)
      |> map(&bear_item/1)
      |> join

    %{ conv | status: 200, resp_body: "<ul>#{ items }</ul>" }
  end

  def show(conv, %{ "id" => id }) do
    bear = Wildthings.get_bear(id)

    %{ conv | status: 200, resp_body: "<h1>Bear #{ bear.id }: #{ bear.name }" }
  end

  def create(conv, %{"name" => name, "type" => type} = _params) do
    %{ conv | status: 201,
      resp_body: "Created a #{ type } bear named #{ name }!" }
  end

  def delete(conv, _params) do
    %{ conv | status: 403, resp_body: "Bears must never be deleted!" }
  end
end
