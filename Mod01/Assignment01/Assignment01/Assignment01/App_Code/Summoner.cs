using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Summoner
{
    //private member variables
    private int profileIconId;
    private string name;
    private string puuid;
    private int summonerLevel;
    private string accountId;
    private string id;
    private int revisionDate;
    //public properties
    public int ProfileIconId { get; set; }
    public string Name { get; set; }
    public string Puuid { get; set; }
    public int SummonerLevel { get; set; }
    public string AccountId { get; set; }
    public string Id { get; set; }
    public long RevisionDate { get; set; }

    //method to display data in html
    public string SummonerInfoHtml(string name)
    {
        //using summoner name search for data
        string htmlString;
        htmlString = "<h1>" + name + "</h1><br />";
        htmlString += "<ul><li>" + Puuid + "</li><li>" + SummonerLevel + "</li><li>" + ProfileIconId + "</li><li>" + AccountId + "</li><li>" + Id + "</li><li>" + RevisionDate + "</li></ul>";
        return htmlString;
    }
}
