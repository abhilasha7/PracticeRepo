public class treenodess {

    public Id detailRecordId {get; set;}
    Public List<cNodes> hierarchy;
    
    /* Wrapper class to contain the nodes and their children */
    public class cNodes
    {
         public List<Contact> parent {get; set;}
         public Account gparent {get;set;}
         public Id gparentId {get;set;}
         public Id parentId {get;set;}
    
         public cNodes(Account  gp, List<Contact> p)
         {
             parent = p;
             gparent = gp;
             
         }
    }
    /* end of Wrapper class */ 

    Public List<cNodes> getmainnodes()
    {
        hierarchy = new List<cNodes>();
        List<Account> tempparent = [Select Id,Name from Account];
        for (Integer i =0; i< tempparent.size() ; i++)
        {
            List<Contact> tempchildren = [Select Id,FirstName,LastName,(Select Id,CaseNumber,Subject from Cases) from Contact where AccountId = :tempparent[i].Id];
            hierarchy.add(new cNodes(tempparent[i],tempchildren));
         }   
        return hierarchy;
    } 
    
  
}