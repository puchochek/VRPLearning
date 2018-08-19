({
    init: function (component, event, helper) {
        console.log('Controller works');
        component.set('v.mycolumns', [
            {label: 'Case Number', fieldName: 'CaseNumber', type: 'Integer'},
            {label: 'Subject', fieldName: 'Subject', type: 'Text'},
            {label: 'Status', fieldName: 'Status', type: 'Picklist'},
            {label: 'Date/Time opened', fieldName: 'CreatedDate', type: 'Date/Time'},
        ]);
        helper.getData(component);
    },

})