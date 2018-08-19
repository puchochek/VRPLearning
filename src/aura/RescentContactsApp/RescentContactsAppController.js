({
    init: function (component, event, helper) {
        console.log('Controller works');
        component.set('v.mycolumns', [
            {label: 'Contact Name', fieldName: 'Name', type: 'text'},
            {label: 'Account', fieldName: 'AccountId', type: 'Id'},
            {label: 'Created', fieldName: 'CreatedDate', type: 'Date/Time'},
        ]);
        helper.getData(component);
    },

})