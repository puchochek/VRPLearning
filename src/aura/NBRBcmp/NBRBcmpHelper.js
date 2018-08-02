/**
 * Created by Lena on 02.08.18.
 */
({
    handleSelectedDate : function (component, selectedDate) {
        var action = component.get('c.getCurrencey');

        action.setParams({currentDate : selectedDate});

        console.log('This Helper works');
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === 'SUCCESS') {
                component.set('v.myCurrencey', response.getReturnValue());
                console.log(v.myCurrencey);
            } else if (state === 'ERROR') {
                var errors = response.getError();
            }
        }));
        $A.enqueueAction(action);
    }
})