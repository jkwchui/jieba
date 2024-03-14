defmodule Jieba do
  @moduledoc """
  Documentation for `Jieba`.
  """

  @doc """
  Wrapper for jieba_rs, the rust Jieba implementation.

  ## Examples

      iex> j = Jieba.make()

      iex> Jieba.split(j, "呢個係乜嘢呀")
      ["呢", "個", "係", "乜嘢", "呀"]

      iex> Jieba.split(j, "李小福是创新办任也是云计算方面的家")
      ["李小福", "是", "创新", "办任", "也", "是", "云", "计算",
       "方面", "的", "家"]

      iex> Jieba.load_dict(j, "example_userdict.txt")
      :ok

      iex> Jieba.split(j, "李小福是创新办任也是云计算方面的家")
      ["李小福", "是", "创新办", "任", "也", "是", "云", "计算",
       "方面", "的", "家"]
  """
  use Rustler,
    otp_app: :jieba, # must match the name of the project in `mix.exs`
    crate: :rustler_jieba # must match the name of the crate in `native/jieba/Cargo.toml`

  def make(), do: :erlang.nif_error(:nif_not_loaded)
  def load_dict(_jieba, _dict_path), do: :erlang.nif_error(:nif_not_loaded)

  def split(_jieba, _text), do: :erlang.nif_error(:nif_not_loaded)
end
