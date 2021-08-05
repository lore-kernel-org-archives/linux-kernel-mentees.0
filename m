Return-Path: <SRS0=ZEDA=M4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_RED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C509C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 22:56:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AA94610A2
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Aug 2021 22:56:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9AA94610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55435606E6;
	Thu,  5 Aug 2021 22:56:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bqfh4oWE2Qh0; Thu,  5 Aug 2021 22:56:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8AFE36065D;
	Thu,  5 Aug 2021 22:56:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68DFBC0010;
	Thu,  5 Aug 2021 22:56:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C191AC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 22:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7FA883AD0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 22:56:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I3D0crCnHJAF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 22:56:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8C5F83A99
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Aug 2021 22:56:01 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id qk33so12111349ejc.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 05 Aug 2021 15:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=SuG+PEur5d8DQ9Qn/uDVvLiL3N+AHdUeJnjbhLCvmeo=;
 b=JNVdsu/B+fQDdCrdUCnPUeYFwB/JHvt1IBafbDAyUjtRUiz60zpR9w6n8WNDqCO/3p
 sAhucwCZ0qgvNcx4T8Sd0Z3+dvs2awQDnhiqZGJyamu//TS9c2C25UKJsgQiW2mcscze
 fn8a0GiIduglIfPfCKT4tam6A7mOc2B7oJJP5FHd8+gHXgLFjdmJiwiur0n0V9kVcxua
 /Wu37CK8zmRAJbg24gavydqSXyARufYVrVSsnKSoGdclyAvQza44qwz3giAKAM7D5b8A
 j3teqTEqSTq52pQqb6W1RutmL6XsvdBIc4s4FyplmC2IUjRP3XI8cp7cDcUaBPd8+iBF
 ciNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=SuG+PEur5d8DQ9Qn/uDVvLiL3N+AHdUeJnjbhLCvmeo=;
 b=XoCBYYAPiZ0Id/xrH6sSOaN4numHWVaSBW2ZXbwAQJSdb4U9ofmdCZ9XxwXbai1Pv3
 BU7OWnyafgonZvZKZCKJYtJ+YQMuYtObAHHa7VSnalAXEsaDlshu8u2ulCw1NFQF+l0L
 yfvWc9d/SBMyiauif3GOy8J5SSaNHEiOBfPwEQK2M3B2Y6w66LVAUU8CNNLbfeadACVM
 Xtb/EqZDSOAU265dlI0F4etPtrPnWhhu8nXGO+sp1r6gZCbu7aIbr5i2eLUMM7ridiDI
 2ObphuVtH51X4z/Qni5QMFxthG28/+x641bWth/kd9/fGUub9x5AVhWDO1VYc/YtP2OH
 7nog==
X-Gm-Message-State: AOAM533NZSpWwEdT7Py1JvHsUDsPiVcQw6Z55mk6LHLbjy59JIkSYP2Q
 ptD77Uo9aGAGbLgHVpa83OwnooL63l4EwCvUGno=
X-Google-Smtp-Source: ABdhPJwCOrrsvEKP1/Qw4942Z6KGMeEWpUrTwYZuwz8LhVKnOTShsXXIxjqFWKZdL7VwVpJO0LncZ6Eqv+IJ+lBzPiA=
X-Received: by 2002:a17:906:b094:: with SMTP id
 x20mr6927770ejy.257.1628204160056; 
 Thu, 05 Aug 2021 15:56:00 -0700 (PDT)
MIME-Version: 1.0
From: Bidemi M <abidemimarufat@gmail.com>
Date: Thu, 5 Aug 2021 23:55:47 +0100
Message-ID: <CAOgmd5fA5Hg9+nmCrM_TQAbsFdg0XhUqHGmMu1iBzisB_5N-eg@mail.gmail.com>
Subject: LF Mentorship Program
To: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============6301729364589702449=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6301729364589702449==
Content-Type: multipart/alternative; boundary="0000000000009501cc05c8d7d2d1"

--0000000000009501cc05c8d7d2d1
Content-Type: text/plain; charset="UTF-8"

Hello Dwaipayan and Lukas,

My name is Bidemi and I am interested in the Checkpatch Documentation
mentorship program. I would like to work on the tasks for the mentee
selection.

Please consider my application.

Regards,
 Bidemi Muibudeen

--0000000000009501cc05c8d7d2d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello=C2=A0<span style=3D"color:rgb(33,37,41);font-family:=
Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px=
;white-space:pre-line">Dwaipayan and Lukas,</span><div><span style=3D"color=
:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,=
sans-serif;font-size:12.8px;white-space:pre-line"><br></span></div><div><sp=
an style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica =
Neue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-line">My name =
is Bidemi and I am interested in the Checkpatch Documentation mentorship pr=
ogram. I would like to work on the tasks for the mentee selection.</span></=
div><div><span style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quo=
t;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-li=
ne"><br></span></div><div><span style=3D"color:rgb(33,37,41);font-family:Po=
ppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;w=
hite-space:pre-line">Please consider my application.</span></div><div><span=
 style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Ne=
ue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-line"><br></span=
></div><div><span style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&=
quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre=
-line">Regards,</span></div><div><span style=3D"color:rgb(33,37,41);font-fa=
mily:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:1=
2.8px;white-space:pre-line">=C2=A0Bidemi Muibudeen</span><br class=3D"gmail=
-Apple-interchange-newline"></div></div>

--0000000000009501cc05c8d7d2d1--

--===============6301729364589702449==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6301729364589702449==--
