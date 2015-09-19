package heroes.maps.primitives;
import lime.utils.ByteArray;

/**
 * ...
 * @author banderos
 */
class PlayerAttributes
{

	private var isHuman:Int;	//byte
	private var isComputer:Int;
	private var behaviour:Int;
	private var isCityTypesOpt:Int;
	private var cityTypes:Int;	//short
	private var randomCity:Int;	//byte
	private var mainCity:Int;
	// if mainCity == 1
	private var generateHero:Int;
	private var cityType:Int;	
	private var x:Int; 			
	private var y:Int;
	private var z:Int;
	// end;
	
	private var randomHero:Int;
	private var heroType:Int;
	private var heroPortrait:Int;
	private var heroName:HString;
	
	private var heroesCount:UInt;
	private var heroes:Array<HeroTag>;
	
	public function new(bytes:ByteArray) 
	{
		if (bytes != null)
		{
			isHuman = bytes.readByte();
			isComputer = bytes.readByte();
			behaviour = bytes.readByte();
			isCityTypesOpt = bytes.readByte();
			cityTypes = bytes.readShort();
			randomCity = bytes.readByte();
			mainCity = bytes.readByte();
			if ( mainCity == 1 ) {
				generateHero = bytes.readByte();
				cityType = bytes.readByte();
				x = bytes.readUnsignedByte();
				y = bytes.readUnsignedByte();
				z = bytes.readUnsignedByte();
			}
			randomHero = bytes.readUnsignedByte();
			heroType = bytes.readUnsignedByte();
			
			heroPortrait = bytes.readUnsignedByte();
			heroName = new HString(bytes);
			
			if ( heroType != 0xFF) {
				// junk
				bytes.readByte();
				
				heroesCount = bytes.readUnsignedInt();
				if ( heroesCount > 0 ) {
					heroes = [];
					for ( i in 0...heroesCount) {
						heroes.push(new HeroTag(bytes));
					}
				}
			}
		}
	}
	
}