({ fireEventMessage: function (component, event) {
    var firstEvent = component.getEvent("firstEvent");
    firstEvent.setParams({'message' : 'This message is shown by event'});
    firstEvent.fire();
}
})