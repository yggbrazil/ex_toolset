defmodule ExToolset.JWT do
  use Joken.Config

  @moduledoc """
  JWT wrapper the JOKEN lib, to
  """
  @alg "HS512"

  defp signer(algoritm, secret) do
    Joken.Signer.create(algoritm, secret)
  end

  @doc """
  Generate a token with some secret
  """
  def generate!(map_claims, secret, algoritm \\ @alg) do
    signer = signer(algoritm, secret)
    {:ok, token, _} = Joken.generate_and_sign(%{}, map_claims, signer)
    token
  end

  @doc """
  Verify a existent token with determined secret and returns the claims
  """
  def verify!(token, secret, algoritm \\ @alg) do
    signer = signer(algoritm, secret)
    {:ok, claims} = Joken.verify(token, signer)
    claims
  end
end
