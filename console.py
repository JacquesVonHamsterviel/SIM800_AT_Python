import time

lastcmd=""
while True:
    with open("common_input.txt","r",encoding='utf-8') as f:
        c=f.readlines()
        #print(len(c))
        if len(c)==1:
            if c[0]=="free\n" or c[0]=="free":
                cmd=input("")
                with open("common_input.txt","w",encoding='utf-8') as f:
                    f.write(cmd)
                    lastcmd=cmd
            else:
                with open("common_input.txt","r",encoding='utf-8') as f:
                    print(f.read())
        else:
            for i in c:
                if i!="free\n" or i!="free" or i==lastcmd:
                    print(i.replace("\n",""))
            if c[0]=="free\n" or c[0]=="free":
                with open("common_input.txt","w",encoding='utf-8') as f:
                    f.write("free")
        time.sleep(1)
