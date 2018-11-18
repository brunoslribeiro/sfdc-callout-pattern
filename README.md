# Salesforce - Apex - Simple Designer Pattern - Callouts

This design pattern was thinking of Salesforce to improve the organization of external calls built on Apex. And it helped me out there to improve the simplicity of building a callout call.

## Example

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

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Authors

* **Bruno Smith Lopes Ribeiro** - bruno_smith10@hotmail.com
