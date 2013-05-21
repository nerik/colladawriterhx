
package me.nerik.collada;


class Param 
{

	public var type:String;
	public var name:String;

	public function new() 
	{
		
	}


	public function export() 
	{
		var xml = Xml.createElement('param');
		xml.set( "name", name );
		xml.set( "type", type );


		return xml;
	}


}