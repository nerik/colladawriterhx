
package me.nerik.collada;


class Triangles 
{

	public var p:Array<Int>;
	public var inputs:Array<Input>;
	
	
	public function new () 
	{
		p = new Array();
		inputs = new Array();
	}

	public function export() 
	{
		var xml = Xml.createElement('triangles');
		var count = Std.int(p.length/inputs.length);
		
		xml.set( "count", Std.string(count) );

		for (i in inputs) 
		{
			xml.addChild( i.export() ); 
		}

		xml.addChild( Xml.parse("<p>"+ p.join(" ")  +"</p>") );
		
		return xml;

	}

	//vertexIndices and normalIndices are supposed to have the same length
	public static function buildFromVerticesAndNormals(vertexIndices:Array<Int>, vertexSource:String, normalIndices:Array<Int>, normalsSource:String)
	{
		var triangles = new Triangles();

		var vInput = new Input();
		vInput.semantic = Input.Semantic.VERTEX;
		vInput.source = "#"+vertexSource;
		vInput.offset = 0;
		triangles.inputs[0] = vInput;

		var nInput = new Input();
		nInput.semantic = Input.Semantic.NORMAL;
		nInput.source = "#"+normalsSource;
		nInput.offset = 1;
		triangles.inputs[1] = nInput;


		for (i in 0...vertexIndices.length) 
		{
			triangles.p.push( vertexIndices[i] );
			triangles.p.push( normalIndices[i] );
		}


		return triangles;

	}


	public static function buildTriangles( sources:Array<Source>, coordsIndices:Array<Int> )
	{
		var triangles = new Triangles();

		var p = new Array();
		for (i in 0...coordsIndices.length) 
		{
			for (s in 0...sources.length) 
			{
				p.push( coordsIndices[i] );
			}
		}

		for (i in 0...sources.length) 
		{
			var input = new Input();
			var source = sources[i];
			input.semantic = source.semantic;
			input.source =  "#"+source.id;
			input.offset = i;
			triangles.inputs[i] = input;

		}

		triangles.p = p;

		return triangles;
	} 




}