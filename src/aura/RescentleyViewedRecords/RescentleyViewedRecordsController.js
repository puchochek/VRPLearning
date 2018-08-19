({
    init: function (component, event, helper) {
        console.log('Controller works');
        component.set('v.mycolumns', [
            {label: 'Name', fieldName: 'Name', type: 'text'},
            {label: 'Record Id', fieldName: 'Id', type: 'Id'},
        ]);
        helper.getData(component);
    },

})