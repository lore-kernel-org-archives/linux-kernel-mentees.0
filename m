Return-Path: <SRS0=Bf+q=DP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B2CC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Oct 2020 11:51:20 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE52920B1F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  8 Oct 2020 11:51:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q74/FCsN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE52920B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 582778722D;
	Thu,  8 Oct 2020 11:51:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LDLU7+d4+ETi; Thu,  8 Oct 2020 11:51:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9D1F787127;
	Thu,  8 Oct 2020 11:51:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83472C016F;
	Thu,  8 Oct 2020 11:51:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D5FAC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 11:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 7BCCE86E59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 11:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yQCwoWJVPsmw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 11:51:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 955A586E56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  8 Oct 2020 11:51:16 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id lw21so7673602ejb.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 08 Oct 2020 04:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:user-agent:mime-version;
 bh=EKS4Rl7taEFKEAjyfKeNM4So5LpeFxU2RUXgnXem7BU=;
 b=Q74/FCsNrM4/oj1pPejy/g9GINBxGZsA4gVxVIaYJ4MsGEVX1y+Xry2faiiplEiEQz
 gp6YTOpNWHL6yM3gV6tFeEjdhFVav7Ac+ZGcIHUHKDvN8cv3DqAW2Bo8nV5cgVxCTaa4
 1dp/kgPM0/ltWe8+0HIxmxsW02JpnlePwBkphxenlZ5e2dVb/FqLS0a+nkMAnRvAJhr6
 YjXVPrglDxwsFXIyCwsC2c8c5l5ABjK56GtUB7N3QLPsxLYTtL2Rln3xoR5c916+WrzG
 1bvUGfkBoQcpvlY/K4LRUXOlEae+jxMl4vk9Vzav3mDY8Zse0T7SzeDKJTbUaxyy7Jpb
 Di9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:user-agent
 :mime-version;
 bh=EKS4Rl7taEFKEAjyfKeNM4So5LpeFxU2RUXgnXem7BU=;
 b=RyX1s4gcS15bGqbyUsWPQt0/eS+NqY3JNSKV1LHDMDE7yfp8yrHH3PWJFc9/MGj0Oc
 a3TKs2Ci1wHrUaCe4+kT8SgqZn9ZUHQxXB0awHP42WZJHqc9H8Bk5tExJo5i/8eAURC0
 Viy4KczBdYja7LtCTx+bCjT6K5ZKcSW/cr5x26Dd/w7ium2agOhJntlB3nZzshhRHFen
 iJHFCfzy/XMsofj2MH+yvjWP7+XPjei96cZ2Xhcg4Nu2iPzM5kndyQ5fJF9NtuTVh0LC
 zYc/SNs+7HxWZQPiAYCWafjyd6UfEGLcpq5CvPnMKwY8T0FHZBF2AknHSB+toLWT8INN
 iCng==
X-Gm-Message-State: AOAM531MzW/cwYLHYlNTDxChLz97SDtufNLekwyQ2WDrROpTy3BQ6wyV
 NKHj7Sgkj5aOcEVOCY7BGq4=
X-Google-Smtp-Source: ABdhPJyEcyf9UBhEyTeCnS0LcUO9nqMkIqRZoXKo4/0oyvreo3Ih8ruMp3tAltm7LRrVFLaAFV0u8g==
X-Received: by 2002:a17:907:20e7:: with SMTP id
 rh7mr8673675ejb.515.1602157875013; 
 Thu, 08 Oct 2020 04:51:15 -0700 (PDT)
Received: from felia ([2001:16b8:2dc7:4d00:248e:daaa:460c:6b4])
 by smtp.gmail.com with ESMTPSA id u26sm3732317eds.2.2020.10.08.04.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Oct 2020 04:51:14 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 8 Oct 2020 13:50:56 +0200 (CEST)
X-X-Sender: lukas@felia
To: Joe Perches <joe@perches.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>
Message-ID: <alpine.DEB.2.21.2010081247510.19461@felia>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] checkpatch.pl: REPEATED_WORD: massive false
 positive in MAINTAINERS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Dear Joe, dear Dwaipayan,

while maintaining MAINTAINERS, I noticed that the REPEATED_WORD check, 
which in general is a great addition to checkpatch.pl, generates a massive
number of warnings due to one specific pattern in the MAINTAINERS file:

$ ./scripts/checkpatch.pl --show-types -f MAINTAINERS

results in 625 warnings of the following kind:

WARNING:REPEATED_WORD: Possible repeated word: 'git'
#XYZ: FILE: MAINTAINERS:XYZ:
+T:	git git://...

That pattern above is of course intentional and perfectly fine, so now the 
REPEATED_WORD check should not complain here.


Joe, would you accept a suitable refinement of the REPEATED_WORD check 
that address the issue above?

Dwaipayan, is that another good issue for you to look into and improve?
There are multiple ways to handle it either directly checking for that 
pattern or excluding MAINTAINERS or both or something completely 
different.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
