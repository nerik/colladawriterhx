
package me.nerik.collada;


class Input 
{

	public var semantic:Semantic;
	public var source:String;
	public var offset:Int = -1;
	
	
	public function new () 
	{
		
	}

	public function export() 
	{
		var xml = Xml.createElement('input');
		xml.set( "semantic", Std.string(semantic) );
		xml.set( "source", source );
		if (offset>-1) xml.set( "offset", Std.string(offset) );


		return xml;
	}




}

enum Semantic 
{
	BINORMAL;
	COLOR;
	CONTINUITY;
	IMAGE;
	INPUT;
	IN_TANGENT;
	INTERPOLATION;
	INV_BIND_MATRIX;
	JOINT;
	LINEAR_STEPS;
	MORPH_TARGET;
	MORPH_WEIGHT;
	NORMAL;
	OUTPUT;
	OUT_TANGENT;
	POSITION;
	TANGENT;
	TEXBINORMAL;
	TEXCOORD;
	TEXTANGENT;
	UV;
	VERTEX;
	WEIGHT;
}