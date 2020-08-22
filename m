Return-Path: <SRS0=K2BX=CA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E52AC433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 646812078A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAK8D7kU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 646812078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 51F43204AE;
	Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RK6cXtxJpIBK; Sat, 22 Aug 2020 21:03:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 59C8E20395;
	Sat, 22 Aug 2020 21:03:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 55B87C08A2;
	Sat, 22 Aug 2020 21:03:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F3C54C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E120C2050A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DMclRFTEOl8I
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by silver.osuosl.org (Postfix) with ESMTPS id E29AD20395
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:45 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w13so4721640wrk.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=c6Ukl5rvkJHg4Pxjf5Lwc2zkxsoVVxL+grMavPqSwKM=;
 b=UAK8D7kUdZEWhEVOSJTSmNVT/+03WsuUs03wWNOcMgXF4Im7Y6W8UcKjZsc3yHlPiB
 ERz1fdj1RZliXlIpB8k84sa/vqM5BaD19PpTmbwb2bDwCOBSLz5Zmqk14RH65agRfcdj
 IM6216noAf0PoNkxC+f90MLeeW8cq8bKEDDPQ/L7hfZCnV1soRd46MVThXw6wVukSiJv
 LLTt+Mynj6iRzEyeLorlq/WdSRICIMO+Jayc+eUaQHV3KWumbja7Zfrxz9vLmq9fNT0S
 1BHzXr750CNqQXz8gZKkZyPU52XC0l914TUaICFFylCwtPEp4moVOIEEsUGpvXX14hxU
 pwqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=c6Ukl5rvkJHg4Pxjf5Lwc2zkxsoVVxL+grMavPqSwKM=;
 b=LSNfTkLu1EJT3ZEiLw+r47rrGOZH2zcbsZr6MEFzAGJJBveIGfnZnS88nwaxzKkk2I
 YXmyLk8l4HwHnOfEksbHTWloiVo8/gHc0NPCgMD4dyz+2I5UHdE6ngPa+f2nmiYIUaci
 KKBEvuJYbUPQgW73UXkZKkog6UvixlicR1XIuKJjF7gsJ3ZKmq5IrehLKsuVaAlm4hhA
 jExqFhJ5+233sFiv/oOOctDYblp2X5WTHwjAheEaZTlXjy9oz7Sc4CJ33aPae6N5WUnP
 7sGcKOsREbQFb8/T2hH6w8IymegVg7w+a896yIilCakWcyrdnup0EX7cMgiIKpENGOs0
 pU5g==
X-Gm-Message-State: AOAM531l/Ac7O2Ryb+kd+pnvd8NsdlnJCtQ5u4SmNQxuglDRacXqdg1b
 KtdIMyezCLEBD2mcDodX5ZY=
X-Google-Smtp-Source: ABdhPJwRM2THgXG5dj6UpmY0ewpLkX7kvt+p0IpLLDrwcEJHCaOa8ORwqB1s2jb3CygJnX9t9AxBXQ==
X-Received: by 2002:a5d:6992:: with SMTP id g18mr8104368wru.15.1598130224401; 
 Sat, 22 Aug 2020 14:03:44 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:43 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:43 +0200
Message-Id: <20200822200358.252967-9-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 08/23] PCI: Remove unused
	aspm_calc_l1ss_info() arguments
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

The two struct aspm_register_info arguments of aspm_calc_l1ss_info()
are now redundant.

 - Remove redundant arguments.
 - Refactor callers to also remove redundant parameters

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index c5f18d280892..506552f8dd2b 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -495,9 +495,7 @@ static struct pci_dev *pci_function_0(struct pci_bus *linkbus)
 }
 
 /* Calculate L1.2 PM substate timing parameters */
-static void aspm_calc_l1ss_info(struct pcie_link_state *link,
-				struct aspm_register_info *upreg,
-				struct aspm_register_info *dwreg)
+static void aspm_calc_l1ss_info(struct pcie_link_state *link)
 {
 	u32 val1, val2, scale1, scale2;
 	u32 t_common_mode, t_power_on, l1_2_threshold, scale, value;
@@ -644,7 +642,7 @@ static void pcie_aspm_cap_init(struct pcie_link_state *link, int blacklist)
 		link->aspm_enabled |= ASPM_STATE_L1_2_PCIPM;
 
 	if (link->aspm_support & ASPM_STATE_L1SS)
-		aspm_calc_l1ss_info(link, &upreg, &dwreg);
+		aspm_calc_l1ss_info(link);
 
 	/* Save default state */
 	link->aspm_default = link->aspm_enabled;
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
