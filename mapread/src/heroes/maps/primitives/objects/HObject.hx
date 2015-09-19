package heroes.maps.primitives.objects;
import lime.utils.ByteArray;

/**
 * ...
 * @author banderos
 */
class HObject
{

	public static inline var JUNK_COUNT:Int = 16;
	public static inline var POSSIBILITIES_COUNT:Int = 6;
	public static inline var ACTIONS_COUNT:Int = 6;
	
	private var fileName:HString;
	private var possibilities:Array<Int>;
	private var actions:Array<Int>;
	private var landscape:Int;
	private var landEditGroups:Int;
	private var objectClass:UInt;
	private var objectNumber:UInt;
	private var objectGroup:Int;
	private var isOverlayed:Int;
	
	public function new(bytes:ByteArray) 
	{
		if (bytes != null) {
			fileName = new HString(bytes);
			possibilities = [];
			for (i in 0...POSSIBILITIES_COUNT)
				possibilities.push(bytes.readUnsignedByte());
			
			actions = [];
			for (i in 0...ACTIONS_COUNT)
				actions.push(bytes.readUnsignedByte());
			
			landscape = bytes.readUnsignedShort();
			landEditGroups = bytes.readUnsignedShort();
			objectClass = bytes.readUnsignedInt();
			objectNumber = bytes.readUnsignedInt();
			objectGroup = bytes.readUnsignedByte();
			isOverlayed = bytes.readUnsignedByte();
			for (i in 0...JUNK_COUNT)
				bytes.readUnsignedByte();
		}
		
	}
	
}