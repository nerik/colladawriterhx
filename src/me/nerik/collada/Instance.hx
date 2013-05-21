
package me.nerik.collada;


class Instance 
{
	public var url:String;
	public var type:InstanceType;

	public function new()
	{

	}

	public function export() 
	{
		var xmlName = "instance_"+Std.string(type);

		var xml = Xml.createElement(xmlName);

		xml.set("url",url);

		return xml;
		
	}



}


enum InstanceType 
{
	geometry;
	visual_scene;
}
