/**
 * Created by User on 11.07.2018.
 */

public with sharing class SomeNewClass extends SomeClass{


    public override String someMethod(String str) {
        System.debug(str + 'I am overrided');
        return str;
    }


}