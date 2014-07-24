using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.SignalR.Hubs;
using System.Threading.Tasks;
using Microsoft.AspNet.SignalR;

namespace SignalR.Common
{
    [HubName("myChatHub")]
    public class LetsChat : Hub
    {
        private List<string> User = new List<string>();

        public void send(string message)
        {
            Clients.All.addMessage(message);
        }

        public static void SendToClient(string message)
        {
            var hubContext = GlobalHost.ConnectionManager.GetHubContext<LetsChat>();
            hubContext.Clients.All.addMessage(message);
        }

        public override Task OnConnected()
        {
            var connectionId = Context.ConnectionId;
            User.Add(connectionId);

            return base.OnConnected();
        }

    }
}