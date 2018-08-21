({
    handleSelectedContact : function(component, event, helper) {
        console.log('Helper works');
        var action = component.get('c.getContactsOnL');
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === 'SUCCESS') {
                var responseObj = response.getReturnValue();
                var conts = [];

                for (var i = 0; i < responseObj.length; i++) {
                    conts.push({
                        class: "contactClass",
                        label: responseObj[i].LastName,
                        value: responseObj[i].LastName
                    });
                }
                    conts.push({
                        class: "contactClass",
                        label: "--- None ---",
                        value: "none"
                    });
            component.set('v.contacts', conts);
            } else if (state === 'ERROR') {
                var errors = response.getError();
            }
        }));
    $A.enqueueAction(action);
    }
})