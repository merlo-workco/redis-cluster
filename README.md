# Redis cluster docker image
Redis cluster docker image is a cluste enabled image for container technology.

## Quick start
The redis has two types, redis-server and redis-sentinel, to work in cluster. The redis-server is the main application for the memory cache service. The redis-sentinel act as a arbitrator to judge which redis-server is master for writing. When you run redis-master or redis-slave, the redis sentinel is also activated as well. The following commands for how to run the docker image in different type.

> NOTE: You can also use this image to work in standalone mode.

> NOTE: The quorun can be reference to the section of [redis sentinel website].

## Parameters
| Parameter             | Description                                                                                        |
|-----------------------|----------------------------------------------------------------------------------------------------|
| REDISPASSWORD         | The authentication for the redis access                                                            |
| STANDALONE            | The redis will act as a standalone cache server                                                    |
| ACT_MASTER            | The redis will act as a master for data write access in the cache cluster                          |
| ACT_SLAVE             | The redis will act as a slave for synchronizing data access in the cache cluster                   |
| ACT_SENTINEL          | The redis will perform judge to decide which redis server is master                                |
| REDIS_MASTER_HOSTNAME | The first connecting redis hostname or ip address, basically it is the redis master in the cluster |
| SENTINEL_QUORUM       | The quorum value defined in the redis sentinel                                                     |

## For non-swarm mode
#### Standalone
```sh
$ docker run -p 6379:6379 -p 26379:26379 --name redis-standalone -h redis-standalone -e STANDALONE=1 -e REDISPASSWORD=redispass wiarea/redis:3.0.7-alpine
```
#### Cluster-Master
```sh
$ docker run -p 6379:6379 -p 26379:26379 --name redis-master -h redis-master -e ACT_MASTER=1 -e REDISPASSWORD=redispass -e REDIS_MASTER_HOSTNAME=master_host_ip -e SENTINEL_QUORUM=quorum_num wiarea/redis:3.0.7-alpine
```
#### Cluster-Slave
```sh
$ docker run -p 6379:6379 -p 26379:26379 --name redis-slave -h redis-slave -e ACT_SLAVE=1 -e REDISPASSWORD=redispass -e REDIS_MASTER_HOSTNAME=master_host_ip -e SENTINEL_QUORUM=quorum_num wiarea/redis:3.0.7-alpine
```
#### Sentinel only
```sh
$ docker run -p 6379:6379 -p 26379:26379 --name redis-sentinel -h redis-sentinel -e ACT_SLAVE=1 -e REDIS_MASTER_HOSTNAME=master_host_ip -e SENTINEL_QUORUM=quorum_num wiarea/redis:3.0.7-alpine
```

  [redis sentinel website]: <http://redis.io/topics/sentinel>
