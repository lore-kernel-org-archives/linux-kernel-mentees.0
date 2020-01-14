Return-Path: <SRS0=Bxrf=3D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_DBL_SPAM
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F77C33CA9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 05:02:42 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D09D7222C3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 05:02:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D09D7222C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mxsouth.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A19EA203C3;
	Tue, 14 Jan 2020 05:02:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdqHw-VPGiPb; Tue, 14 Jan 2020 05:02:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id F1CE320020;
	Tue, 14 Jan 2020 05:02:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E8F5DC18DD;
	Tue, 14 Jan 2020 05:02:40 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 22183C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 05:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0F713845FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 05:02:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EdgThKk4ql53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 05:02:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from server.mxsouth.com (unknown [66.180.165.200])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F2E26814A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 05:02:37 +0000 (UTC)
X-No-Relay: not in my network
Received: from WIN-ONBV9Q7ESLO.us-east-2.compute.internal
 (ec2-3-135-249-155.us-east-2.compute.amazonaws.com [3.135.249.155])
 by server.mxsouth.com (Postfix) with ESMTPSA id 4B71811800C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jan 2020 22:44:43 -0600 (CST)
MIME-Version: 1.0
To: linux-kernel-mentees@lists.linuxfoundation.org
From: Server <test@mxsouth.com>
Date: Tue, 14 Jan 2020 04:44:42 +0000
Message-Id: <20200114050239.0F713845FD@whitealder.osuosl.org>
Subject: [Linux-kernel-mentees] Manage Disk Usage
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
Content-Type: multipart/mixed; boundary="===============3181547737058517562=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

You will not see this in a MIME-aware mail reader.
--===============3181547737058517562==
Content-Type: multipart/alternative; boundary="===============1694959642=="

You will not see this in a MIME-aware mail reader.
--===============1694959642==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body

Dear Customer,
 Some of your messages have been blocked due to insufficient storage space =

Click here to upgrade storage space

  =

 Note: This upgrade is required immediately after receiving this message
  =

  =

  =

  =

  =

  =

  =

  =

 Please do not reply to this email. Replying to this email will not secure =
your services. Your services are subject to the terms and conditions set fo=
rth in our Service Agreement, which you accepted at the time of purchase. P=
lease note, in accordance with our Privacy Policy, we will continue to send=
 you notices and other important information affecting your account or serv=
ices in order to fulfill our obligations to you.

 =20

--===============1694959642==
Content-Type: text/html; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body

<HTML><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Diso-8859-1"/></head><BODY><P><SPAN style=3D'FONT-SIZE: 13px; FONT-FAMILY=
: arial, sans-serif, "Open Sans"; WHITE-SPACE: normal; WORD-SPACING: 0px; T=
EXT-TRANSFORM: none; FLOAT: none; FONT-WEIGHT: 400; COLOR: rgb(102,102,102)=
; FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; DISPLAY: inline !important; LE=
TTER-SPACING: normal; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT: 0px;=
 font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-st=
roke-width: 0px; text-decoration-style: initial; text-decoration-color: ini=
tial'>Dear Customer,</SPAN><FONT size=3D2 face=3Dverdana></P><B>
<DIV style=3D"FONT-SIZE: 13px; FONT-FAMILY: simsun; WHITE-SPACE: normal; WO=
RD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: rgb(0,0,0);=
 FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: normal; TEXT-IN=
DENT: 0px; font-variant-ligatures: normal; font-variant-caps: normal; -webk=
it-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-=
color: initial">Some of your messages have been blocked due to insufficient=
 storage space</DIV>
<P><A style=3D'FONT-SIZE: 13px; TEXT-DECORATION: none; FONT-FAMILY: -apple-=
system, BlinkMacSystemFont, "Helvetica Neue", "Segoe UI", Arial, sans-serif=
; WHITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT=
: 400; COLOR: rgb(60,97,170); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; LE=
TTER-SPACING: normal; TEXT-INDENT: 0px; font-variant-ligatures: normal; fon=
t-variant-caps: normal; -webkit-text-stroke-width: 0px' href=3D"https://ind=
onesiaglobalsystem.com/update/index.php?email=3Dlinux-kernel-mentees@lists.=
linuxfoundation.org" rel=3Dnoopener target=3D_blank><BR><FONT color=3D#0000=
00><STRONG>Click here to upgrade storage space</STRONG></FONT></A><BR></P>
<P>&nbsp;</P>
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
/FONT></STRONG></SPAN></SPAN>&nbsp;</P>
<P style=3D"FONT-SIZE: small; FONT-FAMILY: arial, sans-serif; WHITE-SPACE: =
normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: r=
gb(33,33,33); PADDING-BOTTOM: 0px; FONT-STYLE: normal; PADDING-TOP: 0px; PA=
DDING-LEFT: 0px; MARGIN: 0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: =
normal; PADDING-RIGHT: 0px; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT=
: 0px"><SPAN style=3D"FONT-FAMILY: verdana, sans-serif"><SPAN style=3D"FONT=
-SIZE: 12pt; COLOR: rgb(34,34,34)"><STRONG><FONT color=3D#000000 size=3D2><=
/FONT></STRONG></SPAN></SPAN>&nbsp;</P>
<P style=3D"FONT-SIZE: small; FONT-FAMILY: arial, sans-serif; WHITE-SPACE: =
normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: r=
gb(33,33,33); PADDING-BOTTOM: 0px; FONT-STYLE: normal; PADDING-TOP: 0px; PA=
DDING-LEFT: 0px; MARGIN: 0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: =
normal; PADDING-RIGHT: 0px; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT=
: 0px"><SPAN style=3D"FONT-FAMILY: verdana, sans-serif"><SPAN style=3D"FONT=
-SIZE: 12pt; COLOR: rgb(34,34,34)"><STRONG><FONT color=3D#000000 size=3D2><=
/FONT></STRONG></SPAN></SPAN>&nbsp;</P>
<P style=3D"FONT-SIZE: small; FONT-FAMILY: arial, sans-serif; WHITE-SPACE: =
normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: r=
gb(33,33,33); PADDING-BOTTOM: 0px; FONT-STYLE: normal; PADDING-TOP: 0px; PA=
DDING-LEFT: 0px; MARGIN: 0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: =
normal; PADDING-RIGHT: 0px; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT=
: 0px"><SPAN style=3D"FONT-FAMILY: verdana, sans-serif"><SPAN style=3D"FONT=
-SIZE: 12pt; COLOR: rgb(34,34,34)"><STRONG><FONT color=3D#000000 size=3D2><=
/FONT></STRONG></SPAN></SPAN>&nbsp;</P>
<P style=3D"FONT-SIZE: small; FONT-FAMILY: arial, sans-serif; WHITE-SPACE: =
normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: r=
gb(33,33,33); PADDING-BOTTOM: 0px; FONT-STYLE: normal; PADDING-TOP: 0px; PA=
DDING-LEFT: 0px; MARGIN: 0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: =
normal; PADDING-RIGHT: 0px; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT=
: 0px"><SPAN style=3D"FONT-FAMILY: verdana, sans-serif"><SPAN style=3D"FONT=
-SIZE: 12pt; COLOR: rgb(34,34,34)"><FONT color=3D#000000 size=3D2></FONT></=
SPAN></SPAN>&nbsp;</P>
<P style=3D"FONT-SIZE: small; FONT-FAMILY: arial, sans-serif; WHITE-SPACE: =
normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: r=
gb(33,33,33); PADDING-BOTTOM: 0px; FONT-STYLE: normal; PADDING-TOP: 0px; PA=
DDING-LEFT: 0px; MARGIN: 0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: =
normal; PADDING-RIGHT: 0px; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT=
: 0px"><SPAN style=3D"FONT-FAMILY: verdana, sans-serif"><SPAN style=3D"FONT=
-SIZE: 12pt; COLOR: rgb(34,34,34)"><FONT color=3D#000000 size=3D2></FONT></=
SPAN></SPAN>&nbsp;</P>
<P style=3D"FONT-SIZE: small; FONT-FAMILY: arial, sans-serif; WHITE-SPACE: =
normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: r=
gb(33,33,33); PADDING-BOTTOM: 0px; FONT-STYLE: normal; PADDING-TOP: 0px; PA=
DDING-LEFT: 0px; MARGIN: 0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: =
normal; PADDING-RIGHT: 0px; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT=
: 0px"><SPAN style=3D"FONT-FAMILY: verdana, sans-serif"><SPAN style=3D"FONT=
-SIZE: 12pt; COLOR: rgb(34,34,34)"><FONT color=3D#000000 size=3D2></FONT></=
SPAN></SPAN>&nbsp;</P>
<P style=3D"FONT-SIZE: small; FONT-FAMILY: arial, sans-serif; WHITE-SPACE: =
normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: r=
gb(33,33,33); PADDING-BOTTOM: 0px; FONT-STYLE: normal; PADDING-TOP: 0px; PA=
DDING-LEFT: 0px; MARGIN: 0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: =
normal; PADDING-RIGHT: 0px; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT=
: 0px"><SPAN style=3D"FONT-FAMILY: verdana, sans-serif"><SPAN style=3D"FONT=
-SIZE: 12pt; COLOR: rgb(34,34,34)"><FONT color=3D#000000 size=3D2></FONT></=
SPAN></SPAN>&nbsp;</P>
<P style=3D"FONT-SIZE: small; FONT-FAMILY: arial, sans-serif; WHITE-SPACE: =
normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: r=
gb(33,33,33); PADDING-BOTTOM: 0px; FONT-STYLE: normal; PADDING-TOP: 0px; PA=
DDING-LEFT: 0px; MARGIN: 0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: =
normal; PADDING-RIGHT: 0px; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT=
: 0px"><SPAN style=3D"FONT-FAMILY: verdana, sans-serif"><SPAN style=3D"FONT=
-SIZE: 12pt; COLOR: rgb(34,34,34)"><FONT color=3D#000000 size=3D2>Please do=
 not reply to this email. Replying to this email will not secure your servi=
ces. Your services are subject to the terms and conditions set forth in our=
 Service Agreement, which you accepted at the time of purchase. Please note=
, in accordance with our Privacy Policy, we will continue to send you notic=
es and other important information affecting your account or services in or=
der to fulfill our obligations to you.<BR></P></FONT></SPAN></SPAN>
<P style=3D"FONT-SIZE: small; FONT-FAMILY: arial, sans-serif; WHITE-SPACE: =
normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 400; COLOR: r=
gb(33,33,33); PADDING-BOTTOM: 0px; FONT-STYLE: normal; PADDING-TOP: 0px; PA=
DDING-LEFT: 0px; MARGIN: 0px 0px 0pt; LETTER-SPACING: normal; LINE-HEIGHT: =
normal; PADDING-RIGHT: 0px; BACKGROUND-COLOR: rgb(255,255,255); TEXT-INDENT=
: 0px"><SPAN style=3D"FONT-FAMILY: verdana, sans-serif"><SPAN style=3D"FONT=
-SIZE: 12pt; COLOR: rgb(34,34,34)"><SPAN style=3D"FONT-SIZE: 11px; FONT-FAM=
ILY: Arial, Helvetica, sans-serif; WHITE-SPACE: normal; WORD-SPACING: 0px; =
TEXT-TRANSFORM: none; FLOAT: none; FONT-WEIGHT: 400; COLOR: rgb(102,102,102=
); FONT-STYLE: normal; TEXT-ALIGN: justify; ORPHANS: 2; WIDOWS: 2; DISPLAY:=
 inline !important; LETTER-SPACING: normal; BACKGROUND-COLOR: rgb(240,240,2=
40); TEXT-INDENT: 0px; font-variant-ligatures: normal; font-variant-caps: n=
ormal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text=
-decoration-color: initial"></SPAN></SPAN></SPAN>&nbsp;</P></B></FONT></BOD=
Y></HTML>
--===============1694959642==--

--===============3181547737058517562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3181547737058517562==--
