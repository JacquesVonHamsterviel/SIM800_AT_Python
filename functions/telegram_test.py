from telegram import tg_bot

bot=tg_bot("https://api-tg.kkk.plus","5539741723:AAH45p8WwlKpE_SV6zhyaS7jiwudm4K5ndU")
print(bot.getUpdates())
print(bot.sendMessage("-1001636319740","TEST"))