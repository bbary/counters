


import Toybox.Lang;
import Toybox.WatchUi;

class CounterDelegate extends WatchUi.BehaviorDelegate {
    var counterView;
    hidden var keyPressedTime = 0;
    

    function initialize(aCounterView) {
        counterView = aCounterView;
    }

    //! Handle a key event
    //! @param evt The key event that occurred
    //! @return true if handled, false otherwise
    function onKeyPressed( evt ) {
        if (evt.getKey() == WatchUi.KEY_DOWN) {
            keyPressedTime = System.getTimer();
            return true;
        }
        return false;
    }

    function onKeyReleased( evt ) {
        if ((keyPressedTime > 0) && (evt.getKey() == WatchUi.KEY_DOWN)) {
            var delta = System.getTimer() - keyPressedTime; // ms since last press
            keyPressedTime = 0;
            if (delta > 1000) {
                // We have a hold of delta ms
                counterView.reset();
            } else {
                // We have a regular press
                counterView.decrement();
            }
            return true;
        }
        return false;
    }

    function onKey(evt){   
        if (evt.getKey() == WatchUi.KEY_ENTER) {
            counterView.change_counter();
        } else if (evt.getKey() == WatchUi.KEY_UP) {
            counterView.increment();
        } else if(evt.getKey() == WatchUi.KEY_MENU) {
            counterView.increment_by_10();
            return true;
        }
        return false;   
    }
}