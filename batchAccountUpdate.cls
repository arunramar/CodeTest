global class batchAccountUpdate implements Database.Batchable<sObject>, Database.Stateful {

    private String strParameter;
    private String strValue;
    
    public batchAccountUpdate(String strParam, String strVal){
        strParameter = strParam;
        strValue = strVal;
    }
	global Database.QueryLocator start(Database.BatchableContext bc) {
	
		String query ='SELECT Id, '+ strParameter + ' FROM Account';
		return Database.getQueryLocator(query);
	}
	
	global void execute(Database.BatchableContext BC, List<Account> accList){
		
		for (Account acc: accList){
            
                if (acc.get(strParameter) == null){
                acc.put(strParameter, strValue);
            }
            
		}
        try{
            update accList;
        }catch(Exception e){
            System.debug(e);
        }
	}
    
    global void finish (Database.BatchableContext BC){
        
    }


}