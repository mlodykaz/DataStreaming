# import bibliotek

import json
import requests
import pandas as pd
import io
import sys
import pandas as pd

inputArguments=list(map(str, sys.argv[1].strip('[]').split(';')))

firstCur=inputArguments[0]
lastCur=inputArguments[1]
outputFileName=inputArguments[2]

#
url = 'https://api.coinmarketcap.com/v1/ticker/?start=%s&limit=%s' % (firstCur,lastCur)
#łacze się do API i pobieram dane
urlData = requests.get(url).content

#wrzucam dane do pandasa
rawData = pd.read_json(io.StringIO(urlData.decode('utf-8')))

# zapis pliku do csvki
rawData.to_csv(outputFileName)
