-module(resource_evercookie_postback).

%% Handle evercookie.js sniffing.
%% Successive reports are broadcasted via z_notifier: {evercookie_id, Id} where Id is string like "asdasdasd123123".

-export([event/2]).

%% @doc receive evercookie from js and make broadcast notification if all ok
event({postback, cookie, _TriggerId, _TargetId}, Context) ->
    CookieValue = z_context:get_q("cookie", Context),
    case mod_evercookie:get_id(CookieValue, Context) of
	{ok, Id} -> 
	    %% all ok - send async broadcast
	    z_notifier:notify({evercookie_id, Id}, Context);

	_ -> ok
    end,
    Context.
