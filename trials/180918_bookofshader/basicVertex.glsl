void main() {
    gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );
}

void main() {
    vec4 color = vec4( 0.5, 1.0, 1.0, 1.0);
    gl_FragColor = color;

}