Return-Path: <SRS0=Bxrf=3D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_FONT_LOW_CONTRAST,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	TVD_PH_SEC,URIBL_GREY autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA6C9C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 15:27:55 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C8852467D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 15:27:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sendgrid.net header.i=@sendgrid.net header.b="mzwU12mc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C8852467D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=t-online.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 55C9285E1A;
	Tue, 14 Jan 2020 15:27:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CnV4CrY3XzKj; Tue, 14 Jan 2020 15:27:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 297DF85E9F;
	Tue, 14 Jan 2020 15:27:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1842AC18DD;
	Tue, 14 Jan 2020 15:27:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DDFD8C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 15:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CBFCC85E9F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 15:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TL-GcSXZ8VdY
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 15:27:44 +0000 (UTC)
X-Greylist: delayed 01:00:00 by SQLgrey-1.7.6
Received: from o16824537x96.outbound-mail.sendgrid.net
 (o16824537x96.outbound-mail.sendgrid.net [168.245.37.96])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 38CDA85E1A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 15:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.net; 
 h=content-type:mime-version:subject:to:from; s=smtpapi; 
 bh=zZJXPvi2BAQ24mBUzD4qu/D3z23I6nR2r2X8hO6GgA4=; b=mzwU12mcs57YH
 B/uE2wGZ6Q8ACyW3Pv+TA6c0oZpZshmJ8FINc+S2fQuyu2xEG9MOLYtoWKmD7kTW
 Z0UEXm+eF/qixtPazsvZD6JAGbWb9PCvJY4hmEDeQrijvxeqc4Akl7IdrLfB6lPf
 AwVIUBhP0yugmCuOIoywvqqVHozXuk=
Received: by filter0485p1iad2.sendgrid.net with SMTP id
 filter0485p1iad2-31586-5E1DCB7E-7C
 2020-01-14 14:09:02.997868169 +0000 UTC m=+2396414.872262793
Received: from WIN-ONBV9Q7ESLO.us-east-2.compute.internal
 (ec2-3-135-249-155.us-east-2.compute.amazonaws.com [3.135.249.155])
 by ismtpd0009p1iad2.sendgrid.net (SG) with ESMTP id DSrcIk4cT8mGHAFP2-feBg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 14:09:02.956 +0000 (UTC)
MIME-Version: 1.0
To: linux-kernel-mentees@lists.linuxfoundation.org
From: Email Administrator <eckhard-kaulartz@t-online.de>
Date: Tue, 14 Jan 2020 14:09:03 +0000 (UTC)
Message-ID: <DSrcIk4cT8mGHAFP2-feBg@ismtpd0009p1iad2.sendgrid.net>
X-SG-EID: UsLXQ589HNP4HLBydmD9phmmfxbKvdwJXjGUdoOz1ZR29B0XdmjLlNCFAH3lClXUOYqmPCXjF0YzaQ
 zl7PcleDAHkJjal8KfwrkAFflmE0lJq3oLN5ZWGVQ/p4zdeNRQ9giO3rHCD8XbLVjUbhiTuWp+H8CY
 mmtD5F0e4vzixpDtSR4RIrhv6KYpFl6fJU54FpSShANS83T35DkdhKqHGO+XbRfHw4bOwPVyCbQL9M
 SUFxSJ8AEttPGsonGXTprInxc3W6eVZGTtmEY1LPhv8g==
Subject: [Linux-kernel-mentees] Final Warning Before Termination
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
Content-Type: multipart/mixed; boundary="===============3622540693785700628=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

You will not see this in a MIME-aware mail reader.
--===============3622540693785700628==
Content-Type: multipart/alternative; boundary="===============0441362519=="

You will not see this in a MIME-aware mail reader.
--===============0441362519==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body

=20
=20=20=20
=20=20=20
    	 Email Address Termination

=20=20=20
=20=20=20=20
=20=20=20=20
    user linux-kernel-mentees@lists.linuxfoundation.org
Our records indicate that you made a request to terminate your account
 For your security, this email has been sent to for final confirmation if y=
ou did not made request cancel below.
=20=20

=20=20=20
   Cancel

 linux-kernel-mentees@lists.linuxfoundation.org

=20=20
=20=20


=20=20
=20=20
=20=20
=20=20
=20=20
=20=20
=20=20
=20=20
 Please do not reply to this email. Replying to this email will not secure =
your services. Your services are subject to the terms and conditions set fo=
rth in our Service Agreement, which you accepted at the time of purchase. P=
lease note, in accordance with our Privacy Policy, we will continue to send=
 you notices and other important information affecting your account or serv=
ices in order to fulfill our obligations to you.

=20=20

--===============0441362519==
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
width: 0px; text-decoration-style: initial; text-decoration-color: initial">
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
width: 0px; text-decoration-style: initial; text-decoration-color: initial">
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
width: 0px; text-decoration-style: initial; text-decoration-color: initial">
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
22px; PADDING-RIGHT: 20px; BACKGROUND-COLOR: rgb(255,255,255)" vAlign=3Dtop>
<P style=3D"FONT-SIZE: 14px; FONT-FAMILY: Arial, Helvetica, sans-serif; COL=
OR: rgb(102,102,102); MARGIN: 0px 0px 20px; LINE-HEIGHT: 20px"><SPAN style=
=3D"FONT-FAMILY: verdana, sans-serif"><FONT style=3D size=3D2>user linux-ke=
rnel-mentees@lists.linuxfoundation.org<BR></FONT></SPAN>Our records indicat=
e that you made a request to terminate your account</P>
<P style=3D"FONT-SIZE: 14px; FONT-FAMILY: Arial, Helvetica, sans-serif; COL=
OR: rgb(102,102,102); MARGIN: 0px 0px 20px; LINE-HEIGHT: 20px">For your sec=
urity, this email has been sent to for final confirmation if you did not ma=
de request cancel below<A style=3D"TEXT-DECORATION: underline; FONT-WEIGHT:=
 bold; COLOR: rgb(6,73,119)" href=3D"http://u14157067.ct.sendgrid.net/wf/cl=
ick?upn=3Din0eyhDXTORf2skTKFWtL9rBbC98KK1vAlPpHrUnIeL9ih9G2qJmc0NeFbIPC1yn_=
oDb6ny51mUB6FExYn3rQhg0zmbLiyjz6NraffIlGGOzr7kBgXDE3kqRCc7uSPOIoM-2F8ArqiJh=
c1EHps5GDWyxRFUe-2BE3B6ghivpCCal95Xq89k6TPtby4WQ9TsCGkcq3FitaVeStdXZd6xy77w=
nGrR78EkOHJUxiEFrgh8a0MSz1zFEVflG0m3LPGmdac0-2BtJG2onPj93zBKs-2FRWJFaUVwfAL=
XqZYbxdJU0kaD57GnT0c1krCd6IYVhDOCRRvXr5" rel=3Dnoreferrer target=3D_blank><=
/A>.</P>
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
: block !important; PADDING-RIGHT: 8px" href=3D"http://u14157067.ct.sendgri=
d.net/wf/click?upn=3Din0eyhDXTORf2skTKFWtL07Er7bCywQDwkU-2Fw0dkIlcj8xJolKvt=
XGOnUZumg3bSCX79L1oLUChClYTKEkmvQtSu-2B8rzQpUitA-2FGjOBJSPfmLDegr7VxY5MIlZq=
yHxGFhufKRenlj3miOPsdsttn9mRkRdMnV-2FZtJA6rVqNRGtQ-3D_oDb6ny51mUB6FExYn3rQh=
g0zmbLiyjz6NraffIlGGOzr7kBgXDE3kqRCc7uSPOIoM-2F8ArqiJhc1EHps5GDWyxRFUe-2BE3=
B6ghivpCCal95XpV5-2Fr1ZjoOHl2BNIyNIBOmIVWaIUlMbJz8IA-2B699JFKYesCsHdBiWGFpw=
z1se11yAWBiqzWwgpmU0KMzXugQNtioypUQrPEMDsH7uW7Z19Dt-2F7dMlej39KcN7tTMMnokVO=
gXAHQewCCJkuL1TUd1fQ" rel=3Dnoreferrer target=3D_blank>Cancel</A></TD></TR>=
</TBODY></TABLE><BR>
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
width: 0px; text-decoration-style: initial; text-decoration-color: initial">
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
width: 0px; text-decoration-style: initial; text-decoration-color: initial">
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
-decoration-color: initial"></SPAN></SPAN></SPAN>&nbsp;</P></B></FONT>
<img src=3D"https://u14157067.ct.sendgrid.net/wf/open?upn=3DoDb6ny51mUB6FEx=
Yn3rQhg0zmbLiyjz6NraffIlGGOzr7kBgXDE3kqRCc7uSPOIoM-2F8ArqiJhc1EHps5GDWyxRFU=
e-2BE3B6ghivpCCal95Xp2QMLBZWCW39AwBfUvv-2BZFiDs-2FSdpCMX58L1o8-2BPw-2B2TpSk=
fqBpTeaz7wDRKgC37g6qA9VefeufC8sMssBfRbAvhtNkd-2BNuEJ81cqEpG-2Bi0qpJS0a0zMKp=
pLzI7GkZSGZbTv-2FhTY-2FMCpzDJ0bxyZExWZ0WaEZioZXtrkyrD3Pkdw-3D-3D" alt=3D"" =
width=3D"1" height=3D"1" border=3D"0" style=3D"height:1px !important;width:=
1px !important;border-width:0 !important;margin-top:0 !important;margin-bot=
tom:0 !important;margin-right:0 !important;margin-left:0 !important;padding=
-top:0 !important;padding-bottom:0 !important;padding-right:0 !important;pa=
dding-left:0 !important;"/>
</BODY></HTML>

--===============0441362519==--

--===============3622540693785700628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3622540693785700628==--
