package map.controller
{
	import flash.events.EventDispatcher;

	/**
	 * MapController.
	 *
	 */
	public class MapController extends EventDispatcher
	{
		public static const ON_CITY_CHANGE:String = "ON_CITY_CHANGE";
		private static var _instance:MapController = null;


		public function MapController()
		{

		}

		public static function get inst(): MapController {
			if (_instance == null)
			{
				_instance = new MapController();
			}
			return _instance;
		}
	}
}