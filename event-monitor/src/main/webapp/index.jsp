<!DOCTYPE html>
<html>
<head>
    <title>Contract Monitor</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen">
    <style>
        body {
            padding-top: 60px;
        }
    </style>
    <link href="css/bootstrap-responsive.min.css" rel="stylesheet" media="screen">

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>

        var $templ;

        if (!window.WebSocket) {
            alert("WebSocket not supported by this browser");
        }

        var server = {
            connect: function () {
                console.log("Connecting...");
//                var location = document.location.toString()
//                        .replace('http://', 'ws://')
//                        .replace('https://', 'wss://')
//                        .replace('index.jsp','servlet/WebSocket');

                var location = "ws://localhost:9090/test/servlet/WebSocket";
                this._ws = new WebSocket(location);
                this._ws.onopen = this._onopen;
                this._ws.onmessage = this._onmessage;
                this._ws.onclose = this._onclose;
                this._ws.onerror = this._onerror;
                $('#status').html('Connecting...').attr('class', 'alert');
            },

            _onerror: function () {
                console.log("Error", arguments);
                $('#status').html('Connection error').attr('class', 'alert alert-error');
            },

            _onopen: function () {
                console.log("Connected!");
                server._send('websockets are open for communications!');
                $('#status').html('Connected').attr('class', 'alert alert-success');
            },

            _send: function (message) {
                if (this._ws) {
                    this._ws.send(message);
                }
            },

            send: function (text) {
                if (text != null && text.length > 0) {
                    server._send(text);
                }
            },

            _onmessage: function (m) {
                console.log("New message", m);
                var $message = $templ.clone();
                $message.find('span').html(m.data);
                $message.hide().prependTo("#messages").show(500);
            },

            _onclose: function (m) {
                this._ws = null;
                $('#status').html('Closed').attr('class', 'alert');
            }
        };

        $(function () {

            $templ = $('#messages > div.alert').detach();

            server.connect();
        });
    </script>
</head>
<body>
<div class="navbar navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container">
            <a class="brand" href="#">Contract Monitor</a>
        </div>
    </div>
</div>

<div class="container">
    <div class="row span8">
        <div id="status" class="alert alert-info">
            Connecting...
        </div>
        <div id="messages">
            <div class="alert alert-info">
                <button type="button" class="close" data-dismiss="alert">&times;</button>
                <span></span>
            </div>
        </div>
    </div>
</div>
</body>
</html>