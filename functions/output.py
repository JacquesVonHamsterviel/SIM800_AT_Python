from functions.standard_time import *

def log(log_type,log_str):
    print("【{}】【{}】{}".format(log_type,standard_time(),log_str))
    filename=str(log_type) + "_" + str(time.strftime("%Y-%m-%d",time.localtime())) + ".txt"
    with open("log/"+filename, 'a+') as f:
        f.write("【{}】【{}】{}\n".format(str(log_type),standard_time(),log_str))
    return True



def html(html_type,html_str):
    filename=str(html_type) + "_" + str(time.strftime("%Y-%m-%d",time.localtime())) + ".html"
    with open("html/"+filename, 'a+') as f:
        #f.write("<tr><td>{}</td><td>【{}】{}</td></tr>\n".format(standard_time(),html_type,html_str))
        f.write("{} 【{}】{}<br>\n".format(standard_time(),html_type,html_str))
