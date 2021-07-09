defmodule ExToolset.Xml do
  @moduledoc """
  Wrapper functions around xmerl
  """
  
  @doc """
  Removes all whitespace between tags in a XML
  """
  def remove_whitespace_between_tags(xml) when is_binary(xml) do
    String.replace(xml, ~r{[\s]+(?![^><]*>)}, "")
  end

  @doc """
  Receives a binary and returns a xmerl xmlElement()
  """
  def scan(xml) when is_binary(xml) do
    xml
    |> :erlang.binary_to_list
    |> :xmerl_scan.string
    |> elem(0)
  end

  @doc """
  Exports a xmerl xmlElement() back to a string binary
  """
  def export(xmls) when is_list(xmls) do
    xmls
    |> Enum.map(&(:xmerl.export_simple([&1], :xmerl_xml)))
    |> Enum.map(&(:lists.flatten(&1)))
    |> to_string
  end

  def export(xml) when is_tuple(xml) do
    [xml]
    |> :xmerl.export_simple(:xmerl_xml)
    |> :lists.flatten
    |> to_string
  end

  @doc """
  Applies an xpath expression to a XML
  """
  def xpath(xml, exp) when is_binary(exp) do
   xpath(xml, :erlang.binary_to_list(exp))
  end
  
  def xpath(xml, exp) when is_tuple(xml) do
    case :xmerl_xpath.string(exp, xml) do
      {:xmlObj, :string, str} -> String.trim(to_string(str))
      {:xmlObj, _any, scalar} -> scalar
      any -> any
    end
  end

  def xpath(xml, exp) when is_binary(xml) do
    scan(xml)
    |> xpath(exp)
  end

  def xpath(xml, exp) when is_list(xml) do
    xml
    |> Enum.map(&(xpath(&1, exp)))
  end
end
