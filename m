Return-Path: <SRS0=TljZ=NE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08AD5C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 22:01:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99FE26103A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 22:01:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 99FE26103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BEDA60607;
	Fri, 13 Aug 2021 22:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MVnNBJa0Lmwn; Fri, 13 Aug 2021 22:01:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 67DF56060B;
	Fri, 13 Aug 2021 22:01:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2EDB1C0010;
	Fri, 13 Aug 2021 22:01:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5A3B5C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 22:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C95B80E25
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 22:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SVYPrd6NkfsB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 22:01:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 956E780E1E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 22:01:39 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id z20so22582075lfd.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 15:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=uh7Zq2EFNNpoJfNnfRbzxYK/mHJml1PWfvXvryk8JsA=;
 b=FZmgz/9vqYDl3X0hlKdhn7Npm2gRu6+34YKDneAMY5VlAqYbvvS1r9+Swn0QJk2ixR
 YjHncbWzmK34VmF2NVy/CXDuFqWQPObwsrVH75dCz0rKx2FWt3637NdfyaMnkR5kAcxE
 lfx0KBuhyL8s7Typ9v/hyC31ClsoJsTaC6OsAoI/vfAX0+sp7jgDQVxvNjkBOu7/LoLO
 8numUQ5V3vp1Or2nh0J6jK4sFOTskcO1Haa7GWAvMbnM3pnIFCWV3RRmz+hxMZLU/1II
 EDG9XlBQE75OlgwYXvFLOw+gizxzCuOyEH7nRYpqxh4PrGS17yfN/gAPHtz6KjxasZWs
 JTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=uh7Zq2EFNNpoJfNnfRbzxYK/mHJml1PWfvXvryk8JsA=;
 b=RmSeVwKGJ8GpSWThIl1pXTeBY6OoPUdU5UGdWtr/SOTpU3wYteVU/rvEOtxq0S72Rl
 d2Vma2+QffcvdXO6SZgHGqFa/mGw5jDRoH9lbJtJRwuDkfXRDN6nOCw/ZrHVl3zs8fM8
 8HhxEiQ/NrU8YJlyiG+Di16JityfZahh3G+ldKYfifG8rvf1ifyQh1yqM7nWYPlOsQ+X
 idzXhJw1lh/ZbojmGRziNR8eqryc9Vd6LfJHTWO+MtTCk22FDPM6211lXsOKARK+ELyO
 MiCCcL0jXcpak4rxuMmhKRnd5Dm0p7zj8zdwVHtPvxfOnQOEh3bjnwmOtOvPy9E49ETs
 37SQ==
X-Gm-Message-State: AOAM530LwPpQqyHR0tes+6QWKk2y3MqYQ2N5IqPN8nEVg4WUpImF2wch
 Sz3VghljlwmLPEtvl43ksvuBykdUp2+kWoyw1SY=
X-Google-Smtp-Source: ABdhPJywzhiMLVKJBvSt++b4dZ2tHunPx3J70j7o/6blUgbLE6fzGbiJL9gSjovxzdwwerO6GL8j7Ot01KD1V3HB8TY=
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr3193077lfd.529.1628892097288; 
 Fri, 13 Aug 2021 15:01:37 -0700 (PDT)
MIME-Version: 1.0
From: Esha Shah <shahesha01@gmail.com>
Date: Sat, 14 Aug 2021 03:31:20 +0530
Message-ID: <CAOUn45QxXYbnUGfYn9oU5y+SWkrY6hw62m+GYiXO8bDjEMc9ug@mail.gmail.com>
Subject: Interested In Mining Maintainers mentorship program
To: lukas.bulwahn@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============0167377637839751598=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0167377637839751598==
Content-Type: multipart/alternative; boundary="000000000000d61fc605c977fe00"

--000000000000d61fc605c977fe00
Content-Type: text/plain; charset="UTF-8"

I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection.

Regards,
Esha Shah

--000000000000d61fc605c977fe00
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Rob=
oto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-spac=
e:pre-line">I am interested in the Mining Maintainers mentorship program an=
d I would like to work on the tasks for the mentee selection.</span><br><di=
v><span style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helve=
tica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-line"><br=
></span></div><div><span style=3D"color:rgb(33,37,41);font-family:Poppins,R=
oboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-sp=
ace:pre-line">Regards,</span></div><div><span style=3D"color:rgb(33,37,41);=
font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font=
-size:12.8px;white-space:pre-line">Esha Shah</span></div></div>

--000000000000d61fc605c977fe00--

--===============0167377637839751598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0167377637839751598==--
