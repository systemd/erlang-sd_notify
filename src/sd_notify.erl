%%%----------------------------------------------------------------------
%%% This is the MIT license.
%%%
%%% Copyright (c) 2014 Peter Lemenkov <lemenkov@gmail.com>
%%%
%%% Permission is hereby granted, free of charge, to any person
%%% obtaining a copy of this software and associated documentation
%%% files (the "Software"), to deal in the Software without
%%% restriction, including without limitation the rights to use,
%%% copy, modify, merge, publish, distribute, sublicense, and/or sell
%%% copies of the Software, and to permit persons to whom the
%%% Software is furnished to do so, subject to the following
%%% conditions:
%%%
%%% The above copyright notice and this permission notice shall be
%%% included in all copies or substantial portions of the Software.
%%%
%%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
%%% EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
%%% OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
%%% NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
%%% HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
%%% WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
%%% FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
%%% OTHER DEALINGS IN THE SOFTWARE.
%%%----------------------------------------------------------------------

-module(sd_notify).

-export([sd_notify/2, sd_notifyf/3, sd_pid_notify/3, sd_pid_notifyf/4, sd_pid_notify_with_fds/4]).

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

sd_notify(UnsetEnv, Data) ->
	sd_pid_notify_with_fds(0, UnsetEnv, Data, []).

sd_pid_notify(Pid, UnsetEnv, Data) ->
	sd_pid_notify_with_fds(Pid, UnsetEnv, Data, []).

sd_notifyf(UnsetEnv, Format, Data) ->
	sd_pid_notify_with_fds(0, UnsetEnv, lists:flatten(io_lib:format(Format, Data)), []).

sd_pid_notifyf(Pid, UnsetEnv, Format, Data) ->
	sd_pid_notify_with_fds(Pid, UnsetEnv, lists:flatten(io_lib:format(Format, Data)), []).

sd_pid_notify_with_fds(_, _, _, _) ->
	?nif_stub.

%% ===================================================================
%% EUnit tests
%% ===================================================================
-ifdef(TEST).

sd_notify_test() ->
	?assertEqual(ok, ok). 

sd_notifyf_test() ->
	?assertEqual(ok, ok).

-endif.
