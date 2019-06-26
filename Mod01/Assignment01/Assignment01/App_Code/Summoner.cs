using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Summoner
{
    //private memebers  
    private string name;
    private int id;
    private int profileIconNumber;

    //properties
    public string Name { get; set; }
    public int Id { get; set; }
    public int ProfileIconNumber { get; set; }

    //constructor
    public Summoner(string name, int id, int profileIconNumber)
    {
        Name = name;
        Id = id;
        ProfileIconNumber = profileIconNumber;
    }
}
