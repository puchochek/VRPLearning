({
    init : function(component, event, helper) {
        console.log('init works');
        //console.log(component);
        helper.handleSelectedContact(component);
    },

    selectContact : function (component, event, helper) {
        console.log('selectContact works');
        var cont = component.get('v.selectedContactValue');
        component.set('v.greetings', 'Hello, ' + cont);
    },

    fireComponentEvent : function (component, event, helper) {
        var cont = component.get('v.greetings');
        var customEventEv = component.getEvent("customEventEv");
                customEventEv.setParams({
                    'message' : cont});
                //console.log(111, customEventEv.get('v.greetingsName' ));
                customEventEv.fire();
    }


})