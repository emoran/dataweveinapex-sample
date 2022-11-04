public class RestServiceConsumerDW {
    
    public static void consume(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://techcrunch.com/wp-json/wp/v2/posts?per_page=2&context=embed');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            

            Map<String, Object> parameters = new Map<String, Object>();
            parameters.put('incomingJson', response.getBody());
            Dataweave.Script script = Dataweave.Script.createScript(
                'json2sObjects'
            );
            DataWeave.Result result = script.execute(parameters);
            System.debug('DW RESPONSE: '+ result.getValueAsString());
           
            List<Lead> lead = (List<Lead>)JSON.deserializeUntyped(result.getValueAsString());

            System.debug('lead: '+lead);

           
        }
    }
}
