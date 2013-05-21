
package me.nerik.collada;


class Node 
{

	public var id:String;
	public var type:NodeType;
	public var nodes:Array<Node>;
	public var instance:Instance;

	public function new()
	{

	}

	public function export() 
	{
		var xml = Xml.createElement('node');

		xml.set( "type", Std.string( type ) );
		xml.set( "id", id );

		var instanceXml = instance.export();
		xml.addChild(instanceXml);

		return xml;

	}

	public static function build(id:String, localPos:Vector3 = null, rotation:Vector3 = null, scale:Vector3 = null) 
	{
		var node = new Node();

		node.id = id;
		node.type = NodeType.NODE;

		node.instance = new Instance();
		node.instance.type = Instance.InstanceType.geometry;
		node.instance.url = "#"+id;

		return node;
	}

}

typedef Vector3 =
{
	x:Float,
	y:Float,
	a:Float
}

enum NodeType 
{
	NODE;
	JOINT;
}