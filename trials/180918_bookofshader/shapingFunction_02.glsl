precision highp float;

#define PI 3.1415926
#define FRANK 333

uniform vec2 u_resolution;
uniform float u_time;
	
float colorCalc_smooth( float x ) {

	return smoothstep( 0.6, 0.7, x );

}

float colorCalc_smooth_02( vec2 st ) {

	return smoothstep( st.y+0.0, st.y+0.1, 0.1 );

}

float colorCalc_mix( float x ) {

	return mix( 0.0, 1.0, x );

}

float colorCalc_mix_inverse( vec2 st, float p ) {

	return mix( st.x+0.0, st.x+1.0, st.y+p );

}



float colorCalc_smooth_y( vec2 st ) {

	return smoothstep( 0.0, 1.0, st.y );

}

float colorCalc_smooth_x( vec2 st ) {

	return smoothstep( st.x, st.x + 1.0, 1.0 );

}

float colorCalc_smooth_x_y_sin( vec2 st ) {

	return smoothstep( st.x, st.x + 0.01, sin(st.y/0.09)/3.0 );

}


float colorCalc_smooth_x_y_sin_minus( vec2 st ) {

	return smoothstep( st.x - 0.01, st.x, sin(st.y)/2.0 ) - smoothstep( st.x, st.x + 0.01, sin(st.y)/2.0 );

}

float colorCalc_smooth_x_y( vec2 st ) {


	float f = abs( sin( u_time ) ) * 100.0;


	// float xs = st.x - 0.5;

	float xs = sin( PI * ( 48.0 * st.x - 1.0 ) ) / ( PI * ( 48.0 * st.x - 1.0 ) );

	// float ys = st.y - 0.5;

	float ys = sin( PI * ( 48.0 * st.y - 1.0 ) ) / ( PI * ( 48.0 * st.y - 1.0 ) );

	

	return smoothstep( xs-0.02 , xs, ys/0.5 ) - smoothstep( xs , xs+0.02, ys/0.5 );

}






void main() {
	
	vec2 st = gl_FragCoord.xy / u_resolution.xy;

	vec3 color = vec3( 0.0 );


	float x = st.x;

	float percentage = colorCalc_smooth_x_y( st );

	// float percentage = colorCalc_02( st, x );

	// color = ( 1.0 - percentage ) * color + percentage * vec3(0.0,1.0,0.0);

	color = vec3( percentage );



	gl_FragColor = vec4( color, 1.0 );

}