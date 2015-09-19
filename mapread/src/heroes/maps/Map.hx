package heroes.maps;
import heroes.maps.primitives.*;
import heroes.maps.primitives.objects.HObject;
import lime.utils.ByteArray;
import heroes.utils.Configuration;
/**
 * ...
 * @author banderos
 */
class Map
{
	// consts
	private static inline var MAIN_JUNK_COUNT:Int = 124;
	public static inline var MAX_PLAYERS:Int = 8;
	public static inline var ARTEFACT_COUNT:Int = 18;
	public static inline var SPELLS_COUNT:Int = 9;
	public static inline var SECSKILLS_COUNT:Int = 4;
	public static inline var HEROOPTIONS_MAX_COUNT:Int = 154;
	public static inline var RESOURCES_NUM:Int = 8;
	
	//vars
	private var bytes:ByteArray;
	private var pos:Int;
	
	private var header:Int;
	private var chunk:Int;
	private var size:Int;
	private var under:Int;
	private var name:HString;
	private var description:HString;
	private var difficulty:Int;
	private var levelLimit:Int;
	
	private var players:Array<PlayerAttributes>;
	private var specialVictoryConditions:VictoryConditions;
	private var specialLossConditions:LossConditions;
	
	private var teamsCount:Int;
	private var teams:Array<Int>;
	
	private var freeHeroes:FreeHeroes;
	
	private var artefacts:Array<Int>;
	private var spells: Array<Int>;
	private var secSkills: Array<Int>;
	
	private var rumors:Rumors;
	private var options:Array<HeroOptions>;
	
	private var ground: Array<Array<LandCell>>;
	private var underground: Array<Array<LandCell>>;
	
	private var globalEvents:Array<GlobalEvent>;
	
	public function new(bytes:ByteArray) 
	{
		if ( bytes != null ){
			// load map bytes
			this.bytes = bytes;
			this.bytes.endian = flash.utils.Endian.LITTLE_ENDIAN;
			
			//this.bytes.writeBytes(bytes);
			readAll();
			
		} else {
			fillDefaults();
		}
	}
	
	private function readAll() {
		readBasicInformation();
		readPlayerAttributes();
		
		specialVictoryConditions = new VictoryConditions(bytes);
		specialLossConditions = new LossConditions(bytes);
		
		readTeams();
		
		freeHeroes = new FreeHeroes(bytes);
		
		readArtefacts();
		readSpells();
		readSecSkills();
		
		rumors = new Rumors(bytes);
		readHeroOptions();
		
		readGround();
		readObjects();
		readEvents();
		
		verify();
	}
	
	private function readBasicInformation() {
		header = bytes.readInt();
		chunk = bytes.readByte();
		size = bytes.readInt();
		under = bytes.readByte();
		name = new HString(bytes);
		description = new HString(bytes);
		difficulty = bytes.readByte();
		levelLimit = bytes.readByte();
	}
	
	private function readPlayerAttributes() {
		players = [];
		for (i in 0...MAX_PLAYERS) {
			players.push(new PlayerAttributes(bytes));
		}
	}
	
	private function readTeams() {
		teamsCount = bytes.readUnsignedByte();
		if ( teamsCount != 0 ) { 
			teams = [];
			for ( i in 0...Map.MAX_PLAYERS ) 
				teams.push(bytes.readUnsignedByte());
		} 
	}
	
	private function readArtefacts() {
		artefacts = [];
		for ( i in 0...ARTEFACT_COUNT )
			artefacts.push(bytes.readUnsignedByte());
	}
	
	private function readSpells() {
		spells = [];
		for ( i in 0...SPELLS_COUNT )
			spells.push(bytes.readUnsignedByte());
	}
	
	private function readSecSkills() {
		secSkills = [];
		for ( i in 0...SECSKILLS_COUNT )
			secSkills.push(bytes.readUnsignedByte());
	}
	
	private function readHeroOptions() {
		options = [];
		for ( i in 0...HEROOPTIONS_MAX_COUNT ) {
			if ( bytes.readUnsignedByte() == 1 ) {
				options.push(new HeroOptions(i, bytes));
			}
		}
	}
	
	private function readGround() {
		ground = [];
		for ( i in 0...size ) {
			ground[i] = [];
			for ( j in 0...size ) {
				ground[i][j] = new LandCell(bytes);
			}
		}
		
		if ( under == 1 ) {
			underground = [];
			for ( i in 0...size ) {
				underground[i] = [];
				for ( j in 0...size ) {
					underground[i][j] = new LandCell(bytes);
				}
			}
		}
	}
	
	private function readObjects() {
		
	}
	
	private function readEvents() {
		var count:UInt = bytes.readUnsignedInt();
		globalEvents = [];
		for (i in 0...count) {
			globalEvents.push(new GlobalEvent(bytes));
		}
	}
	
	private function verify() {
		for (i in 0...MAIN_JUNK_COUNT) 
			if ( bytes.readUnsignedByte() != 0 )
				throw "Main junk isn't fine. Reading fault!";
	}
	
	private function fillDefaults() {
		//bytes = new ByteArray();		
	}
}