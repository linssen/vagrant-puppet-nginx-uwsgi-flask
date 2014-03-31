A puppet setup for a Flask app
==============================================================================

The Vagrant file currently specifies VMWare Fusion as the provider, but that's
easily changed.

```bash
    # Bring the box up
    vagrant up
    # Provision with
    vagrant provision
```

Site should then be available over port 8080 at `http://localhost:8080/`.

## TODO:

- [ ] Fix dependencies on current infrastructure like Vagrant #4
- [ ] Move Python deps into a virtualenv (_maybe_) #1
- [ ] Varnish #3
- [ ] Postgres #2
