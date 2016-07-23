A puppet setup for a Flask app
==============================================================================
    
    ```bash
        # Bring the box up
        vagrant up
        # Provision with
        vagrant provision
    ```

    Site should then be available over port 8080 at `http://localhost:8080/`.

##Features:
3 apps and a set up tool...
    

## TODO:

- [x] Fix dependencies on current infrastructure like Vagrant #4.
- [ ] Move Python deps into a virtualenv (_maybe_) #1.
- [ ] Varnish #3.
- [ ] Postgres #2.
- [ ] SSL.
- [ ] UNIX Sockets  https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-uwsgi-and-nginx-on-ubuntu-14-04#configuring-nginx-to-proxy-requests.
- [ ] Load balancer config??
- [ ] admin gui.
- [ ] market place for (code,config scripts, bootstrap themes, server space)??
