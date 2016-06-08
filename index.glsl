// Adapted from https://igortrindade.wordpress.com/2010/04/23/fun-with-opengl-and-shaders/
vec4 sharpen(in sampler2D tex, in vec2 coords, in vec2 renderSize) {
  float dx = 1.0 / renderSize.x;
  float dy = 1.0 / renderSize.y;
  vec4 sum = vec4(0.0);
  sum += -1. * texture2D(tex, coords + vec2( -1.0 * dx , 0.0 * dy));
  sum += -1. * texture2D(tex, coords + vec2( 0.0 * dx , -1.0 * dy));
  sum += 5. * texture2D(tex, coords + vec2( 0.0 * dx , 0.0 * dy));
  sum += -1. * texture2D(tex, coords + vec2( 0.0 * dx , 1.0 * dy));
  sum += -1. * texture2D(tex, coords + vec2( 1.0 * dx , 0.0 * dy));
  return sum;
}

#pragma glslify: export(sharpen)
