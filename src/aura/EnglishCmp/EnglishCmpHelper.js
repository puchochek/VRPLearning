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
                //console.log('response ' + responseJSON);
                console.log(responseObj);
                console.log('000', responseObj.def.length);
                var translations = [];
                for (var i = 0; i < responseObj.def.length; i++) {
                    //console.log('666', responseObj.def.tr[i].length);
                    console.log('777', responseObj.def[i].tr[0].text);
                    translations.push(responseObj.def[i].tr[0].text);

                }
                console.log('111', translations);
                component.set('v.translation', translations);
            } else if (state === 'ERROR') {
                var errors = response.getError();
                console.log(errors);
            }
        }));
        $A.enqueueAction(action);
    }

})