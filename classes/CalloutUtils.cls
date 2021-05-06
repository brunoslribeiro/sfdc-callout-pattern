public virtual class CalloutUtils {
	public class CalloutUtilsException extends Exception {}
            
    public HttpRequest request;
    public Http httpInstance;
    public HttpResponse response;     	
    
    private String method;
    private String endpoint;
    private String body;
    private Integer timeout;
    private Map<String,String> headers;
    private Map<String,List<String>> parameters;
    private Map<String,List<String>> parametersBody;
    
    public CalloutUtils(){		
        response = new HttpResponse();
        httpInstance = new Http(); 
        headers = new Map<String,String>();
        parameters = new Map<String,List<String>>();
        parametersBody = new Map<String,List<String>>();
    }
    
    public virtual CalloutUtils endPoint(String endpoint){
        this.endPoint = endpoint;
        return this;
    }
    
    public virtual CalloutUtils body(String body){
        this.body = body;
        return this;
    }
    
    public virtual CalloutUtils bodyToJson(Object o){
        this.body = JSON.serialize(o);
        return this;
    }
       
    public virtual CalloutUtils timeout(Integer timeout){
        this.timeout = timeout;
        return this;
    }
    
    public virtual CalloutUtils addHeader(String key, String body){
        this.headers.put(key,body);
        return this;
    }
    
    public virtual CalloutUtils method(String method){
        this.method = method;
        return this;
    }
    
    public virtual CalloutUtils addHeader(Map<String,String> collectionHeaders){
        for( String header : collectionHeaders.keySet() ) {                        
            this.headers.put(header,collectionHeaders.get(header));
        }               
        return this;
    }
    
    public virtual CalloutUtils addParameter(String key,String value){
        
        if( parameters.get(key) == null ) {
            parameters.put(key,  new List<String>() );
        }
        
        parameters.get(key).add(value);
        
        return this;
    }

    public virtual CalloutUtils addParameterBody(Map<String,List<String>> collectionParameters){
        for(String parameter : collectionParameters.keySet() ) {                        
            this.parametersBody.put(parameter,collectionParameters.get(parameter));
        }               
        return this;
    }

    public virtual CalloutUtils addParameterBody(String key,String value){
       if(parametersBody.get(key) == null ) {
           parametersBody.put(key,  new List<String>());
        }
        
        parametersBody.get(key).add(value);
        return this;
    }
    
    public virtual CalloutUtils addParameter(Map<String,List<String>> collectionParameters){
        for(String parameter : collectionParameters.keySet() ) {                        
            this.parameters.put(parameter,collectionParameters.get(parameter));
        }               
        return this;
    }
    
    public virtual String buildParameter(String key, List<String> values){        
        String parameter = '';
        Integer count = 0;        
        for(String value : values){
            count++;
            parameter += value;
            parameter += (count == values.size()) ? '' : ',';
        }
        return parameter;
    }

    private virtual String buildStringParameter(String value,Map<String,List<String>> parameters){
        Integer count = 0;  
        for(String key : parameters.keySet() ) {                                                                 
            if(count==0){
                value += key + '=' + buildParameter(key,parameters.get(key));    
            }else{
                value += '&' + key + '=' + buildParameter(key,parameters.get(key));    
            }
            count++;                
        }
        
        return value;
    }
        
    public virtual String buildQueryStringParameter(){
        
        String queryString = this.endpoint;
                
        if(!parameters.isEmpty()){
            queryString  += '?';        
            queryString = buildStringParameter(queryString,parameters);
        }   
              
        return queryString;
    }

    public virtual String buildBodyParameter(){
        
        String bodyParameters = '';
                 
        if(!parametersBody.isEmpty()){
            bodyParameters = buildStringParameter(bodyParameters,parametersBody);
        }   
              
        return bodyParameters;
    }

    public virtual CalloutUtils builder(){
        if(!String.isNotBlank(this.method) || String.isEmpty(this.method)){
		  throw new CalloutUtilsException('Method not found!');           
        }
		
        if(!String.isNotBlank(this.endpoint) || String.isEmpty(this.endpoint)){
		  throw new CalloutUtilsException('Endpoint not found!');           
        }
        
        if(this.timeout!=null && this.timeout > 120000){
		  throw new CalloutUtilsException('Timeout maximum exceeded!');           
		}
                      	        
        this.request = new HttpRequest();              
        this.request.setEndpoint(this.endpoint);      
        this.request.setMethod(this.method);      
        
        if(this.body!=null){
        	this.request.setBody(this.body);
        }
              
        if(this.timeout!=null){
        	this.request.setTimeout(this.timeout);
        }
                       
        if(!headers.isEmpty())        {
            for(String header : headers.keySet() ) {                        
                request.setHeader( header , headers.get( header ) );
            }
        }  
        
        if(!parameters.isEmpty()){
            this.request.setEndpoint(buildQueryStringParameter());
        }

        if(!parametersBody.isEmpty()){
            this.request.setBody(buildBodyParameter());
        }
                        
        return this;
    }
    
    public virtual HttpResponse send() {               
        try {       
            this.builder();
            response = httpInstance.send(this.request);             
        } catch(CalloutUtilsException ex) {
            throw new CalloutUtilsException(ex.getMessage());    
        }
        return response;
    }
}