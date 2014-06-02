#include "erl_nif.h"
#include <systemd/sd-daemon.h>

static ERL_NIF_TERM sd_notify_nif(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
	int unset_environment = 0;
	enif_get_int(env, argv[0], &unset_environment);

	unsigned int length = 0;
	enif_get_list_length(env, argv[1], &length);

	char* state = (char*)enif_alloc(++length);
	enif_get_string(env, argv[1], state, length, ERL_NIF_LATIN1);
	sd_notify(unset_environment, state);
	enif_free(state);

	return enif_make_atom(env, "ok");
}

static ErlNifFunc nif_funcs[] =
{
	{"sd_notify", 2, sd_notify_nif}
};

ERL_NIF_INIT(sd_notify, nif_funcs, NULL, NULL, NULL, NULL);
