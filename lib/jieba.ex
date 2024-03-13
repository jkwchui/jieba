defmodule Jieba do
  @moduledoc """
  Documentation for `Jieba`.
  """

  @doc """
  Wrapper for jieba_rs, the rust Jieba implementation.

  ## Examples

      iex> Jieba.split("呢個係乜嘢呀")

  """
  use Rustler,
    otp_app: :jieba, # must match the name of the project in `mix.exs`
    crate: :rustler_jieba # must match the name of the crate in `native/jieba/Cargo.toml`

  def split(_arg1), do: :erlang.nif_error(:nif_not_loaded)

end
