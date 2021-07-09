defmodule ExToolset.Http do
  @moduledoc """
  Wrapper functions around hackney
  """

  @doc """
  Posts to URL
  """
  def post(url, headers, body, options) do
    {:ok, status, headers, ref} = :hackney.post(url, headers, body, options)
    {:ok, contents} = :hackney.body(ref)
    {:ok, status, headers, contents}
  end

  @doc """
  Posts to URL, returns the body contents
  """
  def post!(url, headers, body, options) do
    {:ok, _status, _headers, ref} = :hackney.post(url, headers, body, options)
    {:ok, contents} = :hackney.body(ref)
    contents
  end

  @doc """
  Gets a URL
  """
  def get(url) do
    {:ok, status, headers, ref} = :hackney.get(url)
    {:ok, contents} = :hackney.body(ref)
    {:ok, status, headers, contents}
  end

  @doc """
  Gets a URL, returns the body contents
  """
  def get!(url) do
    {:ok, _status, _headers, contents} = get(url)
    contents
  end
end
