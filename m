Return-Path: <SRS0=CeKo=BL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FC14C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 053C32076A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Aug 2020 12:24:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hgKqoCrs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 053C32076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C2767888AB;
	Sat,  1 Aug 2020 12:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1TSgUSSkF+z1; Sat,  1 Aug 2020 12:24:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C596A88831;
	Sat,  1 Aug 2020 12:24:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE26EC0052;
	Sat,  1 Aug 2020 12:24:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54F02C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 522B088686
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HqLaKcYhmGGH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 922C68867E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Aug 2020 12:24:47 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id c15so14457963edj.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Aug 2020 05:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=y/Cb7GKK5mO5miGjoqukiO9DrcaVbTzBZ/XAaAsprek=;
 b=hgKqoCrsgEvqzZxuemcdmAGc7l+erLtC0MIMuinBU6Z7xRXXMH08QxW5iaYUUehX4a
 N2jhjFbh6KSNqPO6rdIXcBDOVF+TC3NA3OpVybZTUL2FZnmU5fe1xan0Ku0OsTsKgJBT
 2Bl+4Fm9qSzXFiD2qF5WRx67/ES4EZypV3beloZaZm672olY421KHi08EwsFRo3ualou
 ugM9j06fc7F2D6U3a6xTJCuLmhn+UiqI0N3tIwyBhgTUcLrRz0fNiyAjWlAKP6mHkIdm
 eTJXEvhx4KUsgrDhJUp31wqdm0zs7H8VlSv9shvME6ij/bBn32Wm2j3Nlw+fMdhGApwy
 SPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=y/Cb7GKK5mO5miGjoqukiO9DrcaVbTzBZ/XAaAsprek=;
 b=lKFnUdhX0pLQIX8OmIH2IvpZloRPylKkBX8axB2w9qfc+LYxZ7C9CSrijNXy3yjh8F
 0uwYebOJpX1bDr0ZjPKdYzyNfScJEK78+AuoGOsNmi3QVM1NIW6NgsJujhqEVOIcmwxQ
 98h6UYZDUGORm3zrUOeocyt2kVI6YwEKEKz46DszhgiQPX0Sgacj2FsCX+klVaegrKer
 2+xgIJbPAiFaJ2Esjx/fzlC0ZMMuAH0+IadczjuPtyEaBeL2KobuPZxyVXD8SAcpvHkj
 msZKK0wUhua6wMFoDl/kglKenxP4nM4dF49aJe5jHzznrnZiLtQZaxyxHWMezU0M0cXf
 hTWw==
X-Gm-Message-State: AOAM533YkkXyybkoeS6U5RFdDdZbfvZUN6wVuuqnREbY5qRN2u4qKLYO
 dSuBJXXQnABeExUvPeJrtsJCEk6NiRx7fA==
X-Google-Smtp-Source: ABdhPJygCFTQRnLVaNC5h4/9yQOO7Dg3dB0ySHxdfO6WpfJvbhq/7rd7jFfxV5f6I7rAPQsprZz5+A==
X-Received: by 2002:a05:6402:13c4:: with SMTP id
 a4mr8165000edx.108.1596284686131; 
 Sat, 01 Aug 2020 05:24:46 -0700 (PDT)
Received: from net.saheed (95C84E0A.dsl.pool.telekom.hu. [149.200.78.10])
 by smtp.gmail.com with ESMTPSA id a101sm12083131edf.76.2020.08.01.05.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:24:45 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Date: Sat,  1 Aug 2020 13:24:45 +0200
Message-Id: <20200801112446.149549-17-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200801112446.149549-1-refactormyself@gmail.com>
References: <20200801112446.149549-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 16/17] mtd: Drop uses of
	pci_read_config_*() return value
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

The return value of pci_read_config_*() may not indicate a device error.
However, the value read by these functions is more likely to indicate
this kind of error. This presents two overlapping ways of reporting
errors and complicates error checking.

It is possible to move to one single way of checking for error if the
dependency on the return value of these functions is removed, then it
can later be made to return void.

Remove all uses of the return value of pci_read_config_*().
Check the actual value read for ~0. In this case, ~0 is an invalid
value thus it indicates some kind of error.

Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/mtd/maps/ichxrom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/ichxrom.c b/drivers/mtd/maps/ichxrom.c
index fda72c5fd8f9..04728d902e49 100644
--- a/drivers/mtd/maps/ichxrom.c
+++ b/drivers/mtd/maps/ichxrom.c
@@ -61,8 +61,8 @@ static void ichxrom_cleanup(struct ichxrom_window *window)
 	int ret;
 
 	/* Disable writes through the rom window */
-	ret = pci_read_config_word(window->pdev, BIOS_CNTL, &word);
-	if (!ret)
+	pci_read_config_word(window->pdev, BIOS_CNTL, &word);
+	if (word != (u16)~0)
 		pci_write_config_word(window->pdev, BIOS_CNTL, word & ~1);
 	pci_dev_put(window->pdev);
 
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
