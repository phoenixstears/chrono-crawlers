shader_type canvas_item;
render_mode unshaded;

uniform sampler2D line_texture;
uniform float scroll_speed = 1.0;
uniform float tile_scale = 100;

void fragment() {
	vec2 uv = SCREEN_UV;
	uv.x *= tile_scale;
	uv.x += TIME * scroll_speed;
	COLOR = texture(line_texture, uv);
}
