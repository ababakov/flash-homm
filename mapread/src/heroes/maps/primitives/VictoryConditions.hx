package heroes.maps.primitives;
import lime.utils.ByteArray;

/**
 * ...
 * @author banderos
 */
class VictoryConditions
{
	private var id:Int;
	
	private var artId:Int;
	
	private var creatureId:Int;
	private var creatureCount:UInt;
	
	private var resId:Int;
	private var resCount:UInt;
	
	private var x:Int;
	private var y:Int;
	private var z:Int;
	
	private var hallLevel:Int;
	private var castleLevel:Int;
	
	public function new(bytes:ByteArray) 
	{
		if (bytes != null ) {
			id = bytes.readUnsignedByte();
			if ( id == 0x00 )
				artId = bytes.readByte();
			else if ( id == 0x01 ) {
				creatureId = bytes.readUnsignedShort();
				creatureCount = bytes.readUnsignedInt();
			} else if ( id == 0x02 ) {
				resId = bytes.readUnsignedShort();
				resCount = bytes.readUnsignedInt();
			} else if ( id >= 0x03 && id <= 0x07 || id == 0x0A ) {
				if ( id == 0x0A )
					artId = bytes.readUnsignedByte();
				x = bytes.readUnsignedByte();
				y = bytes.readUnsignedByte();
				z = bytes.readUnsignedByte();
				if ( id == 0x03 ) {
					hallLevel = bytes.readByte();
					castleLevel = bytes.readByte();
				}
			}
		}
	}
	
}