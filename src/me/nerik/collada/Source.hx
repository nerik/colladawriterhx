
package me.nerik.collada;


class Source 
{

	inline public static var ARRAY:String = "array";
	
	public var id:String; 
	
	public var data:DataArray<Float>;
	public var techniqueCommon:Technique;

	//this is not written to the xml for this element, but it's useful to connect the Source to an Input
	public var semantic:Input.Semantic;


	public function new () 
	{

	}

	public function export() 
	{
		var xml = Xml.createElement('source');
		xml.set( "id", id );

		xml.addChild( data.export() );

		xml.addChild( techniqueCommon.export() );

		return xml;
	}





	public static function buildFromDataArray(id, data:DataArray<Float>, paramNames:Array<String>, semantic:Input.Semantic = null) 
	{
		data.id = [id, ARRAY].join(Collada.PATH_SEPARATOR); 


		var accessor = Accessor.build(paramNames);
		accessor.source = "#"+data.id;
		accessor.count = Std.int( data.count/accessor.stride );

		var techniqueCommon =  new Technique();
		techniqueCommon.accessor = accessor;

		var source = new Source();
		source.id = id;
		source.data = data;
		source.techniqueCommon = techniqueCommon;
		source.semantic = semantic;

		return source;
	}

}