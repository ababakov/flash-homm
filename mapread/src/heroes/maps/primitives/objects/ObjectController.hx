package heroes.maps.primitives.objects;

/**
 * ...
 * @author banderos
 */
class ObjectController
{

	public function new() 
	{
		objectsCount = bytes.readUnsignedInt();
		objects = [];
		for ( i in 0...objectsCount ) {
			objects.push(new HObject(bytes));
		}
		
		tunedObjectsCount = bytes.readUnsignedInt();
		if ( tunedObjectsCount > 0 ) {
			
		}
	}
	
}