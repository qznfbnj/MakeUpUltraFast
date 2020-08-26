/* MakeUp Ultra Fast - color_utils.glsl
Usefull functions for color manipulation.

Javier Garduño - GNU Lesser General Public License v3.0
*/

const float ambient_multiplier = 1.2;

// Ambient colors per hour
const vec3 ambient_baselight[25] =
  vec3[25](
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 6
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 7
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 8
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 9
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 10
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 11
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 12
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 13
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 14
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 15
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 16
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 17
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 18
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 19
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 20
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 21
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 22
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 23
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 24
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 1
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 2
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 3
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 4
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961), // 5
  vec3(0.20784313725490197, 0.18823529411764706, 0.1843137254901961) // 6
  );

// Ambient color luma per hour in exposure calculation
const float ambient_exposure[25] =
  float[25](
  .1, // 6
  .1, // 7
  .1, // 8
  .1, // 9
  .1, // 10
  .1, // 11
  .1, // 12
  .1, // 13
  .1, // 14
  .1, // 15
  .1, // 16
  .1, // 17
  .1, // 18
  .1, // 19
  .1, // 20
  .1, // 21
  .1, // 22
  .1, // 23
  .1, // 24
  .1, // 1
  .1, // 2
  .1, // 3
  .1, // 4
  .1, // 5
  .1 // 6
  );

// How many sky_color vs. fog_color is used for fog.
const float fog_color_mix[25] =
  float[25](
  .75, // 6
  .75, // 7
  .75, // 8
  .75, // 9
  .75, // 10
  .75, // 11
  .75, // 12
  .75, // 13
  .75, // 14
  .75, // 15
  .75, // 16
  .75, // 17
  .75, // 18
  .75, // 19
  .75, // 20
  .75, // 21
  .75, // 22
  .75, // 23
  .75, // 24
  .75, // 1
  .75, // 2
  .75, // 3
  .75, // 4
  .75, // 5
  .75 // 6
  );

// Fog parameter per hour
const float fog_density[25] =
  float[25](
  .5, // 6
  .5, // 7
  .5, // 8
  .5, // 9
  .5, // 10
  .5, // 11
  .5, // 12
  .5, // 13
  .5, // 14
  .5, // 15
  .5, // 16
  .5, // 17
  .5, // 18
  .5, // 19
  .5, // 20
  .5, // 21
  .5, // 22
  .5, // 23
  .5, // 24
  .5, // 1
  .5, // 2
  .5, // 3
  .5, // 4
  .5, // 5
  .5 // 6
  );

// Omni intensity per hour
const float omni_force[25] =
  float[25](
  .15, // 6
  .2, // 7
  .3, // 8
  .3, // 9
  .3, // 10
  .3, // 11
  .3, // 12
  .3, // 13
  .3, // 14
  .3, // 15
  .3, // 16
  .2, // 17
  .15, // 18
  .15, // 19
  .9, // 20
  1.0, // 21
  1.0, // 22
  1.0, // 23
  1.0, // 24
  1.0, // 1
  1.0, // 2
  1.0, // 3
  .9, // 4
  .15, // 5
  .15 // 6
  );

const vec3 candle_baselight = vec3(0.555, 0.4309411764705883, 0.22200000000000003);
const vec3 waterfog_baselight = vec3(0.09215686274509804, 0.23137254901960785, 0.3980392156862745);
