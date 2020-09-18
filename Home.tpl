<!DOCTYPE html>
<html lang="en">
  <head>
    <title>My Bottle Home</title>
    <style>
      body {
        background-color: #fff;
        font-family: calibri;
      }

      h1 {
        text-align: center;
        font-size: 40px;
        color: #1f5e5d;
        font-family: sans-serif;
      }


      .btn-main {
        padding: 10px;
        min-width: 12em;
        font-size: 15px;
        cursor: pointer;
        margin: 3%;
        background-image: linear-gradient(0deg, #b6fbff, #a6bec0);
        border: 2px solid #b3b5b6;;
      }

      .btn-main:hover,
      .btn-main:focus {
        background-color: #0e9592;
    background-image: none;
    border-color: #000;
    color: #fff;
      }

      .show {
        display: block;
      }

      .hide {
        display: none;
      }

      .enabled {
        color: #04ef0b;
      }

      .disabled {
        color: #ef3304;
      }

      ::-webkit-scrollbar {
        width: 0.5em;
      }

      ::-webkit-scrollbar-track {
        box-shadow: inset 0 0 6px rgba(95, 79, 79, 0.3);
      }

      ::-webkit-scrollbar-thumb {
        background-color: #00889d;
        outline: 1px solid slategrey;
      }

      .col70{
        width:70%;
        min-height:550px;
        border: 1px solid #0e9592;
        margin-left:5px;
        background-image: linear-gradient(white, #cfd3d5);
        padding:10px;
      }
      .col30{
        width: 30%;
        border: 1px solid #0e9592;
        margin-left:5px;
        background-image: linear-gradient(white,#cfd3d5 );
      }
      .container{
        margin-left: 10%;
        margin-right:10%;
        display:flex;
      }

      .folder {
        width: 30px;
    height: 20px;
    margin-right:5px;
    position: relative;
    background-color: #5dabae;
    border-radius: 3px;
    }

.folder:before {
    content: '';
    width: 50%;
    height: 12px;
    border-radius: 0 20px 0 0;
    background-color: #5dabae;
    position: absolute;
    top: -5px;
    left: 0px;
}
.folder-list{
  list-style-type: none;
  padding-left:2%;
}

.folder-list > li{  
  cursor: pointer;
}
.file {
	float:left;
  margin-right:5px;
  width:20px;
  height:30px;
  background:#000;
  border-radius:3px;
  padding-left:2px;
  text-shadow: 3px 1px 1px rgba(0,0,0,0.4); 
   background:#5dabae;
}
.file:before {
	content:'';
  float:right;
  width:10px;
  height:10px;
  background-image:-webkit-linear-gradient(top right, rgba(237,237,237,1) 50%, rgba(19,19,19,0.4) 50%);
  background-image:linear-gradient(to bottom left, rgba(237,237,237,1) 50%, rgba(19,19,19,0.4) 50%);
  border-radius:0 0 0 3px;
}
.file:after {
  content:'';
  width:10px;
  height:10px;
  background-image:-webkit-linear-gradient(top right, rgba(0,0,0,0.4) 50%, rgba(0,0,0,0) 50%);
  background-image:linear-gradient(to bottom left, rgba(0,0,0,0.4) 50%, rgba(0,0,0,0) 50%);
  position:relative;
}
.inline-flex{
  display: inline-flex;
}
    </style>
  </head>
  <body>
    <h1>Title of the page</h1>
    <div class="container">

      <div class="col70">      
           <div class="inline-flex"><div class="folder"></div> {{ tree['name'] }} </div>
              % if tree['children']:
               % for fil in tree['children']:
                <ul class="folder-list">
                  <li>
                    % if len(fil) > 1:
                    <div class="inline-flex"><div class="folder"></div> <a ondblclick="folderClicked(this)">{{ fil['name'] }}</a></div>
                    % else:
                    <div class="inline-flex"><div class="file"></div><a ondblclick="fileClicked(this)">{{ fil['name'] }}</a></div>
                    % end
                    </li>
                </ul>
                % end
          % end
         
  
      </div>
      <div class="col30">
        <div>
          <button class="btn-main" onclick="startFunc()">Show</button>
        </div>
        <div>
          <button class="btn-main" onclick="stopFunc()">
            Start Logging Details
          </button>
        </div>
        <div>
          <button class="btn-main" onclick="downloadFunc()">
            Download Logs
          </button>
        </div>
      </div>
     
      
    </div>
     
    </div>
<script>

  function folderClicked(ele){
    var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
          if (xmlhttp.readyState == XMLHttpRequest.DONE) {
            // XMLHttpRequest.DONE == 4
            if (xmlhttp.status == 200) {
              alert('python method called');
            } else if (xmlhttp.status == 400) {
            } else {
            }
          }
        };
        var params = '/filename=' + ele.innerText;
        xmlhttp.open("GET", "http://localhost:6003/folderClicked", true);
        xmlhttp.send();
  }

  function fileClicked(ele){
    console.log('file clicked');
  }
</script>

  </body>
</html>
