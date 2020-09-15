#version 120
/* MakeUp Ultra Fast - gbuffers_clouds.fsh
Render: sky, clouds

Javier Garduño - GNU Lesser General Public License v3.0
*/

#include "/lib/config.glsl"

// Varyings (per thread shared variables)
varying vec4 tint_color;

// 'Global' constants from system
uniform sampler2D texture;
uniform float wetness;

void main() {
  vec4 block_color = tint_color;

  #include "/src/writebuffers.glsl"
}