package heroes.maps.primitives;
import lime.utils.ByteArray;

/**
 * ...
 * @author banderos
 */
class Rumors
{
	private var items:Array<RumorTag>;
	
	public function new(bytes:ByteArray) 
	{
		var count:UInt;
		if ( bytes != null ) {
			count = bytes.readUnsignedInt();
			if ( count > 0 ) {
				items = [];
				for ( i in 0...count ) 
					items.push(new RumorTag(bytes));
			}
		}
	}
}