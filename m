Return-Path: <SRS0=uyVO=3Y=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.8 required=3.0 tests=DATE_IN_PAST_12_24,
	DKIM_INVALID,DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,PDS_FRNOM_TODOM_NAKED_TO,PDS_FROM_NAME_TO_DOMAIN,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8829CC35247
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Feb 2020 23:35:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B74E20661
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 Feb 2020 23:35:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sendgrid.net header.i=@sendgrid.net header.b="H52Ql68N"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B74E20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=normtrade.at
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F1783850EA;
	Tue,  4 Feb 2020 23:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oxt7fNovJImm; Tue,  4 Feb 2020 23:35:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D454683311;
	Tue,  4 Feb 2020 23:35:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BBE16C0177;
	Tue,  4 Feb 2020 23:35:45 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63D9FC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Feb 2020 23:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 4A35720119
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Feb 2020 23:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KcW3-6xLybu8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Feb 2020 23:35:42 +0000 (UTC)
X-Greylist: delayed 00:05:23 by SQLgrey-1.7.6
Received: from wrqvdbnd.outbound-mail.sendgrid.net
 (wrqvdbnd.outbound-mail.sendgrid.net [149.72.219.45])
 by silver.osuosl.org (Postfix) with ESMTPS id D2C411FD90
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 Feb 2020 23:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.net; 
 h=from:to:subject:mime-version:content-type:content-transfer-encoding; 
 s=smtpapi; bh=YpoNE74TfTLHUAcahlqnMb9cOTU1/FGnY4oCHaB6F08=; b=H5
 2Ql68NXU7H0taxvZ2T2VSvtK+RfHJQ1RAvQvCwbOo9CoNo6/W3LORSWnZmpKFk4J
 j3M4G8CXK0mn6uw4SBB0bmUtMjtVMsuIhQkbS/uxeOIr26iK9cQc03SxWf4b6jMZ
 Q+xbxWTjAL0BVdcRgzYeOq39bEL3mjHLF5eJJYP4A=
Received: by filter0613p1iad2.sendgrid.net with SMTP id
 filter0613p1iad2-1750-5E39136A-12
 2020-02-04 06:47:06.822650165 +0000 UTC m=+40870.145536826
Received: from normtrade.at (ec2-3-93-179-203.compute-1.amazonaws.com
 [3.93.179.203])
 by ismtpd0003p1iad1.sendgrid.net (SG) with ESMTP id pOaQDgOCQVC_VCP6LCq8Gw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 04 Feb 2020 06:47:06.745 +0000 (UTC)
From: "lists.linuxfoundation.org  "<office@normtrade.at>
To: linux-kernel-mentees@lists.linuxfoundation.org
Date: Tue, 04 Feb 2020 06:47:06 +0000 (UTC)
Message-ID: <20200204064701.4D528DE300EAC371@normtrade.at>
MIME-Version: 1.0
X-SG-EID: UsLXQ589HNP4HLBydmD9phmmfxbKvdwJXjGUdoOz1ZR29B0XdmjLlNCFAH3lClXUOYqmPCXjF0YzaQ
 zl7PcleOwrRMaRO9d6tP5MzJXLPfOB2SlrjjrR0Y7198XMuWlz+rzKZKB65ys71QCKXVzfgNhjjqX1
 t2cXs7tY9E5i/A6DdFgM82jaXELfuEz5Lkp+BBJ2e2t9qkmOJNqd6m1JrWEW9n4WaWdwQDPHOtni6G
 cfHeYqY0PvWkTQSS8njjUWCgfIroQXHBvDD8YDcDuYlQ==
Subject: [Linux-kernel-mentees] Upgrade Email Quota
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
Content-Type: multipart/mixed; boundary="===============7320455238451631162=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7320455238451631162==
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML>

<html><head><title></title>
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body style=3D"margin: 0.4em;">
<p>
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
<td style=3D"margin: 0px; border: 1px solid rgb(255, 0, 0); border-image: n=
one; width: 500px; font-family: arial, sans-serif; min-height: 25px; backgr=
ound-color: rgb(255, 0, 0);">
<div align=3D"center"><font face=3D"calibri">Mail Quota: (99%=20
Full)</font></div></td>
<td style=3D"margin: 0px; border: 1px solid rgb(29, 124, 14); border-image:=
 none; width: 15px; font-family: arial, sans-serif; min-height: 25px; backg=
round-color: rgb(29, 124, 14);"></td></tr>
<tr></tr></tbody></table><br>
<table align=3D"center">
<tbody>
<tr>
<td style=3D"margin: 0px; padding: 25px; border: 1px solid rgb(29, 124, 14)=
; border-image: none; width: 470px; font-family: arial, sans-serif; min-hei=
ght: 200px;">
<p><font face=3D"verdana"><span style=3D"color: rgb(34, 34, 34); text-trans=
form: none; text-indent: 0px; letter-spacing: normal; font-family: verdana,=
 sans-serif; font-style: normal; font-weight: normal; word-spacing: 0px; wh=
ite-space: normal; background-color: rgb(255, 255, 255);">The=20
size limit of 4096 MB for mailbox&nbsp;<strong><u><font color=3D"#000000">l=
inux-kernel-mentees@lists.linuxfoundation.org</font></u></strong></span></f=
ont></p>
<p><font face=3D"verdana"><span style=3D"color: rgb(34, 34, 34); text-trans=
form: none; text-indent: 0px; letter-spacing: normal; font-family: verdana,=
 sans-serif; font-style: normal; font-weight: normal; word-spacing: 0px; wh=
ite-space: normal; background-color: rgb(255, 255, 255);">&nbsp;has=20
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
ttp://u14826417.ct.sendgrid.net/ls/click?upn=3DaWUe44omBbDGkS3Mr05TNQ-2F38o=
C8qBs2N9KVPwUKgzPLG22IbTYOmOlebW5IpQcu-2B-2BemYFo1UrhxokfOwPf-2BII7zuxLGWy3=
k4bfZpH7qN8UA6FUkLAyXdQ5Q5U8dk2VMX3GkZeGOpeYDB31FkImAUw-3D-3DV31y_6pwKHJ8Ph=
1XTyv7ONZlOBOTaaCb0jLn7kAwOPEAmON27TSZclEAEGpyyy9PzLbrRQyH1hffxl2B-2BrnL-2B=
lxfSi9rg2YcApalM1G7quUvvEhJyzlXdyI1WsAfTgbx-2FcrTaZt9Za11uz83aiqJDQ46mvkxMp=
HXJ041dXP3vSm-2F37PIceo55EzyYtlnqojMCtKruA3IWpPjAwHxDFFDMnS-2F6Vc6gVp6RzBC4=
g0lNAwfOuykXFDfIzSPlSyualG6fUic2" target=3D"_blank" rel=3D"nofollow"><font =
face=3D"verdana"><b>Upgrade Email=20
Quota&nbsp;</b></font></a></font><br><b><br></b></font></p><font face=3D"ve=
rdana" size=3D"2"><b>
<p style=3D"margin: 0px 0px 0pt; padding: 0px; color: rgb(33, 33, 33); text=
-transform: none; line-height: normal; text-indent: 0px; letter-spacing: no=
rmal; font-family: arial, sans-serif; font-style: normal; font-weight: 400;=
 word-spacing: 0px; white-space: normal; background-color: rgb(255, 255, 25=
5);"><span style=3D"font-family: verdana, sans-serif;"><span style=3D"color=
: black;">Note: This upgrade is required immediately=20
after receiving this message</span></span></p>
<p style=3D"margin: 0px 0px 0pt; padding: 0px; color: rgb(33, 33, 33); text=
-transform: none; line-height: normal; text-indent: 0px; letter-spacing: no=
rmal; font-family: arial, sans-serif; font-style: normal; font-weight: 400;=
 word-spacing: 0px; white-space: normal; background-color: rgb(255, 255, 25=
5);"><span style=3D"font-family: verdana, sans-serif;"><span style=3D"color=
: black;"></span></span>&nbsp;</p><p><font face=3D"calibri" size=3D"3"><fon=
t size=3D"2"><font size=3D"1">Regards.<br>
<span style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0=
px; letter-spacing: normal; font-family: verdana, sans-serif; font-size: sm=
all; font-style: normal; font-weight: normal; word-spacing: 0px; white-spac=
e: normal; background-color: rgb(255, 255, 255); font-variant-ligatures: no=
rmal; font-variant-caps: normal;"><font size=3D"2">lists.linuxfoundation.or=
g</font></span></font></font></font></p></b></font></td></tr></tbody></tabl=
e></td></tr></tbody></table><p>
<br class=3D"yiv1399064684m_4624660778764768030m_-2375720457011239671m_1855=
024489230263231gmail-Apple-interchange-newline" style=3D"text-align: left; =
color: rgb(34, 34, 34); text-transform: none; text-indent: 0px; letter-spac=
ing: normal; font-family: arial, sans-serif; font-size: small; font-style: =
normal; font-weight: normal; word-spacing: 0px; white-space: normal; orphan=
s: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatur=
es: normal; font-variant-caps: normal;=20
-webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decora=
tion-color: initial;"></p><p>
</p><p style=3D'text-align: left; color: rgb(29, 34, 40); text-transform: n=
one; text-indent: 0px; letter-spacing: normal; font-family: "Helvetica Neue=
", Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-=
weight: 400; word-spacing: 0px; white-space: normal; orphans: 2; widows: 2;=
 background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font=
-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-styl=
e: initial; text-decoration-color: initial;'></p><p>
</p><p>
<span style=3D'text-align: left; color: rgb(29, 34, 40); text-transform: no=
ne; text-indent: 0px; letter-spacing: normal; font-family: "Helvetica Neue"=
, Helvetica, Arial, sans-serif; font-size: 13px; font-style: normal; font-w=
eight: 400; word-spacing: 0px; float: none; display: inline !important; whi=
te-space: normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 25=
5); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text=
-stroke-width: 0px; text-decoration-style: initial;=20
text-decoration-color: initial;'>WARNING:=20
Maximum email <strong><u><font color=3D"#000000" face=3D"Verdana" size=3D"1=
">linux-kernel-mentees@lists.linuxfoundation.org</font></u></strong> size e=
xceeded</span></p><p>
</p>



<img src=3D"https://u14826417.ct.sendgrid.net/wf/open?upn=3DoDb6ny51mUB6FEx=
Yn3rQhg0zmbLiyjz6NraffIlGGOzr7kBgXDE3kqRCc7uSPOIoB0zHC0ckzNma6iGtOtSx-2FYT0=
I3hba69V94nSy8XDOF7-2BXwGdDKOe4UxrqWziOa37gtcO0gzSGhbz8Tl-2B-2BZNu1s5-2B0hM=
Ay3NBoCEiaZFtN87MJTaR7Q0l4MlEn5kXzpLp9yUwkaQCILDNGzQWFHQ6if85U2Eu7hW-2FhCSS=
zFrRtGu7VD3OyWQ28-2BnEE-2FklVZ33-2BOILBu9kecHp8RA-2BPQXe4g-3D-3D" alt=3D"" =
width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !important;width:=
1px !important;border-width:0 !important;margin-top:0 !important;margin-bot=
tom:0 !important;margin-right:0 !important;margin-left:0 !important;padding=
-top:0 !important;padding-bottom:0 !important;padding-right:0 !important;pa=
dding-left:0 !important;"/>
</body></html>


--===============7320455238451631162==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7320455238451631162==--
