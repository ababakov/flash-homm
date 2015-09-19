package heroes.maps.primitives;
import lime.utils.ByteArray;

/**
 * ...
 * @author banderos
 */
class RumorTag
{
	private var name:HString;
	private var text:HString;
	
	public function new(bytes:ByteArray) 
	{
		if ( bytes != null ) {
			name = new HString(bytes);
			text = new HString(bytes);
		}
	}
	
}