
package me.nerik.collada;


class VisualScene 
{

	public var id:String;
	public var nodes:Array<Node>;


	public function new()
	{

	}

	public function export() 
	{
		var xml = Xml.createElement('visual_scene');

		xml.set("id",id);

		for (i in 0...nodes.length) 
		{
			xml.addChild ( nodes[i].export() );
		}

		return xml;

	}



}
