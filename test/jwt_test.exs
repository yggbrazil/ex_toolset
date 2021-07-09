defmodule ExToolset.JWTTest do
  use ExUnit.Case, async: true
  doctest ExToolset.JWT

  alias ExToolset.JWT

  setup do
    secret = "secret"

    claims = %{
      "id" => 1,
      "name" => "test"
    }

    token_to_verify =
      "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6InRlc3QifQ.uMO9drJSq7udl45ZlZBCnXEXPXPezU02Hr2m-WUKjyFBZUENdXXjnl3p1VzikF41oe5mYeWaxl3BoKEb9j8i-w"

    %{
      secret: secret,
      claims: claims,
      token_to_verify: token_to_verify
    }
  end

  test "generate!", %{secret: secret, claims: claims, token_to_verify: token_to_verify} do
    token = JWT.generate!(claims, secret)

    assert token_to_verify == token
  end

  test "verify!", %{secret: secret, claims: claims, token_to_verify: token_to_verify} do
    claims_returned = JWT.verify!(token_to_verify, secret)

    assert claims_returned == claims
  end
end
