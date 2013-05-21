package me.nerik.collada;

import Type.ValueType;

class DataArray<T> 
{
	public var id:String;
    public var count:Int;

    // public var length(getLength, null):Int;

    private var _values:Array<T>;

    public function new(values:Array<T>) 
    {
    	_values = values;


        count = _values.length;
    }





    public function export() 
    {
    
    	//get type name
    	var typeName = "";



        var type = Type.typeof(_values[0] );


        if (type == ValueType.TFloat)
        {
            typeName = "float";
        }


    	typeName += "_array";


    	//serialize values
    	var valuesStr = _values.join(" ");


    	//build xml
    	var xml = Xml.createElement(typeName);

        xml.set( "id", id );
    	xml.set( "count", Std.string( _values.length ) );
    	 

    	xml.addChild( Xml.parse(valuesStr) );

    	return xml;
    }






    static public function buildFrom3DPoints(pts:Array<Collada.Point3D>):DataArray<Float>
    {

        var arr = [];

        for (p in pts) 
        {
            arr.push(p.x);
            arr.push(p.y);
            arr.push(p.z);
        }

        return new DataArray(arr);

    }


}