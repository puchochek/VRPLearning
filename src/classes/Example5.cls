/**
 * Created by User on 20.08.2018.
 */
public class Example5 {
    public static void func() {
        list<contact> list1 = [select id,name,phone, email from contact];
        list<contact> list1new = new list<contact>();
        for(contact c: list1)
        {
            Boolean f = false;
            integer i = 0;
            for(i=0;i<list1new.size();i++)
            {
                if(c.Name == list1new[i].Name){f=true;}

            }
            if(f!=true)
            {
                list1new.add(c);
            }
        }
        delete list1new;
        list<lead> list2 = [select id,name,phone, email,title from Lead];
        list<lead> list2new = new list<lead>();
        for(lead c: list2)
        {
            Boolean f = false;
            integer i = 0;
            for(i=0;i<list2new.size();i++)
            {
                if(c.Name == list2new[i].Name){f=true;}

            }
            if(f!=true)
            {
                list2new.add(c);
            }
        }
        delete list2new;
    }
}