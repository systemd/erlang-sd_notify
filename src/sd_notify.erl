-module(sd_notify).

-export([sd_notify/2, sd_notifyf/3]).

-on_load(init/0).

-define(nif_stub, nif_stub_error(?LINE)).

nif_stub_error(Line) ->
	erlang:nif_error({nif_not_loaded,module,?MODULE,line,Line}).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

init() ->
	PrivDir = case code:priv_dir(?MODULE) of
			  {error, bad_name} ->
				  EbinDir = filename:dirname(code:which(?MODULE)),
				  AppPath = filename:dirname(EbinDir),
				  filename:join(AppPath, "priv");
			  Path ->
				  Path
		  end,
	erlang:load_nif(filename:join(PrivDir, ?MODULE) ++ "_drv", 0).

sd_notify(_, _) ->
	?nif_stub.

sd_notifyf(UnsetEnv, Format, Data) ->
	sd_notify(UnsetEnv, lists:flatten(io_lib:format(Format, Data))).

%% ===================================================================
%% EUnit tests
%% ===================================================================
-ifdef(TEST).

sd_notify_test() ->
	?assertEqual(ok, ok).

sd_notifyf_test() ->
	?assertEqual(ok, ok).

-endif.
