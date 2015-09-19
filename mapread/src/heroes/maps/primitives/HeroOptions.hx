package heroes.maps.primitives;
import lime.utils.ByteArray;

/**
 * ...
 * @author banderos
 */
class HeroOptions
{
	public static inline var ARTEFACTSLOTS_COUNT:Int = 19;
	public static inline var SPELLS_COUNT:Int = 19;
	public static inline var PRIMARY_SKILLS_COUNT:Int = 4;
	
	public var id(default, null):Int;
	
	private var hasExp:Int;
	
	private var exp:UInt;
	
	private var hasSecSkill:Int;
	private var skills:Array<Dynamic>;
	
	private var hasArtefacts:Int;
	private var artefactSlotIds:Array<Int>;
	private var artefactSackIds:Array<Int>;
		
	private var hasBiography:Int;
	private var biography:HString;
	
	private var gender:Int;
	
	private var hasSpells:Int;
	private var spells:Array<Int>; 
	
	private var hasPrimarySkills:Int;
	private var attack:Int;
	private var defence:Int;
	private var power:Int;
	private var knowledge:Int;
	
	
	public function new(id:Int, bytes:ByteArray) 
	{
		this.id = id;
		
		if ( bytes != null ) {
			hasExp = bytes.readUnsignedByte();
			if ( hasExp == 1 )
				exp = bytes.readUnsignedInt();
				
			hasSecSkill = bytes.readUnsignedByte();
			if ( hasSecSkill == 1 ) {
				skills = [];
				var count = bytes.readUnsignedInt();
				if ( count > 0 )
					for ( i in 0...count )
						skills.push( { id: bytes.readUnsignedByte(), level: bytes.readUnsignedByte() } );
			}
			
			hasArtefacts = bytes.readUnsignedByte();
			if ( hasArtefacts == 1 ) {
				artefactSlotIds = [];
				for ( i in 0...ARTEFACTSLOTS_COUNT )
					artefactSlotIds.push(bytes.readUnsignedShort());
				var sackCount = bytes.readUnsignedShort();
				if ( sackCount > 0 ) {
					artefactSackIds = [];
					for ( i in 0...sackCount ) {
						artefactSackIds.push(bytes.readUnsignedShort());
					}
				}
			}
			
			hasBiography = bytes.readUnsignedByte();
			if ( hasBiography == 1 ) {
				biography = new HString(bytes);
			}
			
			gender = bytes.readUnsignedByte();
			
			hasSpells = bytes.readUnsignedByte();
			if ( hasSpells == 1 ) {
				spells = [];
				for ( i in 0...SPELLS_COUNT ) {
					spells.push(bytes.readUnsignedByte());
				}
				
			}
			
			hasPrimarySkills = bytes.readUnsignedByte();
			if ( hasPrimarySkills == 1 ) {
				attack = bytes.readUnsignedByte();
				defence = bytes.readUnsignedByte();
				power = bytes.readUnsignedByte();
				knowledge = bytes.readUnsignedByte();
			}
		}
	}
	
}