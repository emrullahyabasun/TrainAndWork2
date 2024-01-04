namespace BurgerKingHomeWork.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class enes : DbMigration
    {
        public override void Up()
        {
            DropColumn("dbo.TCPDatas", "Price");
        }
        
        public override void Down()
        {
            AddColumn("dbo.TCPDatas", "Price", c => c.Double(nullable: false));
        }
    }
}
