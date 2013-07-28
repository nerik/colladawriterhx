
package me.nerik.collada;
class Asset 
{
	public function new () 
	{

	}

	public function export() 
	{
		var d = DateTools.format(Date.now(), '%Y-%m-%dT%H:%M:%S%z' );
		return Xml.parse( "<asset>
	    <contributor>
	      <author>nerik</author>
	      <authoring_tool>colladawriterhx</authoring_tool>
	    </contributor>
	    <created>"+d+"</created>
	    <modified>"+d+"</modified>
	    <unit name=\"meter\" meter=\"1\"/>
	    <up_axis>Z_UP</up_axis>
	  </asset>");
	}

}