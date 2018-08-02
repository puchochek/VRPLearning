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
    },

    getContData : function(component) {
        var action = component.get('c.getContacts');

        action.setCallback(this, $A.getCallback(function (response) {
            console.log('Helper works');
            var state = response.getState();
            if (state === 'SUCCESS') {
                console.log('State is Success' + response.getReturnValue());
                component.set('v.myContact', response.getReturnValue());
            } else if (state === 'ERROR') {
                var errors = response.getError();
                console.log(errors);
            }
        }));
        $A.enqueueAction(action);
    },

    searchObjectByName : function(component, forSearch) {
    var action = component.get('c.getObjByName');

    action.setParams({nameToSearch : forSearch});

    action.setCallback(this, $A.getCallback(function (response) {
        var state = response.getState();
        if (state === 'SUCCESS') {
            component.set('v.myContact', response.getReturnValue());
        } else if (state === 'ERROR') {
            var errors = response.getError();
        }
    }));
    $A.enqueueAction(action);

    },

    searchNumberOfContacts : function (component, contNumber) {
        var action = component.get('c.getContByNumber');

        action.setParams({numberOfContacts : contNumber});

        console.log('This Helper works');
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === 'SUCCESS') {
                component.set('v.myContact', response.getReturnValue());
            } else if (state === 'ERROR') {
                var errors = response.getError();
            }
        }));
        $A.enqueueAction(action);
    },

    getContactById : function (component, idValue) {
        var action = component.get('c.getContById');
        console.log('Id Helper works with ' + idValue);
        action.setParams({inputValue : idValue});

        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === 'SUCCESS') {
                component.set('v.myContact', response.getReturnValue());
            } else if (state === 'ERROR') {
                var errors = response.getError();
            }
            console.log('Id Helper works');
        }));
        $A.enqueueAction(action);


    }
})