import requests
import string
import random
import time

def random_string(size=6, chars=string.ascii_uppercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))

while True:
    try:
        t1=time.time()
        r=requests.get("http://www.baidu.com/{}".format(random_string()),verify=False,timeout=5)
        #print(r.content)
        time_used=str(time.time()-t1)+"s"
        print(time_used)
    except Exception as ex:
        #print(ex)
        print("error")
    finally:
        time.sleep(3)