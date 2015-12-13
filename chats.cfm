
<!DOCTYPE HTML>
<html>
   <head>
      <script type="text/javascript">
         function WebSocketTest()
         {
            if ("WebSocket" in window)
            {
               // Let us open a web socket
               var ws = new WebSocket("ws://localhost:10125");
               ws.onopen = function(evt)
               {
                  // Web Socket is connected, send data using send()
                  // This will run only at the sender side
                  document.getElementById("contents").innerHTML = document.getElementById("contents").innerHTML + '<br>Sent : '+document.getElementById("msgBox").value
                  ws.send(document.getElementById("msgBox").value);
                  document.getElementById("msgBox").value = '';
               };
				// Message will received for the sender too. Have to add some condition to restrict that.
               ws.onmessage = function (evt) 
               { 
                  var received_msg = evt.data;
                  document.getElementById("contents").innerHTML = document.getElementById("contents").innerHTML + '<br>Received : '+evt.data
               };
				
               ws.onclose = function()
               { 
                  // websocket is closed.
                  alert("Connection is closed..."); 
               };
			   ws.onerror = function(evt)
               { 
                  // websocket is closed.
                  console.log(evt.data); 
               };
            }
            
            else
            {
               // The browser doesn't support WebSocket
               alert("WebSocket NOT supported by your Browser!");
            }
         }
      </script>
		
   </head>
   <body>
   
      <div id="sse">
         <textarea name="msgBox" id="msgBox" class="msgBox"></textarea>
         <button onclick="javascript:WebSocketTest()" name="SendMessage">SendMessage</button>
      </div>
      <div id="contents">
         <h1>Conversation</h1>
      </div>
      
   </body>
</html>
