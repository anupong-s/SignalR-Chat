<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyChat.aspx.cs" Inherits="MyChat.MyChat" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Chat</title>
    <script src="Scripts/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script src="Scripts/jquery.signalR-1.0.0-rc1.js" type="text/javascript"></script>
    <script src="http://localhost:13866/signalr/hubs" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <script type="text/javascript">

        $(function () {

            var connection = $.hubConnection("http://localhost:13866");

            var proxy = connection.createHubProxy("myChatHub");

            proxy.on("addMessage", function (message) {
                $('#listMessages').append('<li>' + message + '</li>');
            });

            connection.start().done(function () {
                $("#SendMessage").click(function () {
                    proxy.invoke("send", $('#txtMessage').val());
                });
            });

        });

        //        $(function () {

        //            var IWannaChat = $.connection.myChatHub;

        //            IWannaChat.client.addMessage = function (message) {
        //                $('#listMessages').append('<li>' + message + '</li>');
        //            };

        //            $("#SendMessage").click(function () {
        //                IWannaChat.server.send($('#txtMessage').val());
        //            });

        //            $.connection.hub.start();
        //        });
    </script>
    <div>
        <input type="text" id="txtMessage" />
        <input type="button" id="SendMessage" value="broadcast" />
        <ul id="listMessages">
        </ul>
    </div>
    </form>
</body>
</html>
