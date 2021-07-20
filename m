Return-Path: <SRS0=NgQV=MM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCA6C07E95
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Jul 2021 08:39:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 533BF611F2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 20 Jul 2021 08:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 533BF611F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13BB78355C;
	Tue, 20 Jul 2021 08:39:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8_VY2C5NYepa; Tue, 20 Jul 2021 08:39:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 511518376B;
	Tue, 20 Jul 2021 08:39:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2573BC001A;
	Tue, 20 Jul 2021 08:39:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6B3B5C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 08:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C2558355C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 08:39:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n8T-cIM0E4wT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 08:39:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7F5F83508
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 08:39:51 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id a13so25056775wrf.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 20 Jul 2021 01:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=1hw8mx63JbSxxlQsg2eiO/pFy+9kSDvJBQsVnkUiOL0=;
 b=mozBcwrzj5T1SpaQel2aBZZiEXo8lLIrtPf3i/4LXtq9R2EHuX66uv3nFGxjNzZfun
 5b9UyEJtkXGPhsCDPPahvbgotvhR4V0hC9krEGmLcK8c8TO8e3xlBWo/EnQxMdWIHR8o
 zYE0WNPDAG0cQZjXRAPFxmCO5B/9jUbHPw1A7FX/saU1iMy1C1dn1ZmqE5hicyQSuPeW
 28ZRnuvh9k/wG2vkoR59vOmcOik2JmyrB/tOhSFdJJIdqJEpgy2DQeJgl370w/+SoLSA
 MAncVl839Wedm491j3AQUwjweZeon397Q8BVFgwv/a0ElMQ1krKN7g9GWwWGdqkHyJvD
 Fv0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1hw8mx63JbSxxlQsg2eiO/pFy+9kSDvJBQsVnkUiOL0=;
 b=mhyGjSvi4KqbXpORxwAnSNO4eey+Ut3f4i42Owm4O+a9Vha8HsqLxC1Ysbm9a9D0id
 pJ6m9mHBsCVqhnvD9mAfw4w/VABiPXMWIhF1amDn61ike5PFgD1AbqgBzFtxXeaspwc6
 va92J6oWZMN8RDB8iqTUBMZ3ICyKywMpNt7yt9tnh81TWI5L75zNE8dtmVCGkvPaFmho
 yTBQv6ZClnMB6WinjgosiXCeJk3mcF0QrlzGMv/cU5E1qXukWUu8SwSGxwqvCN6LXhZ4
 0qBuxc77oCuDf5+8PNz9uoPxUjmpoJQB0Xd4jxvah/bYTW6xLeg1qCV1WtyKrCAItlPv
 e5EA==
X-Gm-Message-State: AOAM530mBuH4DhCKnx5STWP1fJVC+1WLhoW/QPddk0djkDtnNJEWm4pp
 IiBR2LggZDoTdxxq+toq41b925UiIuS8CCIR68g=
X-Google-Smtp-Source: ABdhPJyooSzmnZrwa46fyYurzqujECJbSvR7shzlRyH8NtvEL9x+lKINQDHAw0thO5qRYa4QlIl8iU6kTujoJ87s7Us=
X-Received: by 2002:a5d:634c:: with SMTP id b12mr33883040wrw.238.1626770390112; 
 Tue, 20 Jul 2021 01:39:50 -0700 (PDT)
MIME-Version: 1.0
From: sri vathsa <srivathsa729.8@gmail.com>
Date: Tue, 20 Jul 2021 14:09:39 +0530
Message-ID: <CANx6jmer0JPnz3ER=A90z_t2G83_G1yhiVTd-1rfKnOy1ZTWgw@mail.gmail.com>
Subject: Request for mentee selection tasks ( Mining Maintainers)
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
Content-Type: multipart/mixed; boundary="===============3979673479597734698=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3979673479597734698==
Content-Type: multipart/alternative; boundary="0000000000003bdadf05c789ff37"

--0000000000003bdadf05c789ff37
Content-Type: text/plain; charset="UTF-8"

Hi,
I'm Srivathsa Dara, I am interested in the Mining Maintainers mentorship
program and I would like to work on the tasks for the mentee selection.

Thanks,
Srivathsa Dara

--0000000000003bdadf05c789ff37
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>I&#39;m Srivathsa Dara,=C2=A0<span style=3D"color:=
rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,s=
ans-serif;font-size:12.8px;white-space:pre-line">I am interested in the Min=
ing Maintainers mentorship program and I would like to work on the tasks fo=
r the mentee selection.</span></div><div><span style=3D"color:rgb(33,37,41)=
;font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Arial,sans-serif;fon=
t-size:12.8px;white-space:pre-line"><br></span></div><div><span style=3D"co=
lor:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helvetica Neue&quot;,Ari=
al,sans-serif;font-size:12.8px;white-space:pre-line">Thanks,</span></div><d=
iv><span style=3D"color:rgb(33,37,41);font-family:Poppins,Roboto,&quot;Helv=
etica Neue&quot;,Arial,sans-serif;font-size:12.8px;white-space:pre-line">Sr=
ivathsa Dara</span></div></div>

--0000000000003bdadf05c789ff37--

--===============3979673479597734698==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3979673479597734698==--
