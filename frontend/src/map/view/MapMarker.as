package map.view
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;

	/**
	 * MapMarker.
	 *
	 */
	public class MapMarker extends Sprite
	{
		private var _textField:TextField;

		public function MapMarker()
		{
			var bitmap: Bitmap = ResManager.MARKER_IMAGE;
			addChild(bitmap);
			_textField = new TextField();
			_textField.selectable = false;
			_textField.mouseEnabled = false;
			addChild(_textField);
			_textField.y = 34;
			_textField.backgroundColor = 0xc2571a;
			_textField.background = true;
			var textFormat:TextFormat = new TextFormat();
			textFormat.align = TextFormatAlign.CENTER;
			_textField.defaultTextFormat = textFormat;
			_textField.alpha = 0.8;
		}

		public function updateText(lat: Number, long: Number): void {
			_textField.text = "latitude: " + lat + "\n" + "longitude: " + long;
			_textField.width = _textField.textWidth + 5;
			_textField.height = _textField.textHeight + 5;
			_textField.x = -(_textField.textWidth / 2);
		}

	}
}