Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F4EC25B47
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 27 Oct 2023 03:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DAB44ECAB;
	Fri, 27 Oct 2023 03:18:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DAB44ECAB
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=exposhowvisitor-com.20230601.gappssmtp.com header.i=@exposhowvisitor-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=mErfxZGw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LSCh5dJvXZTh; Fri, 27 Oct 2023 03:18:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 68F3E41E48;
	Fri, 27 Oct 2023 03:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68F3E41E48
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B6B5C0071;
	Fri, 27 Oct 2023 03:18:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2CE5C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 03:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBAF684AAD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 03:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBAF684AAD
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=exposhowvisitor-com.20230601.gappssmtp.com
 header.i=@exposhowvisitor-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=mErfxZGw
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nWGXKCQED4Uh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 03:18:36 +0000 (UTC)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8DA4484AAC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 27 Oct 2023 03:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DA4484AAC
Received: by mail-pl1-x641.google.com with SMTP id
 d9443c01a7336-1ca72f8ff3aso13465355ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 26 Oct 2023 20:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=exposhowvisitor-com.20230601.gappssmtp.com; s=20230601; t=1698376716;
 x=1698981516; darn=lists.linuxfoundation.org; 
 h=disposition-notification-to:content-language:importance
 :thread-index:mime-version:message-id:date:subject:to:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CNtkJ6Y/Mcc9pRs79vnmvKcBzw5Osx8Jknm9myc5qlU=;
 b=mErfxZGwAWm+jS/MxF8tad3zPDfMne4BC0DU8XqIRJqQGc51NpGdvFoGeJsUc5zBgZ
 9nWhNPEoCiQ1qGjCTXGxaUOrwNRl0UR5jrz9QOUPU094oshr3TEdkp+dF04wgSI+q0iZ
 BXfnz9Hdmfwjm5WVpZejlJhAu+f9z7BCgbG0Vd5EacIlGCaOZPDZ5CndMwy/WtaMDnfo
 eQV5E/eeCG4AaH4pQgnk1Pv/Ej4mO0VRM2sixrbSKp4xSrhJE+0zzuHiA3o1yUPWUYUb
 e8QKF2kvrPm0YzAw8wXQkUEq6PxGGvyGrEUwkYJe8WJpvhknehpIVCeNJ29n+ejCzFae
 x1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698376716; x=1698981516;
 h=disposition-notification-to:content-language:importance
 :thread-index:mime-version:message-id:date:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CNtkJ6Y/Mcc9pRs79vnmvKcBzw5Osx8Jknm9myc5qlU=;
 b=fKo6ZEA7t150++IKekfmRVCIQknXNoTpJH9FKQZLDx3B0kNBYO5UsdRccziJKdyszV
 Pcy226xEQRLRFFaaLWz9Hd/GcJYB8JYN+SDPoJCabsqDh9hXkGfeifZgWw4sMpb3l5Ym
 yEUvvvvWcn/0iS43TJf9F6ILhbYiODzXf8zHwcT5f7JX1RGsgDfh7Ro+KEQREUxkO6lX
 D7FzjuD0chOB3bqBcJPgYEw87775taW8SVljnKpLaRQdo/U9RmR3nJ2OoX310pVInVeY
 JOEvibN7B4thz8g3p5T25+52xdkoC8JPSkJWRMf653cHElGOaqcw/lNpfhLw+pl5QlFl
 Lm/w==
X-Gm-Message-State: AOJu0YxnCt/O9CuviHPjZHLgzy9fVRk14tE/6w+V4n9sttLey3pVTuJR
 g2I7tphZ58pr7V1bHrEbOjDPFGQnbJBtCGgvQxIVLQ==
X-Google-Smtp-Source: AGHT+IHzjj9oQbVyKOE7vTqR80CnC46ge7++EdPGAFnzeu91E2S3eBlYNJcgXoqjXbq9RieufSQQrw==
X-Received: by 2002:a17:902:ecce:b0:1c9:dbd3:94f7 with SMTP id
 a14-20020a170902ecce00b001c9dbd394f7mr1539248plh.65.1698376715744; 
 Thu, 26 Oct 2023 20:18:35 -0700 (PDT)
Received: from DESKTOPOU5BQRD ([2406:7400:56:42e5:79c4:c8bb:e079:522a])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a1709026b8900b001a80ad9c599sm403955plk.294.2023.10.26.20.18.34
 for <linux-kernel-mentees@lists.linuxfoundation.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Oct 2023 20:18:35 -0700 (PDT)
From: "Kristi Florence" <kristi.f@exposhowvisitor.com>
To: <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Lists.Linuxfoundation.Org
Date: Thu, 26 Oct 2023 22:18:32 -0500
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAEBWjqY46N1LtPvTJFk2bqDCgAAAGAAAAAAAAABAVo6mOOjdS7T70yRZNm6ghIQvAAEAAAAA@exposhowvisitor.com>
MIME-Version: 1.0
X-Priority: 1 (Highest)
X-MSMail-Priority: High
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdoIhEOCCmkGTFbFS1GT6i/HKrY8dg==
Importance: High
Content-Language: en-in
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7870577602308033901=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

This is a multipart message in MIME format.

--===============7870577602308033901==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_47CB_01DA085A.5C1611C0"
Content-Language: en-in

This is a multipart message in MIME format.

------=_NextPart_000_47CB_01DA085A.5C1611C0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi!

 

I'm connecting to see if you would be interested in grabbing the 2023 SHPE
(Society of Hispanic Professional Engineers) National Convention Attendees
List.

 

Attendees are Mechanical Engineers, Computer Scientists, Computer Engineers,
Electrical Engineers, Civil Engineers, Industrial Engineers, Bioengineers &
Biomedical Engineers, Chemical Engineers, Aerospace, Aeronautical &
Astronautical Engineers, Environmental Engineers, Systems Engineering
Professionals, Materials Scientist Engineers, Software Engineers, Hispanic
Scientists, Mathematicians, and more!

 

Kindly review, and if you're interested, please reply to this email, and I
shall revert with pricing, counts, and other deliverables.

 

Regards,

Kristi Florence - Event Database Coordinator

 

If you do not wish to receive future emails from us, reply with "End".


------=_NextPart_000_47CB_01DA085A.5C1611C0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Cambria;
	panose-1:2 4 5 3 5 4 6 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoNoSpacing, li.MsoNoSpacing, div.MsoNoSpacing
	{mso-style-priority:1;
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.hgkelc
	{mso-style-name:hgkelc;}
span.cskcde
	{mso-style-name:cskcde;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-IN =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNoSpacing><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'>Hi!<o:p></o:p></spa=
n></p><p class=3DMsoNoSpacing><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></=
span></p><p class=3DMsoNoSpacing><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'>I&#8217;m =
connecting to see if you would be interested in grabbing the <b>2023 =
SHPE (Society of Hispanic Professional Engineers) National Convention =
Attendees List.<o:p></o:p></b></span></p><p class=3DMsoNoSpacing><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></=
span></p><p class=3DMsoNoSpacing><b><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'>Attendees =
are</span></b><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'> <em><span =
style=3D'font-family:"Cambria",serif;font-style:normal'>Mechanical =
Engineers, </span></em><span class=3Dhgkelc>Computer Scientists, =
Computer Engineers, Electrical Engineers, Civil Engineers, </span><span =
class=3Dcskcde>Industrial Engineers, </span><em><span =
style=3D'font-family:"Cambria",serif;font-style:normal'>Bioengineers =
&amp; Biomedical Engineers, </span></em><span class=3Dhgkelc>Chemical =
Engineers, Aerospace, Aeronautical &amp; Astronautical Engineers, =
Environmental Engineers, </span><span class=3Dcskcde>Systems Engineering =
Professionals, Materials Scientist Engineers, Software Engineers, =
Hispanic Scientists, Mathematicians, and =
more!</span><o:p></o:p></span></p><p class=3DMsoNoSpacing><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></=
span></p><p class=3DMsoNoSpacing><b><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'>Kindly review, and =
if you&#8217;re interested, please reply to this email</span></b><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'>, and I shall =
revert with pricing, counts, and other =
deliverables.<o:p></o:p></span></p><p class=3DMsoNoSpacing><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></=
span></p><p class=3DMsoNoSpacing><b><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'>Regards,<o:p></o:p>=
</span></b></p><p class=3DMsoNormal><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'>Kristi Florence =
&#8211; Event Database Coordinator<o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-family:"Cambria",serif;color:#1F4E79;mso-style-textfill-fil=
l-color:#1F4E79;mso-style-textfill-fill-alpha:100.0%'><o:p>&nbsp;</o:p></=
span></p><p class=3DMsoNormal><span =
style=3D'font-size:9.0pt;font-family:"Cambria",serif;color:#7F7F7F;mso-st=
yle-textfill-fill-color:#7F7F7F;mso-style-textfill-fill-alpha:100.0%'>If =
you do not wish to receive future emails from us, reply with =
&#8220;End&#8221;.</span><o:p></o:p></p></div></body></html>
------=_NextPart_000_47CB_01DA085A.5C1611C0--


--===============7870577602308033901==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7870577602308033901==--

