package heroes.maps.primitives;
import lime.utils.ByteArray;

/**
 * ...
 * @author banderos
 */
class GlobalEvent
{
	private static inline var JUNK_COUNT:Int = 16;
	
	private var name:HString;
	private var text:HString;
	
	private var resources:Array<Int>;
	
	private var playersAffected:Int;
	private var humanAffected:Int;
	private var aiAffected:Int;
	
	private var dayOfFirstEvent:Int;
	private var eventIteration:Int;
	
	public function new(bytes:ByteArray) 
	{
		if ( bytes != null ) {
			name = new HString(bytes);
			text = new HString(bytes);
			
			resources = [];
			for (i in 0...Map.RESOURCES_NUM)
				resources.push(bytes.readInt());
			
			playersAffected = bytes.readUnsignedByte();
			humanAffected = bytes.readUnsignedByte();
			aiAffected = bytes.readUnsignedByte();
			
			dayOfFirstEvent = bytes.readUnsignedShort();
			eventIteration = bytes.readUnsignedShort();
			
			for (i in 0...JUNK_COUNT) 
				bytes.readUnsignedByte();
			
		}
	}
	
}