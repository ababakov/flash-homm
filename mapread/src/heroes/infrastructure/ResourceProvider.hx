package heroes.infrastructure;
import heroes.maps.Map;
import lime.utils.ByteArray;

/**
 * ...
 * @author banderos
 */
class ResourceProvider
{

	private static var _instance:ResourceProvider;
	
	public static var Instance(get, null):ResourceProvider;
	
	private static function get_Instance():ResourceProvider {
		if ( _instance == null ) {
			_instance = new ResourceProvider();
		}
		return _instance;
	}
	
	public function new() 
	{
		
	}
	
	public function loadMap(name:String):Map {
		var bytes:ByteArray = openfl.Assets.getBytes("maps/A Viking We Shall Go Allied");
		return new Map(bytes);
	}
}