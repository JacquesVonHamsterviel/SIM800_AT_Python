VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "短信调试工具"
   ClientHeight    =   6336
   ClientLeft      =   4380
   ClientTop       =   1908
   ClientWidth     =   19920
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   6336
   ScaleWidth      =   19920
   Begin VB.Frame Frame11 
      Caption         =   "读取一些信息的指令"
      Height          =   852
      Left            =   13680
      TabIndex        =   90
      Top             =   3600
      Width           =   5652
      Begin VB.CommandButton Command30 
         Caption         =   "是否有SIM卡？"
         Height          =   495
         Left            =   120
         TabIndex        =   94
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton Command29 
         Caption         =   "读SIM卡ID"
         Height          =   495
         Left            =   1200
         TabIndex        =   93
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton Command28 
         Caption         =   "读取IMEI"
         Height          =   495
         Left            =   2280
         TabIndex        =   92
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton Command21 
         Caption         =   "CSQ"
         Height          =   495
         Left            =   3360
         TabIndex        =   91
         Top             =   240
         Width           =   1092
      End
   End
   Begin VB.Frame Frame10 
      Caption         =   "ble"
      Height          =   1332
      Left            =   13680
      TabIndex        =   81
      Top             =   2160
      Width           =   5652
      Begin VB.CommandButton Command31 
         Caption         =   "读取name"
         Height          =   372
         Left            =   2520
         TabIndex        =   95
         Top             =   840
         Width           =   972
      End
      Begin VB.CommandButton Command27 
         Caption         =   "断开蓝牙"
         Height          =   495
         Left            =   3360
         TabIndex        =   88
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton Command26 
         Caption         =   "发送数据"
         Height          =   972
         Left            =   4560
         TabIndex        =   87
         Top             =   240
         Width           =   972
      End
      Begin VB.CommandButton Command25 
         Caption         =   "修改name"
         Height          =   372
         Left            =   3480
         TabIndex        =   86
         Top             =   840
         Width           =   972
      End
      Begin VB.CommandButton Command24 
         Caption         =   "开启蓝牙"
         Height          =   495
         Left            =   120
         TabIndex        =   85
         Top             =   240
         Width           =   1092
      End
      Begin VB.TextBox Text17 
         Height          =   372
         Left            =   840
         TabIndex        =   84
         Text            =   "sim800BLE"
         Top             =   840
         Width           =   1572
      End
      Begin VB.CommandButton Command23 
         Caption         =   "允许配对"
         Height          =   495
         Left            =   1200
         TabIndex        =   83
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton Command22 
         Caption         =   "允许连接"
         Height          =   495
         Left            =   2280
         TabIndex        =   82
         Top             =   240
         Width           =   1092
      End
      Begin VB.Label Label21 
         Caption         =   "myname"
         Height          =   300
         Left            =   120
         TabIndex        =   89
         Top             =   840
         Width           =   972
      End
   End
   Begin VB.Frame Frame9 
      Caption         =   "http"
      Height          =   1692
      Left            =   13680
      TabIndex        =   67
      Top             =   360
      Width           =   5652
      Begin VB.TextBox Text14 
         Height          =   372
         Left            =   4440
         TabIndex        =   79
         Text            =   "1000"
         Top             =   1200
         Width           =   732
      End
      Begin VB.CommandButton Command20 
         Caption         =   "READ"
         Height          =   972
         Left            =   4560
         TabIndex        =   78
         Top             =   240
         Width           =   972
      End
      Begin VB.CommandButton Command19 
         Caption         =   "TERM"
         Height          =   495
         Left            =   2280
         TabIndex        =   77
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton Command18 
         Caption         =   "INIT"
         Height          =   495
         Left            =   1200
         TabIndex        =   76
         Top             =   240
         Width           =   1092
      End
      Begin VB.TextBox Text13 
         Height          =   372
         Left            =   840
         TabIndex        =   75
         Text            =   "www.sim.com"
         Top             =   1200
         Width           =   2532
      End
      Begin VB.TextBox Text12 
         Height          =   372
         Left            =   840
         TabIndex        =   74
         Text            =   "www.sim.com"
         Top             =   840
         Width           =   2532
      End
      Begin VB.CommandButton Command17 
         Caption         =   "联网"
         Height          =   495
         Left            =   120
         TabIndex        =   71
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton Command16 
         Caption         =   "GET"
         Height          =   372
         Left            =   3480
         TabIndex        =   70
         Top             =   840
         Width           =   972
      End
      Begin VB.CommandButton Command15 
         Caption         =   "POST"
         Height          =   372
         Left            =   3480
         TabIndex        =   69
         Top             =   1200
         Width           =   972
      End
      Begin VB.CommandButton Command13 
         Caption         =   "断开网络"
         Height          =   495
         Left            =   3360
         TabIndex        =   68
         Top             =   240
         Width           =   1092
      End
      Begin VB.Label Label19 
         Caption         =   "ms"
         Height          =   300
         Left            =   5280
         TabIndex        =   80
         Top             =   1320
         Width           =   252
      End
      Begin VB.Label Label18 
         Caption         =   "getURL"
         Height          =   300
         Left            =   120
         TabIndex        =   73
         Top             =   840
         Width           =   972
      End
      Begin VB.Label Label17 
         Caption         =   "postURL"
         Height          =   300
         Left            =   120
         TabIndex        =   72
         Top             =   1200
         Width           =   972
      End
   End
   Begin VB.Frame Frame8 
      Caption         =   "EMAIL"
      Height          =   2292
      Left            =   7920
      TabIndex        =   43
      Top             =   3840
      Width           =   5652
      Begin VB.TextBox Text11 
         Height          =   372
         Left            =   1200
         TabIndex        =   66
         Text            =   "test mail from 800c"
         Top             =   1800
         Width           =   2172
      End
      Begin VB.TextBox Text10 
         Height          =   372
         Left            =   3840
         TabIndex        =   63
         Text            =   "25"
         Top             =   1080
         Width           =   1692
      End
      Begin VB.TextBox Text9 
         Height          =   372
         Left            =   1200
         TabIndex        =   54
         Text            =   "105620314@163.com"
         Top             =   1440
         Width           =   2172
      End
      Begin VB.TextBox Text8 
         Height          =   372
         Left            =   1200
         TabIndex        =   53
         Text            =   "smtp.qq.com"
         Top             =   1080
         Width           =   2172
      End
      Begin VB.TextBox Text7 
         Height          =   372
         Left            =   3840
         TabIndex        =   52
         Text            =   "你的邮箱密码"
         Top             =   720
         Width           =   1692
      End
      Begin VB.TextBox Text6 
         Height          =   372
         Left            =   1200
         TabIndex        =   51
         Text            =   "105620314@qq.com"
         Top             =   720
         Width           =   2172
      End
      Begin VB.CommandButton Command14 
         Caption         =   "发送邮件"
         Height          =   495
         Left            =   2280
         TabIndex        =   47
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton Command12 
         Caption         =   "配置邮箱"
         Height          =   495
         Left            =   1200
         TabIndex        =   46
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton Command11 
         Caption         =   "联网"
         Height          =   495
         Left            =   120
         TabIndex        =   45
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton Command9 
         Caption         =   "断开网络"
         Height          =   495
         Left            =   3240
         TabIndex        =   44
         Top             =   240
         Width           =   1092
      End
      Begin VB.Label Label16 
         Caption         =   "邮件主题"
         Height          =   300
         Left            =   120
         TabIndex        =   65
         Top             =   1920
         Width           =   972
      End
      Begin VB.Label Label15 
         Caption         =   "端口"
         Height          =   300
         Left            =   3480
         TabIndex        =   64
         Top             =   1200
         Width           =   972
      End
      Begin VB.Label Label14 
         Caption         =   "邮箱服务"
         Height          =   300
         Left            =   120
         TabIndex        =   62
         Top             =   1200
         Width           =   972
      End
      Begin VB.Label Label13 
         Caption         =   "目标邮箱"
         Height          =   300
         Left            =   120
         TabIndex        =   61
         Top             =   1560
         Width           =   972
      End
      Begin VB.Label Label12 
         Caption         =   "密码"
         Height          =   300
         Left            =   3480
         TabIndex        =   60
         Top             =   840
         Width           =   972
      End
      Begin VB.Label Label11 
         Caption         =   "我的邮箱"
         Height          =   300
         Left            =   120
         TabIndex        =   59
         Top             =   840
         Width           =   972
      End
   End
   Begin VB.Frame Frame7 
      Caption         =   "TCP/IP"
      Height          =   1332
      Left            =   7920
      TabIndex        =   37
      Top             =   2520
      Width           =   5652
      Begin VB.TextBox Text4 
         Height          =   372
         Left            =   4320
         TabIndex        =   50
         Text            =   "9014"
         Top             =   840
         Width           =   1092
      End
      Begin VB.TextBox Text3 
         Height          =   372
         Left            =   1200
         TabIndex        =   49
         Text            =   "rmryun.com"
         Top             =   840
         Width           =   2172
      End
      Begin VB.CommandButton btn_closeTCP 
         Caption         =   "断开连接"
         Height          =   495
         Left            =   4440
         TabIndex        =   42
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton Command10 
         Caption         =   "联网"
         Height          =   495
         Left            =   120
         TabIndex        =   41
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton btn_tcp 
         Caption         =   "TCP"
         Height          =   495
         Left            =   1200
         TabIndex        =   40
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton Command8 
         Caption         =   "UDP"
         Height          =   495
         Left            =   2280
         TabIndex        =   39
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton Command7 
         Caption         =   "发送数据"
         Height          =   495
         Left            =   3360
         TabIndex        =   38
         Top             =   240
         Width           =   1092
      End
      Begin VB.Label Label10 
         Caption         =   "目标端口"
         Height          =   300
         Left            =   3480
         TabIndex        =   58
         Top             =   960
         Width           =   972
      End
      Begin VB.Label Label9 
         Caption         =   "目标IP/DNS"
         Height          =   300
         Left            =   240
         TabIndex        =   57
         Top             =   960
         Width           =   972
      End
   End
   Begin VB.Frame Frame6 
      Caption         =   "AT指令"
      Height          =   852
      Left            =   7920
      TabIndex        =   31
      Top             =   360
      Width           =   5652
      Begin VB.CommandButton Command6 
         Caption         =   "CSQ"
         Height          =   495
         Left            =   3360
         TabIndex        =   36
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton btn_CREG 
         Caption         =   "CREG"
         Height          =   495
         Left            =   2280
         TabIndex        =   34
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton btn_ATEO 
         Caption         =   "ATE0"
         Height          =   495
         Left            =   1200
         TabIndex        =   33
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton btn_AT 
         Caption         =   "AT"
         Height          =   495
         Left            =   120
         TabIndex        =   32
         Top             =   240
         Width           =   1092
      End
   End
   Begin VB.CheckBox Check1 
      Caption         =   "换行"
      Height          =   255
      Left            =   1560
      TabIndex        =   25
      Top             =   4200
      Width           =   972
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   3000
      Left            =   3000
      Top             =   3960
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   3360
      Top             =   3840
      _ExtentX        =   995
      _ExtentY        =   995
      _Version        =   393216
      DTREnable       =   -1  'True
      InBufferSize    =   4096
   End
   Begin VB.Frame Frame5 
      Caption         =   "发送区"
      Height          =   1455
      Left            =   2760
      TabIndex        =   19
      Top             =   4800
      Width           =   5052
      Begin VB.CommandButton Command1 
         BackColor       =   &H8000000A&
         Caption         =   "发 送 数 据"
         BeginProperty Font 
            Name            =   "宋体"
            Size            =   10.8
            Charset         =   134
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1092
         Left            =   4080
         TabIndex        =   56
         Top             =   240
         Width           =   852
      End
      Begin VB.TextBox Text1 
         Height          =   1095
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   20
         Top             =   240
         Width           =   3972
      End
   End
   Begin VB.Frame Frame4 
      Caption         =   "接收区"
      Height          =   4455
      Left            =   2760
      TabIndex        =   18
      Top             =   240
      Width           =   5052
      Begin VB.TextBox Text2 
         Height          =   4092
         Left            =   120
         MultiLine       =   -1  'True
         ScrollBars      =   2  'Vertical
         TabIndex        =   24
         Top             =   240
         Width           =   4812
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   "显示发送设置"
      Height          =   2532
      Left            =   120
      TabIndex        =   12
      Top             =   3120
      Width           =   2535
      Begin VB.TextBox Text5 
         Alignment       =   2  'Center
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   1560
         TabIndex        =   14
         Text            =   "1000"
         Top             =   1440
         Width           =   570
      End
      Begin VB.CheckBox Check12 
         Caption         =   "自动发送"
         Height          =   255
         Left            =   360
         TabIndex        =   21
         Top             =   1080
         Width           =   1095
      End
      Begin VB.CommandButton Command5 
         Caption         =   "清空发送"
         Height          =   495
         Left            =   1320
         TabIndex        =   17
         Top             =   1920
         Width           =   975
      End
      Begin VB.CheckBox Check10 
         Caption         =   "以十六进制数显示"
         Height          =   255
         Left            =   360
         TabIndex        =   16
         ToolTipText     =   "默认显示字符串"
         Top             =   360
         Width           =   1935
      End
      Begin VB.CheckBox Check11 
         Caption         =   "以十六进制数发送"
         Height          =   255
         Left            =   360
         TabIndex        =   15
         ToolTipText     =   "十六进制数据用逗号隔开 例：“12,34,56”或“0x78,0x90,0xAB”"
         Top             =   720
         Width           =   1935
      End
      Begin VB.CommandButton Command4 
         Caption         =   "清空接收"
         Height          =   495
         Left            =   240
         TabIndex        =   13
         Top             =   1920
         Width           =   975
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "设置定时周期:"
         Height          =   180
         Left            =   360
         TabIndex        =   23
         Top             =   1470
         Width           =   1170
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "MS"
         Height          =   180
         Left            =   2160
         TabIndex        =   22
         Top             =   1470
         Width           =   180
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   "参数设置"
      Height          =   2895
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   2535
      Begin VB.CheckBox Check9 
         Caption         =   "打开串口"
         Height          =   495
         Left            =   840
         Style           =   1  'Graphical
         TabIndex        =   0
         Top             =   2160
         Width           =   1575
      End
      Begin VB.ComboBox Combo1 
         Height          =   300
         Left            =   1320
         TabIndex        =   6
         Text            =   "COM1"
         Top             =   240
         Width           =   1095
      End
      Begin VB.ComboBox Combo2 
         Height          =   300
         Left            =   1320
         TabIndex        =   5
         Text            =   "115200"
         Top             =   600
         Width           =   1095
      End
      Begin VB.ComboBox Combo3 
         Height          =   300
         Left            =   1320
         TabIndex        =   4
         Text            =   "NONE"
         Top             =   960
         Width           =   1095
      End
      Begin VB.ComboBox Combo4 
         Height          =   300
         Left            =   1320
         TabIndex        =   3
         Text            =   "8"
         Top             =   1320
         Width           =   1095
      End
      Begin VB.ComboBox Combo5 
         Height          =   300
         Left            =   1320
         TabIndex        =   2
         Text            =   "1"
         Top             =   1680
         Width           =   1095
      End
      Begin VB.Shape Shape10 
         FillColor       =   &H00808080&
         FillStyle       =   0  'Solid
         Height          =   220
         Left            =   332
         Shape           =   2  'Oval
         Top             =   2297
         Width           =   220
      End
      Begin VB.Shape Shape9 
         BorderWidth     =   2
         FillColor       =   &H00FFFFFF&
         FillStyle       =   0  'Solid
         Height          =   345
         Left            =   270
         Shape           =   2  'Oval
         Top             =   2235
         Width           =   345
      End
      Begin VB.Label Label6 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         Caption         =   "停止位"
         Height          =   255
         Left            =   120
         TabIndex        =   11
         Top             =   1680
         Width           =   1215
      End
      Begin VB.Label Label5 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         Caption         =   "数据位长度"
         Height          =   255
         Left            =   120
         TabIndex        =   10
         Top             =   1320
         Width           =   1215
      End
      Begin VB.Label Label4 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         Caption         =   "奇偶校验"
         Height          =   252
         Left            =   120
         TabIndex        =   9
         Top             =   960
         Width           =   1212
      End
      Begin VB.Label Label3 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         Caption         =   "比特率"
         Height          =   252
         Left            =   0
         TabIndex        =   8
         Top             =   600
         Width           =   1212
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         BackColor       =   &H80000016&
         Caption         =   "串口"
         Height          =   255
         Left            =   120
         TabIndex        =   7
         Top             =   240
         Width           =   1215
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   "短信电话apn"
      Height          =   1332
      Left            =   7920
      TabIndex        =   26
      Top             =   1200
      Width           =   5652
      Begin VB.CommandButton Command32 
         Caption         =   "APN"
         Height          =   372
         Left            =   4560
         TabIndex        =   97
         Top             =   840
         Width           =   972
      End
      Begin VB.ComboBox Combo6 
         Height          =   276
         Left            =   2520
         TabIndex        =   96
         Text            =   "CMNET"
         Top             =   840
         Width           =   1932
      End
      Begin VB.TextBox txt_Num 
         Height          =   372
         Left            =   1200
         TabIndex        =   48
         Text            =   "13814249700"
         Top             =   840
         Width           =   1212
      End
      Begin VB.CommandButton Command3 
         Caption         =   "拨号"
         Height          =   495
         Left            =   4440
         TabIndex        =   35
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton Command2 
         Caption         =   "删除全部短信"
         Height          =   495
         Left            =   3360
         TabIndex        =   30
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton btn_JIEMA 
         Caption         =   "解码选中的UNICODE"
         Height          =   495
         Left            =   2280
         TabIndex        =   29
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton btn_Send 
         Caption         =   "发送短信"
         Height          =   495
         Left            =   120
         TabIndex        =   28
         Top             =   240
         Width           =   1092
      End
      Begin VB.CommandButton tbn_list 
         Caption         =   "列出全部短信"
         Height          =   495
         Left            =   1200
         TabIndex        =   27
         Top             =   240
         Width           =   1092
      End
      Begin VB.Label Label7 
         Caption         =   "手机号码"
         Height          =   300
         Left            =   240
         TabIndex        =   55
         Top             =   960
         Width           =   972
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal length As Long)
Private Declare Sub Sleep Lib "kernel32.DLL" (ByVal dwMilliseconds As Long)
Public Timer_Count '定时发送十六进制时用到的 计数器
Dim n As Integer
Dim uartStr As String
Dim keepFlag As Integer



Private Sub btn_AT_Click()
MSComm1.Output = "AT" & vbCrLf
End Sub

Private Sub btn_ATEO_Click()
MSComm1.Output = "ATE0" & vbCrLf
End Sub

Private Sub btn_closeTCP_Click()
MSComm1.Output = "AT+CIPCLOSE" & vbCrLf
End Sub

Private Sub btn_CREG_Click()
MSComm1.Output = "AT+CREG?" & vbCrLf
End Sub

Private Sub btn_JIEMA_Click()
Text2.Text = Text2.Text + UNICODE_to_HANZI(Text2.SelText) & vbCrLf

End Sub

Private Sub btn_Send_Click()
If Len(Text1.Text) = 0 Then
   MsgBox ("发送的长度为0，在发送区填入数据")
Else

    MSComm1.Output = "AT+CMGF=1" & vbCrLf '转为TXT模式
    Sleep 100
    MSComm1.Output = "AT+CMGS=" & Chr(34) & txt_Num.Text & Chr(34) & vbCrLf
    Sleep 100
    MSComm1.Output = Text1 & Chr(&H1A)
End If
End Sub

Private Sub btn_tcp_Click()
'UART0_send("AT+CSTT=\"CMNET\"\r\n");
MSComm1.Output = "AT+CIPSTART=" & Chr(34) & "TCP" & Chr(34) & "," & Chr(34) & Text3.Text & Chr(34) & "," & Chr(34) & Text4.Text & Chr(34) & vbCrLf
End Sub

Private Sub Check10_Click()
'如果选中“以十六进制显示”则串口接收方式改为2进制接收，否则文本形式接收
MSComm1.InputMode = IIf(Check10.Value, comInputModeBinary, comInputModeText)
End Sub

'===============
'自动发送 复选框
'===============
Private Sub Check12_Click()
If Check12.Value Then '打钩
Timer1.Interval = Val(Text5.Text)
Timer1.Enabled = True
Else '取消
Timer1.Enabled = False
End If
End Sub


'=========================
'自定义函数 二进制转十进制
'=========================
Public Function BIN_to_DEC(ByVal Bin As String) As Long
    Dim i As Long
    For i = 1 To Len(Bin)
        BIN_to_DEC = BIN_to_DEC * 2 + Val(Mid(Bin, i, 1))
    Next i
End Function

'=========================
'自定义函数 Unicode转中文
'=========================
Public Function UNICODE_to_HANZI(ByVal unicodeSRC As String) As String
    Dim i As Long
    Dim src As String
    Dim dst As String
    Dim length As Long
    src = unicodeSRC
    length = Len(src)
    
    For i = 1 To length Step 4
        UNICODE_to_HANZI = UNICODE_to_HANZI + ChrW(Val("&H" + Mid(src, i, 4)))
    Next i
End Function



'========================
'自定义函数  二进制数取反
'========================
Public Function BinReverse(ByVal Exp) As String
    Dim lngLen     As Long, i       As Long
    lngLen = Len(Exp)
    For i = 1 To lngLen
        BinReverse = BinReverse & IIf(Mid(Exp, i, 1) = "1", "0", "1")
    Next
End Function

'=============================
' 自定义函数  十六进制转十进制
'=============================
Public Function HEX_to_DEC(ByVal hex As String) As Long
    Dim i As Long
    Dim B As Long
    
    hex = UCase(hex)
    For i = 1 To Len(hex)
        Select Case Mid(hex, Len(hex) - i + 1, 1)
            Case "0": B = B + 16 ^ (i - 1) * 0
            Case "1": B = B + 16 ^ (i - 1) * 1
            Case "2": B = B + 16 ^ (i - 1) * 2
            Case "3": B = B + 16 ^ (i - 1) * 3
            Case "4": B = B + 16 ^ (i - 1) * 4
            Case "5": B = B + 16 ^ (i - 1) * 5
            Case "6": B = B + 16 ^ (i - 1) * 6
            Case "7": B = B + 16 ^ (i - 1) * 7
            Case "8": B = B + 16 ^ (i - 1) * 8
            Case "9": B = B + 16 ^ (i - 1) * 9
            Case "A": B = B + 16 ^ (i - 1) * 10
            Case "B": B = B + 16 ^ (i - 1) * 11
            Case "C": B = B + 16 ^ (i - 1) * 12
            Case "D": B = B + 16 ^ (i - 1) * 13
            Case "E": B = B + 16 ^ (i - 1) * 14
            Case "F": B = B + 16 ^ (i - 1) * 15
        End Select
    Next i
    HEX_to_DEC = B
End Function

'================
'打开串口 按钮
'================
Private Sub Check9_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)

If Check9.Value Then '...打开串口
    MSComm1.CommPort = Mid(Combo1.Text, 4, 2)  '串口号
    MSComm1.Settings = Combo2.Text & "," & Mid(Combo3.Text, 1, 1) & "," & Combo4.Text & "," & Combo5.Text   '比特率,奇偶效应,数据位长度,停止位
    On Error GoTo OpenComErr '...打开串口出错时的处理，错误提示
    MSComm1.PortOpen = True '....打开串口
    Check9.Caption = "关闭串口"
    Shape10.FillColor = &HFF00&
    If Check12.Value Then '如果“定时发送”复选框选中，则打开时即启动Timer1
    Timer1.Interval = Val(Text5.Text)
    Timer1.Enabled = True
    End If
    'Timer2.Interval = 1000
    'Timer2.Enabled = True
Else '...................关闭串口
'   On Error GoTo CloseComErr
    MSComm1.PortOpen = False '...关闭串口
    Check9.Caption = "打开串口"
    Shape10.FillColor = &H808080
    If Timer1.Enabled Then Timer1.Enabled = False '如果Timer1开着就关了它
End If

Exit Sub
OpenComErr:
    MsgBox "打开串口失败！" & Chr(13) & "请确定通信端口存在且没被占用。", vbCritical + vbOKOnly, "错误提示 (0x" & comPortInvalid & ")"
    Check9.Caption = "打开串口"
    Shape10.FillColor = &H808080
    Check9.Value = False
Exit Sub
CloseComErr:
'    MsgBox "关闭串口失败！" & Chr(13) & "请确定通信端口存在且已经打开。", vbCritical + vbOKOnly, "错误提示 (0x" & comPortInvalid & ")"
Exit Sub
End Sub

'===============================
'Combo1~5--->5个串口设置参数存放
'===============================
Private Sub Combo1_Click()
MSComm1.CommPort = Mid(Combo1.Text, 4, 1)
End Sub

Private Sub Combo2_Click()
MSComm1.Settings = Combo2.Text & "," & Mid(Combo3.Text, 1, 1) & "," & Combo4.Text & "," & Combo5.Text
End Sub

Private Sub Combo3_Click()
MSComm1.Settings = Combo2.Text & "," & Mid(Combo3.Text, 1, 1) & "," & Combo4.Text & "," & Combo5.Text
End Sub

Private Sub Combo4_Click()
MSComm1.Settings = Combo2.Text & "," & Mid(Combo3.Text, 1, 1) & "," & Combo4.Text & "," & Combo5.Text
End Sub

Private Sub Combo5_Click()
MSComm1.Settings = Combo2.Text & "," & Mid(Combo3.Text, 1, 1) & "," & Combo4.Text & "," & Combo5.Text
End Sub

'=============
'发送数据 按钮
'=============
Private Sub Command1_Click()
On Error Resume Next '..........出错则忽略 不处理
Dim OPut() As Byte '............定义发送的数据，字节型（0~255）
Dim Data() As String  '.........存放十六进制数，把text1.text中的数以“,”拆分开
Dim k As Integer

MSComm1.OutBufferCount = 0 '....清空输出寄存器

If Check11.Value Then  '以十六进制 发送？
    Data = Split(Text1.Text, " ") '把text1.text的内容去掉“0x”后 再用“,”分开，拆成数组各元素放到Data中
    ReDim OPut(UBound(Data)) '重定义数组OPut()，数组元素个数与数组Data()元素个数相等
    For k = 0 To UBound(Data) '.........
    OPut(k) = HEX_to_DEC(Data(k)) '....把Data()中对应数组元素--经十六转十进制后--转移到OPut()中
    Next k '............................
    MSComm1.Output = OPut
    
Else  '发送字符串
    MSComm1.Output = Text1.Text
    If Check1.Value Then
        MSComm1.Output = vbCrLf
    End If
End If

End Sub


Private Sub Command10_Click()

    'MSComm1.Output = "AT+CSTT=" & Chr(34) & "CMNET" & Chr(34) & vbCrLf
    'Sleep 1000
    MSComm1.Output = "AT+CIICR" & vbCrLf
    Sleep 1000
    MSComm1.Output = "AT+CIFSR" & vbCrLf
    Sleep 1000
End Sub

Private Sub Command11_Click()
MSComm1.Output = "AT+SAPBR=1,1" & vbCrLf
End Sub

Private Sub Command12_Click()

MSComm1.Output = "AT+EMAILCID=1" & vbCrLf
Sleep 100
MSComm1.Output = "AT+EMAILTO=30" & vbCrLf
Sleep 100
MSComm1.Output = "AT+SMTPSRV=" & Chr(34) & Text8.Text & Chr(34) & "," & Text10.Text & vbCrLf
Sleep 100
Dim ID As String
Dim i As Integer
i = InStr(1, Text6.Text, "@")
ID = Mid(Text6.Text, 1, i - 1)
MSComm1.Output = "AT+SMTPAUTH=1," & Chr(34) & ID & Chr(34) & "," & Text7.Text & vbCrLf
Sleep 100
MSComm1.Output = "AT+SMTPFROM=" & Chr(34) & Text6.Text & Chr(34) & "," & Chr(34) & "test ma" & Chr(34) & vbCrLf
Sleep 100
MSComm1.Output = "AT+SMTPRCPT=0,0," & Chr(34) & Text9.Text & Chr(34) & vbCrLf
Sleep 100
MSComm1.Output = "AT+SMTPSUB=" & Chr(34) & Text11.Text & Chr(34) & vbCrLf

End Sub

Private Sub Command13_Click()
MSComm1.Output = "AT+SAPBR=0,1" & vbCrLf
End Sub

Private Sub Command14_Click()
If Len(Text1.Text) = 0 Then
   MsgBox ("发送的长度为0，在发送区填入数据")
Else
   MSComm1.Output = "AT+SMTPBODY=" & Len(Text1.Text) & vbCrLf
   Sleep 100
   MSComm1.Output = Text1.Text
   Sleep 100
   MSComm1.Output = "AT+SMTPSEND" & vbCrLf
End If
End Sub

Private Sub Command15_Click()
If Len(Text1.Text) = 0 Then
   MsgBox ("发送的长度为0，在发送区填入数据")
Else
    MSComm1.Output = "AT+HTTPPARA=" & Chr(34) & "URL" & Chr(34) & "," & Chr(34) & Text13.Text & Chr(34) & vbCrLf
    Sleep 100
    MSComm1.Output = "AT+HTTPDATA=" & CStr(Len(Text1.Text)) & "," & Text14.Text & vbCrLf
    Sleep 200
    MSComm1.Output = Text1.Text
    Sleep 100
    MSComm1.Output = "AT+HTTPACTION=1" & vbCrLf
     Sleep 100
End If
End Sub

Private Sub Command16_Click()
MSComm1.Output = "AT+HTTPPARA=" & Chr(34) & "URL" & Chr(34) & "," & Chr(34) & Text12.Text & Chr(34) & vbCrLf
Sleep 100
MSComm1.Output = "AT+HTTPACTION=0" & vbCrLf
End Sub

Private Sub Command17_Click()
MSComm1.Output = "AT+SAPBR=1,1" & vbCrLf
End Sub

Private Sub Command18_Click()
MSComm1.Output = "AT+HTTPINIT" & vbCrLf
End Sub

Private Sub Command19_Click()
MSComm1.Output = "AT+HTTPTERM" & vbCrLf
End Sub

Private Sub Command2_Click()
MSComm1.Output = "AT+CMGD=1,4" & vbCrLf '转为TXT模式
End Sub

Private Sub Command20_Click()
MSComm1.Output = "AT+HTTPREAD" & vbCrLf
End Sub

Private Sub Command22_Click()
MSComm1.Output = "AT+BTACPT=1" & vbCrLf
End Sub

Private Sub Command23_Click()
MSComm1.Output = "AT+BTPAIR=1,1" & vbCrLf
End Sub

Private Sub Command24_Click()
MSComm1.Output = "AT+BTPOWER=1" & vbCrLf

End Sub

Private Sub Command25_Click()
MSComm1.Output = "AT+BTHOST=" & Text17.Text & vbCrLf
End Sub

Private Sub Command26_Click()
MSComm1.Output = "AT+BTSPPSEND=" & CStr(Len(Text1.Text)) & vbCrLf
Sleep 50
MSComm1.Output = Text1.Text

End Sub

Private Sub Command27_Click()
MSComm1.Output = "AT+BTPOWER=0" & vbCrLf
End Sub

Private Sub Command28_Click()
MSComm1.Output = "AT+GSN" & vbCrLf
End Sub

Private Sub Command29_Click()
MSComm1.Output = "AT+CCID" & vbCrLf
End Sub

Private Sub Command3_Click()
MSComm1.Output = "ATD" & txt_Num.Text & ";" & vbCrLf
End Sub

Private Sub Command30_Click()
MSComm1.Output = "AT+CSMINS?" & vbCrLf
End Sub
'+BTHOST: sim800B,38:1c:4a:95:a0:18
Private Sub Command31_Click()
MSComm1.Output = "AT+BTHOST?" & vbCrLf
keepFlag = 1
uartStr = ""
Sleep 1000
DoEvents
keepFlag = 0
Text17.Text = Mid(uartStr, InStr(uartStr, "+BTHOST:") + Len("+BTHOST:"), InStr(uartStr, ",") - InStr(uartStr, "+BTHOST:") - Len("+BTHOST:"))
End Sub

Private Sub Command32_Click()
MSComm1.Output = "AT+CSTT=" & Chr(34) & Combo6.Text & Chr(34) & vbCrLf
End Sub

Private Sub Command6_Click()
MSComm1.Output = "AT+CSQ" & vbCrLf
End Sub


Private Sub Command7_Click()
If Len(Text1.Text) = 0 Then
   MsgBox ("发送的长度为0，在发送区填入数据")
Else
    MSComm1.Output = "AT+CIPSEND" & vbCrLf
    Sleep 100
    MSComm1.Output = Text1 & Chr(&H1A)
End If
End Sub

Private Sub Command8_Click()
MSComm1.Output = "AT+CIPSTART=" & Chr(34) & "UDP" & Chr(34) & "," & Chr(34) & Text3.Text & Chr(34) & "," & Chr(34) & Text4.Text & Chr(34) & vbCrLf
End Sub

Private Sub Command9_Click()
MSComm1.Output = "AT+SAPBR=0,1" & vbCrLf
End Sub

Private Sub tbn_list_Click()
MSComm1.Output = "AT+CMGF=1" & vbCrLf '转为TXT模式
Sleep 100
MSComm1.Output = "AT+CMGL=" & Chr(34) & "ALL" & Chr(34) & vbCrLf '转为TXT模式
End Sub

'========
'定时发送
'========
Private Sub Timer1_Timer() '定时发送，如果字符串则定时发送就行，如果十六进制发送则拆分为数组各元素发送
On Error Resume Next
Dim OPut() As Byte '..........定义发送的数据，字节型（0~255）
Dim Data() As String  '.......存放十六进制数，把text1.text中的数以“,”拆分开

MSComm1.OutBufferCount = 0 '....清空输出寄存器

If Check11.Value Then  '以十六进制 发送？
    Data = Split(Text1.Text, ",")
    ReDim OPut(0) '重定义数组OPut()，只需一个元素
    OPut(0) = HEX_to_DEC(Data(Timer_Count)) '把Data()中对应数组元素--经十六转十进制后--一个一个转移到OPut(0)中
    MSComm1.Output = OPut '输出 串口发送
    Timer_Count = Timer_Count + 1 'Timer_Count自增
    If Timer_Count = UBound(Data) + 1 Then Timer_Count = 0 '如果达到数组长度，Timer_Count归零
Else  '发送字符串
    MSComm1.Output = Text1.Text
    If Check1.Value Then
        MSComm1.Output = vbCrLf
    End If
End If
End Sub

'=============
'串口数据 接收
'*#1%A8968AC4895D87
'@
'=============
Private Sub Mscomm1_Oncomm()
'...通讯事件发生
Dim bytInfo() As Byte
Dim varTmp As Variant
Dim k As Integer
Dim str As String
Select Case MSComm1.CommEvent

Case comEvReceive '...有接受事件发生
  
    varTmp = MSComm1.Input '.....
    If keepFlag = 1 Then
       uartStr = varTmp
    End If
    bytInfo() = varTmp '.........从不定型转换为字节型
    
    If Check10.Value Then '......如果以十六进制显示
        For k = 0 To UBound(bytInfo)
        Text2.Text = Text2.Text & Right("0" & hex(bytInfo(k)), 2) & "," '十六进制显示
        Next
    Else
        Text2.Text = Text2.Text & varTmp '显示 收到字符串
        'uartStr = uartStr & varTmp
    End If


'MSComm.OutBufferCount = 0 '清除发送缓冲区
'MSComm.InBufferCount = 0 '清除接收缓冲区

End Select
Text2.SelStart = Len(Text2.Text)

End Sub

'清空接收
Private Sub Command4_Click()
Text2.Text = ""
MSComm1.InBufferCount = 0
End Sub
'清空发送
Private Sub Command5_Click()
Text1.Text = ""
MSComm1.OutBufferCount = 0
End Sub

'========
' 初始化
'========
Private Sub Form_Load()
On Error Resume Next
    Dim i As Integer
    For i = 1 To 40 Step 1
        MSComm1.CommPort = i '...使用Com1口
        MSComm1.PortOpen = True
    If MSComm1.PortOpen = True Then
        Combo1.AddItem "COM" + CStr(i)
        MSComm1.PortOpen = False
    End If
Next i

MSComm1.CommPort = 1 '...使用Com1口
MSComm1.Settings = "115200,N,8,1" '...设置通讯参数
MSComm1.InputMode = comInputModeText '以文本形式接收
'MSComm1.InputMode = comInputModeBinary '按2进制接收方式
MSComm1.RThreshold = 1 '传输缓冲区中允许的最小字符数   每个字符到接收缓冲区都触发OnComm事件 缺省值为0则不产生onComm事件
MSComm1.SThreshold = 1 '每发送一个字节就触发OnComm事件
MSComm1.InputLen = 0   '设置或返回一次从接收缓冲区中读取字节数，0表示一次读取所有数据

'Option1.Value = True
'Option3.Value = True


'Combo1.AddItem "COM1"
Combo2.AddItem "300"
Combo2.AddItem "600"
Combo2.AddItem "1200"
Combo2.AddItem "2400"
Combo2.AddItem "4800"
Combo2.AddItem "9600"
Combo2.AddItem "19200"
Combo2.AddItem "38400"
Combo2.AddItem "43000"
Combo2.AddItem "56000"
Combo2.AddItem "57600"
Combo2.AddItem "115200"

Combo3.AddItem "NONE"
Combo3.AddItem "ODD"
Combo3.AddItem "EVEN"
Combo3.AddItem "MARK"
Combo3.AddItem "SPACE"

Combo4.AddItem "5"
Combo4.AddItem "6"
Combo4.AddItem "7"
Combo4.AddItem "8"

Combo5.AddItem "1"
Combo5.AddItem "1.5"
Combo5.AddItem "2"

Combo6.AddItem "CMNET"
Combo6.AddItem "UNINET"
Combo6.AddItem "CMM2M"
Combo6.AddItem "CMIOT"
Combo6.AddItem "UNIM2M.NJM2MAPN"
Combo6.Text = "CMNET"

End Sub

Private Sub Form_UnLoad(Cancel As Integer)
If MSComm1.PortOpen = True Then MSComm1.PortOpen = False
End Sub

