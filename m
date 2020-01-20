Return-Path: <SRS0=6Qv+=3J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_GREY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33D74C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jan 2020 12:27:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFEC921569
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Jan 2020 12:27:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sendgrid.net header.i=@sendgrid.net header.b="NEzp/VBg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFEC921569
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxsouth.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A355D8506C;
	Mon, 20 Jan 2020 12:27:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12aKt494l5cy; Mon, 20 Jan 2020 12:27:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E7FA584D3B;
	Mon, 20 Jan 2020 12:27:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E4ED8C0178;
	Mon, 20 Jan 2020 12:27:49 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C39EC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jan 2020 12:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 477B783664
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jan 2020 12:27:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oflaHv2vkLI1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jan 2020 12:27:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from o2.lv30e.shared.sendgrid.net (o2.lv30e.shared.sendgrid.net
 [50.31.63.43])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 05A6C83638
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jan 2020 12:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.net; 
 h=content-type:mime-version:subject:to:from; s=smtpapi; 
 bh=kxGzZZtYDnVCw8VBVMWcREAdled0mG2JXx4lo+fCi5M=; b=NEzp/VBgJ+68i
 A286yhpuz4Pbv7MgJcM9xtSL1OKjN36BCVbNpwarKI+nwJxIGDp/2/BDnjRNmhPy
 lGGC7uBWKeW37c9m9D/Xm0oefCqMwoaUcyiDPSHuLuvFRiR5U9H/ToRpS1ReVSH/
 uycuo7HgVGY/KVrWJoDHCa+/BcFkSc=
Received: by filter1570p1mdw1.sendgrid.net with SMTP id
 filter1570p1mdw1-22950-5E25925A-19
 2020-01-20 11:43:22.837412998 +0000 UTC m=+489191.664519092
Received: from WIN-7Q5ED51QG4U.ec2.internal
 (ec2-52-91-20-203.compute-1.amazonaws.com [52.91.20.203])
 by ismtpd0005p1iad2.sendgrid.net (SG) with ESMTP id UyrbuLvHSQqV3jpQ3qm3Ng
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Jan 2020 11:43:22.837 +0000 (UTC)
MIME-Version: 1.0
To: linux-kernel-mentees@lists.linuxfoundation.org
From: Server <test@mxsouth.com>
Date: Mon, 20 Jan 2020 11:43:22 +0000 (UTC)
Message-ID: <UyrbuLvHSQqV3jpQ3qm3Ng@ismtpd0005p1iad2.sendgrid.net>
X-SG-EID: UsLXQ589HNP4HLBydmD9phmmfxbKvdwJXjGUdoOz1ZR29B0XdmjLlNCFAH3lClXUOYqmPCXjF0YzaQ
 zl7PcleL5gWykWK2NOOlbv50LI8sErkX9dLVA1M/3FiHSKyn7chMJBn67jvR9ShblxWtjKBkfrHzUB
 i4eTD0/r8kmkCRsXtf8z8FRJtY4hABQy4b2a+I75tK0doLiCHe8TyjMq9n13o17zP93RFHKMhQ4s3P
 RNj9Djxj0Uli6RPnYbT9+S
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
Content-Type: multipart/mixed; boundary="===============3336335647859844981=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

You will not see this in a MIME-aware mail reader.
--===============3336335647859844981==
Content-Type: multipart/alternative; boundary="===============1474009746=="

You will not see this in a MIME-aware mail reader.
--===============1474009746==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body

=20
=20=20=20=20
    Mail Quota: (99% Full)=09=20
=20

=20
    The size limit of 4096 MB for mailbox linux-kernel-mentees@lists.linuxf=
oundation.org
  has been exceeded. Incoming mail is currently being rejected. To upgrade =
for more Megabytes [MB].

Upgrade Email Quota=20


 Note: This upgrade is required immediately after receiving this message
=20



=20
 WARNING: Maximum email linux-kernel-mentees@lists.linuxfoundation.org size=
 exceeded

--===============1474009746==
Content-Type: text/html; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body

<HTML><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Diso-8859-1"/></head><BODY><P>
<TABLE style=3D"FONT-SIZE: small; FONT-FAMILY: arial, sans-serif; WHITE-SPA=
CE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: normal; C=
OLOR: rgb(0,0,0); FONT-STYLE: normal; TEXT-ALIGN: left; ORPHANS: 2; WIDOWS:=
 2; LETTER-SPACING: normal; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT=
: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-t=
ext-stroke-width: 0px; text-decoration-style: initial; text-decoration-colo=
r: initial">
<TBODY>
<TR>
<TD style=3D"FONT-FAMILY: arial, sans-serif; MARGIN: 0px">
<TABLE style=3D"border-radius: 3px" cellSpacing=3D0>
<TBODY>
<TR>
<TD style=3D"BORDER-TOP: rgb(255,0,0) 1px solid; FONT-FAMILY: arial, sans-s=
erif; BORDER-RIGHT: rgb(255,0,0) 1px solid; WIDTH: 500px; BORDER-BOTTOM: rg=
b(255,0,0) 1px solid; MARGIN: 0px; MIN-HEIGHT: 25px; BORDER-LEFT: rgb(255,0=
,0) 1px solid; BACKGROUND-COLOR: rgb(255,0,0)">
<DIV align=3Dcenter><FONT size=3D2 face=3Dcalibri>Mail Quota: (99% Full)</F=
ONT></DIV></TD>
<TD style=3D"BORDER-TOP: rgb(29,124,14) 1px solid; FONT-FAMILY: arial, sans=
-serif; BORDER-RIGHT: rgb(29,124,14) 1px solid; WIDTH: 15px; BORDER-BOTTOM:=
 rgb(29,124,14) 1px solid; MARGIN: 0px; MIN-HEIGHT: 25px; BORDER-LEFT: rgb(=
29,124,14) 1px solid; BACKGROUND-COLOR: rgb(29,124,14)"></TD></TR>
<TR></TR></TBODY></TABLE><BR>
<TABLE align=3Dcenter>
<TBODY>
<TR>
<TD style=3D"BORDER-TOP: rgb(29,124,14) 1px solid; FONT-FAMILY: arial, sans=
-serif; BORDER-RIGHT: rgb(29,124,14) 1px solid; WIDTH: 470px; BORDER-BOTTOM=
: rgb(29,124,14) 1px solid; PADDING-BOTTOM: 25px; PADDING-TOP: 25px; PADDIN=
G-LEFT: 25px; MARGIN: 0px; MIN-HEIGHT: 200px; BORDER-LEFT: rgb(29,124,14) 1=
px solid; PADDING-RIGHT: 25px">
<P><FONT size=3D2 face=3Dverdana><SPAN style=3D"FONT-SIZE: small; FONT-FAMI=
LY: verdana, sans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANS=
FORM: none; FONT-WEIGHT: normal; COLOR: rgb(34,34,34); FONT-STYLE: normal; =
LETTER-SPACING: normal; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0p=
x">The size limit of 4096 MB for mailbox<SPAN>&nbsp;</SPAN><FONT size=3D3>l=
inux-kernel-mentees@lists.linuxfoundation.org</FONT></SPAN></FONT></P>
<P><FONT size=3D2 face=3Dverdana><SPAN style=3D"FONT-SIZE: small; FONT-FAMI=
LY: verdana, sans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANS=
FORM: none; FONT-WEIGHT: normal; COLOR: rgb(34,34,34); FONT-STYLE: normal; =
LETTER-SPACING: normal; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0p=
x"><SPAN>&nbsp;</SPAN>has been exceeded. Incoming mail<SPAN class=3Dyiv1399=
064684m_4624660778764768030m_-2375720457011239671m_1855024489230263231gmail=
-m_7926666998367078443m_3423666190005370373m_-4524136907661069784m_24278676=
30730309906m_7312641845505028992m_-5277437999442520058m_-431324046547169494=
6m_-4860251715101858634m_3016533219712536195gmail-Apple-converted-space>&nb=
sp;</SPAN>is currently being rejected. To upgrade for more Megabytes [MB].<=
/SPAN><BR style=3D"FONT-SIZE: small; FONT-FAMILY: arial, sans-serif; WHITE-=
SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: normal=
; COLOR: rgb(34,34,34); FONT-STYLE: normal; LETTER-SPACING: normal; BACKGRO=
UND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px"><FONT color=3D#0000ff><BR><A=
 style=3D"TEXT-DECORATION: underline; COLOR: rgb(17,85,204)" href=3D"http:/=
/u14494565.ct.sendgrid.net/wf/click?upn=3DBHej57gugQ5JiuCp5Yms5bjhezSdjkmCg=
R9EAG6QEYjgU7gpkBBTRcRnW2SiqjCEmLoLjGbDjlcLl0tqA-2FBwJuiW87Vmd9OuyzQmu9OYoJ=
ZPBIxrE23suRW47FCCstjww0KoVvJnLfq9AOJXIo2-2FHw-3D-3D_oDb6ny51mUB6FExYn3rQhg=
0zmbLiyjz6NraffIlGGOzr7kBgXDE3kqRCc7uSPOIozHDKgpMG1kWpL0WK7Sb24Mi-2F0ym2JK1=
esz0Gd23fY0MQ5rQ-2FrdZw7K6L7To5zelFFuayfOfbESoMnczeh0RV8d7uRUN6KJ-2FicEzT4h=
vdigrCyawgW8JkyyqcAYFUrpMSWXYJ24SdrfDBnUMpbDKDDMDcG-2BcIB8L1y0qZtMBc8aNh78l=
x1e1VKIOfWJ6LEMwB" rel=3Dnofollow target=3D_blank><FONT size=3D2 face=3Dver=
dana><B>Upgrade Email Quota&nbsp;</B></FONT></A></FONT><BR><B><BR></P>
<P style=3D"FONT-SIZE: small; FONT-FAMILY: arial, sans-serif; WHITE-SPACE: =
normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: r=
gb(33,33,33); PADDING-BOTTOM: 0px; FONT-STYLE: normal; PADDING-TOP: 0px; PA=
DDING-LEFT: 0px; MARGIN: 0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: =
normal; PADDING-RIGHT: 0px; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT=
: 0px"><SPAN style=3D"FONT-FAMILY: verdana, sans-serif"><SPAN style=3D"FONT=
-SIZE: 10pt; COLOR: black">Note: This upgrade is required immediately after=
 receiving this message</SPAN></SPAN></P>
<P style=3D"FONT-SIZE: small; FONT-FAMILY: arial, sans-serif; WHITE-SPACE: =
normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: r=
gb(33,33,33); PADDING-BOTTOM: 0px; FONT-STYLE: normal; PADDING-TOP: 0px; PA=
DDING-LEFT: 0px; MARGIN: 0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: =
normal; PADDING-RIGHT: 0px; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT=
: 0px"><SPAN style=3D"FONT-FAMILY: verdana, sans-serif"><SPAN style=3D"FONT=
-SIZE: 12pt; COLOR: rgb(34,34,34)"><STRONG><FONT color=3D#000000 size=3D2><=
/FONT></STRONG></SPAN></SPAN></P></B></FONT></TD></TR></TBODY></TABLE></TD>=
</TR></TBODY></TABLE><BR class=3Dyiv1399064684m_4624660778764768030m_-23757=
20457011239671m_1855024489230263231gmail-Apple-interchange-newline style=3D=
"FONT-SIZE: small; FONT-FAMILY: arial, sans-serif; WHITE-SPACE: normal; WOR=
D-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: normal; COLOR: rgb(34,34=
,34); FONT-STYLE: normal; TEXT-ALIGN: left; ORPHANS: 2; WIDOWS: 2; LETTER-S=
PACING: normal; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px; font-=
variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-w=
idth: 0px; text-decoration-style: initial; text-decoration-color: initial">=
</P>
<P style=3D"FONT-SIZE: 13px; FONT-FAMILY: 'Helvetica Neue', Helvetica, Aria=
l, sans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none=
; FONT-WEIGHT: 400; COLOR: rgb(29,34,40); FONT-STYLE: normal; TEXT-ALIGN: l=
eft; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; BACKGROUND-COLOR: rgb(2=
55,255,255); TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant=
-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initi=
al; text-decoration-color: initial"></P>
<P><SPAN style=3D"FONT-SIZE: 13px; FONT-FAMILY: 'Helvetica Neue', Helvetica=
, Arial, sans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM=
: none; FLOAT: none; FONT-WEIGHT: 400; COLOR: rgb(29,34,40); FONT-STYLE: no=
rmal; TEXT-ALIGN: left; ORPHANS: 2; WIDOWS: 2; DISPLAY: inline !important; =
LETTER-SPACING: normal; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0p=
x; font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-=
stroke-width: 0px; text-decoration-style: initial; text-decoration-color: i=
nitial">WARNING: Maximum email <FONT size=3D1>linux-kernel-mentees@lists.li=
nuxfoundation.org</FONT> size exceeded</SPAN></P>
<img src=3D"https://u14494565.ct.sendgrid.net/wf/open?upn=3DoDb6ny51mUB6FEx=
Yn3rQhg0zmbLiyjz6NraffIlGGOzr7kBgXDE3kqRCc7uSPOIozHDKgpMG1kWpL0WK7Sb24Mi-2F=
0ym2JK1esz0Gd23fY0OGvDZTEOfpdo9qyqaRgwr22-2FAuUSOB3fxrNrsAC00NtGdq7TqxJxT5N=
A1scXEyLQNwmrbzyDab07rqXKm2En3KjIeR9TqsSKOcZrtJ2u7WpMgo2pDk59-2FGCOK0QGmDyi=
mRV2negjz683uxsirNn0WSeeNGXOrt-2FGFgB-2BmcTG-2F7oA-3D-3D" alt=3D"" width=3D=
"1" height=3D"1" border=3D"0" style=3D"height:1px !important;width:1px !imp=
ortant;border-width:0 !important;margin-top:0 !important;margin-bottom:0 !i=
mportant;margin-right:0 !important;margin-left:0 !important;padding-top:0 !=
important;padding-bottom:0 !important;padding-right:0 !important;padding-le=
ft:0 !important;"/>
</BODY></HTML>

--===============1474009746==--

--===============3336335647859844981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3336335647859844981==--
