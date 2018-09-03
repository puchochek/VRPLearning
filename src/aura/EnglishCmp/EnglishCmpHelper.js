({
    translateTheWord : function (component, wordToTranslate) {
        if (/\s/.test(wordToTranslate)) {
            var action = component.get('c.getTranslationPhrase');
            action.setParams({wordToTranslate : wordToTranslate});
            action.setCallback(this, $A.getCallback(function (response) {
                var state = response.getState();
                if (state === 'SUCCESS') {
                    var responseJSON = response.getReturnValue();
                    var responseObj = JSON.parse(responseJSON);
                    component.set('v.translation', responseObj.text);
                } else if (state === 'ERROR') {
                    var errors = response.getError();
                    console.log(errors);
                }
            }));
            $A.enqueueAction(action);
        } else {
            var action = component.get('c.getTranslationWord');
            action.setParams({wordToTranslate : wordToTranslate});
            action.setCallback(this, $A.getCallback(function (response) {
                var state = response.getState();
                if (state === 'SUCCESS') {
                    var responseJSON = response.getReturnValue();
                    var responseObj = JSON.parse(responseJSON);
                    var translations = [];
                    for (var i = 0; i < responseObj.def.length; i++) {
                         translations.push(responseObj.def[i].tr[0].text);
                     }
                     component.set('v.translation', translations);
                            } else if (state === 'ERROR') {
                                var errors = response.getError();
                                console.log(errors);
                            }
                        }));
                        $A.enqueueAction(action);
        }
    },

    saveTranslation : function (component, translation) {
        console.log('the translation is ' + translation);
        var action = component.get('c.saveTranslation');
                action.setParams({
                    translation : translation
                });
    },

})