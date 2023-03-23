Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AB1C74A5B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Mar 2023 18:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33D7D41EBF;
	Thu, 23 Mar 2023 18:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33D7D41EBF
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=alphasolutionsdata-com.20210112.gappssmtp.com header.i=@alphasolutionsdata-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=6nzTn7MQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ytWPR-WesE_f; Thu, 23 Mar 2023 18:39:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 927D641EBE;
	Thu, 23 Mar 2023 18:39:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 927D641EBE
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68774C0035;
	Thu, 23 Mar 2023 18:39:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAAD4C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Mar 2023 18:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9202E60E0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Mar 2023 18:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9202E60E0B
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key)
 header.d=alphasolutionsdata-com.20210112.gappssmtp.com
 header.i=@alphasolutionsdata-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=6nzTn7MQ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JxHyUWlwiP11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Mar 2023 18:39:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8679660BAF
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8679660BAF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Mar 2023 18:39:55 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 om3-20020a17090b3a8300b0023efab0e3bfso2824084pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Mar 2023 11:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=alphasolutionsdata-com.20210112.gappssmtp.com; s=20210112; t=1679596794;
 h=to:subject:message-id:date:disposition-notification-to:thread-index
 :mime-version:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U2UfDfmczXHDppopXCn5zn5+GEuoRlYRJ9Ymenxi/y0=;
 b=6nzTn7MQEhZBH8WVnJmEwhBOV/UGPrVI9JBo3WuT3oyDn2W0CP9DTjClbwIGmLI90P
 +R+hA34uwQgkQRzy+ufdQ7fo5tRJnZQcY3FvRM0UpXj0UaiKJl4C2/cWBsoVlS6WKonf
 srrpiFbmqZuzWFU0wxsE5wug7i2zRTkKyp/bQgJzCO+MdJPhQsU1UMu/zRGyUidsXTz7
 NuckcmuR9BCOifkOWrxrMiGQWKKCEs6V2R5fe+ppzgpEWtgHZk2Y42AMgJTVOsKNEHOV
 B9bYrNAl1q8iBw9E9pLX5an/qz6XJhhtTzKbGAUizUc0U9r/RfDD6bjf24HPAY0DtD5e
 LfBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679596794;
 h=to:subject:message-id:date:disposition-notification-to:thread-index
 :mime-version:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U2UfDfmczXHDppopXCn5zn5+GEuoRlYRJ9Ymenxi/y0=;
 b=MZZDCl4lRPT3uqIB3W0kr/Oz19sA+3mDgz2uTddXaVvEILSceN6IoEZqzM8m8UtrkO
 wkdb/RyMnO30sWEZCdnME/3aty6DQZtcOFX7jglF9tqIsb3yohHgrrxyWVrS6ItMTzzc
 ebU+K9Ziqg9yTLX3KAK3uvErAO7BTtsO2Oo5VpEMlGn67liaYwpGF+7Z2Q+BmOYnq0pY
 T2EmfQYV+nK32bvrnT3ZWwqjETftxqowF5ArdQ9BmtsA0RdG0RDiKCkzEuj4fP5rIqNx
 sRk2aCbpXTEcr1A3C9yAkoJcQCyH86nN1ey3Xxm0iBXh37IJL7DqHmB7h9ksyMiCrmWw
 jsNw==
X-Gm-Message-State: AAQBX9cW9TauoURcSI0z84ooKylxFSkDe2E/yPMLDQMtGfFQAMu+0/U4
 NGAhk0+2AOJcz2qSS6UAi1MhhtnpoYlGv0mNrpMXccaBSA0jE+i9
X-Google-Smtp-Source: AKy350aX7LGMrUmzU+ngLNAW5tuq2Qo9Sxv0BQ9RZ8xy/UzgJ25/uB4T0IJtFlLM9qkw+iRSyG1N6EhqXtgs+MLpm7s=
X-Received: by 2002:a17:90a:d245:b0:23d:19cf:f9d4 with SMTP id
 o5-20020a17090ad24500b0023d19cff9d4mr5820pjw.6.1679596794639; Thu, 23 Mar
 2023 11:39:54 -0700 (PDT)
From: Jackie Wilkins <jackie@alphasolutionsdata.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdldtWkSwPQiyEa7T4uN5U6x/bpxkg==
Date: Fri, 24 Mar 2023 00:06:57 +0530
Message-ID: <3279f78f69d5eee26a351515487f1582@mail.gmail.com>
Subject: Hyperbaric Physicians and Respiratory Therapists Contacts.
To: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============1910628295654417868=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============1910628295654417868==
Content-Type: multipart/alternative; boundary="0000000000004f86f305f7959a07"

--0000000000004f86f305f7959a07
Content-Type: text/plain; charset="UTF-8"

Hello,



Hope you are doing well.



Keeping the upcoming recession in mind do you wish to ramp up your sales &
marketing initiatives with our verified *Hyperbaric Physicians and
Respiratory Therapists Contacts.*



Please help us with your *Target Geography:* __to get connected with
business leaders at your location.



Awaiting your response.



Thanks,

Jackie Wilkins

Demand Generation Executive



Please reply with Set-Out in the Subject Line.

--0000000000004f86f305f7959a07
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dus-ascii"><meta name=3D"Generator" content=3D"Microsoft Word 15 (filtere=
d medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:#1F3864;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:595.3pt 841.9pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style></head><body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72"><=
div class=3D"WordSection1"><p class=3D"MsoNormal"><span style=3D"font-size:=
11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1f3864">Hello,</sp=
an></p><p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&=
quot;Calibri&quot;,sans-serif;color:#1f3864">=C2=A0</span></p><p class=3D"M=
soNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,s=
ans-serif;color:#1f3864">Hope you are doing well.</span></p><p class=3D"Mso=
Normal"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,san=
s-serif;color:#1f3864">=C2=A0</span></p><p class=3D"MsoNormal"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1f38=
64">Keeping the upcoming recession in mind do you wish to ramp up your sale=
s &amp; marketing initiatives with our verified <b>Hyperbaric Physicians an=
d Respiratory Therapists Contacts.</b></span></p><p class=3D"MsoNormal"><sp=
an style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;col=
or:#1f3864">=C2=A0</span></p><p class=3D"MsoNormal"><span style=3D"font-siz=
e:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1f3864">Please h=
elp us with your <b>Target Geography:</b> __to get connected with business =
leaders at your location.</span></p><p class=3D"MsoNormal"><span style=3D"f=
ont-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1f3864">=
=C2=A0</span></p><p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;fon=
t-family:&quot;Calibri&quot;,sans-serif;color:#1f3864">Awaiting your respon=
se.</span></p><p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-f=
amily:&quot;Calibri&quot;,sans-serif;color:#1f3864">=C2=A0</span></p><p cla=
ss=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Calibri&=
quot;,sans-serif;color:#1f3864">Thanks,</span></p><p class=3D"MsoNormal"><s=
pan style=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;co=
lor:#1f3864">Jackie Wilkins</span></p><p class=3D"MsoNormal"><span style=3D=
"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1f3864"=
>Demand Generation Executive</span></p><p class=3D"MsoNormal"><span style=
=3D"font-size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:#1f38=
64">=C2=A0</span></p><p class=3D"MsoNormal"><span style=3D"font-size:10.0pt=
;font-family:&quot;Calibri&quot;,sans-serif;color:#7f7f7f">Please reply wit=
h Set-Out in the Subject Line.</span></p><p class=3D"MsoNormal">=C2=A0</p><=
/div></body></html>

--0000000000004f86f305f7959a07--

--===============1910628295654417868==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============1910628295654417868==--
