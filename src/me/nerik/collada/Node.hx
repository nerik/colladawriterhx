
package me.nerik.collada;


class Node 
{

	public var id:String;
	public var type:NodeType;
	public var nodes:Array<Node>;
	public var instance:Instance;
	public var translate:Translate;

	public function new()
	{
		type = NodeType.NODE;
	}

	public function export() 
	{
		var xml = Xml.createElement('node');

		xml.set( "type", Std.string( type ) );
		xml.set( "id", id );

		if (instance != null)
		{
			var instanceXml = instance.export();
			xml.addChild(instanceXml);
		}

		if (translate != null)
		{
			var translateXml = translate.export();
			xml.addChild(translateXml);
		}

		return xml;

	}

	public static function build(id:String, localPos:Collada.Vector3 = null /*, rotation:Vector3 = null, scale:Vector3 = null*/) 
	{
		var node = new Node();

		node.id = id;

		node.instance = new Instance();
		node.instance.type = Instance.InstanceType.geometry;
		node.instance.url = "#"+id;

		if (localPos != null)
		{
			node.translate = Translate.build(localPos);
		}

		return node;
	}

}



enum NodeType 
{
	NODE;
	JOINT;
}