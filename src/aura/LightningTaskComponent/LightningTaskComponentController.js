({
    init : function(component, event, helper) {

        component.set('v.mycolumns', [
            {label: 'Account Name', fieldName: 'Name', type: 'text'},
            {label: 'Account Id', fieldName: 'Id', type: 'Id'},
            {label: 'Account Site', fieldName: 'Site', type: 'text'}
        ]);
        component.set('v.columns', [
            {label: 'Contact Name', fieldName: 'Name', type: 'text'},
            {label: 'Contact Birthday', fieldName: 'Birthdate', type: 'date'},
            {label: 'Contact Email', fieldName: 'Email', type: 'email'}
        ]);

        console.log('Controller works');
    },

    setData : function(component, event, helper) {
        console.log('SetData works');
        helper.getData(component);
        console.log('SetData works');
    },
    deleteData : function (component, event, helper) {
        component.set('v.mydata', []);
    },

    setContData : function(component, event, helper) {
        console.log('SetContData works');
        helper.getContData(component);
        console.log('SetContData works');
    },

    deleteContData : function (component, event, helper) {
        component.set('v.myContact', []);
    },

    searchObject : function (component, event, helper) {
        var selectedName = component.get("v.forSearch");

        if (!selectedName) {
            alert('Enter correct value');
        }
        helper.searchObjectByName(component, selectedName);
    },

    showNumberOfContacts : function (component, event, helper) {
        var contNumber = component.get("v.myNumber");
        console.log('showNumberOfContacts works');
        if (!contNumber) {
            alert('Enter correct value');
        }
        helper.searchNumberOfContacts(component, contNumber);
    },
    showContactWithId : function (component, event, helper) {
        var inputId = component.get("v.myId");
        console.log('Controller Id works');
        if (!inputId) {
            alert('Enter correct value');
        }
        helper.getContactById(component, JSON.stringify(inputId));
    },
    selectChangeOne : function(component, event, helper) {
          var changeElement = component.find("Toggle1");
          $A.util.toggleClass(changeElement, "slds-hide");
    },
    selectChangeTwo : function(component, event, helper) {
          var changeElement = component.find("Toggle2");
          $A.util.toggleClass(changeElement, "slds-hide");
    },
    selectChangeThree : function(component, event, helper) {
          var changeElement = component.find("Toggle3");
          $A.util.toggleClass(changeElement, "slds-hide");
    },
    selectChangeFour : function(component, event, helper) {
          var changeElement = component.find("Toggle4");
          $A.util.toggleClass(changeElement, "slds-hide");
    }
})