global class ContactSchedulerClass implements Schedulable {
    global void execute(SchedulableContext sc){
        ContactBatchClass c = new ContactBatchClass();
        Database.executeBatch(c);
    }
}