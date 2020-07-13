Return-Path: <SRS0=16qS=AY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415C4C4345C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 131982072D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 13 Jul 2020 13:23:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYu8pxNg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 131982072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0745F88AEF;
	Mon, 13 Jul 2020 13:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9V5PPQTQ97yZ; Mon, 13 Jul 2020 13:23:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4150788C76;
	Mon, 13 Jul 2020 13:23:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31835C0733;
	Mon, 13 Jul 2020 13:23:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 74D02C0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 616DC88C64
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JGxeFgaEIpdf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 89FDB88B7A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 13:23:03 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id n2so13659652edr.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 06:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ExF6es49alDYSdqAf6nfQyrFV/rkp6/B8fioIMr76uI=;
 b=RYu8pxNgdnsOJ+hiYOZPlgYabzTbyLX+KMaw5u1yC21ZGr8PmNJw4tVllr1m9KBdW6
 e1yZPoxl4y5vSPwSff+H5xY+hBFKa0xapp3KqR4lMOytc87Cu0xtS6UAQ4fu6FzUAJfZ
 pRYjhi9Q0FHBszC+QXNaDkBU76r+evf62OFLkBk6jgs5Kkgdu9YNMR8DApOdJrkbmxIX
 n9TgJiTaWqPLAjmiPdhuOA+y8c3N0T4ztzYJqgMxaTrD6ZraQP9RiV9P1137SC4/OST6
 tP3QAy3RnsKQrlXqfirjGAvj0zomjFPkEZf9F1WuUKjG9Zo92zd6cdt1pPsPih+31Wya
 V/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ExF6es49alDYSdqAf6nfQyrFV/rkp6/B8fioIMr76uI=;
 b=QWYnvXu5Zktu+1b9s+hSIn56D06avnte+J8TlFhN8sk4vCheHbH+1CmqCXwKgpMRRq
 mOizORSopWDVPIYQ3Urnn3/JKv0eCol07hN6/CWckaY6px+sPyjLCwLbjdqi/zLzMPM3
 7QLXaeCzR6qf50Sa6spsvltu/D+I1ZFyiQX6J8lSjPQlmP5adqs7U+IPvPPcVQ5MCwrd
 FOWWdc4ihUjEnTcBiEFiZUMNW+xIH8Z0x88Und3b2+HTFr4VdVTSj/DJ3Omt4A5MRHUn
 lLOZqQn8r8Nq5VuCdrSJRUyUiDjuLeVTl2YEoiTiIuoicdhdz743th8gsot/unAUFJeV
 9nEw==
X-Gm-Message-State: AOAM532cJzkvu28Js7mUjIW6PdTCAveim1C0zmFYW/WMNT6SUf0ns7Yb
 XUUMxoYW6PvMHrQL0blywGI=
X-Google-Smtp-Source: ABdhPJx62O4aj0c9a5CqnQR0S5T4oeckXkZ/F5P2u6F1htBXN0jjErRFVTWu9CQ+3ieaAac56zRjXw==
X-Received: by 2002:a05:6402:1805:: with SMTP id
 g5mr80230354edy.357.1594646582069; 
 Mon, 13 Jul 2020 06:23:02 -0700 (PDT)
Received: from net.saheed (54007186.dsl.pool.telekom.hu. [84.0.113.134])
 by smtp.gmail.com with ESMTPSA id n9sm11806540edr.46.2020.07.13.06.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 06:23:01 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Mon, 13 Jul 2020 14:22:30 +0200
Message-Id: <20200713122247.10985-19-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200713122247.10985-1-refactormyself@gmail.com>
References: <20200713122247.10985-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH 18/35] bcma: Change
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
 drivers/bcma/driver_pci_host.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bcma/driver_pci_host.c b/drivers/bcma/driver_pci_host.c
index 88a93c266c19..b64ba68bdc8a 100644
--- a/drivers/bcma/driver_pci_host.c
+++ b/drivers/bcma/driver_pci_host.c
@@ -244,7 +244,7 @@ static int bcma_core_pci_hostmode_read_config(struct pci_bus *bus,
 				     PCI_FUNC(devfn), reg, val, size);
 	spin_unlock_irqrestore(&pc_host->cfgspace_lock, flags);
 
-	return err ? PCIBIOS_DEVICE_NOT_FOUND : PCIBIOS_SUCCESSFUL;
+	return err ? PCIBIOS_DEVICE_NOT_FOUND : 0;
 }
 
 static int bcma_core_pci_hostmode_write_config(struct pci_bus *bus,
@@ -264,7 +264,7 @@ static int bcma_core_pci_hostmode_write_config(struct pci_bus *bus,
 				      PCI_FUNC(devfn), reg, &val, size);
 	spin_unlock_irqrestore(&pc_host->cfgspace_lock, flags);
 
-	return err ? PCIBIOS_DEVICE_NOT_FOUND : PCIBIOS_SUCCESSFUL;
+	return err ? PCIBIOS_DEVICE_NOT_FOUND : 0;
 }
 
 /* return cap_offset if requested capability exists in the PCI config space */
-- 
2.18.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
