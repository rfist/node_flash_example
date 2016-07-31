package map.model
{
	/**
	 * MapCoordinatesVO.
	 *
	 */
	public class MapCoordinatesVO
	{
		private var _long:Number, _lat: Number;

		public function MapCoordinatesVO(lat: Number, long: Number)
		{
			_lat = lat;
			_long = long;
		}


		public function get long():Number
		{
			return _long;
		}

		public function set long(value:Number):void
		{
			_long = value;
		}

		public function get lat():Number
		{
			return _lat;
		}

		public function set lat(value:Number):void
		{
			_lat = value;
		}

		public function toObject(): Object {
			return {lat: _lat, long: _long};
		}
	}
}