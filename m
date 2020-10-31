Return-Path: <SRS0=CDUK=EG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE6EAC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 20:53:17 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32758206DC
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Oct 2020 20:53:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zjd1OUqs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32758206DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BFED187624;
	Sat, 31 Oct 2020 20:53:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id frEvJtzSErtk; Sat, 31 Oct 2020 20:53:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4509A87621;
	Sat, 31 Oct 2020 20:53:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29220C0859;
	Sat, 31 Oct 2020 20:53:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0C97C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 20:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8371085F50
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 20:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z9NQdbXHrxyE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 20:53:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 23EAB85F32
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 20:53:14 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id x23so4744329plr.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Oct 2020 13:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=tdsVpzPWzlpi/N8lTcJ/F/65jzaQjtuC1M3o0w/m6PI=;
 b=Zjd1OUqs9g2lk+2itvGuZy98b62dzsXDDVXVQOjOOuO7BhyMMKVQFdHCiiDHPFcMsC
 ETAE3ycmeKjwKAyOePp2LbJSBEx19ye32NQOVttD+cSF5NlaKAetqx9nNxsWHHEQ4x3m
 yZslfiGHIATCmOwGNshgxPVB1CqwSjoK1kCQlHI/tkYITiQA4n7A2DUc+zkgVdJidWmA
 YLEvW/KjWx5iVWIIm18W6ehnxZ5d11QJ4FC6gld+tj90jw9C7Sz3Vy0F//cR2wwwwkTx
 eoPJvr8VuKvSnTDdIFPszcjWJUBDW+pAuq4eCXs22ciILp6TWtCi2CMni7KOO/B9SJhe
 mAXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=tdsVpzPWzlpi/N8lTcJ/F/65jzaQjtuC1M3o0w/m6PI=;
 b=J5xeqg2rbBQY6lz4+VeKzLD1yGgoG0wkq6DW83HPGAJh7eFr0iyYqCLPsy1CMUPTRO
 UBEVVBZ+nqiDZqGQRSf5okWjt1JeyjHRKh2TdTF+XXFQDrLbut5U0rl3jon3XW947Ioa
 TpdXLtAta0+QtIBBOINp01m0BB8/2I7Tw1Qvsxc4UxhT0W7ZxnYJvtyYDxgD5i/KJiA9
 DgUQ+5Nl0yA1JaPfi+UEASPDTmhIJeMXpk8MX4su7BQMM/VehistaIPU7qQ/N/dQiJ1Y
 xDYMlGBSF/qhUcSHP1KpIQnt1jrJNnqwH/6n9xULOoakmZM95rTw8zu5a1vlbSkd3ly0
 mDoA==
X-Gm-Message-State: AOAM532Ajfrjsk0g1bWaCHYInuWMWUslk/FbiByDrLImRIZvyD4IlUCP
 SYbhWCPpUxmbeQdZR9udBM3cJEDQYSlvDpPN77DSmlZ3zUyDmg==
X-Google-Smtp-Source: ABdhPJxNTpzvMrP8I3bSNEsIiwTR7JIMQdaw78srbkgTVNPq0eWS+31XqX/O2cxsUEHoQnO3Ss3XCJfQQo1aqh7J4+4=
X-Received: by 2002:a17:902:a70e:b029:d6:a25c:50db with SMTP id
 w14-20020a170902a70eb02900d6a25c50dbmr8041500plq.34.1604177593451; Sat, 31
 Oct 2020 13:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAJ3Q+7bum=ESExRa7mcjLWq9wXGfHOrVMOFqTuwVW60DUH=87A@mail.gmail.com>
In-Reply-To: <CAJ3Q+7bum=ESExRa7mcjLWq9wXGfHOrVMOFqTuwVW60DUH=87A@mail.gmail.com>
From: Drupad Joshi <drupadjoshi64@gmail.com>
Date: Sun, 1 Nov 2020 02:23:02 +0530
Message-ID: <CAJ3Q+7a_Ddw_iUcA4ijJxuD+Vt_E2M9X+pw7=nnBeZvfhh9v9g@mail.gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] Fwd: Linux kernel upstream patch
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
Content-Type: multipart/mixed; boundary="===============6440718190910871364=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============6440718190910871364==
Content-Type: multipart/alternative; boundary="0000000000009d4ae105b2fdb3f9"

--0000000000009d4ae105b2fdb3f9
Content-Type: text/plain; charset="UTF-8"

---------- Forwarded message ---------
From: Drupad Joshi <drupadjoshi64@gmail.com>
Date: Sun, 1 Nov 2020 at 02:04
Subject: Linux kernel upstream patch
To: <training@linuxfoundation.org>, <info@linuxfoundation.org>


Hi ,

I want to upstream or contribute to open source. Any training or help
provided from you?

Regards,
Drupad

--0000000000009d4ae105b2fdb3f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">---------- Forwarded message ---------<br>From: <strong cla=
ss=3D"gmail_sendername" dir=3D"auto">Drupad Joshi</strong> <span dir=3D"aut=
o">&lt;<a href=3D"mailto:drupadjoshi64@gmail.com" target=3D"_blank">drupadj=
oshi64@gmail.com</a>&gt;</span><br>Date: Sun, 1 Nov 2020 at 02:04<br>Subjec=
t: Linux kernel upstream patch<br>To:  &lt;<a href=3D"mailto:training@linux=
foundation.org" target=3D"_blank">training@linuxfoundation.org</a>&gt;,  &l=
t;<a href=3D"mailto:info@linuxfoundation.org" target=3D"_blank">info@linuxf=
oundation.org</a>&gt;<br></div><br><br><div dir=3D"ltr">Hi ,<div><br></div>=
<div>I want to upstream or contribute to open source. Any training or help =
provided from you?</div><div><br></div><div>Regards,</div><div>Drupad</div>=
</div>
</div></div>

--0000000000009d4ae105b2fdb3f9--

--===============6440718190910871364==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============6440718190910871364==--
