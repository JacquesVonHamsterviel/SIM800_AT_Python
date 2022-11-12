import sys
import configparser

from telegram.tg import tg_bot
def at_initialize():
    log("LOG","AT_initializing...")
    ser.write('AT'.encode('utf-8') + b'\r\n');time.sleep(1);print(ser.readline()) #No Response without this
    ser.write('ATE0'.encode('utf-8') + b'\r\n');time.sleep(1);print(ser.readline())  #echo off
    ser.write('AT+CPIN?'.encode('utf-8') + b'\r\n') #SIM Card In?
    ser.write('AT+CLIP=1'.encode('utf-8') + b'\r\n');time.sleep(1);print(ser.readline()) #显示来电号码，如果没有这条指令，则来电话模块只送出ring，不送出号码
    ser.write('AT+CMGF=1'.encode('utf-8') + b'\r\n')
    #ser.write('AT+CIMI'.encode('utf-8') + b'\r\n');time.sleep(1);print(ser.readline()) #读取IMSI
    #ser.write('AT+CCID'.encode('utf-8') + b'\r\n');time.sleep(1);print(ser.readline()) #读取ICCID号
    #ser.write('AT+CPBS="ON"'.encode('utf-8') + b'\r\n');time.sleep(1);print(ser.readline()) #将电话存贮位置选择为本机号码列表
    #ser.write('AT+CPBW=1'.encode('utf-8') + b'\r\n');time.sleep(1);print(ser.readline()) #储存本机号码
    #ser.write('AT+CNUM'.encode('utf-8') + b'\r\n');time.sleep(1);print(ser.readline()) #读取本机号码
    return True

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
            ser.write('AT+CMGS="{}"'.format(phonenum).encode('utf-8') + b'\r\n')
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


def at_main():

    #读取配置文件
    try: 
        if len(sys.argv)<=1:
            print("Argument Required! Use 'help' to get help")
            flag_return=True
            sys.exit()
        #elif len(sys.argv)>2:
        #    print("Too Many Arguments! Use 'help' to get help")
        #    flag_return=True
        #    sys.exit()
        cf=configparser.ConfigParser()
        cf.read(sys.argv[1])
        if sys.argv[1]=='debug-serial':
            print("mode: debug-serial")
            serialPort=input("Port: ")
            baudRate=115200         
            ser=serial.Serial(serialPort,baudRate,timeout=0.5) 
            print("参数设置：串口=%s ，波特率=%d, Use ## to send exit signal"%(serialPort,baudRate))#输出串口号和波特率
            while True:
                try:
                    res=ser.readline()
                    if res==b'':
                        time.sleep(0.1)
                        i_input=input("Command: ")
                        if i_input=="##":
                            command_variable = chr(26)
                            ser.write(command_variable.encode('utf-8'))
                        else:      
                            ser.write(i_input.encode('utf-8') + b'\r\n')
                    else:
                        print(res)
                        i_input=input("Command: ")
                        if i_input=="##":
                            command_variable = chr(26)
                            ser.write(command_variable.encode('utf-8'))
                        else:      
                            ser.write(i_input.encode('utf-8') + b'\r\n')
                
                except KeyboardInterrupt:
                    break
                    
                #except Exception as ex:    
                #     print(ex)
                #     pass
                    
                except:
                    print("【Log】Something else went wrong")
                
            ser.close()
            flag_return=True
            sys.exit()
        elif sys.argv[1]=='phoneinfo':
            print("mode: phoneinfo")
            findphone  = Phone()
            print(phoneinfo(input("PhoneNum: ")))
            flag_return=True
            sys.exit()
        elif sys.argv[1]=='help':
            print("Help\n1. debug-serial\n2. phoneinfo\n3. ver\nElse: Seen as path of config file")
            flag_return=True
            sys.exit()
        elif sys.argv[1]=='ver':
            print("Py_AT\nVersion: {}".format(version))
            flag_return=True
            sys.exit()
        else:
            current_phonenum=cf.get('main','current_phonenum')
            max_error_count=cf.getint('main','max_error_count')

            serialPort=cf.get('port','serialPort')
            baudRate=cf.getint('port','baudRate')
            schedule_reconnect_max=cf.getfloat('port','schedule_reconnect_max')

            sms_send_allow=cf.getboolean('sms','sms_send_allow')
            sms_auto_send=cf.getboolean('sms','sms_auto_send')
            sms_limit=cf.getint('sms','sms_limit')
            sms_auto_send_content=cf.get('sms','sms_auto_send_content')

            current_phonenum_log=cf.getboolean('log','current_phonenum_log')

            tg_send_enable=cf.getboolean('telegram','tg_send_enable')
            tg_receive_enable=cf.getboolean('telegram','tg_receive_enable')
            bot = tg_bot(cf.get('telegram','tg_api_base_link'),cf.get('telegram','bot'))
            
            if cf.getboolean('proxy','enable_proxy')==True:
                if cf.getboolean('proxy','auth')==True:
                    telepot.api.set_proxy(cf.get('proxy','url'), basic_auth=(cf.get('proxy','username'),cf.get('proxy','password')))
                else:
                    telepot.api.set_proxy(cf.get('proxy','url'), basic_auth=None)
            tg_chat_id=cf.get('telegram','tg_chat_id')
            current_phonenum_tg=cf.getboolean('telegram','current_phonenum_tg')
            tg_read_period=cf.getint('telegram','tg_read_period')
            tg_last_read_id=cf.getint('telegram','tg_last_read_id')
            common_input_function=cf.getboolean('common_input','common_input_function')
    except:
        if flag_return==True:
            sys.exit()
        elif sys.argv[1]=='telegram':
            if len(sys.argv)<3:
                print("Config File Required!")
                sys.exit()
            else:
                cf=configparser.ConfigParser()
                cf.read(sys.argv[2])
                tg_send_enable=cf.getboolean('telegram','tg_send_enable')
                tg_receive_enable=cf.getboolean('telegram','tg_receive_enable')
                bot = telepot.Bot(cf.get('telegram','bot'))
                if cf.getboolean('proxy','enable_proxy')==True:
                    if cf.getboolean('proxy','auth')==True:
                        telepot.api.set_proxy(cf.get('proxy','url'), basic_auth=(cf.get('proxy','username'),cf.get('proxy','password')))
                    else:
                        telepot.api.set_proxy(cf.get('proxy','url'), basic_auth=None)
                tg_chat_id=cf.get('telegram','tg_chat_id')
                current_phonenum_tg=cf.getboolean('telegram','current_phonenum_tg')
                tg_read_period=cf.getint('telegram','tg_read_period')
                tg_last_read_id=cf.getint('telegram','tg_last_read_id')
                while True:
                    tg_send("系统",input("发送消息： "))
                sys.exit()
        else:
            print('读取配置文件出错！')
            sys.exit()
        


    ser=serial.Serial(serialPort,baudRate,timeout=0.5) 
    log("LOG","Program Starts")
    log("LOG","参数设置：串口=%s ，波特率=%d"%(serialPort,baudRate)) #输出串口号和波特率

    try:
        if tg_receive_enable==True:
            start_new_thread( read_tg_message, ("Telegram_bot", ) )
            #thread.start_new_thread( print_time, ("Thread-2", 4, ) )
        if common_input_function==True:
            start_new_thread( common_input, ("Common_input", ) )
    except Exception as ex:
         print(ex)

    at_initialize()
    log("LOG","本机号码："+ current_phonenum)

    #print(schedule_reconnect)

    while True:
        try:
            res=ser.readline()
            #读取并解析短消息
            if res!=b'' and res!=b'\r\n':
                 schedule_reconnect=time.time()
                 log("Terminal",str(res))#可以接收中文
                 if res==b'\x00':
                    log("LOG","检测到信号断连，重新连接串口")
                    ser.close()
                    time.sleep(3)
                    ser=serial.Serial(serialPort,baudRate,timeout=0.5) 
                    #at_initialize()
                    log("LOG","检测到信号断连，重新连接串口完成")
                 if b'+CMTI:' in res:
                     log("LOG","有短信来了")
                     ser.write('AT+CMGL'.encode('utf-8') + b'\r\n')  #读取内存中所有短消息
                 if b'+CMGL:' in res: #短消息第一部分-电话号码和时间
                     #开始读取短信
                     re_phonenum=re.compile(r'\d{5,}')
                     re_time=re.compile(r'\d{1,2}/\d{1,2}/\d{1,2},\d{1,2}:\d{1,2}:\d{1,2}')

                     if len(re_phonenum.search(str(res))[0])>24:
                         msg_phonenum=DecodeUnicode(re_phonenum.search(str(res))[0])
                     else:
                         msg_phonenum=re_phonenum.search(str(res))[0]
                         
                     msg_time=re_time.search(str(res))[0]
                     msg_in_receiving=True
                     continue
                 if msg_in_receiving==True: #短消息第二部分-文本内容
                     msg_content=DecodeUnicode(str(res)[2:-5])
                     msg_in_receiving=False
                     #读取短信完成
                     #msg_phonenum=DecodeUnicode(msg_phonenum) #这里可能有gbk解码方面的问题，直接在第一步读取
                     phone_location=phoneinfo(msg_phonenum)
                     if phone_location[0]=="Error":
                         log("LOG","来自：{} {}时间:{} 内容：{}".format(msg_phonenum,phonenum_self("space"),standard_time(),msg_content))
                         tg_send("收到消息","\n来自：{} \n{}时间:{} \n内容：{}".format(msg_phonenum,phonenum_self("enter"),standard_time(),msg_content))
                         html("SMS","来自：{} {}内容：{}".format(msg_phonenum,phonenum_self("space"),msg_content))
                     else:
                         log("LOG","来自：{} ({}) {}时间:{} 内容：{}".format(msg_phonenum,phone_location[1],phonenum_self("space"),standard_time(),msg_content))
                         tg_send("收到消息","\n来自：{} ({}) \n{}时间:{} \n内容：{}".format(msg_phonenum,phone_location[1],phonenum_self("enter"),standard_time(),msg_content))
                         html("SMS","来自：{} ({}) {}内容：{}".format(msg_phonenum,phone_location[1],phonenum_self("space"),msg_content))
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
                         log("LOG","【拒绝来电】 \n来自：{} {}".format(phonenum,phonenum_self("space")))
                         tg_send("拒绝来电","\n来自：{} {}".format(phonenum,phonenum_self("space")))
                    else:
                         log("LOG","【拒绝来电】 \n来自：{} ({}) {}".format(phonenum,phone_location[1],phonenum_self("space")))
                         tg_send("拒绝来电","\n来自：{} ({}) {}".format(phonenum,phone_location[1],phonenum_self("space")))
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
            else:
                if time.time()-schedule_reconnect>schedule_reconnect_max:
                    ser.close()
                    #time.sleep(1)
                    ser=serial.Serial(serialPort,baudRate,timeout=0.5) 
                    #log("LOG","串口自动重连")
                    schedule_reconnect=time.time()

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