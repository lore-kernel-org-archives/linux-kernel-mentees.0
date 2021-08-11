Return-Path: <SRS0=y1cr=NC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44FE2C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Aug 2021 10:12:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6AFF604AC
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 11 Aug 2021 10:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6AFF604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADB95833A3;
	Wed, 11 Aug 2021 10:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uz1X4hc-iYKI; Wed, 11 Aug 2021 10:12:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id ABCE883216;
	Wed, 11 Aug 2021 10:12:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 81DFAC001A;
	Wed, 11 Aug 2021 10:12:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59305C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 10:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3601A83437
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 10:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KwdkiTuQXfSI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 10:12:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 839F783216
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 10:12:16 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id z20so4608110lfd.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 03:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=BE712d7UNZkq+DzDkP7T9k0a0NFD/cEaXnzdqZfX3lA=;
 b=qtFx7i6HUkbKyKnGCjLsXyEMcUM82MW2Y3cxy9LS57AQ8ofdYa50i7Uyd9BbHrm59Q
 oGUmgr1idB61N//MVgWjkzTOGX8XyHYo3fOIDCxA2PmKCxBrdy0lN6ebvKZxF0eyE2A6
 pBhBgB8OvF99DN2hYh/kdo20g0FR+veFHYwCgAVmt//Z67aHnjFE4f8uIYtwDR89txXR
 P0SPBDvx9/kEmjCb3oenVA9TmArQolUHZvsh1PhsH1q4c3l1OOJRPnJBdq2BoW+rNAJ8
 7QFrBa1cFNYRjjTM5VvMjEyoB+Zwhl8W0ngACJF52dCaVDvxuaqnpr0Gz15qqopzvOm1
 luqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=BE712d7UNZkq+DzDkP7T9k0a0NFD/cEaXnzdqZfX3lA=;
 b=B8FVbMVGck9JByyno6DpawWskoyQGCp4zh3DZusdg70JjY+88aO01KeaCK30mWajoQ
 hRSGSc4B0foKh0R6a056LVhjm6DL2NR7ohKIDJowONlUAAlGlJ/eRJ2d6weE+eAlxiOW
 5eyq2zlBKPTlNZnWQh0G+r6NhHpJYPGXt7gtFfcVnVJUBlXO2Jh2qbZHqgPD6/QUrVGJ
 42b31J8iG2KjWEw9aRf9B//o4Sj4o6cVcIWykjykbw1jAGs+qqEQhJQziifrrrJRg8W3
 Yvi82TwAK1iEoNGfyCYOft3WxebIawgb972LYxwi4iHdRH/fQpaPogLqnzXZTAEWOV5c
 dZnA==
X-Gm-Message-State: AOAM532kwOIRR4fFTglYGhqHB/6d0kgd0UXMRdRnK8YJiFpSZ6z6nkQ8
 EC2RmDVmYVmI7nK3LMBV09/TP6cqNb2jAKPB0gI=
X-Google-Smtp-Source: ABdhPJyjApR6aJE3Yam0Wl/FYrjkMg7Gt66pN1UcIKfanMDWOzZ9j5tuO+J9QyxRtXen5q8OzpYA9xAnYykfo9afRiY=
X-Received: by 2002:a05:6512:6cf:: with SMTP id
 u15mr13865761lff.402.1628676734169; 
 Wed, 11 Aug 2021 03:12:14 -0700 (PDT)
MIME-Version: 1.0
From: Avinesh Tripathi <avineshtripathi1@gmail.com>
Date: Wed, 11 Aug 2021 15:42:01 +0530
Message-ID: <CAPaG8Ty7EJRPV_ujcrLGE9WCKg4r9KZdj-sv_9Fpnzc88V_wvg@mail.gmail.com>
Subject: 
To: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, 
 linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============5950478012100356401=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============5950478012100356401==
Content-Type: multipart/alternative; boundary="00000000000031b65305c945da65"

--00000000000031b65305c945da65
Content-Type: text/plain; charset="UTF-8"

I am interested in the Checkpatch Documentation mentorship program and I
would like to work on the tasks for the mentee selection. Work and finish
the tasks for the mentee selection.

--00000000000031b65305c945da65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,37,41);font-family:Poppins,Rob=
oto,&quot;Helvetica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-spac=
e:pre-line">I am interested in the Checkpatch Documentation mentorship prog=
ram and I would like to work on the tasks for the mentee selection.

Work and finish the tasks for the mentee selection.</span><br></div>

--00000000000031b65305c945da65--

--===============5950478012100356401==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5950478012100356401==--
