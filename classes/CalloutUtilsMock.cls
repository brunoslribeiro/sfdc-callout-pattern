@isTest
public class CalloutUtilsTst {
	
    @isTest 
    public static void testExecutionCalloutsUtilsSuccess(){
        
   	 	CalloutUtils callout = new CalloutUtils();
        Test.setMock(HttpCalloutMock.class, new CalloutUtilsMock());
		
		Map<String,List<String>> parameters = new Map<String,List<String>>();
        Map<String,String> headers = new Map<String,String>();
        
        parameters.put('parameter', new List<String>{'','','',''});                
        headers.put('header', 'header');
        
        callout
            .endPoint('http://www.google.com.br')        	      
            .method('POST')            
            .addHeader('Content-Type','application/json')
            .addParameter('parameter1','')
            .addParameter(parameters)
            .addHeader('header1','valueHeader')
            .addHeader(headers)
            .body('body')
            .bodyToJson('')
            .timeout(10000);
        
        System.Test.startTest();
        callout.send();
        System.Test.stopTest();
                
    }
       
}