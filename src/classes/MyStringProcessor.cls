/**
 * Created by Lena on 09.07.18.
 */
public  class MyStringProcessor implements StringProcessor{
   // public String str;


    public String addPrefix (String str) {
        //this.str = 'Hello';
        //System.debug(this.str);
        System.debug(str);

        //System.debug('Here is some prefix. ' + str);
        return 'Here is some prefix. ' + str;
    }

    public String addPostfix (String str){
//        this.str = str;
        //System.debug(str + ' Here is some postfix.');
        return str + ' Here is some postfix.';
    }

    public String removeWhitespaces (String str){
//        this.str = str;
        //System.debug(str.deleteWhitespace() + ' There are no whitespaces anymore');
        return str.deleteWhitespace() + ' There are no whitespaces anymore';
    }
    public void  updateList (List<String> testList, List<String> resultList) {

        for (String testString : testList) {
//
            resultList.add(addPrefix(testString));
            // resultList.add(addPostfix(testString));
            // resultList.add(removeWhitespaces(testString));
        }
        //System.debug(resultList);
    }


}