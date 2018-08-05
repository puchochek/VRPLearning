({
    handleSelectedDate : function (component, selectedDate) {
        console.log('This Helper works');

        var action = component.get('c.getCurrencey');
        action.setParams({currentDate : selectedDate});
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === 'SUCCESS') {
                var responseJSON = response.getReturnValue();
                var responseObj = JSON.parse(responseJSON);
                component.set('v.myCurrencey', responseObj);

                var opts = [];
                for (var i = 0; i < responseObj.length; i++) {
                    opts.push({
                        class: "optionClass",
                        label: responseObj[i].Cur_Abbreviation,
                        value: responseObj[i].Cur_Abbreviation
                    });
                }

                opts.push({
                    class: "optionClass",
                    label: "--- None ---",
                    value: "none"
                });

                console.log('opts', opts);
                component.set('v.options', opts);

            } else if (state === 'ERROR') {
                var errors = response.getError();
            }
        }));
        $A.enqueueAction(action);
    }
})