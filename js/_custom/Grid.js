function Grid( x, y, z, unitsize_width, unitsize_height, unitsize_depth ) {
	this.x = x;
	this.y = y;
	this.z = z;

	this.unitsize_width = unitsize_width;
	this.unitsize_height = unitsize_height;
	this.unitsize_depth = unitsize_depth;

	this.totalNum = this.x * this.y * this.z;

	this.totalWidth = (this.x-1)*unitsize_width;
	this.totalHeight = (this.y-1)*unitsize_height;
	this.totalDepth = (this.z-1)*unitsize_depth;

	this.matrix = [];

	this.make();
}

Grid.prototype.make = function() {
	for( var d=0; d<this.z; ++d ) {
		for( var v=0; v<this.y; ++v ) {
			for( var h=0; h<this.x; ++h ) {

				var x = h * this.unitsize_width - this.totalWidth/2 ;
				var y = v * this.unitsize_height - this.totalHeight/2;
				var z = d * this.unitsize_depth - this.totalDepth/2;

				var pos = new THREE.Vector3( x, y, z );

				this.matrix.push(pos);
			}
		}
	}
};