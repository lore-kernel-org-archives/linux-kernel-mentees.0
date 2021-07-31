Return-Path: <SRS0=pOiW=MX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E316C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Jul 2021 08:14:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C93FF60F94
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Jul 2021 08:14:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C93FF60F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97F8183BF3;
	Sat, 31 Jul 2021 08:14:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FaiSSJzfGWnQ; Sat, 31 Jul 2021 08:14:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BD21583BF1;
	Sat, 31 Jul 2021 08:14:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98090C0010;
	Sat, 31 Jul 2021 08:14:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A798C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 08:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2196783BF3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 08:14:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FgptgyAnSsKl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 08:14:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F93B83BF1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 08:14:53 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id g76so19996846ybf.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 01:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=p5pDbshYYZRYOMXA1L0F4q9DZERCxouxmu6kCm8/E10=;
 b=V2p0J45sUOAP3FhXMXGz3u/w4mcM0qUmhUoGvZfnGzsm1NxxrDmDWPnoVVAFz2Rzzy
 vlVt4ZY46/ceB9iVi72NrFXP0FBiRF7li97oTs3zOeESOVL9rOpTmq5wjagUHxNXUtR3
 ljr1M0o/bLh+o9wpLiqRBjST3ux8n+SKv8imHWyW2dlTXamqzb2KL5VBdkBUDGqqJeUk
 EpqEPqtpcAiwrvJcozsor0o0k4XNiZg/Xgc7Pch74EFsbIs+bYdfb9DPy1z3TwDPvFey
 cB1n/3iwCP67iuXUsE1Ok4yf4otjV1M6uN70hBK2ofWEXLtBNq3bTV/iu1rVaD5BmMxO
 6JmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=p5pDbshYYZRYOMXA1L0F4q9DZERCxouxmu6kCm8/E10=;
 b=ExCdU/ET/FN99PLQGEew5eZ4fJX2Wuoigurh8FGhWFfXCZlR2zlWgP34mS06CMcXh7
 Ucw/9viv3lyL/OU3Oy9OboAr3hkBA8U6UoN1bP2Li5qBXoc08Nf/tnQxTuhUdeczoJAv
 QXW4wt2ldsttoaIJ6afjykIWuz1HsPDJrXuUscLIl8FiE5onAUDEYOZbdftpDNV3W973
 wZnYPVw+5LXTCHRzDJ559JR4UEccco0jxZds77I9XAvOTs4IsURocQbtlt+GJjE0zSav
 jcMWmP3EJVJKEuKF/pGwOQaDn7XX+48LYkZV+3hEaIMxsdmV/nJjBorKmLbyp9sS72CC
 JSSw==
X-Gm-Message-State: AOAM532hzpBFQGClzExpyFZRzwZeYnfIIkZd4wmOnYYxWGMmmmw6AEaz
 iXkOvXKKhHlCF4kSXHq2vdFWFkIeVUCIqjB4iWc=
X-Google-Smtp-Source: ABdhPJwmJF4NKzOknrDB5MEw/peNrzw71kjYu4ERmaTbWZtZBj1Ef95ljJZhycxX4qHAuYmHH574piiwQNq1H1ON7tw=
X-Received: by 2002:a05:6902:134c:: with SMTP id
 g12mr7884636ybu.251.1627719292301; 
 Sat, 31 Jul 2021 01:14:52 -0700 (PDT)
MIME-Version: 1.0
From: Rahul Balaji <rahulbalaji78@gmail.com>
Date: Sat, 31 Jul 2021 12:14:41 +0400
Message-ID: <CADywMdqcPV5TaB64TbujGdRFL0WiGUqJLi-pOSpf81_ZLMg+iA@mail.gmail.com>
Subject: Request for tasks regarding Checkpatch Documentation mentorship
 program (LFX)
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
Content-Type: multipart/mixed; boundary="===============5331392856645419745=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============5331392856645419745==
Content-Type: multipart/alternative; boundary="00000000000036355505c866eef5"

--00000000000036355505c866eef5
Content-Type: text/plain; charset="UTF-8"

Respected sir,

I am interested in working on the checkpath documentation project under
your mentorship and would like to work on tasks for the selection process.

Sincerely,
Rahul Balaji

--00000000000036355505c866eef5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Respected sir,<div><br></div><div>I am interested in worki=
ng on the checkpath documentation project under your mentorship and would l=
ike to work=C2=A0on tasks for the selection process.</div><div><br></div><d=
iv>Sincerely,</div><div>Rahul Balaji</div></div>

--00000000000036355505c866eef5--

--===============5331392856645419745==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============5331392856645419745==--
