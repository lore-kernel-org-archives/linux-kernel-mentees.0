Return-Path: <SRS0=TljZ=NE=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C958C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 09:22:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AABC60FC0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Aug 2021 09:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1AABC60FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CBE0A83A5D;
	Fri, 13 Aug 2021 09:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ph-NPavvb-mz; Fri, 13 Aug 2021 09:22:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D590680E86;
	Fri, 13 Aug 2021 09:22:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2AD7C0010;
	Fri, 13 Aug 2021 09:22:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C8E2C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 09:22:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B1EC80EA1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 09:22:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHwRcq1gZdzI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 09:22:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 807CD80E86
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 09:22:50 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id qk33so17073245ejc.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Aug 2021 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=T/Km1YfynsNVJoTFsyWOlbw2OCbDjL4OVm1SgV7thLs=;
 b=C72Ledj3lW87+NWa90Bockfs1G6LR9lpPs+Z4rpkdaSy3ClLg3ADfnvnKFYnxNzw+n
 wy2uj5dpy6G7v3k9NsvDszJz5oh7kv3s4nhPVpd6KaDmNFGG6DA8uU8g0YhcxLGXYd6M
 yA27QkTpdS9qD2srgeu4NqpRoMohak9hPo+XTLRfQQvIP3dRURnzSPcmhQKUrc6XiOuv
 tN5q1TlaDWK/i3C3m5sgZH2PGejj+DUE+P4zEYFaLqUQ3Zq1qG9aOKW/mbfBmWPjdpvA
 GGTYBDMQ/xFPUVgWAhrxi4ER2ScoNRpcbQbmxLrwsiKZZEHbPDUsnPITrJsUNJ+cUR+H
 VNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=T/Km1YfynsNVJoTFsyWOlbw2OCbDjL4OVm1SgV7thLs=;
 b=YaTgG8P+c5CsxLqYwD1AjVRhdYltPghK2+Qi4eWhhVos1Zq5SjPOjm9cPMYVOEzbzL
 KDb6jAcwDVeVr2jd8xiv8XJBs66dUw6lSMOxjBkC7Wt+fHtpIyY84m56qXX7qObjGV5l
 VoQtE9EnkfrEcrpWIUisD30GqdVfKN7cCwdZvn4G7NaMuxGAFkjSn6fSjvR2GWtt6exc
 bUDRJc15t4JON+S59U0YswztenNksIH0IGpPKF6y5ihLXm0GYtyGPqpLbYo3udUYupjT
 ZrszknPCIZDjpUFO0ueobi3g7MjhhftuliovKbbIiQBygO8pyduHSDS0/pOX2ypxSf2a
 VOaw==
X-Gm-Message-State: AOAM5316+es9lx5MsdVctyLPVaVBBjeaG9CYMJ3MtMPrMje47zEd56v6
 0grQZ5KzkO2vcRXqsoL+iX46UELAt5lb1oirwkg=
X-Google-Smtp-Source: ABdhPJzpPyOjqMdcRLqnBz3xyOpy2+qXJDfsWYBg2E7asjnRAt/Sg03jNQvCBfueHaD3gK3apOJL7BXAAlGYhp7kutE=
X-Received: by 2002:a17:907:98b2:: with SMTP id
 ju18mr1495071ejc.15.1628846568528; 
 Fri, 13 Aug 2021 02:22:48 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?Q?Luna_S=C3=A1nchez?= <lunasanchez@gmail.com>
Date: Fri, 13 Aug 2021 11:22:37 +0200
Message-ID: <CANzSgSkBGm3aLx_iOdXp=HfWwOoga_CuQTGA++CX4YgVNWgBdw@mail.gmail.com>
Subject: Checkpatch Documentation mentorship program
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
Content-Type: multipart/mixed; boundary="===============7851727837169820707=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============7851727837169820707==
Content-Type: multipart/alternative; boundary="0000000000001c606305c96d652b"

--0000000000001c606305c96d652b
Content-Type: text/plain; charset="UTF-8"

Hello,

I am interested in the Checkpatch Documentation mentorship program and I
would like to work on the tasks for the mentee selection.

Thank you and best regards,

Luna Sanchez

--0000000000001c606305c96d652b
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div>Hello,</div><div><br></div>I am interested in the Checkpatch Documentation mentorship program and I
 would like to work on the tasks for the mentee selection.<br><div><br></div><div>Thank you and best regards,</div><div><br></div><div>Luna Sanchez</div></div>

--0000000000001c606305c96d652b--

--===============7851727837169820707==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============7851727837169820707==--
