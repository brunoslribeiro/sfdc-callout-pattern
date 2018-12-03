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
### Author
Bruno Smith Lopes Ribeiro - Salesforce Developer - bruno_smith10@hotmail.com

### Contributors
Allan Oricil - Salesforce Consultant

### Sources
https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_restful_http.htm
https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_restful_http_httprequest.htm#apex_classes_restful_http_httprequest
https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_restful_http_httpresponse.htm#apex_classes_restful_http_httpresponse
https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_restful_http_http.htm#apex_classes_restful_http_http

