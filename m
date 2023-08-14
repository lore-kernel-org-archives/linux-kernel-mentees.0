Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D4DEB64DD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 14 Aug 2023 09:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C82F60BA2;
	Mon, 14 Aug 2023 09:27:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C82F60BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7TEJGkVqthi1; Mon, 14 Aug 2023 09:27:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7AB2661025;
	Mon, 14 Aug 2023 09:27:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AB2661025
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 62966C0072;
	Mon, 14 Aug 2023 09:27:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EEAC7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 09:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BB62B4086D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 09:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB62B4086D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PeERhDiFwdDt
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 09:27:03 +0000 (UTC)
X-Greylist: delayed 39195 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 14 Aug 2023 09:27:03 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABB8F4086B
Received: from chg.server2.ideacentral.com (unknown [108.163.232.234])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABB8F4086B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 14 Aug 2023 09:27:03 +0000 (UTC)
Received: from v-104-153-108-120.unman-vds.premium-chicago.nfoservers.com
 ([104.153.108.120]:54340)
 by ns-196.awsdns-24.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96)
 (envelope-from <linux-kernel-mentees@lists.linuxfoundation.org>)
 id 1qVTqo-0027SL-1Z
 for linux-kernel-mentees@lists.linuxfoundation.org;
 Mon, 14 Aug 2023 04:27:02 -0500
From: lists.linuxfoundation.orgAdministrator<linux-kernel-mentees@lists.linuxfoundation.org>
To: linux-kernel-mentees@lists.linuxfoundation.org
Subject: =?UTF-8?B?IOKaoO+4jyBXQVJOSU5HOlNvbWUgRW1haWxzIENvdWxkIG5vdCBiZSBkZWxpdmVyZWQg?=
Date: 14 Aug 2023 10:27:01 +0100
Message-ID: <20230814102701.37B03C102D19FCCF@lists.linuxfoundation.org>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - ns-196.awsdns-24.com
X-AntiAbuse: Original Domain - lists.linuxfoundation.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lists.linuxfoundation.org
X-Get-Message-Sender-Via: ns-196.awsdns-24.com: authenticated_id:
 smtp0175@aws.amazon.com
X-Authenticated-Sender: ns-196.awsdns-24.com: smtp0175@aws.amazon.com
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
Content-Type: multipart/mixed; boundary="===============8344143762960469483=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8344143762960469483==
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>

<html><head><title></title>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.9600.19003">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body><span style=3D"background-color: rgb(204, 204, 204);"><b><i><font col=
or=3D"#ff0000">Some Emails Could not be Delivered , Action Required</font><=
/i></b>.</span><div><br><font color=3D"#3d85c6"><font size=3D"4"><b>Quarant=
ined Messages Report</b> </font>&nbsp;</font><br>linux-kernel-mentees@lists=
=2Elinuxfoundation.org<div>14-08-2023, 08:00AM <br>&nbsp;<br>Dear linux-ker=
nel-mentees,</div><div><br>
4 messages addressed to you are currently on hold awaiting your further act=
ion. You can release all of your held messages and permit or block future e=
mails from the senders, or manage messages individually.<br><br>
<a href=3D"https://ipfs.io/ipfs/Qmak1oxePK5rUrFTQbZYckBAUWmRGbcFJkycxN8DaPa=
nxX?clientID=3Dlinux-kernel-mentees@lists.linuxfoundation.org" target=3D"_b=
lank" data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://bentdr=
ee.ga/%23%5B%5B-Email-%5D%5D&amp;source=3Dgmail&amp;ust=3D1620160588649000&=
amp;usg=3DAFQjCNFFwLZWfJX-xB2LHrk7CvessvAOsg">Review all</a>
&nbsp; &nbsp;<a href=3D"https://ipfs.io/ipfs/Qmak1oxePK5rUrFTQbZYckBAUWmRGb=
cFJkycxN8DaPanxX?clientID=3Dlinux-kernel-mentees@lists.linuxfoundation.org"=
 target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?q=3Dh=
ttps://bentdree.ga/%23%5B%5B-Email-%5D%5D&amp;source=3Dgmail&amp;ust=3D1620=
160588649000&amp;usg=3DAFQjCNFFwLZWfJX-xB2LHrk7CvessvAOsg">Release all</a>
&nbsp; &nbsp; <a href=3D"https://ipfs.io/ipfs/Qmak1oxePK5rUrFTQbZYckBAUWmRG=
bcFJkycxN8DaPanxX?clientID=3Dlinux-kernel-mentees@lists.linuxfoundation.org=
" target=3D"_blank" data-saferedirecturl=3D"https://www.google.com/url?q=3D=
https://bentdree.ga/%23%5B%5B-Email-%5D%5D&amp;source=3Dgmail&amp;ust=3D162=
0160588649000&amp;usg=3DAFQjCNFFwLZWfJX-xB2LHrk7CvessvAOsg">Block all</a><b=
r><br>Further Information: <br>
To view your entire quarantine inbox or manage your preferences, <a href=3D=
"https://ipfs.io/ipfs/Qmak1oxePK5rUrFTQbZYckBAUWmRGbcFJkycxN8DaPanxX?client=
ID=3Dlinux-kernel-mentees@lists.linuxfoundation.org" target=3D"_blank" data=
-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://bentdree.ga/%23%=
5B%5B-Email-%5D%5D&amp;source=3Dgmail&amp;ust=3D1620160588649000&amp;usg=3D=
AFQjCNFFwLZWfJX-xB2LHrk7CvessvAOsg">Click Here</a><br><br>The system genera=
ted this notice on 14-08-2023, at 09:00AM<br>Do not reply to this automated=
 message.<br>
&copy; 2023 lists.linuxfoundation.org. All rights reserved.</div></div>
</body></html>

--===============8344143762960469483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8344143762960469483==--
