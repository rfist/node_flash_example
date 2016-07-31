package
{
	import mx.controls.Text;
	/**
	 * Logger.
	 *
	 */
	public class Logger
	{

		private static var _inst:Logger = null;
		private static var _textArea:Text = null;

		public function Logger()
		{

		}

		public static function initialize(textArea:Text):void
		{
			_textArea = textArea;
		}

		// Methods
		public static function get inst():Logger
		{
			if (_inst == null)
			{
				if (_textArea == null)
				{
					throw new Error("Logger TextArea not initialized!");
				}
				_inst = new Logger();
			}
			return _inst;
		}

		public function add(s:String):void
		{
			var text: String = getTime() + " " + s;
			text += "\n";
			_textArea.htmlText += text;
			_textArea.height = _textArea.textHeight + 200;
		}

		public function error(s:String):void
		{
			var errorMessage: String = '<font color = "#ff0000">' + getTime() + " ERROR: " + s +  "</font>";
			errorMessage += "<br>";
			_textArea.htmlText += errorMessage;
			_textArea.height = _textArea.textHeight + 200;
		}

		public function clear(): void {
			_textArea.htmlText = "";
			_textArea.height = 100;
		}

		private function getTime():String
		{
			var dateObj:Date = new Date();
			var year:String = String(dateObj.getFullYear());
			var month:String = String(dateObj.getMonth() + 1);
			if (month.length == 1)
			{
				month = "0" + month;
			}
			var date:String = String(dateObj.getDate());
			if (date.length == 1)
			{
				date = "0" + date;
			}
			var hours:String = String(dateObj.getHours());
			if (hours.length == 1)
			{
				hours = "0" + hours;
			}

			var minutes:String = String(dateObj.getMinutes());
			if (minutes.length == 1)
			{
				minutes = "0" + minutes;
			}

			var seconds:String = String(dateObj.getSeconds());
			if (seconds.length == 1)
			{
				seconds = "0" + seconds;
			}

			return hours + ":" + minutes + ":" + seconds + " " + date + "/" + month;
		}
	}
}