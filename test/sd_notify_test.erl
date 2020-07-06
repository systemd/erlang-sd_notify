-module(sd_notify_test).

-include_lib("eunit/include/eunit.hrl").


sd_notify_test_() ->
	{ok, CWD} = file:get_cwd(),
	FakeNotifyUnixSockName = CWD ++ "/fake-sock-" ++ integer_to_list(erlang:phash2(make_ref())),
	{ok, FakeNotifyUnixSock} = gen_udp:open(0, [{ifaddr, {local, FakeNotifyUnixSockName}}, {active, false}, list]),
	os:putenv("NOTIFY_SOCKET", FakeNotifyUnixSockName),

	{setup,
		fun() -> ok end,
		fun(_) -> ok = gen_udp:close(FakeNotifyUnixSock), ok = file:delete(FakeNotifyUnixSockName)  end,
		[
			{
				"Try sending message",
				fun() ->
					TestMessage = integer_to_list(erlang:phash2(make_ref())),
					ok = sd_notify:sd_pid_notify_with_fds(0, 0, TestMessage, []),
					{ok, {_Address, _Port, Packet}} = gen_udp:recv(FakeNotifyUnixSock, length(TestMessage), 1000),
					?assertEqual(TestMessage, Packet)
				end
			}

		]

	}.
