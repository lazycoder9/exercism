defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    palette_bit_size(color_count, 0)
  end

  defp palette_bit_size(color_count, bit_size) do
    if Integer.pow(2, bit_size) < color_count do
      palette_bit_size(color_count, bit_size + 1)
    else
      bit_size
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0b00::2, 0b01::2, 0b10::2, 0b11::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    bit_size = palette_bit_size(color_count)

    <<pixel_color_index::size(bit_size), picture::bitstring>>
  end

  def get_first_pixel(picture, _color_count) when picture == <<>>, do: nil

  def get_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)

    <<value::size(bit_size), _rest::bitstring>> = picture
    value
  end

  def drop_first_pixel(picture, _color_count) when picture == <<>>, do: <<>>

  def drop_first_pixel(picture, color_count) do
    bit_size = palette_bit_size(color_count)

    <<_value::size(bit_size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
