<%-- The following 4 lines are ASP.NET directives needed when using SharePoint components --%>

<%@ Page Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" MasterPageFile="~masterurl/default.master" Language="C#" %>

<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%-- The markup and script in the following Content element will be placed in the <head> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="../Scripts/jquery-1.9.1.min.js"></script>
    <SharePoint:ScriptLink name="sp.js" runat="server" OnDemand="true" LoadAfterUI="true" Localizable="false" />
    <meta name="WebPartPageExpansion" content="full" />

    <!-- Add your CSS styles to the following file -->
        <link rel="Stylesheet" type="text/css" href="../Content/bootstrap.min.css" />
    <link rel="Stylesheet" type="text/css" href="../Content/bootstrap-theme.min.css" />
    <link rel="Stylesheet" type="text/css" href="../Content/App.css" />
    <link href="../Content/orgchart.css" rel="stylesheet">

    <!-- Add your JavaScript to the following file -->
      <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="../Scripts/orgchart.js"></script>
    <script type="text/javascript" src="../Scripts/App.js"></script>
</asp:Content>

<%-- The markup in the following Content element will be placed in the TitleArea of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server">
    Page Title
</asp:Content>

<%-- The markup and script in the following Content element will be placed in the <body> of the page --%>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">

    <div id></div>
    <div id="clockin"><asp:Button id="addteambutton" ClientIDMode="Static" Text="チームを作成"
  ForeColor="#cc3300" Font-Size="Large" Font-Bold="true" Height="40" OnClientClick="return createTeam()" runat="server" />
        
    </div>
    <div id ="listText">
    </div>
    <div id="tree-view">
    </div> 

        <!-- 手動入力用モーダルウィンドウ -->
    <div class="modal" id="manualInput" role="dialog">
      <div class="modal-dialog modal-sm">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <h4 class="modal-title">te</h4>
          </div>
          <div class="modal-body">
            <div class="form-inline">
              <div class="form-group">
                <label class="form-control-label">時間:</label>
                <input type="text" class="form-control" id="manual-input-hhmi" style="width:100px;">
              </div>
              <input type="hidden" id="target-date">
              <input type="hidden" id="inout">
              <input type="hidden" id="work-date">
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-primary" onclick="clockDailyManualInput();">登録</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">閉じる</button>
          </div>
        </div>
      </div>
    </div>

</asp:Content>
