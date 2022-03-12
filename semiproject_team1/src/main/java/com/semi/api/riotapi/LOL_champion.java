package com.semi.api.riotapi;

import org.springframework.stereotype.Component;

@Component
public class LOL_champion {

	public String getChampionName(int id) {
		String ChampionName=null;
		switch(id) {
		case 266:
			ChampionName = "아트록스";break; // 챔피언 한글 이름
		case 412:
			ChampionName ="쓰레쉬";break;
		case 23:
			ChampionName = "트린다미어";break;
		case 79:
			ChampionName = "그라가스";break;
		case 69:
			ChampionName = "카시오페아";break;
		case  136:
			ChampionName = "아우렐리온 솔";break;
		case   13:
			ChampionName = "라이즈";break;
		case   78:
			ChampionName = "뽀삐";break;
		case  14:
			ChampionName = "사이온";break;
		case  1:
			ChampionName = "애니";break;
		case  202:
			ChampionName = "진";break;
		case 43:
			ChampionName = "카르마";break;
		case  111:
			ChampionName = "노틸러스";break;
		case 240:
			ChampionName = "클레드";break;
		case   99:
			ChampionName = "럭스";break;
		case  103:
			ChampionName = "아리";break;
		case   2:
			ChampionName = "올라프";break;
		case   112:
			ChampionName = "빅토르";break;
		case  34:
			ChampionName = "애니비아";break;
		case   27:
			ChampionName = "신지드";break;
		case   86:
			ChampionName = "가렌";break;
		case   127:
			ChampionName = "리산드라";break;
		case    57:
			ChampionName = "마오카이";break;
		case     25:
			ChampionName =  "모르가나";break;
		case    28:
			ChampionName =  "이블린";break;
		case   105:
			ChampionName =  "피즈";break;
		case   74:
			ChampionName =  "하이머딩거";break;
		case   238:
			ChampionName =  "제드";break;
		case   68:
			ChampionName =  "럼블";break;
		case  82:
			ChampionName =  "모데카이저";break;
		case  37:
			ChampionName =  "소나";break;
		case  96:
			ChampionName =  "코그모";break;
		case  55:
			ChampionName =  "카타리나";break;
		case  117:
			ChampionName =  "룰루";break;
		case  22:
			ChampionName =  "애쉬";break;
		case  30:
			ChampionName =  "카서스";break;
		case  12:
			ChampionName =  "알리스타";break;
		case  122:
			ChampionName =  "다리우스";break;
		case   67:
			ChampionName = "베인";break;
		case  110:
			ChampionName = "바루스";break;
		case  77:
			ChampionName =  "우디르";break;
		case  89:
			ChampionName =  "레오나";break;
		case   126:
			ChampionName = "제이스";break;
		case   134:
			ChampionName = "신드라";break;
		case   80:
			ChampionName =  "판테온";break;
		case  92:
			ChampionName = "리븐";break;
		case  121:
			ChampionName = "카직스";break;
		case  42:
			ChampionName =  "코르키";break;
		case  268:
			ChampionName =   "아지르";break;
		case 51:
			ChampionName =   "케이틀린";break;
		case   76:
			ChampionName =  "니달리";break;
		case 3:
			ChampionName =  "갈리오";break;
		case 45:
			ChampionName =  "베이가";break;
		case 432:
			ChampionName =  "바드";break;
		case 150:
			ChampionName = "나르";break;
		case 90:
			ChampionName =   "말자하";break;
		case   104:
			ChampionName =  "그레이브즈";break;
		case  254:
			ChampionName =  "바이";break;
		case  10:
			ChampionName =  "케일";break;
		case  39:
			ChampionName =  "이렐리아";break;
		case  64:
			ChampionName = "리 신";break;
		case  420:
			ChampionName =   "일라오이";break;
		case 60:
			ChampionName =  "엘리스";break;
		case  106:
			ChampionName =  "볼리베어";break;
		case 20:
			ChampionName = "누누와 윌럼프";break;
		case 4:
			ChampionName =  "트위스티드 페이트";break;
		case 24:
			ChampionName =  "잭스";break;
		case  102:
			ChampionName =  "쉬바나";break;
		case 429:
			ChampionName =  "칼리스타";break;
		case 36:
			ChampionName =  "문도 박사";break;
		case 427:
			ChampionName = "아이번";break;
		case  131:
			ChampionName = "다이애나";break;
		case 63:
			ChampionName = "브랜드";break;
		case 113:
			ChampionName = "세주아니";break;
		case 8:
			ChampionName =  "블라디미르";break;
		case  154:
			ChampionName =  "자크";break;
		case  421:
			ChampionName = "렉사이";break;
		case  133:
			ChampionName = "퀸";break;
		case  84:
			ChampionName =  "아칼리";break;
		case  163:
			ChampionName =  "탈리야";break;
		case  18:
			ChampionName =  "트리스타나";break;
		case  120:
			ChampionName =  "헤카림";break;
		case  15:
			ChampionName = "시비르";break;
		case  236:
			ChampionName =  "루시안";break;
		case   107:
			ChampionName = "렝가";break;
		case  19:
			ChampionName = "워윅";break;
		case  72:
			ChampionName =  "스카너";break;
		case  54:
			ChampionName = "말파이트";break;
		case  157:
			ChampionName =  "야스오";break;
		case  101:
			ChampionName = "제라스";break;
		case   17:
			ChampionName = "티모";break;
		case  75:
			ChampionName =  "나서스";break;
		case  58:
			ChampionName =  "레넥톤";break;
		case   119:
			ChampionName =  "드레이븐";break;
		case  35:
			ChampionName =  "샤코";break;
		case  50:
			ChampionName =  "스웨인";break;
		case   91:
			ChampionName =  "탈론";break;
		case  40:
			ChampionName = "잔나";break;
		case   115:
			ChampionName =  "직스";break;
		case   245:
			ChampionName =  "에코";break;
		case   61:
			ChampionName =  "오리아나";break;
		case  114:
			ChampionName = "피오라";break;
		case  9:
			ChampionName =  "피들스틱";break;
		case  31:
			ChampionName =  "초가스";break;
		case  33:
			ChampionName =  "람머스";break;
		case  7:
			ChampionName =  "르블랑";break;
		case  16:
			ChampionName =  "소라카";break;
		case  26:
			ChampionName =  "질리언";break;
		case  56:
			ChampionName = "녹턴";break;
		case  222:
			ChampionName =  "징크스";break;
		case  83:
			ChampionName = "요릭";break;
		case  6:
			ChampionName = "우르곳";break;
		case  203:
			ChampionName =  "킨드레드";break;
		case  21:
			ChampionName =  "미스 포츈";break;
		case  62:
			ChampionName =  "오공";break;
		case  53:
			ChampionName = "블리츠크랭크";break;
		case   98:
			ChampionName =  "쉔";break;
		case  201:
			ChampionName =   "브라움";break;
		case  5:
			ChampionName = "신 짜오";break;
		case  29:
			ChampionName = "트위치";break;
		case  11:
			ChampionName = "마스터 이";break;
		case  44:
			ChampionName = "타릭";break;
		case  32:
			ChampionName = "아무무";break;
		case 41:
			ChampionName =  "갱플랭크";break;
		case  48:
			ChampionName =  "트런들";break;
		case   38:
			ChampionName = "카사딘";break;
		case   161:
			ChampionName = "벨코즈";break;
		case   143:
			ChampionName =  "자이라";break;
		case  267:
			ChampionName =  "나미";break;
		case  59:
			ChampionName =  "자르반 4세";break;
		case  81:
			ChampionName =   "이즈리얼";break;
		case    350:
			ChampionName =   "유미";break;
		case  145:
			ChampionName =  "카이사";break;
		case   518:
			ChampionName = "니코";break;
		case   142:
			ChampionName =  "조이";break;
		case   498:
			ChampionName =  "자야";break;
		case  517:
			ChampionName =  "사일러스";break;
		case  141:
			ChampionName =   "케인"; break;
		case   516:
			ChampionName =  "오른";break;
		case   555:
			ChampionName =   "파이크";break;
		case  164:
			ChampionName =   "카밀";break;
		case   246:
			ChampionName = "키아나";break;
		case   497:
			ChampionName = "라칸";break;
		case 777:
			ChampionName =  "요네";break;
		case 876:
			ChampionName = "릴리아";break;
		case 235:
			ChampionName = "세나";break;
		case 875:
			ChampionName = "세트";break;
		case 523:
			ChampionName = "아펠리오스";break;
		case 223:
			ChampionName = "탐 켄치";break;
		case 360:
			ChampionName = "사미라";break;
		case 526:
			ChampionName = "렐";break;
		case 234:
			ChampionName = "비에고";break;
		case 887:
			ChampionName = "그웬";break;
		case 166:
			ChampionName = "아크샨";break;
		case 711:
			ChampionName = "벡스";break;
		case 85:
			ChampionName = "케넨";break;
		case 221:
			ChampionName = "제리";break;
		case 147:
			ChampionName = "세라핀";break;
		default :ChampionName="Not Found"; break;
		
		}
		return ChampionName;
	}
}
