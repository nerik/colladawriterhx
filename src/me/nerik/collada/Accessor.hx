
package me.nerik.collada;


class Accessor 
{

	public var params:Array<Param>;
	public var source:String;
	public var count:Int;
	public var stride:Int;

	public function new () 
	{
		params = new Array();
	}

	public function export() 
	{
		var xml = Xml.createElement('accessor');
		xml.set( "source", source );
		xml.set( "count", Std.string(count) );
		xml.set( "stride", Std.string(stride) );

		for (p in params) 
		{
			xml.addChild( p.export() ); 
		}

		return xml;
	}




	public static function buildXYZ() 
	{
		/*
		var accessor = new Accessor();

		var names = ["X","Y","Z"];

		for (i in 0...3) 
		{
			accessor.params[i] = new Param();
			accessor.params[i].name = names[i];
			accessor.params[i].type = "float";
		}

		accessor.stride = 3;

		return accessor;*/
		return build(["X","Y","Z"]);

	}

	public static function build(paramNames:Array<String>) 
	{
		var accessor = new Accessor();

		for (i in 0...paramNames.length) 
		{
			accessor.params[i] = new Param();
			accessor.params[i].name = paramNames[i];
			accessor.params[i].type = "float";
		}

		accessor.stride = paramNames.length;

		return accessor;
	}


}