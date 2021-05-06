# Salesforce - Simple Apex Rest Callout Pattern

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://github.com/brunoslribeiro/salesforceapexcalloutsutils)

This design pattern was thinking of Salesforce to improve the organization of external calls built on Apex. And it helped me out there to improve the simplicity of building a callout call.

### Example
```apex
Map<String,List<String>> parameters = new Map<String,List<String>>();
Map<String,String> headers = new Map<String,String>();

parameters.put('parameter', new List<String>{'','','',''});                
headers.put('header', 'header');

CalloutUtils callout = new CalloutUtils();

callout
    .endPoint('http://www.google.com.br')        	      
    .method('POST')            
    .addHeader('Content-Type','application/json')
    .addParameter('parameter1','')
    .addParameter(parameters)
    .addHeader('header1','valueHeader')
    .addHeader(headers)
    .body('body')    
    .timeout(10000);

 HttpResponse res = callout.send();

```                                                                                                  
### Description of methods

```
endPoint(String endpoint) 
Specifies the endpoint for this request - Required
```

```
method(String method) 
Sets the type of method to be used for the HTTP request - Required 
(Examples:DELETE,GET,HEAD,POST,PUT,TRACE) - Required
```

```
addHeader(String key,String body) 
Adds a header in the request. 
```

```
addHeader(Map<String,List<String>> collectionHeaders)
Adds one or more header through the request.
```

```
addParameter(String key,String value)
Adds a parameter to the URL
Example:http://requesturl.com/myendpoint?key=value
```

```
addParameter(Map<String,List<String>> collectionParameters) 
Dynamically adds the parameters in the URL, respecting the other values ​​added.
Example:http://requesturl.com/myendpoint?key1=Apex,SFDC,Rest
```

```
addParameterBody(String key,String value)
Adds a parameter to the Body - Multipart Form Data
Example:Body:"key=value&key=value"
```

```
addParameterBody(Map<String,List<String>> collectionParameters) 
Dynamically adds the parameters in the Body, respecting the other values ​​added -  Multipart Form Data
Example:Body:"key1=Apex,SFDC,Rest"
```

```
body(String body)
Adds in the request body. (Example: String Json, String xml)
```

```
send()
Performs the construction and call of the requisition.
```

### Author
Bruno Smith Lopes Ribeiro - Salesforce Developer - bruno_smith10@hotmail.com

### Contributors
Allan Oricil - Salesforce Consultant

### Sources
https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_restful_http.htm
https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_restful_http_httprequest.htm#apex_classes_restful_http_httprequest
https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_restful_http_httpresponse.htm#apex_classes_restful_http_httpresponse
https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_restful_http_http.htm#apex_classes_restful_http_http

