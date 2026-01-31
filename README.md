# defold-helpers

## color_heper

Helper methods to cast and modify colors. Most operations require a color (table r, g, b 0..255 and a 0..1).

* `rgba_to_color()` (shorthand: `rgb()` and `rgba()`): convert r, g, b, a to color table.
* `hex_to_color` and `color_to_hex`: Convert a color from an to a hex value (i.e. #FF0000 <-> { r = 255, b = 0, g = 0, a = 1 }).
* `to_vector`: Transform a color into a vector4.
* `lerp_color`: Linear interpolation between two colors.
* `rgb_to_hsl` and `hsl_to_rgb`: Convert r, g, b to corresponing [HSL value](https://en.wikipedia.org/wiki/HSL_and_HSV).
* `spread_color`: Generates a ligher and darker version of the input color by adding factor to the lightness of the given color.
* `contrast_ratio`: Calculate constrast ratio of two given colors.
* `contrast_passes`: Check constrast ratio according to WCAG 2 with level 'AA' (1.4.3 Contrast (Minimum)) and 'AAA' (1.4.6 Contrast (Enhanced)).

## gui_helper

Methods to simplify using Defold the `gui` api.

* `create_box_node`: Create a box or circle node with root node, size, position, and visibility.
* `create_text_node`: Create a text node.
* `get_text_metrics`: Get text metrics of given text node.

## lua_helper

A set of helpful methods to work with lua structures.

* `merge`: Merge two tables
* `map`: Map given table with mapping function
* `spairs`: Return sorted iterator of given table
* `string_starts_with`: Check if given string starts with substring
