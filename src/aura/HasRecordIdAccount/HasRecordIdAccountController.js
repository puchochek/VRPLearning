({
    init: function (component, event, helper) {
        console.log('Controller works');
        component.set('v.mycolumns', [
            {label: 'Contact Name', fieldName: 'Name', type: 'text'},
            {label: 'Contact Id', fieldName: 'Id', type: 'Id'},
        ]);

        var IdByAccount = component.get("v.recordId");
        console.log(IdByAccount);
        helper.getData(component, IdByAccount);
    },

})