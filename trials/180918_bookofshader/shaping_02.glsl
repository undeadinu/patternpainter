#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 u_screencoord;
uniform vec2 u_resolution;
uniform vec2 u_mouse;
uniform float u_time;

void main(){

  vec2 center_offset = ( u_screencoord/u_resolution ) / 2.0;

  vec2 st = gl_FragCoord.xy/u_resolution - center_offset;

  vec3 color = vec3(0.0);

  float d = 0.0;

  // Make the distance field
  d = length( abs(st) - 0.0 );

  d = length( min( (st.xy) - vec2(0.3), vec2(1.0,0.0) ) );

  // d = length( min(abs(st) - 0.3, 0.0 ) );

  // d = length( max(abs(st)-.3,0.) );

  // Visualize the distance field
  // gl_FragColor = vec4( vec3( fract(d*10.0) ), 1.0 );

  gl_FragColor = vec4( vec3( fract(d*8.0) ), 1.0 );

  // Drawing with the distance field
  // gl_FragColor = vec4(vec3( step(.3,d) ),1.0);
  // gl_FragColor = vec4(vec3( step(.3,d) * step(d,.4)),1.0);
  gl_FragColor = vec4(vec3( smoothstep(.3,.4,d)* smoothstep(.6,.5,d)) ,1.0);
}
