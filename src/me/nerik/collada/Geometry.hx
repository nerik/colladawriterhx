
package me.nerik.collada;

import Collada.Point3D;

class Geometry 
{
	//these are only used to generate source ids (MyObject-mesh-positions)
	inline public static var MESH:String = "mesh";
	inline public static var POSITIONS:String = "positions";
	inline public static var NORMALS:String = "normals";
	inline public static var UVS:String = "uvs";
	inline public static var COLORS:String = "colors";
	inline public static var VERTICES:String = "vertices";


	public var id:String;
	public var mesh:Mesh; //normally there could be several <mesh> nodes
	
	public function new (id) 
	{
		this.id = id;
	}

	public function export() 
	{
		var xml = Xml.createElement('geometry');
		xml.set( "id", id );

		xml.addChild( mesh.export() );

		return xml; 
	}

	




	/*
	* DEPRECATED
	* triangles refers to vertexCoords indexes. 
	*/
	// public static function buildFlatGeometry(id:String, vertexCoords:Array<Point3D>, normal:Point3D, triangles:Array<Tri>) 
	public static function buildFlatGeometry(id:String, vertexCoords:Array<Float>, normal:Array<Float>, triangles:Array<Int>) 
	{

		var geom = new Geometry( [id, MESH].join( Collada.PATH_SEPARATOR ) );


		//data arrays
		// var verticesArray = DataArray.buildFrom3DPoints(vertexCoords);
		var verticesArray:DataArray<Float> = new DataArray(vertexCoords);
		// var normalsArray = DataArray.buildFrom3DPoints([normal]);
		var normalsArray:DataArray<Float> = new DataArray(normal);

		//sources
		var posSource = Source.buildFromDataArray( [geom.id, POSITIONS].join( Collada.PATH_SEPARATOR ), verticesArray, ["X","Y","Z"] );

		var normalSource = Source.buildFromDataArray ( [geom.id, NORMALS].join( Collada.PATH_SEPARATOR ), normalsArray, ["X","Y","Z"] );


		//vertices
		var vertices = Vertices.buildFromPositionsId( posSource.id );
		vertices.id = [geom.id, VERTICES].join( Collada.PATH_SEPARATOR );

		//triangles
		//first generate normals array
		var normalIndices:Array<Int> = new Array();
		for (i in 0...triangles.length) 
		{
			normalIndices.push(0);
			normalIndices.push(0);
			normalIndices.push(0);
		}
		var triangles = Triangles.buildFromVerticesAndNormals( triangles, vertices.id,  normalIndices, normalSource.id );


	

		var mesh = new Mesh();
		mesh.sources = [posSource, normalSource];
		mesh.triangles = triangles;
		mesh.vertices = vertices;

		geom.mesh = mesh;


		return geom;
		// var collada = new Collada();
		// collada.geometries = [geom];


		// return collada;
	}



	public static function buildGeometry(id:String, coords:Array<Float>, trianglesCoordsIndices:Array<Int>, normals:Array<Float> = null, uvs:Array<Float> = null, colors:Array<Float> = null) 
	{
		var geom = new Geometry( [id, MESH].join( Collada.PATH_SEPARATOR ) );


		var sources:Array<Source>;

		var coordsArray:DataArray<Float> = new DataArray(coords);
		var coordsSource = Source.buildFromDataArray( [geom.id, POSITIONS].join( Collada.PATH_SEPARATOR ), coordsArray, ["X","Y","Z"], Input.Semantic.VERTEX );
		sources = [coordsSource];


		if (normals != null)
		{
			var normalsArray:DataArray<Float> = new DataArray(normals);
			var normalsSource = Source.buildFromDataArray ( [geom.id, NORMALS].join( Collada.PATH_SEPARATOR ), normalsArray, ["X","Y","Z"], Input.Semantic.NORMAL );
			sources.push( normalsSource );
		}

		if (uvs != null)
		{
			var uvsArray:DataArray<Float> = new DataArray(uvs);
			var uvsSource = Source.buildFromDataArray ( [geom.id, UVS].join( Collada.PATH_SEPARATOR ), uvsArray, ["S","T"], Input.Semantic.TEXCOORD );
			sources.push( uvsSource );
		}
		

		var vertices = Vertices.buildFromPositionsId( coordsSource.id );
		vertices.id = [geom.id, VERTICES].join( Collada.PATH_SEPARATOR );


		var triangles = Triangles.buildTriangles( sources, trianglesCoordsIndices );




		var mesh = new Mesh();
		mesh.sources = sources;
		mesh.vertices = vertices;
		mesh.triangles = triangles;


		geom.mesh = mesh;


		return geom;
	}

}

typedef Tri = Array<Int>;

