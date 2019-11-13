import redis

# Nos conectamos a la base de datos indicando su URL o IP
redis_db = redis.Redis(host="localhost", port=9000, db=0)

# Con esto seteamos una KEY test, con un VALUE python
redis_db.set('test', 'python')

# Con esto geteamos la KEY test que guardamos anteriormente
print(redis_db.get('test'))