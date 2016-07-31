package
{
	import flash.display.Bitmap;

	/**
	 * ResManager.
	 *
	 */
	public class ResManager
	{

		public function ResManager()
		{
		}

		[Embed(source="../assets/marker.png")]
		private static var _markerImage:Class;
		public static function get MARKER_IMAGE(): Bitmap {
			var marker:Bitmap = new _markerImage();
			return marker;
		}

		[Embed(source="../assets/kyiv_map.png")]
		private static var _mapImage:Class;

		public static function get KYIV_MAP(): Bitmap {
			var map:Bitmap = new _mapImage();
			return map;
		}

		[Embed(source="../assets/lviv_map.png")]
		private static var _lvivImage:Class;

		public static function get LVIV_MAP(): Bitmap {
			var map:Bitmap = new _lvivImage();
			return map;
		}

		[Embed(source="../assets/odessa_map.png")]
		private static var _odessaImage:Class;

		public static function get ODESSA_MAP(): Bitmap {
			var map:Bitmap = new _odessaImage();
			return map;
		}


	}
}