package heroes.maps.primitives;
import lime.utils.ByteArray;
import heroes.utils.Configuration;
/**
 * ...
 * @author banderos
 */
class HString
{
	private var length:UInt;
	public var content(default, null):String;
	
	public function new(bytes:ByteArray) 
	{
		if ( bytes != null ) {
			length = bytes.readUnsignedInt();
			if (length > 0)
				content = bytes.readMultiByte(length, Configuration.CHARSET);
			else content = "";
		}
	}
}