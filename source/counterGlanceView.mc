using Toybox.WatchUi;
import Toybox.Application.Storage;
import Toybox.Lang;

(:glance)
class CounterGlanceView extends WatchUi.GlanceView {
    var counter0;
    var counter1;
    var counter2;
	
    function initialize() {
      GlanceView.initialize();
    }
    
    function onUpdate(dc) {

        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(dc.getWidth()/2, dc.getHeight()/2, Graphics.FONT_MEDIUM, getCountersFromStorage(), Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        
    }

        // Get a string with the storage value
    private function getCountersFromStorage() as String {
        counter0 = Storage.getValue("counter0");
        counter2 = Storage.getValue("counter2");
        counter1 = Storage.getValue("counter1");
        if (counter0 == null) {
            counter0 = 0;
        }
        if (counter1 == null) {
            counter1 = 0;
        }
        if (counter2 == null) {
            counter2 = 0;
        }
        return counter0.toString()+" - "+counter1.toString()+" - "+counter2.toString();
    }
}