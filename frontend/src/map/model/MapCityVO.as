package map.model
{
	import flash.display.Bitmap;

	/**
	 * MapCityVO.
	 *
	 */
	public class MapCityVO
	{
		private var _name: String;
		private var _image: Bitmap;
		private var _leftUpPosition:MapCoordinatesVO, _rightDownPosition: MapCoordinatesVO;

		public function MapCityVO(name: String, image: Bitmap, leftUpPosition:MapCoordinatesVO, rightDownPosition: MapCoordinatesVO)
		{
			_name = name;
			_image = image;
			_leftUpPosition = leftUpPosition;
			_rightDownPosition = rightDownPosition;
		}

		public function get name():String
		{
			return _name;
		}

		public function get image():Bitmap
		{
			return _image;
		}

		public function get rightDownPosition():MapCoordinatesVO
		{
			return _rightDownPosition;
		}

		public function get leftUpPosition():MapCoordinatesVO
		{
			return _leftUpPosition;
		}
	}
}