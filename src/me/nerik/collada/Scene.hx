
package me.nerik.collada;


class Scene 
{
	public var instanceVisualScene:Instance;

	public function new()
	{

	}

	public function export() 
	{
		var xml = Xml.createElement('scene');

		xml.addChild( instanceVisualScene.export() );

		return xml;
	}


	public static function buildDefault(sceneId) 
	{
		var s = new Scene();
		var inst = new Instance();
		
		inst.type = Instance.InstanceType.visual_scene;
		inst.url = "#"+sceneId;

		s.instanceVisualScene = inst;

		return s;
	}

}
