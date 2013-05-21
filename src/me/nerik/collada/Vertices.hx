
package me.nerik.collada;


class Vertices 
{

	public var id:String;
	public var input:Input;
	
	
	public function new () 
	{

	}

	public function export() 
	{
		var xml = Xml.createElement('vertices');
		xml.set( "id", id );

		xml.addChild( input.export() );

		return xml;
	}




	public static function buildFromPositionsId(positionsId:String)
	{
		var vertices = new Vertices();

		var i = new Input();
		i.semantic = Input.Semantic.POSITION;
		i.source = "#" + positionsId; 
		vertices.input = i;

		return vertices;

	}




}