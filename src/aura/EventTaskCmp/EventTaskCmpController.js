({
    init: function (component, event, helper) {

     component.set('v.mycolumns', [
                {label: 'Contact Name', fieldName: 'Name', type: 'text'},
                {label: 'Contact Id', fieldName: 'Id', type: 'Id'},
            ]);
    helper.getData(component);
    },

    /*waiting: function(component, event, helper) {
            document.getElementById("Accspinner").style.display = "block";
    },

    doneWaiting: function(component, event, helper) {
        document.getElementById("Accspinner").style.display = "none";

    },*/

    showConsoleMessage: function (component, event) {
        console.log('The First Event Works');

        var message = event.getParam('message');
        console.log('Parametr for message ', event.getParam('message'));
        component.set('v.eventMessage', message);
    }
         
})