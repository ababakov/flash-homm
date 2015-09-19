package;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import heroes.infrastructure.ResourceProvider;
/**
 * ...
 * @author banderos
 */
class Main extends Sprite 
{

	public function new() 
	{
		super();
		try {
			var map = ResourceProvider.Instance.loadMap(null);
			var test = openfl.Assets.getBitmapData("img/geroi_mecha_i_magii_3_klinok_armageddona_buka.jpg");
			addChild(new Bitmap(test));
		} catch ( ex:Dynamic ) {
			var exception:TextField = new TextField();
			exception.textColor = 0xFFFFFF;
			exception.width = width;
			exception.autoSize = TextFieldAutoSize.CENTER;
			if ( Reflect.hasField(ex, "message") )
				exception.text = ex.message;
			else 
				exception.text = Std.string(ex);
			exception.x = 200;
			exception.y = 200;
			addChild(exception);
		}

		
	}

}
