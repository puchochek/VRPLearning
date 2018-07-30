public class AsyncAp implements Queueable{
    
    public void execute(QueueableContext context) {
        Contact cont = new Contact();
        cont.LastName = 'Lena';
        cont.Email = 'Lena@gmail.com';
        insert cont;
        System.debug('Inserted contact is ' + cont);
    }

}