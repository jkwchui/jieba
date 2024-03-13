defmodule Jieba do
  @moduledoc """
  Documentation for `Jieba`.
  """

  @doc """
  Wrapper for jieba_rs, the rust Jieba implementation.

  ## Examples

      iex> Jieba.split("呢個係乜嘢呀")
      ["呢", "個", "係", "乜嘢", "呀"]

      iex> Jieba.split("李小福是创新办任也是云计算方面的家")
      ["李小福", "是", "创新", "办任", "也", "是", "云", "计算",
       "方面", "的", "家"]

      iex> Jieba.split_custom("李小福是创新办任也是云计算方面的家", "example_userdict.txt")
      ["李小福", "是", "创新办", "任", "也", "是", "云", "计算",
       "方面", "的", "家"]
  """
  use Rustler,
    otp_app: :jieba, # must match the name of the project in `mix.exs`
    crate: :rustler_jieba # must match the name of the crate in `native/jieba/Cargo.toml`

  def split(_arg1), do: :erlang.nif_error(:nif_not_loaded)

  def split_custom(_arg1, _arg2), do: :erlang.nif_error(:nif_not_loaded)

end
