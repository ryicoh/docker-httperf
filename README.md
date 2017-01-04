# docker-httperf

- usage: 
<https://github.com/httperf/httperf>

```
docker run -ti --rm \
       -v /var/log/httperf:/var/log/httperf \
       quay.io/alaska/httperf \
       httperf \
       --server blazedemo.com \
       --num-conns 100
```
