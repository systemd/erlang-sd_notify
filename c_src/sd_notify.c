/*
This is the MIT license.

Copyright (c) 2014 Peter Lemenkov <lemenkov@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this
software and associated documentation files (the "Software"), to deal in the Software
without restriction, including without limitation the rights to use, copy, modify,
merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be included in all copies
or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#include "erl_nif.h"
#include <systemd/sd-daemon.h>

static int upgrade(ErlNifEnv* env, void** priv, void** old_priv, ERL_NIF_TERM load_info)
{
	return 0;
}

static ERL_NIF_TERM sd_pid_notify_with_fds_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
	ERL_NIF_TERM head, tail;
	unsigned int length = 0;

	pid_t pid = 0;
	enif_get_int(env, argv[0], &pid);

	int unset_environment = 0;
	enif_get_int(env, argv[1], &unset_environment);

	enif_get_list_length(env, argv[2], &length);
	char* state = (char*)enif_alloc(++length);
	enif_get_string(env, argv[2], state, length, ERL_NIF_LATIN1);

	enif_get_list_length(env, argv[3], &length);
	int* fds = (int*)enif_alloc(length * sizeof(int));
	ERL_NIF_TERM list = argv[3];
	int i = 0;
	while(enif_get_list_cell(env, list, &head, &tail)) {
		enif_get_int(env, head, &fds[i]);
		i++;
		list = tail;
	}
	int result = sd_pid_notify_with_fds(pid, unset_environment, state, fds, length);

	enif_free(fds);
	enif_free(state);

	return enif_make_int(env, result);
}


static ErlNifFunc nif_funcs[] =
{
	{"sd_pid_notify_with_fds", 4, sd_pid_notify_with_fds_nif},

};

// Initialize this NIF library.
//
// Args: (MODULE, ErlNifFunc funcs[], load, reload, upgrade, unload)
// Docs: http://erlang.org/doc/man/erl_nif.html#ERL_NIF_INIT

ERL_NIF_INIT(sd_notify, nif_funcs, NULL, NULL, &upgrade, NULL);
