/**
 * Created by User on 10.07.2018.
 */

public  class MyAbstractClass extends SomeAbstractClass{

    public String myString;

    public String someStringAction(String myString){
        this.myString = myString;
        System.debug(this.myString);
        System.debug(myString);
        return myString;
    }

    public String someOtherStringAction(String myString){
        this.myString = myString;
        System.debug(this.myString);
        System.debug(myString);
        return myString;
    }

    public override void someNewAction() {
        this.myString = 'New string';
        System.debug(myString);
        System.debug('Hi there again ');
    }



}