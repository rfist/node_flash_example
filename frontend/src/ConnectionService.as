package
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.external.ExternalInterface;

	import map.model.MapModel;

	/**
	 * ConnectionService.
	 *
	 */
	public class ConnectionService extends EventDispatcher
	{
		public static const ON_LOCATION_CHANGED:String = "ON_LOCATION_CHANGED";

		public static const GET_POSITION_COMMAND:String = "get_position";
		public static const SERVER_CHECK_COMMAND:String = "server_check";

		public function ConnectionService()
		{
			 if (ExternalInterface.available) {
				 ExternalInterface.addCallback("recieveFromJSHandler", recieveFromJSHandler);
				 ExternalInterface.call("emit", SERVER_CHECK_COMMAND, "");
			 }  else
			 {
				 Logger.inst.error("ExternalInterface not available!");
			 }
		}

	 	public function getPosition(): void {
			if (ExternalInterface.available) {
				ExternalInterface.call("emit", GET_POSITION_COMMAND,
					{
						leftUpPosition: MapModel.inst.currentCity.leftUpPosition.toObject(),
						rightDownPosition: MapModel.inst.currentCity.rightDownPosition.toObject()
					});
			}  else
			{
				Logger.inst.error("ExternalInterface not available!");
			}
		}

		private function recieveFromJSHandler(data: Object): void {
			parseData(data);
		}

		private function parseData(data: Object): void {
			for (var command:String in data)
			{
				switch (command) {
					case "newPosition":
						MapModel.inst.updatePosition(data[command].lat, data[command].long);
						dispatchEvent(new Event(ON_LOCATION_CHANGED));
						break;
					case "server_check":
						Logger.inst.add("Connection successful! Server status: " + data[command]);
						break;
					case "server_error":
						Logger.inst.error(data[command]);
						break;
					default:
						Logger.inst.error("Unknown command: " +  command);
						break;
				}
			}
		}
	}
}