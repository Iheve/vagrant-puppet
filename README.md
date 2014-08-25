# Vagrant-Puppet

This is a Vragant based test environment for Puppet.

To use it, please run `vagrant up`

It brings up:

* A puppet master
* A puppetDB (with puppet board)
* An nginx load-balancer
* A few back-end apache2 web servers


## Provisioning

After the virtual machine start up, it runs a script that :

* Append the hostfile a few hostname keys to enable master-agent communication
* Install puppet
* Copy the configuration tree at the root `/`
* Run the puppet agent

On the puppet master, an other script is ran. It does the same thing, plus :

* Install the puppet server
* Download all the modules

## Testing

After running a vagrant up, run `echo "127.0.0.1 appli" >> /etc/hosts`.
You will then be able to access [http://appli:8080/]() and reach your back-ends
through the nginx load-balancer.

Run  `echo "127.0.0.1 pboard" >> /etc/hosts`. You will be able to reach the
puppet board at [http://pboard:8081/]()

## Nginx auto-configuration

Puppet installs [Serf](http://www.serfdom.io/) on all the nodes.

Serf will take care of the configuration of the load balancer:

* It will add an entry to the upstream when a node boots up.
* It will remove this entry when the node fail.

## Update puppet configuration

After you change the configuration tree, you might want the puppet master to
take into account the changes. To do so without re-installing the virtual
machine, you can run `./up`

## Puppet test

To run a puppet test on any machine, you can run `./pt machine1 machine2
machine3 ...`
