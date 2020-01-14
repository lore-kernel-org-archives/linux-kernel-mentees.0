Return-Path: <SRS0=Bxrf=3D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=3.0 tests=DATE_IN_PAST_06_12,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_FONT_LOW_CONTRAST,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,TVD_PH_SEC,URIBL_GREY autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6272FC33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 21:59:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F2B424658
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 21:59:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sendgrid.net header.i=@sendgrid.net header.b="rEVkQuS8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F2B424658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CB92F847B3;
	Tue, 14 Jan 2020 21:59:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N8eEqfQWwiKX; Tue, 14 Jan 2020 21:59:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C64A084407;
	Tue, 14 Jan 2020 21:59:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2630C18DD;
	Tue, 14 Jan 2020 21:59:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A80AC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 21:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 096D682383
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 21:59:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MPiNDABGWjDi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 21:59:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from o16824537x96.outbound-mail.sendgrid.net
 (o16824537x96.outbound-mail.sendgrid.net [168.245.37.96])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 0798B8214C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 21:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.net;
 h=content-type:mime-version:subject:from:to;
 s=smtpapi; bh=4sP6z2XnQU9FvAy7u9XYCDNT8MUAKk7gh50eQEqn3jM=;
 b=rEVkQuS8IHlUgjrNGDBTn2V5vFQ7ebqpvMN8TmZPl2jIMhGpUcA9ZRs17qIyVZeNDmrP
 FdT5CZfEoLE1CU2FgwK+A5Fcj7skMzMrUbrdcHkkP7RiqlmXVUN3kGDIlIa/p77Mv06a9P
 6Os1lK4IWhfhM6F2OACJ+GljoXa44MCyc=
Received: by filterdrecv-p3iad2-57f487d66-r7bxj with SMTP id
 filterdrecv-p3iad2-57f487d66-r7bxj-18-5E1DBA58-55
 2020-01-14 12:55:52.944707893 +0000 UTC m=+1000740.845933755
Received: from WIN-ONBV9Q7ESLO.us-east-2.compute.internal (unknown
 [3.135.249.155])
 by ismtpd0015p1iad2.sendgrid.net (SG) with ESMTP id 75MdwoC7TGyRFUeKqWsgOw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 12:55:52.898 +0000 (UTC)
MIME-Version: 1.0
From: Email Administrator <eckhard-kaulartz@t-online.de>
Date: Tue, 14 Jan 2020 12:55:52 +0000 (UTC)
Message-ID: <75MdwoC7TGyRFUeKqWsgOw@ismtpd0015p1iad2.sendgrid.net>
X-SG-EID: =?us-ascii?Q?4sstKLB4EH43SiKxZjguhpPAOFIf0J17qTxa9XaMF5MJjNVj9onmfUgAEQeiDW?=
 =?us-ascii?Q?80VMTchRN4e1b9cg2fl9DIOj=2F9Z98H9kCJlp2f0?=
 =?us-ascii?Q?bon6U=2FV+D=2FveSklk9tqo1ScVFsgQ5Om1KfBWW3G?=
 =?us-ascii?Q?eghXXuKHaNrIizVQ9o5VT8tBlalkag0Uq3zPRql?=
 =?us-ascii?Q?InD77brGODvTmtlR=2FNtGLcZHopPjU946sjEPGQg?=
 =?us-ascii?Q?X8T56OTs0DMhjAZ=2FKRcYViJWifANYGaPsXn70RZ?=
 =?us-ascii?Q?MsQQVSQWMnKQd=2FGZs23FkZ8SfSiZIFzSIy0drKD?=
 =?us-ascii?Q?X13QUy8yeJYDvnaugHB16WOc?=
To: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] we received a request earlier to suspend
	your account
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
Content-Type: multipart/mixed; boundary="===============8738843226549425920=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

You will not see this in a MIME-aware mail reader.
--===============8738843226549425920==
Content-Type: multipart/alternative; boundary="===============0164082680=="

You will not see this in a MIME-aware mail reader.
--===============0164082680==
Content-Type: text/plain; charset=us-ascii
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body

=20
  =20
  =20
    	 Email Address Termination

  =20
   =20
   =20
    user linux-kernel-mentees@lists.linuxfoundation.org
Our records indicate that you made a request to terminate your account
 For your security, this email has been sent to for final confirmation if y=
ou did not made request cancel below.
 =20

  =20
   Cancel

 linux-kernel-mentees@lists.linuxfoundation.org

 =20
 =20


 =20
 =20
 =20
 =20
 =20
 =20
 =20
 =20
 Please do not reply to this email. Replying to this email will not secure =
your services. Your services are subject to the terms and conditions set fo=
rth in our Service Agreement, which you accepted at the time of purchase. P=
lease note, in accordance with our Privacy Policy, we will continue to send=
 you notices and other important information affecting your account or serv=
ices in order to fulfill our obligations to you.

 =20

--===============0164082680==
Content-Type: text/html; charset=us-ascii
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
tial'>
<TABLE id=3DmainTable style=3D"FONT-FAMILY: Arial, Helvetica, sans-serif; W=
ORD-SPACING: 0px; BORDER-COLLAPSE: collapse; TABLE-LAYOUT: fixed; TEXT-TRAN=
SFORM: none; MARGIN: 0px auto; ORPHANS: 2; WIDOWS: 2; LETTER-SPACING: norma=
l; BACKGROUND-COLOR: rgb(232,232,232); TEXT-INDENT: 0px; -webkit-text-strok=
e-width: 0px; text-decoration-style: initial; text-decoration-color: initia=
l" width=3D600 align=3Dcenter>
<TBODY>
<TR style=3D"FONT-SIZE: 11px; FONT-FAMILY: Arial, Helvetica, sans-serif; WH=
ITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 40=
0; COLOR: rgb(51,51,51); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; LETTER-=
SPACING: normal; BACKGROUND-COLOR: rgb(232,232,232); TEXT-INDENT: 0px; font=
-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-=
width: 0px; text-decoration-style: initial; text-decoration-color: initial"=
>
<TD style=3D"FONT-SIZE: 14px; BORDER-TOP: rgb(0,70,147) 4px solid; FONT-FAM=
ILY: Arial, Helvetica, sans-serif; BACKGROUND: rgb(255,255,255); COLOR: rgb=
(102,102,102); PADDING-BOTTOM: 10px; TEXT-ALIGN: center; PADDING-TOP: 10px;=
 PADDING-LEFT: 0px; LINE-HEIGHT: 20px; PADDING-RIGHT: 0px" align=3Dcenter><=
/TD></TR>
<TR style=3D"FONT-SIZE: 11px; FONT-FAMILY: Arial, Helvetica, sans-serif; WH=
ITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 40=
0; COLOR: rgb(51,51,51); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; LETTER-=
SPACING: normal; BACKGROUND-COLOR: rgb(232,232,232); TEXT-INDENT: 0px; font=
-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-=
width: 0px; text-decoration-style: initial; text-decoration-color: initial"=
>
<TD style=3D"FONT-SIZE: 14px; FONT-FAMILY: Arial, Helvetica, sans-serif; CO=
LOR: rgb(102,102,102); PADDING-BOTTOM: 0px; PADDING-TOP: 0px; PADDING-LEFT:=
 0px; LINE-HEIGHT: 20px; PADDING-RIGHT: 0px">
<TABLE style=3D"BOX-SIZING: border-box" cellSpacing=3D0 cellPadding=3D0 wid=
th=3D"100%">
<TBODY>
<TR>
<TD style=3D"FONT-SIZE: 14px; FONT-FAMILY: Arial, Helvetica, sans-serif; WI=
DTH: 10px; COLOR: rgb(102,102,102); PADDING-BOTTOM: 15px; PADDING-TOP: 15px=
; PADDING-LEFT: 0px; LINE-HEIGHT: 20px; PADDING-RIGHT: 0px; BACKGROUND-COLO=
R: rgb(0,70,147)" width=3D10>&nbsp;</TD>
<TD style=3D"FONT-SIZE: 14px; FONT-FAMILY: Arial, Helvetica, sans-serif; WI=
DTH: 570px; COLOR: rgb(102,102,102); PADDING-BOTTOM: 15px; PADDING-TOP: 15p=
x; PADDING-LEFT: 10px; LINE-HEIGHT: 20px; PADDING-RIGHT: 15px; BACKGROUND-C=
OLOR: rgb(64,116,174)" align=3Dleft><SPAN style=3D"FONT-SIZE: 30px; FONT-WE=
IGHT: bold; COLOR: rgb(255,255,255); LINE-HEIGHT: 36px">Email Address Termi=
nation<BR></SPAN></TD></TR></TBODY></TABLE></TD></TR>
<TR style=3D"FONT-SIZE: 11px; FONT-FAMILY: Arial, Helvetica, sans-serif; WH=
ITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 40=
0; COLOR: rgb(51,51,51); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; LETTER-=
SPACING: normal; BACKGROUND-COLOR: rgb(232,232,232); TEXT-INDENT: 0px; font=
-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-=
width: 0px; text-decoration-style: initial; text-decoration-color: initial"=
>
<TD id=3DmainCell style=3D"FONT-SIZE: 14px; BORDER-TOP: rgb(232,232,232) 4p=
x solid; FONT-FAMILY: Arial, Helvetica, sans-serif; COLOR: rgb(102,102,102)=
; LINE-HEIGHT: 22px">
<TABLE style=3D"WIDTH: 598px; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: =
white" cellSpacing=3D0 cellPadding=3D0 bgColor=3D#ffffff border=3D0>
<TBODY>
<TR>
<TD style=3D"FONT-SIZE: 14px; FONT-FAMILY: Arial, Helvetica, sans-serif; CO=
LOR: rgb(102,102,102); LINE-HEIGHT: 22px; BACKGROUND-COLOR: rgb(255,255,255=
)">
<TABLE cellSpacing=3D0 cellPadding=3D0 bgColor=3D#ffffff>
<TBODY>
<TR>
<TD style=3D"FONT-SIZE: 14px; FONT-FAMILY: Arial, Helvetica, sans-serif; CO=
LOR: rgb(102,102,102); LINE-HEIGHT: 22px; BACKGROUND-COLOR: rgb(255,255,255=
)">
<TABLE style=3D"BOX-SIZING: border-box; WIDTH: 598px" cellSpacing=3D0 cellP=
adding=3D0 align=3Dleft bgColor=3D#ffffff>
<TBODY>
<TR>
<TD style=3D"FONT-SIZE: 14px; FONT-FAMILY: Arial, Helvetica, sans-serif; CO=
LOR: rgb(102,102,102); PADDING-TOP: 20px; PADDING-LEFT: 20px; LINE-HEIGHT: =
22px; PADDING-RIGHT: 20px; BACKGROUND-COLOR: rgb(255,255,255)" vAlign=3Dtop=
>
<P style=3D"FONT-SIZE: 14px; FONT-FAMILY: Arial, Helvetica, sans-serif; COL=
OR: rgb(102,102,102); MARGIN: 0px 0px 20px; LINE-HEIGHT: 20px"><SPAN style=
=3D"FONT-FAMILY: verdana, sans-serif"><FONT style=3D size=3D2>user linux-ke=
rnel-mentees@lists.linuxfoundation.org<BR></FONT></SPAN>Our records indicat=
e that you made a request to terminate your account</P>
<P style=3D"FONT-SIZE: 14px; FONT-FAMILY: Arial, Helvetica, sans-serif; COL=
OR: rgb(102,102,102); MARGIN: 0px 0px 20px; LINE-HEIGHT: 20px">For your sec=
urity, this email has been sent to for final confirmation if you did not ma=
de request cancel below<A style=3D"TEXT-DECORATION: underline; FONT-WEIGHT:=
 bold; COLOR: rgb(6,73,119)" href=3D"https://u14157067.ct.sendgrid.net/wf/c=
lick?upn=3Din0eyhDXTORf2skTKFWtL9rBbC98KK1vAlPpHrUnIeL9ih9G2qJmc0NeFbIPC1yn=
_oDb6ny51mUB6FExYn3rQhg0zmbLiyjz6NraffIlGGOzr7kBgXDE3kqRCc7uSPOIoBiYYAXygxq=
WlzxppIxrfoKpNIZ-2B1WpHV-2BNecTmjGzOmGYFHhbU-2B1eaLRny7TQYtv8faOKoCdULH4JZ0=
axWtoN7bA6SS4RchFe17IKfsU2Nq774-2B2UKc0aY11phuozob-2BJlb7lm-2B4i3nwOFzAqvBv=
CB6ZEuSw7ygOWGMaqTOoI5OamnMPKNaQxB72yyfBGQDS6R1wwYJANwnk-2Bqeq6sjeZw-3D-3D"=
 rel=3Dnoreferrer target=3D_blank></A>.</P>
<P style=3D"FONT-SIZE: 14px; FONT-FAMILY: Arial, Helvetica, sans-serif; COL=
OR: rgb(102,102,102); MARGIN: 0px 0px 20px; LINE-HEIGHT: 20px">&nbsp;</P></=
TD></TR>
<TR>
<TD style=3D"FONT-SIZE: 14px; FONT-FAMILY: Arial, Helvetica, sans-serif; CO=
LOR: rgb(102,102,102); PADDING-TOP: 0px; PADDING-LEFT: 20px; LINE-HEIGHT: 2=
2px; PADDING-RIGHT: 20px; BACKGROUND-COLOR: rgb(255,255,255)" vAlign=3Dtop>
<TABLE class=3Dbutton style=3D"OVERFLOW: hidden; BACKGROUND: rgb(0,114,198)=
" cellSpacing=3D0 cellPadding=3D0 border=3D0>
<TBODY>
<TR>
<TD style=3D"FONT-SIZE: 16px; FONT-FAMILY: Arial, Helvetica, sans-serif; WI=
DTH: auto !important; BACKGROUND: rgb(0,114,198); COLOR: rgb(255,255,255); =
TEXT-ALIGN: center; PADDING-LEFT: 15px; DISPLAY: block; LINE-HEIGHT: 22px; =
PADDING-RIGHT: 15px"><A style=3D"FONT-SIZE: 16px; TEXT-DECORATION: none; FO=
NT-FAMILY: Helvetica, Arial, sans-serif; FONT-WEIGHT: bold; COLOR: rgb(255,=
255,255); PADDING-BOTTOM: 8px; PADDING-TOP: 8px; PADDING-LEFT: 8px; DISPLAY=
: block !important; PADDING-RIGHT: 8px" href=3D"https://u14157067.ct.sendgr=
id.net/wf/click?upn=3Din0eyhDXTORf2skTKFWtL3vrJJCtsvQAzSI2NlNgEIJASBVjpSGQv=
p9wv-2FXmFRY76xl8EixtoxLRxtCgZ62U-2FxGleXelu-2B0OMROvwIy-2BIo0J0oxtZ53XWNm4=
Ih-2F7xlFwW3Hb1HAF940-2BBa900r5kVTUkskoPlPCuYLRgpu3XlNo-3D_oDb6ny51mUB6FExY=
n3rQhg0zmbLiyjz6NraffIlGGOzr7kBgXDE3kqRCc7uSPOIoBiYYAXygxqWlzxppIxrfoKpNIZ-=
2B1WpHV-2BNecTmjGzOmRV6mNvNus1DSYtNxpRNPc9yvLLFoq7vmOHNZyVvxYDTUkiPCz39H4Xg=
NE3uibpWjxUmAZ4MYg80KJ3GUF-2FV73joY1PQwbzOZyF-2B9gxzwJOMmYIh8cTq3MOGR2HFFoT=
SarUMvrhzTduhJo8-2FkvGSw7KdeXbeuP7Ra8GpNdLGqr7w-3D-3D" rel=3Dnoreferrer tar=
get=3D_blank>Cancel</A></TD></TR></TBODY></TABLE><BR>
<P style=3D"FONT-SIZE: 14px; FONT-FAMILY: Arial, Helvetica, sans-serif; COL=
OR: rgb(102,102,102); MARGIN: 0px 0px 20px; LINE-HEIGHT: 20px"><SPAN style=
=3D"FONT-SIZE: small; FONT-FAMILY: verdana, sans-serif; WHITE-SPACE: normal=
; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: normal; COLOR: rgb(=
34,34,34); FONT-STYLE: normal; LETTER-SPACING: normal; BACKGROUND-COLOR: rg=
b(255,255,255); TEXT-INDENT: 0px"><FONT color=3D#000000>linux-kernel-mentee=
s@lists.linuxfoundation.org</FONT><SPAN style=3D"FONT-SIZE: 20px; COLOR: rg=
b(0,0,0)"></SPAN></SPAN></P></TD></TR></TBODY></TABLE></TD></TR></TBODY></T=
ABLE></TD></TR></TBODY></TABLE></TD></TR>
<TR style=3D"FONT-SIZE: 11px; FONT-FAMILY: Arial, Helvetica, sans-serif; WH=
ITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 40=
0; COLOR: rgb(51,51,51); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; LETTER-=
SPACING: normal; BACKGROUND-COLOR: rgb(232,232,232); TEXT-INDENT: 0px; font=
-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-=
width: 0px; text-decoration-style: initial; text-decoration-color: initial"=
>
<TD style=3D"FONT-SIZE: 12px; BORDER-TOP: rgb(232,232,232) 4px solid; FONT-=
FAMILY: Arial, Helvetica, sans-serif; COLOR: rgb(102,102,102); PADDING-BOTT=
OM: 20px; TEXT-ALIGN: center; PADDING-TOP: 20px; PADDING-LEFT: 20px; LINE-H=
EIGHT: 22px; PADDING-RIGHT: 20px; BACKGROUND-COLOR: rgb(255,255,255)" align=
=3Dcenter></TD></TR>
<TR style=3D"FONT-SIZE: 11px; FONT-FAMILY: Arial, Helvetica, sans-serif; WH=
ITE-SPACE: normal; WORD-SPACING: 0px; TEXT-TRANSFORM: none; FONT-WEIGHT: 40=
0; COLOR: rgb(51,51,51); FONT-STYLE: normal; ORPHANS: 2; WIDOWS: 2; LETTER-=
SPACING: normal; BACKGROUND-COLOR: rgb(232,232,232); TEXT-INDENT: 0px; font=
-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-=
width: 0px; text-decoration-style: initial; text-decoration-color: initial"=
>
<TD style=3D"FONT-SIZE: 12px; FONT-FAMILY: Arial, Helvetica, sans-serif; CO=
LOR: rgb(102,102,102); PADDING-BOTTOM: 20px; TEXT-ALIGN: center; PADDING-TO=
P: 20px; PADDING-LEFT: 20px; LINE-HEIGHT: 22px; PADDING-RIGHT: 20px; BACKGR=
OUND-COLOR: rgb(255,255,255)" align=3Dcenter><BR class=3DApple-interchange-=
newline></TR></TBODY></TABLE></SPAN><FONT size=3D2 face=3Dverdana><B></P>
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
-decoration-color: initial"></SPAN></SPAN></SPAN>&nbsp;</P></B></FONT><img =
src=3D"https://u14157067.ct.sendgrid.net/wf/open?upn=3DoDb6ny51mUB6FExYn3rQ=
hg0zmbLiyjz6NraffIlGGOzr7kBgXDE3kqRCc7uSPOIoBiYYAXygxqWlzxppIxrfoKpNIZ-2B1W=
pHV-2BNecTmjGzOm-2FkG-2F6XDZr9WtGeq9Z0dLfbjeBc9NPvqwiXllBaP5kn8PDIxoBN0kRIL=
2TQFUZ72Bc-2BRdI2mB5vILlYsqXlYC3m-2BVdj5Mw9WUPfWw6cYY0MRqADwwHaT02Iiy9O4U69=
zHryRvhcxICpgxJexv447Wb0ERf6ro5zTZaX5h2YKRFTZpKxG41pJY-2FyhN2h0JFH30-3D" al=
t=3D"" width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !important=
;width:1px !important;border-width:0 !important;margin-top:0 !important;mar=
gin-bottom:0 !important;margin-right:0 !important;margin-left:0 !important;=
padding-top:0 !important;padding-bottom:0 !important;padding-right:0 !impor=
tant;padding-left:0 !important;"/></BODY></HTML>
--===============0164082680==--

--===============8738843226549425920==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8738843226549425920==--
