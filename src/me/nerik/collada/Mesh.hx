
package me.nerik.collada;


class Mesh 
{

	public var sources:Array<Source>;
	public var triangles:Triangles;
	public var vertices:Vertices;

	public function new () 
	{
		sources = new Array();
	}

	public function export() 
	{
		var xml = Xml.createElement('mesh');

		for (s in sources) 
		{
			xml.addChild( s.export() );
		}

		if (vertices != null) xml.addChild(vertices.export());

		if (triangles != null) xml.addChild(triangles.export());


		return xml;
	}
	


}