({
    selectContactsForIteration : function (component) {
        console.log('Helper works');
        var action = component.get('c.getContactsForIteration');
        action.setCallback(this, $A.getCallback(function (response) {
                    console.log(3, 'Helper works');
                    var state = response.getState();
                    if (state === 'SUCCESS') {
                        console.log('State is Success' + response.getReturnValue());
                        component.set('v.contactForIteration', response.getReturnValue());
                    } else if (state === 'ERROR') {
                        var errors = response.getError();
                        console.log(errors);
                    }
                }));
        $A.enqueueAction(action);
    }

})