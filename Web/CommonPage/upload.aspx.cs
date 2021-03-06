﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EyouSoft.Common.Page;
using EyouSoft.Common;
using System.IO;

namespace Web.CommonPage
{
    public partial class upload : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Get the Upload File Type.
            string fileType = Utils.GetFormValue("filetype");


            // Get the file data.
            HttpPostedFile image_upload = Request.Files["Filedata"];

            if (image_upload == null || image_upload.ContentLength <= 0)
            {
                Response.Clear();
                Response.StatusCode = 200;

                Response.Write("{error:'上传的文件为空'}");
                Response.End();
            }

            else if (image_upload.ContentLength > 2097152)
            {
                Response.Clear();
                Response.StatusCode = 200;

                Response.Write("{error:'上传的文件超过了指定的大小'}");
                Response.End();
            }

            string companyId = string.Empty;

            var domain = EyouSoft.Security.Membership.UserProvider.GetDomain();
            if (domain != null)
            {
                companyId = domain.CompanyId.ToString();
            }
            else
            {
                Response.Clear();
                Response.StatusCode = 200;

                Response.Write("{error:'登录失效,请重新登录'}");
                Response.End();
            }

            string fileExt = System.IO.Path.GetExtension(image_upload.FileName);
            string fileName = Utils.GenerateFileName(fileExt);
            // 允许上传的文件格式
            //string[] fileTypeList = new[] { ".xls", ".rar", ".pdf", ".doc", ".swf", ".jpg", ".gif", ".jpeg", ".png", ".dot",".bmp",".zip",".7z",".docx",".xlsx" };
            string[] fileTypeList = Utils.GetUploadFileExtensions();
            if (!fileTypeList.Contains(fileExt))
            {
                Response.Clear();
                Response.StatusCode = 200;

                Response.Write("{error:'文件格式错误!'}");
                Response.End();
            }


            string year = DateTime.Now.Year.ToString();
            string month = DateTime.Now.Month.ToString();

            //原图完整路径
            string relativePath = "/UploadFiles/" + companyId + "/" + year + "/" + month + "/" + fileName;
            //原图文件夹
            string relativeDirPath = "/UploadFiles/" + companyId + "/" + year + "/" + month + "/";

            string desFilePath = Server.MapPath(relativePath);
            string desDirPath = Server.MapPath(relativeDirPath);

            if (!Directory.Exists(desDirPath))
            {
                Directory.CreateDirectory(desDirPath);
            }
            image_upload.SaveAs(desFilePath);
            Response.Clear();

            Response.StatusCode = 200;

            Response.Write("{\"fileid\":\"" + image_upload.FileName + "|" + relativePath + "\"}");
            Response.End();
        }
    }
}
