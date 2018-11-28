function randomWithinScreen ( width, height, depth ) {
	var _x = ( Math.random() - 0.5 ) * width;
	var _y = ( Math.random() - 0.5 ) * height;
	var _z = ( Math.random() - 0.5 ) * depth;

	return new THREE.Vector3( _x, _y, _z );
}