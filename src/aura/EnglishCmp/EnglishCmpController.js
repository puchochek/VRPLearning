({
    translate : function (component, event, helper) {
        var wordToTranslate = component.get("v.wordToTranslate");
        helper.translateTheWord(component, wordToTranslate);
        console.log('Controller works ' + wordToTranslate);
    }

})