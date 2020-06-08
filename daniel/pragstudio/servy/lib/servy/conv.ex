defmodule Servy.Conv do
  defstruct method: "",
            path: "",
            params: %{},
            headers: %{},
            resp_headers: %{
              "Content-Type" => "text/html",
              "Content-Length" => 0
            },
            resp_body: "",
            status: nil

  def put_resp_content_type(conv, ctype) do
    put_in(conv.resp_headers["Content-Type"], ctype)
  end

  def put_content_length(conv) do
    headers = Map.put(conv.resp_headers, "Content-Length", String.length(conv.resp_body))
    %{ conv | resp_headers: headers }
  end

  def full_status(%Servy.Conv{} = conv) do
    "#{conv.status} #{status_reason(conv.status)}"
  end

  defp status_reason(code) do
    %{
      200 => "OK",
      201 => "Created",
      401 => "Unauthorized",
      403 => "Forbidden",
      404 => "Not Found",
      500 => "Internal Server Error"
    }[code]
  end
end
