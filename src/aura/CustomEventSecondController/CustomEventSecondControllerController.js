({
    selectContactGreeting: function (component, event) {
        console.log(444);
        var greetingsName = event.getParam("greetingsName");
        console.log('value on event side ', greetingsName);

    }

})