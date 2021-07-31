Return-Path: <SRS0=pOiW=MX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94613C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Jul 2021 10:17:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20B3A60F46
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Jul 2021 10:17:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 20B3A60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D586D4026D;
	Sat, 31 Jul 2021 10:17:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oyDY-m8n-6KD; Sat, 31 Jul 2021 10:17:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 979FC40295;
	Sat, 31 Jul 2021 10:17:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 706D0C0010;
	Sat, 31 Jul 2021 10:17:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08E55C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 10:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F367C83B34
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 10:17:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HT9449IiDGHE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 10:17:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 612FA83B2C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 10:17:13 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 68-20020a9d0f4a0000b02904b1f1d7c5f4so12315911ott.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 03:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=f8L/dbO9vucV3TJqsyGnTsh0kcrcjCM8h0ETj4WZRLc=;
 b=sLyCR4I8kxGXvTkxkSiy6yHkkmBJsvFQXRw6YEZyPQUZKQn50StTHzVLLjcHXsXkhM
 6HoV2zwWKnSfTPdK14M2y+/JB2oo1nnFV1kZ/uVYpOLb6Gmr3rhiMcdsscmyNDPM4s1P
 Am9UL7nUVkq+kzvWlwSNqRQquyGCKhvUQTbs+cMjAAoJQAOiERzXC4nIjIKpe5Bu2/fl
 1rwFZ+RC32lpvpHx/zj7yX1PZiODqYjkeCVL5bNHuCAHhQmswG7B1y1kUPCUPuHTLVj/
 L+uYofpsnGgq2wEa4/Hmxi4oX+AOPM+gKbM5vXIE4o21oQcnpu+aJ/nYHMUXCIUicKWL
 iFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=f8L/dbO9vucV3TJqsyGnTsh0kcrcjCM8h0ETj4WZRLc=;
 b=dMlAcxgbcXZpOCnLxxZPwe1YcadbIZJbjQpDlxX25FvN1FEg3r63Y1ToKASpVbMcX4
 yuUG0p9CU+jCNw8IXpWG/leVLi+GVuyjUGlx/WugLXKcajRe2409w0vhHi4Uh7IzMD47
 AtLnB646ICKC7t/67dJ6rkYeZy8BvTUGeGn4FDNVr1ZVTwIJiBnKUPtEfQuzTVdly4GB
 t7gK8cy6auoo5jQDxAej6zRlXmi/BDuIJJXbzNqveKpnv+LvS4OGQ1b/UQ0quPpPQy+H
 R1+vEuon4xZxZPqLNDsfcU5o17ujfRk4qVvK0zvh+5Ol5te3/RlsLPoNPUXF6VSLnEjA
 9gxQ==
X-Gm-Message-State: AOAM5324lnidSpt3AFdlmqzWXDOsIxTVJ+ZvE/Ljwe2tylH9+EfaRv/D
 HBiBJvXd+VqqmZ9+fw3t26BMHCBdrofRb0tse0g=
X-Google-Smtp-Source: ABdhPJwNcbD/Frur4nFGeR0x7fLerlihT/0vWAt/1YcSgM7zJevnfFTc4TVwkPcIIKBZL8v7/dzWYdoloJvpZlJa2yc=
X-Received: by 2002:a05:6830:544:: with SMTP id
 l4mr5256907otb.164.1627726632405; 
 Sat, 31 Jul 2021 03:17:12 -0700 (PDT)
MIME-Version: 1.0
From: varun khatri <varunkhatri122@gmail.com>
Date: Sat, 31 Jul 2021 15:47:01 +0530
Message-ID: <CAJPTKA8N5B2B2403JsF+0MpG4Q=GnAwVn77CHD3iS9dFDyn+Qw@mail.gmail.com>
Subject: Request for tasks regarding Linux Kernel: Mining for Maintainers
 mentorship program (LFX)
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
Content-Type: multipart/mixed; boundary="===============6322369936505750765=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6322369936505750765==
Content-Type: multipart/alternative; boundary="000000000000b74d3005c868a32f"

--000000000000b74d3005c868a32f
Content-Type: text/plain; charset="UTF-8"

Respected Mentor,

I am interested in the Mining Maintainers mentorship program and I would
like to work on the tasks for the mentee selection.

Sincerely,
Varun Khatri

--000000000000b74d3005c868a32f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"color:rgb(33,37,41);font-family:Poppin=
s,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white=
-space:pre-line">Respected Mentor,</span></div><span style=3D"color:rgb(33,=
37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-ser=
if;font-size:12.8px;white-space:pre-line"><div><span style=3D"color:rgb(33,=
37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-ser=
if;font-size:12.8px;white-space:pre-line"><br></span></div>I am interested =
in the Mining Maintainers mentorship program and I would like to work on th=
e tasks for the mentee selection.</span><br><div><span style=3D"color:rgb(3=
3,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-s=
erif;font-size:12.8px;white-space:pre-line"><br></span></div><div><font col=
or=3D"#212529" face=3D"Poppins, Roboto, Helvetica Neue, Arial, sans-serif">=
<span style=3D"font-size:12.8px;white-space:pre-line">Sincerely,</span></fo=
nt></div><div><font color=3D"#212529" face=3D"Poppins, Roboto, Helvetica Ne=
ue, Arial, sans-serif"><span style=3D"font-size:12.8px;white-space:pre-line=
">Varun Khatri</span></font></div></div>

--000000000000b74d3005c868a32f--

--===============6322369936505750765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6322369936505750765==--
