/**
 * Created by User on 11.07.2018.
 */

public virtual class MyVirtualClass extends VirtualClass{

    public String newSTR;

    public String notOverridenMethod(String str) {
        System.debug('I dont want to be overiden ' + this.newSTR);
        return str;
}
    public override String someMethod(String str) {
        System.debug('I wont use ' + str);
        return str;
    }
}