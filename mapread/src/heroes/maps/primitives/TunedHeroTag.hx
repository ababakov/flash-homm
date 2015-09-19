package heroes.maps.primitives;
import lime.utils.ByteArray;

/**
 * ...
 * @author banderos
 */
class TunedHeroTag
{
	private var id:Int;
	private var portrait:Int;
	private var name:HString;
	private var players:Int;
	
	public function new(bytes:ByteArray) 
	{
		if ( bytes != null ) {
			id = bytes.readUnsignedByte();
			portrait = bytes.readUnsignedByte();
			name = new HString(bytes);
			players = bytes.readUnsignedByte();
		}
	}
	
}