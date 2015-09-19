package heroes.maps.primitives;
import lime.utils.ByteArray;

/**
 * ...
 * @author banderos
 */
class FreeHeroes
{
	public static inline var HEROES_COUNT:Int = 20;
	public static inline var JUNK_COUNT:Int = 4;
	public static inline var JUNK2_COUNT:Int = 31;
	
	
	private var count:Int;
	private var heroes:Array<Int>;
	private var tuned:Array<TunedHeroTag>;
	
	public function new(bytes:ByteArray) 
	{
		if ( bytes != null ) {
			heroes = [];
			for ( i in 0...HEROES_COUNT )
				heroes.push(bytes.readUnsignedByte());
			for ( i in 0...JUNK_COUNT )
				bytes.readUnsignedByte();
			
			count = bytes.readUnsignedByte();
			if ( count > 0 ) {
				tuned = [];
				for ( i in 0...count )
					tuned.push(new TunedHeroTag(bytes));
			}
			for ( i in 0...JUNK2_COUNT)
				bytes.readUnsignedByte();

		}
	}
	
}