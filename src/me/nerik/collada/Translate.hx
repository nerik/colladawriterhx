
package me.nerik.collada;


class Translate 
{

	public var x:Float;
	public var y:Float;
	public var z:Float;
	public var sid:String;


	public function new()
	{

	}

	public function export() 
	{
		var xml = Xml.createElement('translate');

		xml.set("sid",sid);

		var valuesStr = [x,y,z].join(" ");
    	xml.addChild( Xml.parse(valuesStr) );

    	return xml;
	}

	static public function build(coords:Collada.Vector3, sid = "translate")
	{
		var translate = new Translate();

		translate.x = coords.x;
		translate.y = coords.y;
		translate.z = coords.z;

		translate.sid = sid;

		return translate;
	}
}