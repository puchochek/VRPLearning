({
    doChange : function(component, event, helper) {
        console.log('Controller works');
        var selectedDate = component.get("v.date");
        if (!selectedDate) {
            alert('Select a date');
        }
        helper.handleSelectedDate(component, selectedDate);
    }
})