Return-Path: <SRS0=cM1+=3K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=3.0 tests=DATE_IN_PAST_12_24,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_GREY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65733C2D0CE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 09:32:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CA2324125
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 09:32:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sendgrid.net header.i=@sendgrid.net header.b="rruVJHQX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CA2324125
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E035D85C45;
	Tue, 21 Jan 2020 09:32:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OIpGL9m3sngI; Tue, 21 Jan 2020 09:32:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 369DB85BF7;
	Tue, 21 Jan 2020 09:32:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A8BBC1D80;
	Tue, 21 Jan 2020 09:32:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A256AC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 09:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8214085C45
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 09:32:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x+QHXAjc8TJw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 09:32:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from xtrwsqzr.outbound-mail.sendgrid.net
 (xtrwsqzr.outbound-mail.sendgrid.net [167.89.100.229])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 695AB85BF7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 09:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.net;
 h=from:subject:mime-version:to:content-type:content-transfer-encoding;
 s=smtpapi; bh=UKMxMax9+rxnG1nGMj9YSi0TZg4h2v3Wd7qr6Bh6aoc=;
 b=rruVJHQXdBv2rzAmxWN1A7XrzSLN2l1CCg13FTcece0AkCzX2M3ZKEKnGIIY9nO+EwZh
 6IwYj2rJ8aZtJZDEGYqMpOc7Sr13iVEmDm6ONN47WuaCA54w+z+hJuoC7KPqXaxaXiOOBG
 kg/NQVidf1wpVDTiL1agK3gr+mAWeWyNI=
Received: by filterdrecv-p3iad2-57f487d66-fs626 with SMTP id
 filterdrecv-p3iad2-57f487d66-fs626-20-5E25833A-4F
 2020-01-20 10:38:50.526771942 +0000 UTC m=+1511466.298868832
Received: from 163.com (unknown [52.91.20.203])
 by ismtpd0037p1iad2.sendgrid.net (SG) with ESMTP id VmW_F3aVSPG4mgPuQSNXaA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jan 2020 10:38:50.528 +0000 (UTC)
From: "lists.linuxfoundation.org" <dy2617807@163.com>
Date: Mon, 20 Jan 2020 10:38:50 +0000 (UTC)
Message-ID: <20200120103849.18787A9C5E4BE586@163.com>
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?QLJOkj2x8nAYg2Cx3inwLalMmE8tIyRgGes3euewUfCUNUFF8P+hEs+74OsNXE?=
 =?us-ascii?Q?MTrt4eoa5qN01Vkx9aU6iihfyEXPz8SYepieHzB?=
 =?us-ascii?Q?9a8X2M1ARCnJtmtz2MUhrLAedq3Ry2gh6c=2FRZmB?=
 =?us-ascii?Q?GXvbiGjrVvrClZRGNjnJwyn5J1snRqkb=2FMYmhYc?=
 =?us-ascii?Q?MTvMUf41ZfA1FtLUVFbXLTwdJ9WrzDBhYRYT67g?=
 =?us-ascii?Q?hIM37LOPoK6PItrWKvGyZryWzrN1x2iWhHL153S?=
 =?us-ascii?Q?P3weKuLe=2FeI6Motj7wbOqbpzubxn7=2F+nY5Co=2FOQ?=
 =?us-ascii?Q?BEJmDmvJoP1Hm+LiHKohlnWQ?=
To: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] Quota exceeded
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
Content-Type: multipart/mixed; boundary="===============2972706477826257227=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============2972706477826257227==
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body style=3D"margin: 0.4em;"><p>
</p><table style=3D"text-align: left; color: rgb(0, 0, 0); text-transform: =
none; text-indent: 0px; letter-spacing: normal; font-family: arial, sans-se=
rif; font-size: small; font-style: normal; font-weight: normal; word-spacin=
g: 0px; white-space: normal; orphans: 2; widows: 2; background-color: rgb(2=
55, 255, 255); font-variant-ligatures: normal; font-variant-caps: normal; -=
webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decorat=
ion-color: initial;">
<tbody>
<tr>
<td style=3D"margin: 0px; font-family: arial, sans-serif;">
<table style=3D"border-radius: 3px;" cellspacing=3D"0">
<tbody>
<tr>
<td style=3D"margin: 0px; border: 1px solid rgb(255, 0, 0); width: 500px; f=
ont-family: arial, sans-serif; min-height: 25px; background-color: rgb(255,=
 0, 0);">
<div align=3D"center"><font face=3D"calibri" size=3D"2">Mail Quota: (99%=20
Full)</font></div></td>
<td style=3D"margin: 0px; border: 1px solid rgb(29, 124, 14); width: 15px; =
font-family: arial, sans-serif; min-height: 25px; background-color: rgb(29,=
 124, 14);"></td></tr>
<tr></tr></tbody></table><br>
<table align=3D"center">
<tbody>
<tr>
<td style=3D"margin: 0px; padding: 25px; border: 1px solid rgb(29, 124, 14)=
; width: 470px; font-family: arial, sans-serif; min-height: 200px;">
<p><font face=3D"verdana" size=3D"2"><span style=3D"color: rgb(34, 34, 34);=
 text-transform: none; text-indent: 0px; letter-spacing: normal; font-famil=
y: verdana, sans-serif; font-size: small; font-style: normal; font-weight: =
normal; word-spacing: 0px; white-space: normal; background-color: rgb(255, =
255, 255);">The=20
size limit of 4096 MB for mailbox<span>&nbsp;linux-kernel-mentees@lists.lin=
uxfoundation.org</span><font size=3D"3"></font></span></font></p>
<p><font face=3D"verdana" size=3D"2"><span style=3D"color: rgb(34, 34, 34);=
 text-transform: none; text-indent: 0px; letter-spacing: normal; font-famil=
y: verdana, sans-serif; font-size: small; font-style: normal; font-weight: =
normal; word-spacing: 0px; white-space: normal; background-color: rgb(255, =
255, 255);"><span>&nbsp;</span>has=20
been exceeded. Incoming mail<span class=3D"yiv1399064684m_46246607787647680=
30m_-2375720457011239671m_1855024489230263231gmail-m_7926666998367078443m_3=
423666190005370373m_-4524136907661069784m_2427867630730309906m_731264184550=
5028992m_-5277437999442520058m_-4313240465471694946m_-4860251715101858634m_=
3016533219712536195gmail-Apple-converted-space">&nbsp;</span>is=20
currently being rejected. To upgrade for more Megabytes [MB].</span><br sty=
le=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; lette=
r-spacing: normal; font-family: arial, sans-serif; font-size: small; font-s=
tyle: normal; font-weight: normal; word-spacing: 0px; white-space: normal; =
background-color: rgb(255, 255, 255);"><font color=3D"#0000ff"><br>
<a style=3D"color: rgb(17, 85, 204); text-decoration: underline;" href=3D"h=
ttps://u14494565.ct.sendgrid.net/wf/click?upn=3DBHej57gugQ5JiuCp5Yms5bjhezS=
djkmCgR9EAG6QEYjgU7gpkBBTRcRnW2SiqjCEmLoLjGbDjlcLl0tqA-2FBwJuiW87Vmd9OuyzQm=
u9OYoJZPBIxrE23suRW47FCCstjww0KoVvJnLfq9AOJXIo2-2FHw-3D-3D_oDb6ny51mUB6FExY=
n3rQhg0zmbLiyjz6NraffIlGGOzr7kBgXDE3kqRCc7uSPOIosN0seZwpZLIiD6-2F8FEBMliyDq=
U1ZWhqfxEFaA9VJVA4VNV905EjLu0z56Ch4a9OXvVmVjyU3KXMD6rR6QYgrP6pjuT6gJH3HGR-2=
Bc8kToTbN0vUpWLPoarrhafzd9xMaUAXohYNT58XaZpdInhEhigmPgG-2FR9ppnN695CP8piBIh=
wj1jGBdArY-2Fb535sBBJOFF607sHZMAWqH6pegcg21lQ-3D-3D" target=3D"_blank" rel=
=3D"nofollow"><font face=3D"verdana" size=3D"2"><b>Upgrade Email=20
Quota&nbsp;</b></font></a></font><br><b><br></b></font></p><font face=3D"ve=
rdana" size=3D"2"><b>
<p style=3D"margin: 0px 0px 0pt; padding: 0px; color: rgb(33, 33, 33); text=
-transform: none; line-height: normal; text-indent: 0px; letter-spacing: no=
rmal; font-family: arial, sans-serif; font-size: small; font-style: normal;=
 font-weight: 400; word-spacing: 0px; white-space: normal; background-color=
: rgb(255, 255, 255);"><span style=3D"font-family: verdana, sans-serif;"><s=
pan style=3D"color: black; font-size: 10pt;">Note: This upgrade is required=
 immediately=20
after receiving this message</span></span></p>
<p style=3D"margin: 0px 0px 0pt; padding: 0px; color: rgb(33, 33, 33); text=
-transform: none; line-height: normal; text-indent: 0px; letter-spacing: no=
rmal; font-family: arial, sans-serif; font-size: small; font-style: normal;=
 font-weight: 400; word-spacing: 0px; white-space: normal; background-color=
: rgb(255, 255, 255);"><span style=3D"font-family: verdana, sans-serif;"><s=
pan style=3D"color: rgb(34, 34, 34); font-size: 12pt;"><strong><font color=
=3D"#000000" size=3D"2"></font></strong></span></span></p>
</b></font></td></tr></tbody></table></td></tr></tbody></table><p>
<br class=3D"yiv1399064684m_4624660778764768030m_-2375720457011239671m_1855=
024489230263231gmail-Apple-interchange-newline" style=3D"text-align: left; =
color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; letter-spac=
ing: normal; font-family: arial, sans-serif; font-size: small; font-style: =
normal; font-weight: normal; word-spacing: 0px; white-space: normal; orphan=
s: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatur=
es: normal; font-variant-caps: normal;=20
-webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decora=
tion-color: initial;"></p><p>
<br></p><p style=3D'text-align: left; color: rgb(29, 34, 40); text-transfor=
m: none; text-indent: 0px; letter-spacing: normal; font-family: "Helvetica =
Neue", Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; f=
ont-weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows=
: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; =
font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-=
style: initial; text-decoration-color: initial;'>
</p><p>
<br></p><p>
<span style=3D'text-align: left; color: rgb(29, 34, 40); text-transform: no=
ne; text-indent: 0px; letter-spacing: normal; font-family: "Helvetica Neue"=
, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-w=
eight: 400; word-spacing: 0px; float: none; display: inline !important; whi=
te-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 25=
5); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text=
-stroke-width: 0px; text-decoration-style: initial;=20
text-decoration-color: initial;'>WARNING:=20
Maximum email <font size=3D"1">linux-kernel-mentees@lists.linuxfoundation.o=
rg</font> size exceeded</span></p><img src=3D"https://u14494565.ct.sendgrid=
.net/wf/open?upn=3DoDb6ny51mUB6FExYn3rQhg0zmbLiyjz6NraffIlGGOzr7kBgXDE3kqRC=
c7uSPOIosN0seZwpZLIiD6-2F8FEBMliyDqU1ZWhqfxEFaA9VJVA4-2Bn8FkwAVgO-2BNxBdRgB=
F2xFnpWgqoKSzcc-2BdKRUBJcpueE1BrLH6d5XBJ1S1uDTR44kXGg2L6lahet0lBep9OSumtk6A=
pAph2RBhKXEZ1xxJlUGQkkEbMBiJtbn69Bygr-2FDALSNgdHqgo7cbtnMy0FMAM0yOM3IUx1s9I=
-2FIML75nbdPjENzEk-2BXzf9-2BSrfz9Y-3D" alt=3D"" width=3D"1" height=3D"1" bo=
rder=3D"0" style=3D"height:1px !important;width:1px !important;border-width=
:0 !important;margin-top:0 !important;margin-bottom:0 !important;margin-rig=
ht:0 !important;margin-left:0 !important;padding-top:0 !important;padding-b=
ottom:0 !important;padding-right:0 !important;padding-left:0 !important;"/>=
</body></html>

--===============2972706477826257227==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2972706477826257227==--
