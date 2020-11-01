#version 120
/* MakeUp Ultra Fast - gbuffers_clouds.vsh
Render: sky, clouds

Javier Garduño - GNU Lesser General Public License v3.0
*/

#define THE_END
#define NO_SHADOWS

#include "/lib/config.glsl"
#include "/lib/color_utils_end.glsl"

// Varyings (per thread shared variables)
varying vec4 tint_color;
varying float fog_density_coeff;
varying float frog_adjust;

uniform float far;
uniform int current_hour_floor;
uniform int current_hour_ceil;
uniform float current_hour_fract;

#if AA_TYPE == 1 || AA_TYPE == 2
  #include "/src/taa_offset.glsl"
#endif

void main() {
  tint_color = gl_Color;
  #include "/src/position_vertex.glsl"
  #include "/src/cloudfog_vertex.glsl"
}
