import asyncio
from pyrogram import Client, idle
from plugins.cb_data import app as Client2
from config import *
import pyrogram.utils

# Fix for channel/chat ID limits
pyrogram.utils.MIN_CHAT_ID = -999999999999
pyrogram.utils.MIN_CHANNEL_ID = -100999999999999

# Main bot instance
bot = Client(
    "Renamer",
    bot_token=BOT_TOKEN,
    api_id=API_ID,
    api_hash=API_HASH,
    plugins=dict(root='plugins')
)

async def main():
    if STRING_SESSION:
        apps = [Client2, bot]
        for app in apps:
            await app.start()
        
        await idle()

        for app in apps:
            await app.stop()
    else:
        await bot.run()

if __name__ == "__main__":
    asyncio.run(main())

# Jishu Developer 
# Don't Remove Credit 🥺
# Telegram Channel @Madflix_Bots
# Back-Up Channel @JishuBotz
# Developer @JishuDeveloper
