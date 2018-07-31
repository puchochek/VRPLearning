({
    init : function(component, event, helper) {
        component.set('v.columns', [
            {label: 'Contact Name', fieldName: 'Name', type: 'text'},
            {label: 'Contact Birthday', fieldName: 'Birthdate', type: 'Date'},
            {label: 'Contact Email', fieldName: 'Email', type: 'Email'}
        ]);
        console.log('Controller works');
    }


})