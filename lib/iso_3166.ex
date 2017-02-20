defmodule Iso do

  defp isoList do
    File.read!("priv/iso.json")
    |> Poison.decode!
  end

  @doc """
  Look up by country name

  ## Examples

      iex> Iso.whereCountry("Norway")
      %{"alpha2" => "NO", "alpha3" => "NOR", "country" => "Norway", "numeric" => "578"}

      iex> Iso.whereCountry("nOrWaY")
      %{"alpha2" => "NO", "alpha3" => "NOR", "country" => "Norway", "numeric" => "578"}

      iex> Iso.whereCountry("Saint Barthélemy")
      %{"alpha2" => "BL", "alpha3" => "BLM", "country" => "Saint Barthélemy", "numeric" => "652"}

      iex> Iso.whereCountry("Random")
      nil

  """
  @spec whereCountry(String.t) :: map
  def whereCountry(country) do
    isoList
    |> find("country", country)
  end

  @doc """
  Look up by alpha 2

  ## Examples

      iex> Iso.whereAlpha2("no")
      %{"alpha2" => "NO", "alpha3" => "NOR", "country" => "Norway", "numeric" => "578"}

      iex> Iso.whereAlpha2("NO")
      %{"alpha2" => "NO", "alpha3" => "NOR", "country" => "Norway", "numeric" => "578"}

      iex> Iso.whereAlpha2("bL")
      %{"alpha2" => "BL", "alpha3" => "BLM", "country" => "Saint Barthélemy", "numeric" => "652"}

      iex> Iso.whereAlpha2("k")
      nil

  """
  @spec whereAlpha2(String.t) :: map
  def whereAlpha2(alpha2) do
    isoList
    |> find("alpha2", alpha2)
  end

  @doc """
  Look up by alpha 3

  ## Examples

      iex> Iso.whereAlpha3("nor")
      %{"alpha2" => "NO", "alpha3" => "NOR", "country" => "Norway", "numeric" => "578"}

      iex> Iso.whereAlpha3("NOR")
      %{"alpha2" => "NO", "alpha3" => "NOR", "country" => "Norway", "numeric" => "578"}

      iex> Iso.whereAlpha3("bLm")
      %{"alpha2" => "BL", "alpha3" => "BLM", "country" => "Saint Barthélemy", "numeric" => "652"}

      iex> Iso.whereAlpha3("k")
      nil

  """
  @spec whereAlpha3(String.t) :: map
  def whereAlpha3(alpha3) do
    isoList
    |> find("alpha3", alpha3)
  end

  @doc """
  Look up by numeric

  ## Examples

      iex> Iso.whereNumeric("578")
      %{"alpha2" => "NO", "alpha3" => "NOR", "country" => "Norway", "numeric" => "578"}

      iex> Iso.whereNumeric(652)
      %{"alpha2" => "BL", "alpha3" => "BLM", "country" => "Saint Barthélemy", "numeric" => "652"}

      iex> Iso.whereNumeric("k")
      nil

  """
  @spec whereNumeric(integer) :: map
  def whereNumeric(numeric) do
    cond do
      is_integer numeric ->
        isoList
        |> find("numeric", Integer.to_string(numeric))
      true ->
        isoList
        |> find("numeric", numeric)
    end
  end

  defp find(list, key, value) do
    Enum.find(list, fn item ->
      String.upcase(item[key]) == String.upcase(value)
    end)
  end

end
