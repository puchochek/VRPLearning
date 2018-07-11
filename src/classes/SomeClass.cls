/**
 * Created by User on 11.07.2018.
 */

public virtual class SomeClass {

    public String str;

    public virtual String someMethod(String str) {
        System.debug(str);
        return str;
    }
}