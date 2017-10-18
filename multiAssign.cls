global class multiAssign
{
    public static void fakeMethod(){
        List <Account> acct = [SELECT Id FROM Account WHERE Name = 'test'];
        for(Account a : acct ){
            System.debug(a); 
        }
    }
    //Uncomment all to return to working order    
    
    webservice static void multiAssign(String acctId) // you can pass parameters //Make params String acctId
    { 
        
        //acctId = acctId; 
        String IMEIs; 
        List<Account> acct = [SELECT Name, Id, IMEIs_for_Assignment__c FROM Account WHERE Id =: acctId];
        for(Account a : acct){ 
          IMEIs = a.IMEIs_for_Assignment__c; 
          List<String> lstIMEIs = IMEIs.split('\r\n'); //replace with \r\n
            for(String s : lstIMEIs){
                
                List<Asset> asst = [SELECT Name, Status, AccountId FROM Asset WHERE Name =: s ];
                for(Asset b : asst){
                    b.AccountId = acctId; 
                    b.Status = 'Provisioned';
                    update b;
                }
            }
          //System.debug(lstIMEIs);
          //System.debug('List prints here');
        }         
      for(Account c : acct){ 
        c.IMEIs_for_Assignment__c = ''; 
        update c; 
      }
        
    }

}

                                                
 	Generate WSDLDownloadSecurityShow Dependencies

