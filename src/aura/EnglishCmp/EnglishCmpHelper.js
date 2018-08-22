
({
    translateTheWord : function (component, wordToTranslate) {
        console.log('Helper works');
        var action = component.get('c.getTranslationFromJandex');
        action.setParams({wordToTranslate : wordToTranslate});
        console.log('word to translate ' + wordToTranslate);
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === 'SUCCESS') {
                var responseJSON = response.getReturnValue();
                var responseObj = JSON.parse(responseJSON);
                console.log('respObj ' + responseObj);
                component.set('v.translation', responseJSON);
                console.log('response ' + responseJSON);
            } else if (state === 'ERROR') {
                var errors = response.getError();
                console.log(errors);
            }
        }));
        $A.enqueueAction(action);
    }

})