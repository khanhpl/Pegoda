using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR;

namespace Api.SignalR
{
    public class ChatHub : Hub
    {
        public ChatHub() { }

        public async Task Request()
        {
            await Clients.Caller.SendAsync("Receive");
        }
    }
}