import time

def standard_sim_time():
    return str(" "+time.strftime("%y/%m/%d,%H:%M:%S", time.localtime())+" (UTC+00:00) " )

def standard_time():
    return str(" "+time.strftime("%Y-%m-%d,%H:%M:%S", time.localtime())+" (UTC+00:00) " )

