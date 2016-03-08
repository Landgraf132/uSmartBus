function launchApp(){

    var res=getSetting("firstLaunch");
    console.log("LAUNCH ? :"+res);
    if (res===0 || res==="yes"){


        return 1
    }

    return 0
}

var arrayCity  = new Object();
function getAllStation() {


    var xmlhttp = new XMLHttpRequest();
    openDB();
    var site = getHostAdress(getSetting("city_rus"));
    var city=getSetting("city");


    var url = "http://"+site+"/php/getStations.php?city="+city+"&info=01234";


    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState == XMLHttpRequest.DONE && xmlhttp.status == 200) {
            parseJSON(xmlhttp.responseText);
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();



}

var selectedStation = new Object();
var arrayCity  = new Object(); //объявляем ассоциативный массив
function getAllCity(){ //кинуть все в БД потом вместо этого кода

    arrayCity["Архангельск"] = "arhangelsk";
    arrayCity["Астрахань"] = "astrahan";
    arrayCity["Бийск"] = "biysk";
    arrayCity["Братск"] = "bratsk";
    arrayCity["Великий Новгород"] = "novgorod";
    arrayCity["Владивосток"] = "vladivostok";
    arrayCity["Иваново"] = "ivanovo";
    arrayCity["Иркутск"] = "irkutsk";
    arrayCity["Караганда(Казахстан)"] = "karaganda";
    // arrayCity["Костанай(Казахстан)"] = "kostanai";
    arrayCity["Кострома"] = "kostroma";
    arrayCity["Курск"] = "kursk";
    arrayCity["Мурманск"] =  "murmansk";
    arrayCity["Орёл"] = "orel";
    arrayCity["Пенза"] = "penza";
    arrayCity["Рязань"] = "ryazan";
    arrayCity["Саранск"] = "saransk";
    arrayCity["Саратов"] = "saratov";
    arrayCity["Сочи"] = "sochi";
    arrayCity["Сургут"] = "surgut";
    arrayCity["Тамбов"] =  "tambov";
    arrayCity["Тверь"] =  "tver";
    arrayCity["Омск"] =  "omsk";
    arrayCity["Хабаровск"] =  "khabarovsk";
    arrayCity["Чебоксары"] = "cheboksari";
    arrayCity["Череповец"] = "chere";
    arrayCity["Улан-Удэ"] = "ulanude";
    arrayCity["Якутск"] = "yakutsk";
    for (var name in arrayCity){ //выведем на экран все элементы
        cityModel.append( {"cityName":name});

    }
}

function getHostAdress(city){

    arrayCity["Архангельск"] = "bus62.ru";
    arrayCity["Астрахань"] = "busapt.ru";
    arrayCity["Бийск"] = "bus62.ru/biysk";
    arrayCity["Братск"] = "bratskbus.ru";
    arrayCity["Великий Новгород"] = "bus62.ru/novgorod";
    arrayCity["Владивосток"] = "bus125.ru";
    arrayCity["Иваново"] = "transport-online-ivanovo.ru";
    arrayCity["Иркутск"] = "irkbus.ru";
    arrayCity["Караганда(Казахстан)"] = "bus09.kz";
    // arrayCity["Костанай(Казахстан)"] = "kostanai";
    arrayCity["Кострома"] = "bus44.ru";
    arrayCity["Курск"] = "bus46.ru";
    arrayCity["Мурманск"] =  "troll51.ru";
    arrayCity["Орёл"] = "bus57.ru";
    arrayCity["Пенза"] = "58bus.ru";
    arrayCity["Рязань"] = "bus62.ru";
    arrayCity["Саранск"] = "bus13.ru";
    arrayCity["Саратов"] = "bus64.ru";
    arrayCity["Сочи"] = "bus23.ru";
    arrayCity["Сургут"] = "spopat-auto.ru";
    arrayCity["Тамбов"] =  "bus62.ru/tambov";
    arrayCity["Тверь"] =  "bus62.ru/tver";
    arrayCity["Омск"] =  "bus62.ru/tomsk";
    arrayCity["Хабаровск"] =  "bus27.ru/";
    arrayCity["Чебоксары"] = "us62.ru/cheboksari";
    arrayCity["Череповец"] = "bus62.ru/chere";
    arrayCity["Улан-Удэ"] = "bus62.ru/ulanude";
    arrayCity["Якутск"] = "bus62.ru/yakutsk";

    for (var name in arrayCity){
        if (name==city){

            return arrayCity[name];
        }
    }
}

function getTranslit(city){

    arrayCity["Архангельск"] = "arhangelsk";
    arrayCity["Астрахань"] = "astrahan";
    arrayCity["Бийск"] = "biysk";
    arrayCity["Братск"] = "bratsk";
    arrayCity["Великий Новгород"] = "novgorod";
    arrayCity["Владивосток"] = "vladivostok";
    arrayCity["Иваново"] = "ivanovo";
    arrayCity["Иркутск"] = "irkutsk";
    arrayCity["Караганда(Казахстан)"] = "karaganda";
    arrayCity["Костанай(Казахстан)"] = "kostanai";
    arrayCity["Кострома"] = "kostroma";
    arrayCity["Курск"] = "kursk";
    arrayCity["Мурманск"] =  "murmansk";
    arrayCity["Орёл"] = "orel";
    arrayCity["Пенза"] = "penza";
    arrayCity["Рязань"] = "ryazan";
    arrayCity["Саранск"] = "saransk";
    arrayCity["Саратов"] = "saratov";
    arrayCity["Сочи"] = "sochi";
    arrayCity["Сургут"] = "surgut";
    arrayCity["Тамбов"] =  "tambov";
    arrayCity["Тверь"] =  "tver";
    arrayCity["Омск"] =  "omsk";
    arrayCity["Хабаровск"] =  "khabarovsk";
    arrayCity["Чебоксары"] = "cheboksari";
    arrayCity["Череповец"] = "chere";
    arrayCity["Улан-Удэ"] = "ulanude";
    arrayCity["Якутск"] = "yakutsk";

    for (var name in arrayCity){
        if (name==city){

            return arrayCity[name];
        }
    }
}

var arr;
var arrayStation  = new Array();
var arrayStationID  = new Object();
function parseJSON(response) {
    stationModel.clear();
    arr = JSON.parse(response);

    for(var i = 0; i < arr.length; i++) {
        arrayStation.push({id:arr[i].id,name:arr[i].name,descr:arr[i].descr});

        arrayStationID[arr[i].name]=arr[i].id;
        var res=getSetting("firstLaunch");
      if (res===0 || res==="yes"){
            saveStantion(arr[i].id, arr[i].name,arr[i].descr);

      }
        stationModel.append( {"stationName":arr[i].name,"stationDescryption":arr[i].descr,"stationId":arr[i].id});

    }
      if (res===0 || res==="yes")   saveSetting("firstLaunch","no");
}




//пользователь сделал выбор города
var globalCity;
function chooseCity(city){

    // if (city!=getSetting("city_rus")){ //dont work


    //}
    var tr_city=getTranslit(city);

    saveSetting("city", tr_city);
    saveSetting("city_rus", city);


}
var globalStation;
function chooseStation(station,id,descr){

    saveSetting("currentStation", id)

    var score = getStationScore(id);

    if (score===undefined) score=1;

    score=score+1;
    saveStationScore(id ,station,descr,score);

}

function getCity(){

    return globalCity;


}
function searchStation(str){
    if (str!=="")
    {
        stationModel.clear();

        //for (var name in arrayStation){ //выведем на экран все элементы
        for (var i=0;i<arrayStation.length;i++){

            if( arrayStation[i].name.indexOf(str) + 1) {

                //выведем на экран все элементы
                stationModel.append( {"stationName": arrayStation[i].name,"stationDescryption":  arrayStation[i].descr,"stationId":arrayStation[i].id});




            }
        }
    }
}
function searchCity(str){
    if (str!=="")
    {
        cityModel.clear();
        for (var name in arrayCity){ //выведем на экран все элементы

            if(name.indexOf(str) + 1) {

                //выведем на экран все элементы
                cityModel.append( {"cityName":name});




            }
        }
    }
}


function getCurrentStantionInfo(action){
     var stantionID=getSetting("currentStation");
    var stantion;
if  (action=="name"){

   stantion=getStantion(stantionID);


    return stantion;
} else {
       stantion=getStantionDescr(stantionID);


       return stantion;

}
}

function getTimetable(){


    var stantion=getSetting("currentStation");

    var city=getSetting("city");




    var site = getHostAdress(getSetting("city_rus"));



    var xmlhttp = new XMLHttpRequest();

    var url="http://"+site +"/php/getStationForecasts.php?sid="+stantion+"&type=0&city="+city+"&info=01234";
    console.log(url);
    xmlhttp.onreadystatechange=function() {
        if (xmlhttp.readyState == XMLHttpRequest.DONE && xmlhttp.status == 200) {

            parseJSON2(xmlhttp.responseText);
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();


}

function parseJSON2(response) { //то же самое что parseJSON только для timetable , иисправлю в ближайшее время
    var _timeLeft;
    timetableModel.clear();
    arr = JSON.parse(response);console.log("длинна массива остановок "+arr.length);

    for(var i = 0; i < arr.length; i++) {
        _timeLeft=Math.round(arr[i].arrt/60);
        if (_timeLeft==0) _timeLeft="Сейчас";
        timetableModel.append( {"busName":arr[i].rtype+arr[i].rnum,"timeLeft":_timeLeft.toString() ,"direct":arr[i].where});

    }
}

/* WORK WITH BD */
function openDB() {
    if(db !== null) return 1;

    // db = LocalStorage.openDatabaseSync(identifier, version, description, estimated_size, callback(db))
    db = LocalStorage.openDatabaseSync("usmartbus-app", "0.1", "Ubuntu smartbus application for Russia service Bus62", 100000);

    try {
        db.transaction(function(tx){
            tx.executeSql('CREATE TABLE IF NOT EXISTS settings(key TEXT UNIQUE, value TEXT)');
             tx.executeSql('CREATE TABLE IF NOT EXISTS stantion(id INTEGER UNIQUE, name TEXT,descr TEXT)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS top10(id INTEGER UNIQUE,name TEXT ,descr TEXT, score INTEGER)');
            tx.executeSql('CREATE TABLE IF NOT EXISTS bookmark(key TEXT UNIQUE, value INTEGER)');
            var table  = tx.executeSql("SELECT * FROM settings");
            // Seed the table with default values
            if (table.rows.length == 0) {
                tx.executeSql('INSERT INTO settings VALUES(?, ?)', ["distro", "Ubuntu"]);
                tx.executeSql('INSERT INTO settings VALUES(?, ?)', ["foo", "Bar"]);
                console.log('Settings table added');
            };
        });
    } catch (err) {
        console.log("Error creating table in database: " + err);
    };
}
function saveSetting(key, value) {

    openDB();
    db.transaction( function(tx){
        tx.executeSql('INSERT OR REPLACE INTO settings VALUES(?, ?)', [key, value]);
    });
}

function getSetting(key) {

    openDB();
    var res = "";
    db.transaction(function(tx) {
        var rs = tx.executeSql('SELECT value FROM settings WHERE key=?;', [key]);

        if (rs.rows.length===0) res=0; else  res = rs.rows.item(0).value;

        //}

    });
    return res;
}
function saveStantion(id, name,descr) {

    openDB();
    db.transaction( function(tx){
        tx.executeSql('INSERT OR REPLACE INTO stantion VALUES(?, ?,?)', [id, name,descr]);
    });
}

function getStantion(id) {

    openDB();
    var res = "";
    db.transaction(function(tx) {
        var rs = tx.executeSql('SELECT name FROM stantion WHERE id=?;', [id]);
console.log(id,rs.rows.item(0).name);
        if (rs.rows.length===0) res=0; else  res = rs.rows.item(0).name;

        //}

    });
    return res;
}


function getStantionDescr(id) {

    openDB();
    var res = "";
    db.transaction(function(tx) {
        var rs = tx.executeSql('SELECT descr FROM stantion WHERE id=?;', [id]);
console.log(id,rs.rows.item(0).name);
        if (rs.rows.length===0) res=0; else  res = rs.rows.item(0).descr;

        //}

    });
    return res;
}
function saveStationScore(id,name,descr, score) {

    openDB();
    db.transaction( function(tx){
        tx.executeSql('INSERT OR REPLACE INTO top10 VALUES(?, ?,?, ?)', [id,name,descr, score]);
    });
}

function getStationScore(id) {

    openDB();
    var res = "";
    db.transaction(function(tx) {
        var rs = tx.executeSql('SELECT score FROM top10 WHERE id=?;', [id]);
         if (rs.rows.length===0) res=0; else {

             res = rs.rows.item(0).score;
}
        //}

    });
    return res;
}
function get10StationScore(){
    var arrayStationTop10=new Array();
    openDB();
    var res = "";
    db.transaction(function(tx) {
        var rs = tx.executeSql('SELECT * FROM top10  LIMIT 10');

        for (var i=0;  rs.rows.length;i++){

            stationIdModel.append( {"stationName":rs.rows.item(i).name,"stationDescryption":rs.rows.item(i).descr,"stationId":rs.rows.item(i).id});

            arrayStationTop10.push({id:rs.rows.item(i).id,name:rs.rows.item(i).name,score:rs.rows.item(i).score,descr:rs.rows.item(i).descr});
        }
    });

    return arrayStationTop10;
}
