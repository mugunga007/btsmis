<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="service.User"%>
<%@page import="model.ItemUsageModel"%>
<%
ItemUsageModel ium = new ItemUsageModel();
 User user = (User) session.getAttribute("user");
            if(user != null){
            	int userId = user.getId();
             %> 

<%
   String picname = "";
   ///// The name you want to give your file
   
   String usageId = session.getAttribute("usageId").toString();
   
   String newn = usageId+"u"+userId;
    String saveFile = "";
    String fileLink = "";
    String contentType = request.getContentType();
    if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
        try {
            DataInputStream in = new DataInputStream(request.getInputStream());
            int formDataLength = request.getContentLength();
            byte dataBytes[] = new byte[formDataLength];
            int byteRead = 0;
            int totalBytesRead = 0;
            while (totalBytesRead < formDataLength) {
                byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                totalBytesRead += byteRead;
            }
             
            String file = new String(dataBytes);
            saveFile = file.substring(file.indexOf("filename=\"") + 10);
            saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
            saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
            int lastIndex = contentType.lastIndexOf("=");
            String boundary = contentType.substring(lastIndex + 1, contentType.length());
            int pos;
            pos = file.indexOf("filename=\"");
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            pos = file.indexOf("\n", pos) + 1;
            int boundaryLocation = file.indexOf(boundary, pos) - 4;
            int startPos = ((file.substring(0, pos)).getBytes()).length;
            int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
            /////////////////
            picname = saveFile+"";
           int leng  = picname.length();
           String picex = picname.substring(leng-4, leng);
           ///////////////
            fileLink =  "/" + newn + picex; 

            saveFile = "C://Users//maza//workspace//BTSMIS//WebContent//uploadTest" + fileLink;
            File ff = new File(saveFile);
            FileOutputStream fileOut = new FileOutputStream(ff);
            fileOut.write(dataBytes, startPos, (endPos - startPos));
            fileOut.flush();
            fileOut.close();
            ium.updateAttachment(Integer.parseInt(usageId), fileLink);
            %>
            
            
            <jsp:forward page="UserHome.jsp"></jsp:forward>
            <%
          //  out.print(fileLink);
        } catch (Exception e) {
e.printStackTrace();
        }
    }
    
   // out.print("out "+fileLink);
    
//out.println(fileLink+""); 
%>


<%
            }
            else
            {
%>

<jsp:forward page="Login.jsp" ></jsp:forward>
<%
            }
%>


<Br>

