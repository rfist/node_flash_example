package map.model
{
	import flash.geom.Point;
	import flash.utils.Dictionary;

	/**
	 * MapModel.
	 *
	 */
	public class MapModel
	{
		private static var _inst: MapModel;
		private var _lat: Number;
		private var _long: Number;

		public static const KYIV:String = "Kyiv ";
		public static const LVIV:String = "Lviv";
		public static const ODESSA:String = "Odessa";

		public var cities:Dictionary;

		private var _currentCity:MapCityVO;


		public function MapModel()
		{
		}

		public static function get inst():MapModel
		{
			if (_inst == null)
			{
				_inst = new MapModel();
			}
			return _inst;
		}

		public function initCitiesList(): void {
			cities = new Dictionary();
			cities[KYIV] = new MapCityVO(KYIV, ResManager.KYIV_MAP, new MapCoordinatesVO(50.53438041, 30.29308319), new MapCoordinatesVO(50.30556858, 30.818367));
			cities[LVIV] = new MapCityVO(LVIV, ResManager.LVIV_MAP, new MapCoordinatesVO(49.937839, 23.804970), new MapCoordinatesVO(49.747431, 24.249229));
			cities[ODESSA] = new MapCityVO(ODESSA, ResManager.ODESSA_MAP, new MapCoordinatesVO(46.596855, 30.468178), new MapCoordinatesVO(46.385544, 30.913811));
		}

		public function get mapWidth(): Number {
			return Math.abs(_currentCity.leftUpPosition.lat - _currentCity.rightDownPosition.lat);
		}

		public function get mapHeight(): Number {
			return Math.abs(_currentCity.leftUpPosition.long - _currentCity.rightDownPosition.long);
		}

		public function get relativeCoordinates(): Point {
			var relativeX:Number = (_lat - Math.min(_currentCity.leftUpPosition.lat, _currentCity.rightDownPosition.lat)) / mapWidth;
			var relativeY:Number = (_long - Math.min(_currentCity.leftUpPosition.long, _currentCity.rightDownPosition.long)) /  mapHeight;
			return new Point(relativeX, relativeY);
		}

		public function updatePosition(lat: Number, long: Number): void {
			_long = long;
			_lat = lat;
			Logger.inst.add("Set new position to: long " + _long + ", lat " + _lat);
		}

		public function get long():Number
		{
			return _long;
		}

		public function get lat():Number
		{
			return _lat;
		}

		public function get currentCity():MapCityVO
		{
			return _currentCity;
		}

		public function set currentCity(value:MapCityVO):void
		{
			_currentCity = value;
		}
	}
}