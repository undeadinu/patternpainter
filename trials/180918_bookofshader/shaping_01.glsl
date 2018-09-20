precision highp float;

#define PI 3.1415926
#define FRANK 333

uniform vec2 u_resolution;
uniform vec2 u_screencoord;
uniform float u_time;


float circle_( in vec2 _st, in float _radius ){

	float f = sin( u_time/2.0 );

    vec2 dist = _st - vec2( 0.00, abs ( f ) );

	return smoothstep( _radius - (_radius*0.21), _radius + (_radius*0.01), _st.y * dot( dist, dist )*5.584 );
}

float circle_2( in vec2 _st, in float _radius ){

	float f = sin( u_time/2.0 );

    vec2 dist = _st - vec2( 0.10, abs ( f ) );

	return smoothstep( _radius - (_radius*1.1), _radius + (_radius*0.01), _st.y * dot( dist, dist )*5.584 );
}


void main(){

	vec2 center_offset = ( u_screencoord/u_resolution ) / 2.0;

	vec2 st = gl_FragCoord.xy/u_resolution - center_offset;

    vec3 color = vec3( circle_( st, 0.18 ) )/2.0 + vec3( circle_2( st, 0.28 ) )/2.0;

	gl_FragColor = vec4( color, 1.0 );
}