package heroes.maps.primitives;
import lime.utils.ByteArray;

/**
 * ...
 * @author banderos
 */
class LandCell
{
	private var surfaceId:Int;
	private var surfacePattern:Int;
	private var riverId:Int;
	private var riverPattern:Int;
	private var roadId:Int;
	private var roadPattern:Int;
	private var mirroring:Int;
	
	public function new(bytes:ByteArray) 
	{
		if ( bytes != null ) {
			surfaceId = bytes.readUnsignedByte();
			surfacePattern = bytes.readUnsignedByte();
			riverId = bytes.readUnsignedByte();
			riverPattern = bytes.readUnsignedByte();
			roadId = bytes.readUnsignedByte();
			roadPattern = bytes.readUnsignedByte();
			mirroring = bytes.readUnsignedByte();
		}
	}
	
}