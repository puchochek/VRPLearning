
({
    init: function (component, event) {
        var customEventEv = component.getEvent("customEventEv");
        // component.get('v.selectedContactValue');
        console.log(444, component.get('v.selectedContactValue'));
        customEventEv.setParams({'greetings': 'This message is shown by event'});
        customEventEv.fire();
    }

})