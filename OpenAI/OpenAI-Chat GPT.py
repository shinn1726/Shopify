# -*- coding: utf-8 -*-
"""
Created on Sun Apr 30 19:50:36 2023

@author: Jongwon Shinn
"""

#Note: The openai-python library support for Azure OpenAI is in preview.
import os
import openai
openai.api_type = "azure"
openai.api_base = os.getenv("OPENAI_API_BASE") 
openai.api_version = "2023-03-15-preview"
openai.api_key = os.getenv("OPENAI_API_KEY")

text = """


The 2022 FIFA World Cup was the 22nd FIFA World Cup, the quadrennial world championship for national football teams organized by FIFA. It took place in Qatar from 20 November to 18 December 2022, after the country was awarded the hosting rights in 2010. It was the first World Cup to be held in the Arab world and Muslim world, and the second held entirely in Asia after the 2002 tournament in South Korea and Japan.[A]

This tournament was the last with 32 participating teams, with the number of teams being increased to 48 for the 2026 edition. To avoid the extremes of Qatar's hot climate,[B] the event was held during November and December.[C] It was held over a reduced time frame of 29 days with 64 matches played in eight venues across five cities. Qatar entered the event—their first World Cup—automatically as the host's national team, alongside 31 teams determined by the qualification process.

Argentina were crowned the champions after winning the final against the title holder France 4–2 on penalties following a 3–3 draw after extra time. It was Argentina's third title and their first since 1986, as well being the first nation from outside of Europe to win the tournament since 2002. French player Kylian Mbappé became the first player to score a hat-trick in a World Cup final since Geoff Hurst in the 1966 final and won the Golden Boot as he scored the most goals (eight) during the tournament. Argentine captain Lionel Messi was voted the tournament's best player, winning the Golden Ball. Teammates Emiliano Martínez and Enzo Fernández won the Golden Glove, awarded to the tournament's best goalkeeper, and the Young Player Award, awarded to the tournament's best young player, respectively. With 172 goals, the tournament set a new record for the highest number of goals scored with the 32-team format, with every participating team scoring at least one goal.[4]

The choice to host the World Cup in Qatar attracted significant criticism, with concerns raised over the country's treatment of migrant workers, women and members of the LGBT community, as well as Qatar's climate, lack of a strong football culture, scheduling changes, and allegations of bribery for hosting rights and wider FIFA corruption.[D]

"""

query = f"""
Article:
\"\"\"
{text}
\"\"\"

Question: How was South Korea team in 2022 FIFA World Cup?"""

response = openai.ChatCompletion.create(
    engine="gpt-35-turbo", # engine = "deployment_name".
    messages=[
        {'role': 'system', 'content': 'You answer questions about the FIFA World Cup'},
        {'role': 'user', 'content': query},
    ]
)

print(query)
print(response['choices'][0]['message']['content'])