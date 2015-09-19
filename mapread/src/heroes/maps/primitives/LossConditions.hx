package heroes.maps.primitives;
import lime.utils.ByteArray;

/**
 * ...
 * @author banderos
 */
class LossConditions
{
	private var id:Int;
	private var x:Int;
	private var y:Int;
	private var z:Int;
	private var days:Int;
	
	public function new(bytes:ByteArray) 
	{
		if ( bytes != null ) {
			id = bytes.readUnsignedByte();
			if ( id != 0xFF ) {
				if ( id == 0x00 || id == 0x01 ) {
					x = bytes.readUnsignedByte();
					y = bytes.readUnsignedByte();
					z = bytes.readUnsignedByte();
				} else if ( id == 0x02 )
					days = bytes.readUnsignedByte();
			}
		}
	}
	
}