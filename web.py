import webbrowser
from flask import Flask
import os
from datetime import date
    
    
def getFileName(path):
    f_list = os.listdir(path)
    # print f_list
    res=[]
    for i in f_list:
        if os.path.splitext(i)[1] == '.html':
            res.append(i)
    return res
app = Flask(__name__)



@ app.route("/")
def index_page():
    try:
        with open("html/SMS_{}.html".format(date.today()),"r") as f:
            HTML=f.read()
    except Exception as ex:
        HTML="<h3>No Message Today</h3>"
        pass
    res="<form><input type=\"date\" id=\"start\" name=\"date\" value=\"{}\"/> <p><button>Submit</button></p></form>{}".format(date.today(),HTML)
    return(res)
    #return redirect("/static/case.html")

@ app.route("/list")
def list():
    html_files=getFileName("html")
    res=""
    for i in html_files:
        res=res+"<a href=\"{}\">{}</a><br><br>".format(i,i)
    return(res)
    #return redirect("/static/case.html")


 
if __name__ == "__main__":
    webbrowser.open("http://127.0.0.1:5000")
    app.run()