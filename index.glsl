
float threshold(in float thr1, in float thr2 , in float val) {
 if (val < thr1) {return 0.0;}
 if (val > thr2) {return 1.0;}
 return val;
}

// averaged pixel intensity from 3 color channels
float avg_intensity(in vec4 pix) {
 return (pix.r + pix.g + pix.b)/3.;
}

vec4 get_pixel(in sampler2D tex, in vec2 coords, in float dx, in float dy) {
 return texture2D(tex,coords + vec2(dx, dy));
}

// returns pixel color
float IsEdge(in vec2 coords, in sampler2D tex){
  float dxtex = 1.0 / 512.0 /*image width*/;
  float dytex = 1.0 / 512.0 /*image height*/;
  float pix[9];
  int k = -1;
  float delta;
  
  pix[0] = avg_intensity(get_pixel(tex, coords,float(-1)*dxtex,
                                        float(-1)*dytex));
  pix[1] = avg_intensity(get_pixel(tex, coords,float(-1)*dxtex,
                                        float(0)*dytex));
  pix[2] = avg_intensity(get_pixel(tex, coords,float(-1)*dxtex,
                                        float(1)*dytex));
  pix[3] = avg_intensity(get_pixel(tex, coords,float(0)*dxtex,
                                        float(-1)*dytex));
  pix[4] = avg_intensity(get_pixel(tex, coords,float(0)*dxtex,
                                        float(0)*dytex));
  pix[5] = avg_intensity(get_pixel(tex, coords,float(0)*dxtex,
                                        float(1)*dytex));
  pix[6] = avg_intensity(get_pixel(tex, coords,float(1)*dxtex,
                                        float(-1)*dytex));
  pix[7] = avg_intensity(get_pixel(tex, coords,float(1)*dxtex,
                                        float(0)*dytex));
  pix[8] = avg_intensity(get_pixel(tex, coords,float(1)*dxtex,
                                        float(1)*dytex));

  // average color differences around neighboring pixels
  delta = (abs(pix[1]-pix[7])+
          abs(pix[5]-pix[3]) +
          abs(pix[0]-pix[8])+
          abs(pix[2]-pix[6])
           )/4.;

  return threshold(0.25,0.4,clamp(3.0*delta,0.0,1.0));
}
#pragma glslify: export(IsEdge)
