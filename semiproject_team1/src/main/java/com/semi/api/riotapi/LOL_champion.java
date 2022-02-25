package com.semi.api.riotapi;

import org.springframework.stereotype.Component;

@Component
public class LOL_champion {

	public String getChampionName(String id) {
		String ChampionName=null;
		switch(id){
			case "266":ChampionName="아트록스"; break;
			case "412":ChampionName="쓰레쉬"; break;
			case "23":ChampionName="트린다미어"; break;
			case "79":ChampionName="그라가스"; break;
			case "69":ChampionName="카시오페아"; break;
			case "136":ChampionName="아우렐리온 솔"; break;
			case "13":ChampionName="라이즈"; break;
			case "78":ChampionName="뽀삐"; break;
			case "14":ChampionName="사이온"; break;
			case "1":ChampionName="애니"; break;
			case "202":ChampionName="진"; break;
			case "43":ChampionName="카르마"; break;
			case "111":ChampionName="노틸러스"; break;
			case "240":ChampionName="클레드"; break;
			case "99":ChampionName="럭스"; break;
			case "103":ChampionName="아리"; break;
			case "2":ChampionName="올라프"; break;
			case "112":ChampionName="빅토르"; break;
			case "34":ChampionName="애니비아"; break;
			case "27":ChampionName="신지드"; break;
			case "86":ChampionName="가렌"; break;
			case "127":ChampionName="리산드라"; break;
			case "57":ChampionName="마오카이"; break;
			case "25":ChampionName="모르가나"; break;
			case "28":ChampionName="이블린"; break;
			case "105":ChampionName="피즈"; break;
			case "74":ChampionName="하이머딩거"; break;
			case "238":ChampionName="제드"; break;
			case "68":ChampionName="럼블"; break;
			case "82":ChampionName="모데카이저"; break;
			case "37":ChampionName="소나"; break;
			case "96":ChampionName="코그모"; break;
			case "55":ChampionName="카타리나"; break;
			case "117":ChampionName="룰루"; break;
			case "22":ChampionName="애쉬"; break;
			case "30":ChampionName="카서스"; break;
			case "12":ChampionName="알리스타"; break;
			case "122":ChampionName="다리우스"; break;
			case "67":ChampionName="베인"; break;
			case "110":ChampionName="바루스"; break;
			case "77":ChampionName="우디르"; break;
//			case """; break;
			default :ChampionName="Not Found"; break;
		}
		return ChampionName;
	}
}
