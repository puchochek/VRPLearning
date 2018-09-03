({
    translate : function (component, event, helper) {
        var wordToTranslate = component.get("v.wordToTranslate");
        helper.translateTheWord(component, wordToTranslate);
        console.log('Controller works ' + wordToTranslate);
    },

    clearData : function (component, event, helper) {
            component.set('v.wordToTranslate', '');
            component.set('v.translation', '');
    },

    rememberTheWord : function (component, translation, helper) {
        var translation = component.get("v.translation");
        helper.saveTranslation(component, translation);
    }

})