({
    render : function(cmp, helper) {
        console.log('Render works');
        confirm("This page shows contacts with '%A' Name");
        return this.superRender();
    },

    rerender : function(cmp, helper){
            var aftr = cmp.get("v.eventMessage");
            cmp.set("v.rerenderMessage", "Rerender is finished first time. So now we can see " +  aftr);
            console.log('Rerender works');
           return this.superRerender();
        },

//        rerender : function(cmp, helper){
//                    var aftr = cmp.get("v.eventMessage");
//                    cmp.set("v.rerenderMessage", "Rerender is finished first time. So now we can see " );
//                    console.log('Rerender works');
//                   return this.superRerender();
//                },

     afterRender : function(cmp, helper, event){
            cmp.set("v.afterMessage", "Afterrender is finished");
            console.log("AfterRender works");
            return this.superAfterRender();
        },

})