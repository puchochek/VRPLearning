({

    init : function(component, event, helper) {
        console.log('init works');
        helper.handleSelectedDate(component);
    },

    onDateChange : function(component, event, helper) {
        console.log('Controller works');

        var selectedDate = component.get("v.date");
        if (!selectedDate) {
            alert('Select a date');
        }

        helper.handleSelectedDate(component, selectedDate);

        component.set('v.columns', [
            {label: 'Abbreviation', fieldName: 'Cur_Abbreviation', type: 'text'},
            {label: 'Name', fieldName: 'Cur_Name', type: 'text'},
            {label: 'Rate', fieldName: 'Cur_OfficialRate', type: 'number'}
        ]);
    },

    toBLR : function (component, event, helper) {
        console.log('Button works');
        var selectedValue = component.get("v.selectedOptionValue");
        var selectedNumber = component.get("v.inputValue");
        var totalValue = component.get("v.myCurrencey");
        var getCurRate;
        for (var i = 0; i < totalValue.length; i++) {
            if (totalValue[i].Cur_Abbreviation == selectedValue) {
                getCurRate = totalValue[i].Cur_OfficialRate;
            }
        }
        var resultValue = selectedNumber * getCurRate;
        component.set('v.countRate', resultValue);
    },

    toSelectedCur : function (component, event, helper) {
        var selectedNumber = component.get("v.inputValue");
        var totalValue = component.get("v.myCurrencey");
        var firstSelectedValue = component.get("v.selectedOptionValue");
        var secondSelectedValue = component.get("v.selectedSecondOptionValue");
        var totalValue = component.get("v.myCurrencey");
        console.log(totalValue);
        var currencToCountFirst;
        for (var i = 0; i < totalValue.length; i++) {
            if (totalValue[i].Cur_Abbreviation == firstSelectedValue) {
                currencToCountFirst = totalValue[i].Cur_OfficialRate;
            }
        }
        var currencToCountSecond;
        for (var i = 0; i < totalValue.length; i++) {
            if (totalValue[i].Cur_Abbreviation == secondSelectedValue) {
                currencToCountSecond = totalValue[i].Cur_OfficialRate;
            }
        }
        var resultValue = (selectedNumber * currencToCountFirst)/currencToCountSecond;
        console.log(resultValue);
        component.set('v.countRate', resultValue);
    }

})