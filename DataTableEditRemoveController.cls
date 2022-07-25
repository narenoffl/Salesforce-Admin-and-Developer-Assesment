public class DataTableEditRemoveController {

public List<Account> accs { get; set; }
public String delId { get; set; }


public DataTableEditRemoveController() {
//load account data into our DataTable
LoadData();
}

private void LoadData() {
accs = [Select id, name, BillingStreet, BillingCity, BillingPostalCode, BillingCountry from Account limit 20];
}

public void DeleteAccount(){
    system.debug('delId' + delId);
 Account acc = [select id,Name from account where Id =:delId];
if (acc != null) {
Delete acc;
    LoadData();
}
}


}