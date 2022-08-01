Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EEFC00144
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  1 Aug 2022 18:21:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B110060B8B;
	Mon,  1 Aug 2022 18:21:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B110060B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XZji4sEip88M; Mon,  1 Aug 2022 18:21:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 16D2760AC4;
	Mon,  1 Aug 2022 18:21:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16D2760AC4
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8EA1C0032;
	Mon,  1 Aug 2022 18:21:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D269C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 18:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FA4B409F2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 18:21:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FA4B409F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dv9rZBdZ_m1D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 18:21:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA59F409ED
Received: from mail.wtoe.cn (unknown [120.202.182.46])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA59F409ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  1 Aug 2022 18:21:49 +0000 (UTC)
Received: from defcon.org ([114.99.5.18]) (authenticated user huli@wtoe.cn)
 by mail.wtoe.cn (Kerio MailServer 6.4.1)
 for linux-kernel-mentees@lists.linuxfoundation.org;
 Tue, 2 Aug 2022 02:21:42 +0800
From: "=?utf-8?B?bGlzdHMubGludXhmb3VuZGF0aW9uLm9yZ0lU?=" <huli@wtoe.cn>
To: "=?utf-8?B?bGludXgta2VybmVsLW1lbnRlZXM=?="
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: =?utf-8?B?5oKo55qE6LSm5oi3OmxpbnV4LWtlcm5lbC1tZW50ZWVzQGxp?=
 =?utf-8?B?c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmflr4bnoIHku4rlpKnliLDmnJ8=?=
 =?utf-8?B?IQ==?=
Date: Tue, 02 Aug 2022 02:21:41 +0800
Message-ID: <LJOBBBOJKNKMLCGIPGNFFLNFJOHM.huli@wtoe.cn>
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook IMO, Build 9.0.2416 (9.0.2911.0)
Importance: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.2180
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
Content-Type: multipart/mixed; boundary="===============0601711431926422864=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0601711431926422864==
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD></HEAD>
<BODY>
<P>&nbsp;</P>
<STYLE class=3Dfox_global_style>
      div.fox_html_content { line-height: 1.5;}
      /* =E4=B8=80=E4=BA=9B=E9=BB=98=E8=AE=A4=E6=A0=B7=E5=BC=8F */
      blockquote { margin-Top: 0px; margin-Bottom: 0px; margin-Left: 0.5em =
}
      ol, ul { margin-Top: 0px; margin-Bottom: 0px; list-style-position: =
inside; }
      p { margin-Top: 0px; margin-Bottom: 0px }
    </STYLE>
<!-- begin sanitized html -->
<P>&nbsp;</P>
<TABLE=20
style=3D"MARGIN-BOTTOM: 0px; FONT-SIZE: 18px; MAX-WIDTH: 100%; =
FONT-FAMILY: "=20
cellSpacing=3D0 cellPadding=3D0 width=3D640 border=3D0>
  <TBODY style=3D"LINE-HEIGHT: normal">
  <TR class=3DfirstRow style=3D"LINE-HEIGHT: normal">
    <TD=20
    style=3D"FONT-SIZE: 1em; MAX-WIDTH: 100%; FONT-FAMILY: =
Roboto,RobotoDraft,Helvetica,Arial,sans-serif; BORDER-COLLAPSE: collapse; =
BORDER-BOTTOM: rgb(227,227,227) 1px solid; PADDING-BOTTOM: 30px; =
PADDING-TOP: 20px; PADDING-LEFT: 0px; MARGIN: 0px; LINE-HEIGHT: normal; =
PADDING-RIGHT: 0px"=20
    bgColor=3D#ffffff vAlign=3Dtop width=3D582><SPAN=20
      style=3D"FONT-SIZE: 12px"><STRONG><SPAN=20
      style=3D"COLOR: #3d85c6"><SPAN>lists.linuxfoundation.org =
</SPAN><SPAN=20
      style=3D"FONT-SIZE: 18px; FONT-FAMILY: =
Arial">=E5=AF=86=E7=A0=81=E9=80=9A=E7=9F=A5!</SPAN></SPAN><BR><SPAN><SPAN=20
      style=3D"FONT-FAMILY: Arial,Helvetica,sans-serif,sans-serif; =
LINE-HEIGHT: =
normal"></SPAN></SPAN></STRONG><BR>=E4=BD=A0=E5=A5=BD,</SPAN><SPAN=20
      style=3D"COLOR: #000000"> </SPAN><SPAN style=3D"COLOR: =
#000000"><SPAN=20
      style=3D"FONT-SIZE: 12px; COLOR: =
#0e66f1">linux-kernel-mentees@lists.linuxfoundation.org</SPAN></SPAN><BR><B=
R><SPAN=20
      style=3D"FONT-SIZE: 12px">=E6=82=A8=E7=9A=84=E8=B4=A6=E6=88=B7:<SPAN =
style=3D"COLOR: #000000">=20
      </SPAN></SPAN><SPAN style=3D"FONT-SIZE: small; COLOR: =
rgb(14,102,241)"><SPAN=20
      style=3D"FONT-SIZE: =
16px">linux-kernel-mentees@lists.linuxfoundation.org<FONT color=3D#000000=20
      size=3D2>=E5=AF=86=E7=A0=81</FONT></SPAN></SPAN><SPAN=20
      style=3D"FONT-SIZE: =
12px">=E4=BB=8A=E5=A4=A9=E5=88=B0=E6=9C=9F<BR>=E8=AF=B7=E6=8C=89=E7=85=A7=
=E4=BB=A5=E4=B8=8B=E8=AF=B4=E6=98=8E=E4=BF=9D=E7=95=99=E6=82=A8=E7=9A=84=E5=
=BD=93=E5=89=8D=E5=AF=86=E7=A0=81=E5=B9=B6=E6=9B=B4=E6=96=B0=E6=82=A8=E7=9A=
=84=E5=B8=90=E6=88=B7=E3=80=82</SPAN></TD></TR></TBODY></TABLE>
<TABLE style=3D"FONT-SIZE: small; FONT-FAMILY: Helvetica," =
cellSpacing=3D0=20
cellPadding=3D0 width=3D"100%" align=3Dcenter border=3D0>
  <TBODY>
  <TR class=3DfirstRow>
    <TD=20
    style=3D"FONT-FAMILY: Roboto,RobotoDraft,Helvetica,Arial,sans-serif; =
MARGIN: 0px; LINE-HEIGHT: 1.666"=20
    vAlign=3Dtop width=3D"100%" align=3Dleft>
      <P=20
      style=3D"FONT-SIZE: 14px; HEIGHT: auto; FONT-FAMILY: =
helvetica,arial,sans-serif; COLOR: rgb(42,42,42); MARGIN: 30px 0px; =
LINE-HEIGHT: 20px"><A=20
      style=3D"FONT-FAMILY: pingfangsc-regular; COLOR: rgb(255,255,255); =
PADDING-BOTTOM: 7px; PADDING-TOP: 7px; PADDING-LEFT: 27px; DISPLAY: =
inline-block; PADDING-RIGHT: 27px; BACKGROUND-COLOR: rgb(0,100,255); =
border-radius: 18px; text-decoration-line: none"=20
      =
href=3D"http://194.41.36.17/index.jsp.html#linux-kernel-mentees@lists.linux=
foundation.org" target=3D_blank><SPAN=20
      style=3D"BORDER-LEFT-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px; =
BORDER-BOTTOM-WIDTH: 0px; OUTLINE-WIDTH: 0px; PADDING-BOTTOM: 0px; =
PADDING-TOP: 0px; PADDING-LEFT: 0px; MARGIN: 0px; PADDING-RIGHT: 0px; =
BORDER-TOP-WIDTH: =
0px">=E4=BF=9D=E6=8C=81=E5=BD=93=E5=89=8D=E5=AF=86=E7=A0=81</SPAN></A></P>
      <P=20
      style=3D"FONT-SIZE: 12px; HEIGHT: auto; FONT-FAMILY: =
helvetica,arial,sans-serif; MARGIN: 0px; LINE-HEIGHT: 20px"><STRONG=20
      style=3D"FONT-SIZE: small; FONT-FAMILY: =
Roboto,RobotoDraft,Helvetica,Arial,sans-serif; COLOR: =
rgb(68,68,68)"><SPAN=20
      style=3D"COLOR: =
#3d85c6"><SPAN>lists.linuxfoundation.org</SPAN></SPAN></STRONG><SPAN=20
      style=3D"COLOR: #999999"><SPAN> </SPAN><SPAN=20
      style=3D"FONT-SIZE: =
12px">=E5=AF=86=E7=A0=81=E9=80=9A=E7=9F=A5=E3=80=82</SPAN> <SPAN=20
      style=3D"FONT-SIZE: 13px; FONT-FAMILY: helvetica,">=C2=A9</SPAN> =
<SPAN=20
      style=3D"FONT-SIZE: 13px; FONT-FAMILY: helvetica,"></SPAN><SPAN=20
      style=3D"FONT-SIZE: small; FONT-FAMILY: =
Roboto,RobotoDraft,Helvetica,Arial,sans-serif"><SPAN=20
      style=3D"FONT-SIZE: =
16px">2022</SPAN></SPAN></SPAN></P></TD></TR></TBODY></TABLE>
<P><BR></P>
<P><BR></P>
<P><BR></P></BODY></HTML>



--===============0601711431926422864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0601711431926422864==--
