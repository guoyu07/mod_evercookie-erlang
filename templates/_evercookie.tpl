<script type="text/javascript">
  
  var _cookievalue = '{{ m.evercookie.new }}';
  var _ecname = 'z_ec';
  
  var _evercookie_png_resource = '{% url evercookie_png %}';
  var _evercookie_cache_resource = '{% url evercookie_cache %}';
  var _evercookie_etag_resource = '{% url evercookie_etag %}';
  var _evercookie_hidtory_resource = '{% url evercookie_history %}'
  
  var ec = new evercookie();
  
  //ec.set(_cookiename, '');
  
  
  ec.get(_ecname, function(best, all) {
    
    if( !best )
    {
      ec.set(_ecname, _cookievalue);
    }else
    {
      noTriggerValue = false;
      triggerID = '';
      extraParams = new Array({'name':'cookie',	'value': best});
      z_queue_postback(triggerID, '{% custom_postback postback="cookie" delegate="resource_evercookie_postback" %}', extraParams, noTriggerValue);
    }
    
  });
  
</script>
