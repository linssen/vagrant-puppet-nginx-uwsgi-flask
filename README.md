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
3 apps and a setup tool...


## TODO:

- [x] Fix dependencies on current infrastructure like Vagrant #4.
- [ ] Move Python deps into a [virtualenv](http://www.markbetz.net/2014/01/17/python-if-you-have-docker-do-you-need-virtualenv/#div-comment-28954) and config puppet for both vagrant and [(docker so we can benifit from unix scokets)](http://unix.stackexchange.com/questions/279543/unix-domain-socket-with-vm#answer-279571) 

- [ ] databace install selector (Postgres work horse dev time longer) or (tinyDB lightweight barebone quary, no filter ect..)
- [ ] SSL encryption and admin gui to set keys and certs
- [ ] [UNIX Sockets]( https://www.digitalocean.com/community/tutorials/how-to-serve-flask-applications-with-uwsgi-and-nginx-on-ubuntu-14-04#configuring-nginx-to-proxy-requests.)
- [ ] Load balancer config??
- [ ] Varnish based admin gui #3.

## usefull links:
    looking for docker flavor? 
    [apache-flask](https://github.com/muneeb-ali/apache-flask)
    uses apache and docker to acheave what we are doing here... This method provides more secerity and needs more system resources whill a bit less migration options... 
