'use strict';

var dateArray = new Array(7);
var siteURL;
var listURL;
var userId;
var clientContext;
var listText;
var count;
var teamNames = [];

SP.SOD.executeFunc('sp.js', 'SP.ClientContext', sharePointReady);

function getListData(_listName, _queryString) {
    return $.ajax({ 
        url: listURL + "/GetByTitle('" + _listName + "')/items?" + _queryString,
        type: "GET",
        headers: {
            "accept": "application/json;odata=verbose"
        },
    });
}

function constructList() {
    var deferred = new $.Deferred();
    var teamArray = [];
    var parentID;
    getListData("m_team_entities", "$select=team_level,team_name,parent_team,team_ID&$orderby=team_level desc").done(function (data) {
        $.each(data.d.results, function (key, value) {
            teamNames[value.team_ID]=value.team_name;
            if (value.team_level == 0) {
                teamArray[value.team_ID] = "<ul id='tree-data' style='display:none'><li id='0'>0<ul>" + teamArray[value.team_ID] + "</ul></li></ul>";
            } else {


                if (teamArray[value.team_ID]) {
                    teamArray[value.team_ID] = "<li id='" + value.team_ID + "'>" + value.team_ID + "<ul>" + teamArray[value.team_ID] + "</ul></li>";
                } else {
                    teamArray[value.team_ID] = "<li id='" + value.team_ID + "'>" + value.team_ID + "</li>";
                }
                if (teamArray[value.parent_team]) {
                    teamArray[value.parent_team] += teamArray[value.team_ID];
                } else {
                    teamArray[value.parent_team] = teamArray[value.team_ID];
                }
            }
        });        
        listText = teamArray[0];
    }).always(function () {
        console.log("ajax finish");
        deferred.resolve();
    });
    return deferred;
}
    
function parseFinish() {
    listText[arrCounter] = "</ul>";
    alert(listText);
}

function viewTeam(_teamID) {
    alert(_teamID);
}

function sharePointReady() {
    
    siteURL = _spPageContextInfo.webAbsoluteUrl;
    listURL = siteURL + "/_api/web/lists/";
    userId = _spPageContextInfo.userId
    listText = "";
    var deferred = constructList();
    deferred.done(function () {
        console.log("FINAL RESULT:" + listText);
        $("#listText").html(listText);
        $("#tree-data").jOrgChart({
          chartElement: $("#tree-view")
    });

    });
    console.log("end of sharepointready");
}