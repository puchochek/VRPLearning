/**
 * Created by User on 11.07.2018.
 */

public virtual class VirtualClass {

    public String str;

    public virtual String someMethod(String str) {
        //some logic
        System.debug('I can use ' + str);
        return str;
    }

    public void notOverridedMethod(){
        System.debug('I am here');
    }


}