# -*- coding: utf-8 -*-

# pip install pyserial
# pip install telepot
# pip install phone #归属地查询


import re
import time
from _thread import *
from urllib.parse import MAX_CACHE_SIZE
import serial
from idna import unicode 
import telepot
from phone import Phone
import traceback

#全局变量

current_phonenum="" #手机号，不填不影响，在多开的情况下，填了方便区分。
max_error_count=100 #错误次数上限

#串口参数
serialPort="COM7"   #串口号
baudRate=115200       #波特率

#Telegram参数
tg_receive_enable=False ##启用Telegram发送接收 （新建线程）
tg_send_enable=True #启用Telegram发送
bot = telepot.Bot('') #bot参数
tg_chat_id='-' #TG的群组
tg_read_period=60 #Telegram消息识别频率，单位为秒，不能小于5秒，否则默认为5秒


#短信相关
sms_send_allow=True #允许发送短信吗
sms_auto_send=True #开启11位来电自动回复
sms_limit=1 #自动回复短信的数量上限
sms_auto_send_content="你好,有事情请联系。" #自动回复的内容





#不可更改的变量
en_uni=(" ","!","\"","#","$","%","&","'","(",")","*","+",",","-",".","/","0","1","2","3","4","5","6","7","8","9",":",";","<","=",">","?","@","A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z","[","\\","]","^","_","`","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","{","|","}","~")
record_sms_phonenum=[] #存储已发送提示消息的手机号，避免重复发送，浪费话费。
findphone  = Phone()
ser=serial.Serial(serialPort,baudRate,timeout=0.5) 
msg_in_receiving=False #短信是否完全接收完毕
msg_in_sending=False #短信是否在发送
error_count=1 #初始错误次数值
tg_last_read_id=0
with open("tg_last_read_id.txt","r") as f:
    tg_last_read_id=int(f.read())

def at_initialize():
    ser.write('AT'.encode('utf-8') + b'\r\n') #No Response without this
    time.sleep(1)
    ser.write('ATE0'.encode('utf-8') + b'\r\n')  #echo off
    time.sleep(1)
    ser.write('AT+CLIP=1'.encode('utf-8') + b'\r\n') #显示来电号码，如果没有这条指令，则来电话模块只送出ring，不送出号码


def standard_sim_time():
    return str(" "+time.strftime("%y/%m/%d,%H:%M:%S", time.localtime())+" " )

def standard_time():
    return str(" "+time.strftime("%Y-%m-%d,%H:%M:%S", time.localtime())+" " )

def DecodeUnicode(str):
    i=0
    res=""
    
    if len(str)%4==0 and len(str)>6: #unicode需要可以被4整除
        if str.upper()==str: #全是大写字母才算短信的unicode，而且不能是纯数字
             while i<len(str)/4:
                 res=res+"\\u"+str[4*i:4*i+4].lower()
                 i+=1
             try:    
                 res=res.encode('utf-8').decode('unicode_escape')
                 return(res)
             except:
                 return(str)
        else:
             return(str)
    else:
        return(str)
   
def EncodeUnicode(text):
     res=""
     for i in text:
          if str(i.encode("unicode_escape"))[2:-1]==i:
               res=res+"00"+str(i.encode("unicode_escape").hex())
          else:
               res=res+str(i.encode("unicode_escape"))[5:-1]
     res=res.upper()
     return(res)

def phoneinfo(num):#归属地查询-支持7-11位手机号   
    try:
        if num.isdigit()==True and 7<=len(num)<=11:
             num=str(num)
             j=findphone.find(num)
             if j==None:
                 return(["Error","No Info Found"])
             else:
                 res=["Success",j["province"]+j["city"]+" "+j["phone_type"]]
                 return(res)
        else:
             return(["Error","Not Digital or not in length from 7 to 11"])
    except Exception as ex:
            return(["Error",str(ex)])

def log(log_type,log_str):
    print("【{}】{}".format(log_type,log_str))
    filename=str(log_type) + "_" + str(time.strftime("%Y-%m-%d",time.localtime())) + ".txt"
    with open("log/"+filename, 'a+') as f:
        f.write("【{}】【{}】{}\n".format(str(log_type),standard_time(),log_str))
    return True

def tg_send(tg_type,tg_str):
    global tg_send_enable
    if tg_send_enable==True:
        try:
            bot.sendMessage(chat_id=tg_chat_id, text="【{}】{} {}".format(str(tg_type),standard_time(),tg_str))
            log("LOG_TG","【{}】{}".format(tg_type,tg_str))
            return True
        except Exception as ex:
            log("LOG_TG","【ERROR】{}".format(str(ex)))
            return False
    else:
        log("LOG_TG","【Error】Telegram send not enable")
        return False

def html(html_type,html_str):
    filename=str(html_type) + "_" + str(time.strftime("%Y-%m-%d",time.localtime())) + ".html"
    with open("html/"+filename, 'a+') as f:
        #f.write("<tr><td>{}</td><td>【{}】{}</td></tr>\n".format(standard_time(),html_type,html_str))
        f.write("{} 【{}】{}<br>\n".format(standard_time(),html_type,html_str))



def at_send_en_message(phonenum,text):
    global msg_in_sending
    if sms_send_allow==True:
        if msg_in_sending==False:
            for i in text or "\n"in text:
                if i in en_uni:
                    pass
                else:
                    return((False,"NOT_EN"))
            msg_in_sending=True
            ser.write('AT+CMGF=1'.encode('utf-8') + b'\r\n')
            ser.write('AT+CMGS="{}"'.format(send_msg_phonenum).encode('utf-8') + b'\r\n')
            ser.write(b'\r\n')
            time.sleep(0.1)
            ser.write(text.encode('utf-8') + b'\r\n')
            time.sleep(0.2)
            command_variable = chr(26)
            ser.write(command_variable.encode('utf-8'))
            log("SMS","MESSAGE SENT TO {}, Content:{}".format(phonenum,text))
            msg_in_sending=False
            return((True,""))
        else:
             return((False,"目前有消息在发送中"))
    else:
        return((False,"sms_send_allow=False，全局消息发生被禁用！"))
                 
def at_send_cn_message(phonenum,text):
    global msg_in_sending
    if sms_send_allow==True:
        if msg_in_sending==False:
            msg_in_sending=True
            ser.write('AT+CMGF=1'.encode('utf-8') + b'\r\n')
            time.sleep(0.1)
            ser.write('AT+CSCS="UCS2"'.encode('utf-8') + b'\r\n')
            time.sleep(0.1)
            ser.write('AT+CSMP=17,71,0,8'.encode('utf-8') + b'\r\n')
            time.sleep(0.1)
            ser.write('AT+CMGS="{}"'.format(EncodeUnicode(phonenum)).encode('utf-8') + b'\r\n')
            time.sleep(0.1)
            ser.write(EncodeUnicode(text).encode('utf-8') + b'\r\n')
            time.sleep(0.2)
            command_variable = chr(26)
            ser.write(command_variable.encode('utf-8'))
            log("SMS","MESSAGE SENT TO {}, Content:{}".format(phonenum,text))
            msg_in_sending=False
            tg_send("SMS","MESSAGE SENT TO {}, Content:{}".format(phonenum,text))
            return((True,""))
        else:
             return((False,"目前有消息在发送中"))  
    else:
        return((False,"sms_send_allow=False，全局消息发生被禁用！"))

def read_tg_message(strx):
    global tg_last_read_id
    global tg_read_period
    global error_count
    global max_error_count
    if tg_read_period<5:
        tg_read_period=5
    while True:
        try:
            response = bot.getUpdates(offset=int(tg_last_read_id)+1)
            if response==[]:
                pass
            else:
                tg_last_read_id=int(response[0]['update_id'])
                if 'channel_post' in response[0]:
                    if str(response[0]['channel_post']['chat']['id'])==tg_chat_id:
                        tg_cmd=response[0]['channel_post']['text']
                        log("LOG","【Telegram】收到消息："+tg_cmd)
                        tg_send("命令执行",cmd_exc(tg_cmd))

            with open("tg_last_read_id.txt","w") as f:
                f.write(str(tg_last_read_id))
            time.sleep(tg_read_period)
        except Exception as ex:
             log("LOG","【异常处理】{}\n目前累计错误次数：{},错误次数上限：{}".format(str(ex),str(error_count),str(max_error_count)))
             tg_send("异常处理","{}\n目前累计错误次数：{},错误次数上限：{}".format(str(ex),str(error_count),str(max_error_count)))
             traceback.print_exc()
             if error_count>=max_error_count:
                 break
             else:
                 error_count+=1

def cmd_exc(strcmd):
    if len(strcmd)>3:
        if strcmd[:4]=="send" and strcmd.count("###")==1:
            cmd_exc_phonenum=strcmd[4:strcmd.find("###")]
            cmd_exc_text=strcmd[strcmd.find("###")+3:]
            if 4<len(cmd_exc_phonenum)<21 and len(cmd_exc_text)!=0 and len(cmd_exc_text)<60 and cmd_exc_phonenum.isdigit()==True:
                 if sms_send_allow==True:
                    at_send_cn_message(cmd_exc_phonenum,cmd_exc_text)
                    return("\n识别到send指令，已发送到：{}，内容：{}".format(cmd_exc_phonenum,cmd_exc_text))
                 else:
                    return("\n全局短信功能目前为禁用状态！")
            else:
                 return("命令错误。提示：不能发送空文本，或者电话长度不在6到20之间，或不是整数，或者短信太长了。")
        elif strcmd=="help":
            return("\n【帮助】请按命令标准格式来\n\n1.发送短信：send电话号码###内容。\n\n2.归属地查询：phone电话号码\n\n请勿一次性发送过多命令，过多的命令会被加载到任务队列中等待下一个周期执行。\n\n当前刷新周期为{}秒".format(str(tg_read_period)))
        elif len(strcmd)>4 and strcmd[:5]=="phone" and strcmd.count("phone")==1:
            if strcmd[5:].isdigit()==True:
                return(str(phoneinfo(strcmd[5:])))
            else:
                return("phone命令后需加纯数字手机号")
        else:
            return("无法识别命令，使用help命令获取帮助")
    else:
        return("无法识别命令，使用help命令获取帮助")


def check_sms_limit(phonenum):
    if sms_limit==0:
        return((False,"Up To Limit"))
    else:
        if len(phonenum)==11:
            for i in record_sms_phonenum:
                if i[0]==phonenum and i[1]<sms_limit:
                    record_sms_phonenum[record_sms_phonenum.index(i)]=[phonenum,i[1]+1]
                    return((True,""))
                elif i[0]==phonenum and i[1]>=sms_limit:
                    return((False,"Up To Limit"))
            record_sms_phonenum.append([phonenum,1])
            return((True,""))
        else:
            return((False,"Phonenum Length Not 11"))



log("LOG","Program Starts")
log("LOG","参数设置：串口=%s ，波特率=%d"%(serialPort,baudRate)) #输出串口号和波特率

try:
    if tg_receive_enable==True:
        start_new_thread( read_tg_message, ("Telegram_bot", ) )
     #thread.start_new_thread( print_time, ("Thread-2", 4, ) )
except Exception as ex:
     print(ex)

at_initialize()

while True:
    try:
        res=ser.readline()
       
        #读取并解析短消息
        if res!=b'' and res!=b'\r\n':
             log("Terminal",str(res))#可以接收中文
             if b'+CMTI:' in res:
                 log("LOG","有短信来了")
                 ser.write('AT+CMGL'.encode('utf-8') + b'\r\n')  #读取内存中所有短消息
             if b'+CMGL:' in res: #短消息第一部分-电话号码和时间
                 #开始读取短信
                 re_phonenum=re.compile(r'\d{5,}')
                 re_time=re.compile(r'\d{1,2}/\d{1,2}/\d{1,2},\d{1,2}:\d{1,2}:\d{1,2}')
                 msg_phonenum=re_phonenum.search(str(res))[0]
                 msg_time=re_time.search(str(res))[0]
                 msg_in_receiving=True
                 continue
             if msg_in_receiving==True: #短消息第二部分-文本内容
                 msg_content=DecodeUnicode(str(res)[2:-5])
                 msg_in_receiving=False
                 #读取短信完成
                 msg_phonenum=DecodeUnicode(msg_phonenum)
                 phone_location=phoneinfo(msg_phonenum)
                 if phone_location[0]=="Error":
                     log("LOG","来自：{} 时间:{} 内容：{}".format(msg_phonenum,standard_time(),msg_content))
                     tg_send("收到消息","\n来自：{} \n时间:{} \n内容：{}".format(msg_phonenum,standard_time(),msg_content))
                     html("SMS","来自：{}  内容：{}".format(msg_phonenum,msg_content))
                 else:
                     log("LOG","来自：{} ({}) 时间:{} 内容：{}".format(msg_phonenum,phone_location[1],standard_time(),msg_content))
                     tg_send("收到消息","\n来自：{} ({}) \n时间:{} \n内容：{}".format(msg_phonenum,phone_location[1],standard_time(),msg_content))
                     html("SMS","来自：{} ({}) 内容：{}".format(msg_phonenum,phone_location[1],msg_content))
                 msg="" #删除内存中所有短消息
                 ser.write('AT+CMGD=1,2'.encode('utf-8') + b'\r\n')
         
             # 拒绝所有电话
             if b'RING\r\n' in res:
                ser.write('AT+CLCC'.encode('utf-8') + b'\r\n') #获取来电号码
                #time.sleep(1)
                ser.write('AT+CHUP'.encode('utf-8') + b'\r\n') #拒绝电话
             if b'CLCC' in res:
                re_phonenum=re.compile(r'\d{5,}')
                phonenum=re_phonenum.search(str(res))[0]
                phone_location=phoneinfo(phonenum)
                if phone_location[0]=="Error":
                     log("LOG","【拒绝来电】 \n来自：{}".format(phonenum))
                     tg_send("拒绝来电","\n来自：{}".format(phonenum))
                else:
                     log("LOG","【拒绝来电】 \n来自：{} ({})".format(phonenum,phone_location[1]))
                     tg_send("拒绝来电","\n来自：{} ({})".format(phonenum,phone_location[1]))

             
             #向11位的手机号来电发送短信
             if b'CLCC' in res:
                re_phonenum=re.compile(r'\d{5,}')
                send_msg_phonenum=re_phonenum.search(str(res))[0]
                if sms_auto_send==True:
                    return_check_limit=check_sms_limit(send_msg_phonenum)
                    log("LOG","临时发生短信次数记录："+str(record_sms_phonenum))
                    if return_check_limit[0]==True:
                        return_send_cn_message=at_send_cn_message(send_msg_phonenum,sms_auto_send_content)
                        if return_send_cn_message[0]==True:
                            log("LOG","发送自动回复短信， 号码：{}".format(send_msg_phonenum))
                        else:
                            log("LOG","发送自动回复短信失败， 原因{}，号码：{}".format(return_send_cn_message[1],send_msg_phonenum))
                    elif return_check_limit[0]==False:
                        log("LOG","不发送自动回复短信，原因：{}， 号码：{}".format(return_check_limit[1],send_msg_phonenum))
                else:
                    log("LOG","自动发送短信回复来点功能为关闭状态")



    except KeyboardInterrupt:
         log("LOG","KeyboardInterrupt")
         break
         
    except Exception as ex:
          if "PermissionError" in str(ex) and "Access is denied" in str(ex):
             log("LOG","错误信息：SerialException\n详细信息：错误导致程序退出。\n这个错误一般在初次配置的时候出现，一般性是串口配置错误，修改配置即可。\n但是在生产环境中，这是一个严重的错误，正常情况下是几乎不可能面临此错误。模块很有可能被异常移除，或者受到物理损坏，需要手动检查模块和串口连接状态后再启动。")
             tg_send("异常处理","SerialException\n详细信息：错误导致程序退出。\n这个错误一般在初次配置的时候出现，一般性是串口配置错误，修改配置即可。\n但是在生产环境中，这是一个严重的错误，正常情况下是几乎不可能面临此错误。模块很有可能被异常移除，或者受到物理损坏，需要手动检查模块和串口连接状态后再启动。")
             break
          else:
              log("LOG","【异常处理】{}\n目前累计错误次数：{},错误次数上限：{}".format(str(ex),str(error_count),str(max_error_count)))
              tg_send("异常处理","{}\n目前累计错误次数：{},错误次数上限：{}".format(str(ex),str(error_count),str(max_error_count)))
          traceback.print_exc()
          if error_count>=max_error_count:
                 log("LOG","【异常处理】Too Many Errors, auto exit")
                 break
          else:
                 error_count+=1
    
ser.close() 
