package heroes.maps.primitives;
import lime.utils.ByteArray;

/**
 * ...
 * @author banderos
 */
class HeroTag
{

	private var portrait:Int;
	private var name:HString;
	
	public function new(bytes:ByteArray) 
	{
		portrait = bytes.readUnsignedByte();
		name = new HString(bytes);
	}
	
}