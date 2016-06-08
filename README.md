# glsl-sharpen

Sharpens pixels of a frame using the surrounding pixels. Function takes it a texture, a coordinate and the render size, and returns the pixel value for that coordinate after applying the sharpening convolution. 

Adapted from https://igortrindade.wordpress.com/2010/04/23/fun-with-opengl-and-shaders/

`sharpen(sampler2D inputTexture, vec2 coord, vec2 imageSize) => vec4`

## License

MIT. See [LICENSE.md](http://github.com/msfeldstein/glsl-map/blob/master/LICENSE.md) for details.
