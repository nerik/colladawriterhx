
package me.nerik.collada;
class Asset 
{
	public function new () 
	{

	}

	public function export() 
	{
		return Xml.parse( "<asset>
	    <contributor>
	      <author>nerik</author>
	      <authoring_tool>xfl2collada</authoring_tool>
	    </contributor>
	    <created>2013-01-31T17:14:43</created>
	    <modified>2013-01-31T17:14:43</modified>
	    <unit name=\"meter\" meter=\"1\"/>
	    <up_axis>Z_UP</up_axis>
	  </asset>");
	}

}