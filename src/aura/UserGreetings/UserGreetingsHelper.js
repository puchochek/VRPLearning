({
    getData : function(component) {
        console.log(1, component);
        var action = component.get('c.getUserName');
        console.log(2);
        action.setCallback(this, $A.getCallback(function (response) {
            console.log(3, 'Helper works');
            var state = response.getState();
            if (state === 'SUCCESS') {
                console.log('State is Success' + response.getReturnValue());
                component.set('v.currentUser', response.getReturnValue());
               
            } else if (state === 'ERROR') {
                var errors = response.getError();
                console.log(errors);
            }
        }));
        $A.enqueueAction(action);
    }
})