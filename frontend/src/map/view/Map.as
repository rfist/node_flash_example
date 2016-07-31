package map.view
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;

	import map.controller.MapController;

	import map.model.MapCityVO;
	import map.model.MapModel;

	import mx.controls.Image;

	/**
	 * Map.
	 *
	 */
	public class Map extends Sprite
	{
		private var _container: Image;
		private var _mapImage:Bitmap;

		public function Map(container: Image)
		{
			_container = container;
			_mapImage = MapModel.inst.currentCity.image;
			_container.addChild(_mapImage);
			MapController.inst.addEventListener(MapController.ON_CITY_CHANGE, update);
		}

		private function update(e: Event): void {
			if (_mapImage) {
				_mapImage.parent.removeChild(_mapImage);
				_mapImage = null;
			}
			_mapImage = MapModel.inst.currentCity.image;
			_container.addChild(_mapImage);
		}

		override public function get height():Number
		{
			return _mapImage.height;
		}

		override public function get width():Number
		{
			return _mapImage.width;
		}
	}
}