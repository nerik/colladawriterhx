
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
		xml.set("xmlns","http://www.collada.org/2005/11/COLLADASchema");
		xml.set("version","1.4.1");

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


	#if (neko || cpp)
	static public function prettifyXml(filename)
	{
		if ( ! ~/Win/.match( Sys.systemName() ) )
        {
            //run xmllint to prettify xml output
            Sys.command("xmllint --format "+ filename + " > " + filename+"_tmp");
            Sys.command("mv " + filename+"_tmp " + filename);
        }
	}
	#end



}


typedef Vector3 =
{
	x:Float,
	y:Float,
	z:Float
}



