({
    init : function (component, event, helper) {
        var IdByAccount = component.get("v.recordId");
        helper.getData(component, IdByAccount);
    }

})