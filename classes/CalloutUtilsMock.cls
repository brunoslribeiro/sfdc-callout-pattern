@isTest
global class CalloutUtilsMock implements HttpCalloutMock {
    
    global HTTPResponse respond(HTTPRequest req) {                     
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody('');
        res.setStatusCode(200);
        return res;
    }
}