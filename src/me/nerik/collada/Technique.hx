
package me.nerik.collada;


class Technique 
{
	
	public var accessor:Accessor;


	public function new() 
	{
		
	}

	public function export() 
	{
		var xml = Xml.createElement('technique_common');

		xml.addChild( accessor.export() );

		return xml;
	}





}