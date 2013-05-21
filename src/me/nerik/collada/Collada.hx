
package me.nerik.collada;


class Collada 
{

	inline public static var PATH_SEPARATOR:String = "-";

	public var name:String;

	public var asset:Asset;
	public var geometries:Array<Geometry>;
	public var animations:Array<Animation>;
	public var visualScenes:Array<VisualScene>;
	public var scene:Scene;


	public function new () 
	{
		geometries = new Array();
		animations = new Array();

		asset = new Asset();

	}

	public function export() 
	{
		var xml = Xml.createElement('COLLADA');

		//asset
		xml.addChild( asset.export() );

		//geom
		var geomXml = Xml.createElement( "library_geometries" );
		xml.addChild( geomXml );		

		for (g in geometries) 
		{
			geomXml.addChild( g.export() );
		}

		//visual scenes
		var visualScenesXml = Xml.createElement( "library_visual_scenes" );
		xml.addChild( visualScenesXml );		

		for (vs in visualScenes) 
		{
			visualScenesXml.addChild( vs.export() );
		}


		//scene
		var sceneXml = scene.export();
		xml.addChild(sceneXml);

		return xml;
	}




}


//helper structs
typedef Point3D = {
	x:Float,
	y:Float,
	z:Float
}





