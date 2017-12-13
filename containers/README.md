# Containers #

## In this section ##

* Check versions of our docker cli and engine
* Create a Nginx (web server) container
* Learn common container management commands
* Learn Docker networking basics

## Check versions of our docker cli and engine ##

In terminal run please the following:

    docker version

The result should be something like the following:

    Client:
     Version:      17.09.1-ce
     API version:  1.32
     Go version:   go1.8.3
     Git commit:   19e2cf6
     Built:        Thu Dec  7 22:22:25 2017
     OS/Arch:      darwin/amd64

    Server:
     Version:      17.09.1-ce
     API version:  1.32 (minimum version 1.12)
     Go version:   go1.8.3
     Git commit:   19e2cf6
     Built:        Thu Dec  7 22:28:28 2017
     OS/Arch:      linux/amd64
     Experimental: true

Then run

    docker info

the output should be like

    Containers: 23
     Running: 6
     Paused: 0
     Stopped: 17
    Images: 9
    Server Version: 17.09.1-ce
    Storage Driver: overlay2
     Backing Filesystem: extfs
     Supports d_type: true
     Native Overlay Diff: true
    Logging Driver: json-file
    Cgroup Driver: cgroupfs
    Plugins:
     Volume: local
     Network: bridge host ipvlan macvlan null overlay
     Log: awslogs fluentd gcplogs gelf journald json-file logentries splunk syslog
    Swarm: active
     NodeID: yzf8h281sxzg0an8yahf2sqqe
     Is Manager: true
     ClusterID: hojfz8p4d0cs94sfecpzocb1c
     Managers: 1
     Nodes: 1
     Orchestration:
      Task History Retention Limit: 5
     Raft:
      Snapshot Interval: 10000
      Number of Old Snapshots to Retain: 0
      Heartbeat Tick: 1
      Election Tick: 3
     Dispatcher:
      Heartbeat Period: 5 seconds
     CA Configuration:
      Expiry Duration: 3 months
      Force Rotate: 0
     Autolock Managers: false
     Root Rotation In Progress: false
     Node Address: 192.168.65.2
     Manager Addresses:
      192.168.65.2:2377
    Runtimes: runc
    Default Runtime: runc
    Init Binary: docker-init
    containerd version: 06b9cb35161009dcb7123345749fef02f7cea8e0
    runc version: 3f2f8b84a77f73d38244dd690525642a72156c64
    init version: 949e6fa
    Security Options:
     seccomp
      Profile: default
    Kernel Version: 4.9.49-moby
    Operating System: Alpine Linux v3.5
    OSType: linux
    Architecture: x86_64
    CPUs: 4
    Total Memory: 1.952GiB
    Name: moby
    ID: SVJM:O7AT:Y6DU:SXWP:4HNI:WKE5:XNEA:RNXB:7TCB:YHVG:QP6J:EB7A
    Docker Root Dir: /var/lib/docker
    Debug Mode (client): false
    Debug Mode (server): true
     File Descriptors: 85
     Goroutines: 227
     System Time: 2017-12-13T12:54:30.2945172Z
     EventsListeners: 7
    Registry: https://index.docker.io/v1/
    Experimental: true
    Insecure Registries:
     127.0.0.0/8
    Live Restore Enabled: false

TODO

| Navigation               |
| ------------------------ |
| [Level up](../README.md) |
