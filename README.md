# arc-ansible
Ansible playbook for ARC installation


# Variables controlling the playbook

You find the variables in group_vars/all file. 



## General variables 

### domain
Domain name of the ARC server

Example: 

```
domain: "cern-test.uiocloud.no"
```


Note: Should be extracted automatically from the server creation scripts. 


### default_user
This is the default user on the ARC server


Example: 


```
default_user: 
   user: "almalinux"
   group: "almalinux"

```

If the group-name is different than the user-name - it must be specified


Note: Should be extracted automatically from the server creation scripts. 

### submit_user
What user submits the batch system job. 

Example: 

```
default_user: 
   user: "slurm"
   group: "slurm"
```



If the group-name is different than the user-name - it must be specified

Note: Should be extracted automatically from the server creation scripts. 

### nordugrid_os_dir

The os type of the ARC server. Used to point to the correct Nordugrid repo. 

Accepted values are: "centos/centos-stream/rocky/fedora/debian/ubuntu"

If `almalinux` - use `rocky` 

Note: Should in some way be extracted automatically from the server creation scripts. But needs some sanitasion to match the Nordugrid repo names. 

### nordugrid_os_v
The os version of the ARC server. Used to point to the correct Nordugrid repo. 

Accepted values are found here: http://www.nordugrid.org/arc/arc7/common/repos/repository.html

### nordugrid_release_v
This is the release version of the Nordugrid release package. 

Typically 6.1 is the correct value for ARC 7. 


### site_type

This is a flag to trigger installation of ARC runtime environments needed for specific experiments. 
If you do not know what this means, select the ```default``` type

### arc_branch

What repo branch should ARC be of. The current released branch is "master", while the next upcoming major release can be found in "next". Currently ARC 7 is not yet released, and is in the "next" branch. Select this. 

Example: 

```
arc_branch: "next"
```

### use_repo
What Nordugrid repo to install from. 

Accepted values: 
- nordugrid - The default Nordugrid release repo 
- nordugrid-testing - The release candidate release repo 
- nordugrid-nightly - Nightly build repo


Before ARC 7 is released, use either nordugrid-testing or nordugrid-nightly. nordugrid-testing will be more stable than nordugrid-nightly


## Variables used to build the ARC configuration file `/etc/arc.conf`

### remotedelivery
Should ARC have a stand-alone remote data delivery server. 

http://www.nordugrid.org/arc/arc7/admins/reference.html#deliveryservice

Accepted values "yes", "no"


### scratchdir
If the compute nodes have a scratch directory, add the path here. If not leave string empty. 

http://www.nordugrid.org/arc/arc7/admins/reference.html#scratchdir


### lrms
What batch system you have. If no batch system connected, use "fork". 

Allowed values, see: http://www.nordugrid.org/arc/arc7/admins/reference.html#lrms


### controldir
ARCs job directory - storing all meta-data files related to a job. Local directory to the ARC server. 

If empty, ARC will use the default value "/var/spool/arc/jobstatus"

http://www.nordugrid.org/arc/arc7/admins/reference.html#controldir

### runtimedir
What directory to use for user-defined runtime environments. 

If left empty, no user-defined runtime directory will be created

http://www.nordugrid.org/arc/arc7/admins/reference.html#runtimedir

### sessionbasename
This variable is used to build a set of session directory folder names. 

The sessiondir is ususally an existing shared filesystem that all compute nodes have access to. 

Example results: session01, session02 etc. 

Example: 
```
sessionbasename: "session"
```


http://www.nordugrid.org/arc/arc7/admins/reference.html#sessiondir

### cachebasename
Similar as sessiondir. 

http://www.nordugrid.org/arc/arc7/admins/reference.html#cachedir


### queues
A list of batch system queues. If SLURM batch system, this is equivalent to the partition name(s). If fork, any uniqe string. Multivalued. 

http://www.nordugrid.org/arc/arc7/admins/reference.html#queue-name-block


Example: 
```
queues: 
  - main
```

### hepspec
If you have benchmarked your servers, add the value here. The values must be in HEPSPEC06 value. If you do not have this, leave the parameter empty. 

Example: 

```hepspec: 14.998```

