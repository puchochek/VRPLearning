({  getData : function(component){
        var action = component.get('c.getAccounts');

        action.setCallback(this, $A.getCallback (function (response) {
            console.log('Helper works');
            var state = response.getState();
            if (state === 'SUCCESS') {
                console.log('State is Success' + response.getReturnValue());
                component.set('v.mydata', response.getReturnValue());
            } else if (state === 'ERROR'){
                var errors = response.getError();
                console.log(errors);
            }
        }));
        $A.enqueueAction(action);
    }
})