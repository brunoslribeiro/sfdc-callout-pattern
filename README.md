# Salesforce - Apex - Simple Designer Pattern - Callouts

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

This design pattern was thinking of Salesforce to improve the organization of external calls built on Apex. And it helped me out there to improve the simplicity of building a callout call.

### Example
```apex
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

callout.send();

```
### Author
Bruno Smith Lopes Ribeiro - Salesforce Developer - bruno_smith10@hotmail.com

### Contributors
Allan Oricil - Salesforce Consultant
