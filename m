Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7779C433E8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:22:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 795B4206F0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:22:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DOSHDGVm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 795B4206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 46EE687569;
	Mon, 13 Jul 2020 13:22:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0cECxgjJpDkJ; Mon, 13 Jul 2020 13:22:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EAF6B86CDF;
	Mon, 13 Jul 2020 13:22:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9902C08A0;
	Mon, 13 Jul 2020 13:22:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62DA1C0888
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A6C65869B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F5ZqrnTEUUyP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 346308694A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:22:39 +0000 (UTC)
Received: by mail-ej1-f68.google.com with SMTP id n26so17182869ejx.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=z4DbCQASJpB18XYS7ktJTNc93Wbe31Dke4XqE2e1oq0=;
 b=DOSHDGVmk30fZFiz3WKd7zMCSK69f3jEL1u8AsUJjxB2mBuvUr1qBHCx969bF8n9Q2
 KtbdMAJyAt3EFUnpKPSIMJbXHWkN6pnl/9Tnrb3Gl0n+kYXCTO2h5BNyruT2BHFjgl+g
 wH9iQCx1EI7m7ZrVqhRyZdNkYPv0uZXHNRXI4H3ZgM4nssEF6Z4+vhCyAINKoOna9COA
 2vQ/UXMl3YhqVXxT1k4grDXlx/GMqUZZFWedx8icvuVMGE/cnpL+73qZzJoFpLnQEXqM
 kKNEdCxwfmXyA7RuYT4PGHN4OQXUHW+RCFO60LXxoSfPzZmiOAwLoId6GJoDAnwMnMXf
 6VkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=z4DbCQASJpB18XYS7ktJTNc93Wbe31Dke4XqE2e1oq0=;
 b=cpbVoAZkpdAmrjfgX3C6KF6RmqgkcNxIkN6TnzzP95OvwCRGwTTsCyX+wt5niY/y6r
 gwe6pueME6hO59piEeDRrcL7Be1H8AABaB/csJhkLJ8nqs4XDe8b6fE/+QLYnDAooC+/
 KUWVswdBM7R6oGKmR0Y1CHWVrV02mO5MEbXuyj2GoeX18mfLZzD12gyTYEr5pO4bD2iE
 MIAFZt2xMuHJ8IlvHXg4NzZ5nLKQVr/F+WOr7Dzx/7G8F7vr8CjeTR/mIe5Xg9VGuZG+
 gqpvBNpjQucACyNyYgWLbmWddTWQKp4olP5+6cKBgYE1qB7G1Xx4YYw9sEvPsxax4fXe
 ZEMg==
X-Gm-Message-State: AOAM5338/5ZmcSvsNVOhbAFeOjdNeDacrN7QU3dFCZw1uXanim5X71X1
 eGYDfTFHPV8M9Vq385bE4uQ=
X-Google-Smtp-Source: ABdhPJyNJ+2A+7vhlimkJ5sh3qnTf4AmYHcIfFpOxzTngMqwIMgJRuRgZYpxdl6ypR4zISe0e31EHw==
X-Received: by 2002:a17:906:4dd4:: with SMTP id
 f20mr77154689ejw.170.1594646557469; 
 Mon, 13 Jul 2020 06:22:37 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:22:37 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Date: Mon, 13 Jul 2020 14:22:13 +0200
Message-Id: <20200713122247.10985-2-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 01/35] xen-pciback: Change
	PCIBIOS_SUCCESSFUL to 0
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

In reference to the PCI spec (Chapter 2), PCIBIOS* is an x86 concept.
Their scope should be limited within arch/x86.

Change all PCIBIOS_SUCCESSFUL to 0

Signed-off-by: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
---
 drivers/xen/xen-pciback/conf_space.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/xen-pciback/conf_space.c b/drivers/xen/xen-pciback/conf_space.c
index 059de92aea7d..0e7577f16f78 100644
--- a/drivers/xen/xen-pciback/conf_space.c
+++ b/drivers/xen/xen-pciback/conf_space.c
@@ -130,7 +130,7 @@ static inline u32 merge_value(u32 val, u32 new_val, u32 new_val_mask,
 static int xen_pcibios_err_to_errno(int err)
 {
 	switch (err) {
-	case PCIBIOS_SUCCESSFUL:
+	case 0:
 		return XEN_PCI_ERR_success;
 	case PCIBIOS_DEVICE_NOT_FOUND:
 		return XEN_PCI_ERR_dev_not_found;
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
