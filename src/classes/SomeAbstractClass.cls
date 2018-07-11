/**
 * Created by User on 10.07.2018.
 */

public abstract class SomeAbstractClass {

    public void someAction() {
        System.debug('Hi there ');
    }

    public abstract void someAbstractAction();

    public virtual void someNewAction() {
        System.debug('Hi there ');
    }

//    public void randomMethod(){
//        System.debug('I make some random logic');
//    }
}