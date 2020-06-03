#DATE_FORMATS内のキーはなんでも可
Time::DATE_FORMATS[:datetime_jp]= '%Y年%m月%d日 %H時%M分'
Time::DATE_FORMATS[:defaulttime_jp]= '%Y年%m月%d日 %H時%M分%S秒'
#これはボツネタ(曜日が英語になる)
Time::DATE_FORMATS[:date_jp]= "%m月%d日 %a曜日"
