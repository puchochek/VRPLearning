({
    init : function(component, event, helper) {

        component.set('v.mycolumns', [
            {label: 'Account Name', fieldName: 'Name', type: 'text'},
            {label: 'Account Id', fieldName: 'Id', type: 'Id'},
            {label: 'Account Site', fieldName: 'Site', type: 'text'}
        ]);

        console.log('Controller works')
    },

    setData : function(component, event, helper) {
        console.log('SetData works');
        helper.getData(component);
        //console.log('SetData works');
    },
    deleteData : function (component, event, helper) {
        component.set('v.mydata', []);
    }
})
