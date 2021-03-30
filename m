Return-Path: <SRS0=Bfkk=I4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CD91C433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 20:53:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E70BB60232
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 30 Mar 2021 20:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E70BB60232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAA284039F;
	Tue, 30 Mar 2021 20:53:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5pgg5W4xDDqL; Tue, 30 Mar 2021 20:53:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id E70F340380;
	Tue, 30 Mar 2021 20:53:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5E20C000B;
	Tue, 30 Mar 2021 20:53:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 41AB5C000A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 20:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30B4483F21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 20:53:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QTlbUkpFgYNl
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 20:53:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FD9B83F1A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 20:53:41 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id ay2so6784213plb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 30 Mar 2021 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=76Ftwc6j0K5A0mdhCxE35QoW2mVgwaH1Lt+VHIxvLcE=;
 b=Xs33hE/uq+i7i05sdlY1p4nl+mEWK9rmNggt1oqffM7UMa+sAHYsFw3w9v6ReFViOK
 PILw0yc/9qUNvp4sBCOFa9ITYvIkaAG0d2s1XrYNMhvw1djyn3hQVzq1DQQSgzg5hygY
 HLintNu+m5cfEFGQlWFsFKpz5gNSz/fGKDlCGy+MchU71F2vpofB/34lvqUz0iIwZI4p
 3flbBilRjtTyW3jC5V6TIpE1CxGSXIXJ5s1zSLdhR3qRKul4Zl6UiPqcEiZxnZgVgDJb
 ji8r6U1hlxQWIbcuXXQ8fJxae/52xYDUCAaY/igmC5I9DI9RMFORgukd7ccp9fkG9oLb
 UqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=76Ftwc6j0K5A0mdhCxE35QoW2mVgwaH1Lt+VHIxvLcE=;
 b=h/vDGMtMwGNcDXLATgvrxt2lUPmgFYDCP8tCdlgvcu79k0JHTTa6gCB9Do5C91/ScK
 axI8vh78b69moWhtxxXToOWjK75ZJpSwwRXlSUxTo8vIgE7aZ/EIF3mntMoj0VZLSV6T
 rfhbSoYV+seIUTaiw0WuTrpbOd2lSSULVwhCzcwrt+1CtA/J2tDu4BiORIz4sJAtl3gQ
 oY/A2GQ53jNUoj3BSvOwmKAfLwbmM1LCxdPvavti7JvU2WymjCMRtI9nK+1vDiK36ptt
 YP5YZpfHgvNhOiDNhLa/UxwoeLQBBr3VD0wIVX7UdQGl7ono0cR3EAnlS/5i8SQZTGrh
 ykuA==
X-Gm-Message-State: AOAM532yxW/KHl2iE6YWxsnGbLwrSpThRx/Nvee77gRBE/8TuYeSR3K/
 ySiu15aWcz+A8USmH9Md4Ws=
X-Google-Smtp-Source: ABdhPJwUjuJTIOCOPZKJifMZmhD87LnB9We54yGCEzll7ZIcimiVPqhJskN/NOLFeEebbRsY3yaCUA==
X-Received: by 2002:a17:90a:3cc6:: with SMTP id
 k6mr181610pjd.212.1617137620933; 
 Tue, 30 Mar 2021 13:53:40 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a089:d1c0:d79d:e260:a650])
 by smtp.googlemail.com with ESMTPSA id fh19sm35622pjb.33.2021.03.30.13.53.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 13:53:40 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: OMAP1: fix incorrect kernel-doc comment syntax in file
Date: Wed, 31 Mar 2021 02:23:30 +0530
Message-Id: <20210330205330.26345-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: aaro.koskinen@iki.fi, tony@atomide.com, rdunlap@infradead.org,
 linux-doc@vger.kernel.org, linux@armlinux.org.uk, yashsri421@gmail.com,
 linux-omap@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
The header for arch/arm/mach-omap1/timer.c follows this syntax, but the
content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warning from kernel-doc:
"warning: expecting prototype for OMAP1 Dual(). Prototype was for OMAP1610_GPTIMER1_BASE() instead"

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210326

 arch/arm/mach-omap1/timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap1/timer.c b/arch/arm/mach-omap1/timer.c
index 97fc2096b970..0411d5508d63 100644
--- a/arch/arm/mach-omap1/timer.c
+++ b/arch/arm/mach-omap1/timer.c
@@ -1,4 +1,4 @@
-/**
+/*
  * OMAP1 Dual-Mode Timers - platform device registration
  *
  * Contains first level initialization routines which internally
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
