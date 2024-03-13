defmodule Jieba do
  @moduledoc """
  Documentation for `Jieba`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Jieba.hello()
      :world

  """
  use Rustler,
    otp_app: :jieba, # must match the name of the project in `mix.exs`
    crate: :jieba # must match the name of the crate in `native/jieba/Cargo.toml`

  def add(_arg1, _arg2), do: :erlang.nif_error(:nif_not_loaded)
  def split(_arg1), do: :erlang.nif_error(:nif_not_loaded)

end
