({
    getData : function(component, IdByAccount) {
        console.log(1, component);
        var action = component.get('c.getContactByAccountId');
        console.log(2);
        action.setParams({accId :  IdByAccount});
        action.setCallback(this, $A.getCallback(function (response) {
            console.log('Helper works');
            var state = response.getState();
            if (state === 'SUCCESS') {
                console.log('State is Success' + response.getReturnValue());
                component.set('v.relatedContactsNumber', response.getReturnValue());
            } else if (state === 'ERROR') {
                var errors = response.getError();
                console.log(errors);
            }
        }));
        $A.enqueueAction(action);
    }

})