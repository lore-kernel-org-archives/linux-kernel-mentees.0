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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6541C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89F872078A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 22 Aug 2020 21:03:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ofoFPHbb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89F872078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 613078839E;
	Sat, 22 Aug 2020 21:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zuswLFqSuLwm; Sat, 22 Aug 2020 21:03:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C5EA1883CD;
	Sat, 22 Aug 2020 21:03:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B59C8C08A5;
	Sat, 22 Aug 2020 21:03:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DA886C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C5C068839E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zi-WJ26T81p1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id BEB85883D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 21:03:50 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y3so5050302wrl.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 22 Aug 2020 14:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xUhoKyXeQE69fU+ukP+5QV7FrP0KVkdHSBpNL+kNZTo=;
 b=ofoFPHbbNehgMEfFy1K4qWiQ3Db3WZf+FeE8f00GkMM50QVXLRFK3QTIbNN3z9fYYb
 FmIXcHDOfS6miF2kJAkmj3pUTK771jri52P0AHS0mAMcBq8YKIkRq32zrXzgsAJuVHOv
 gPkbf2JdPTBwCpTNVm+1jHlWsBcHWTlzSJkFd5mLGpHvp6gF7yZNpTZ9g8kAb/eNLZsN
 W0X51CvG+/EWFFIFQG+fWx+UXnRcFwxEL8k3VzFGZmNDB4Mqcu7SQqcxp0kLyJdjlx7t
 xZmHOOBZShzmp3C8pFXEUQ8/7olvX7CJNqyW1mkBvrvilzQRxswt+iEIkuhUkFH2N+Y2
 uT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xUhoKyXeQE69fU+ukP+5QV7FrP0KVkdHSBpNL+kNZTo=;
 b=R7qPdzJ7juSg37dKF19m4QHnLIXk0DTe+QkrwZMBRexudqFgN3Cr1R/LEJ0xrCG0NW
 OqV8gKz8VDASmCJ87yv937+8gRmWSnM/HPqg7rgNl6SUmQ8dYewiLe7MyekSu4rqIBHZ
 uEvHIN45VYZiUz5qIhbPB615c8Wp/wp8/T+9EUw3oI9YEVmERwuDqfYoldLtdrqgqJFH
 YytrjlZSNJ9kYD50uwvZa1TDPLtUqBEvT9gTExp4G/nDQ3Yp0tYYQ0Y1I4qs8W/G8/sM
 0N/cj0rjVsiwyNGHCbwBUb05mZ+AiGg2eNiTpbdkpJEK9JaM5ydLyhHmt36jOIuiAfr2
 WZ4Q==
X-Gm-Message-State: AOAM531S/lmLcYW3hu3pLbtUUSWw9DNS4Bj6FWYe+ru9SiK6a4hgQzgQ
 VfUkfeE067SIoftqv+eu7CKL5BV3uML0Lg==
X-Google-Smtp-Source: ABdhPJxr/9a81mZjWAtRmISfozf0YgPJUQQp8ZSVrrWgVDV89YVJ0h3+sgfZEOXSZqhRnE0BR+Xtnw==
X-Received: by 2002:adf:9030:: with SMTP id h45mr7801265wrh.50.1598130229133; 
 Sat, 22 Aug 2020 14:03:49 -0700 (PDT)
Received: from net.saheed (563BDA2C.dsl.pool.telekom.hu. [86.59.218.44])
 by smtp.gmail.com with ESMTPSA id y2sm14868321wmg.25.2020.08.22.14.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Aug 2020 14:03:48 -0700 (PDT)
From: "Saheed O. Bolarinwa" <refactormyself@gmail.com>
To: helgaas@kernel.org
Date: Sat, 22 Aug 2020 22:03:47 +0200
Message-Id: <20200822200358.252967-13-refactormyself@gmail.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200822200358.252967-1-refactormyself@gmail.com>
References: <20200822200358.252967-1-refactormyself@gmail.com>
Cc: "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [RFC PATCH v5 12/23] PCI: Add ASPM and CLOCK
	PM states to struct pci_dev
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

Move all struct pcie_link_state information to struct pci_dev

Signed-off-by: Saheed O. Bolarinwa <refactormyself@gmail.com>
---
 drivers/pci/pcie/aspm.c |  5 -----
 include/linux/pci.h     | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 4cff11dc8d83..d9c17093b250 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -41,11 +41,6 @@
 #define ASPM_STATE_ALL		(ASPM_STATE_L0S | ASPM_STATE_L1 |	\
 				 ASPM_STATE_L1SS)
 
-struct aspm_latency {
-	u32 l0s;			/* L0s latency (nsec) */
-	u32 l1;				/* L1 latency (nsec) */
-};
-
 struct pcie_link_state {
 	struct pci_dev *pdev;		/* Upstream component of the Link */
 	struct pci_dev *downstream;	/* Downstream component, function 0 */
diff --git a/include/linux/pci.h b/include/linux/pci.h
index fa114c5d01e7..1daf5fe0b913 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -305,6 +305,11 @@ struct pci_vpd;
 struct pci_sriov;
 struct pci_p2pdma;
 
+struct aspm_latency {
+	u32 l0s;			/* L0s latency (nsec) */
+	u32 l1;				/* L1 latency (nsec) */
+};
+
 /* The pci_dev structure describes PCI devices */
 struct pci_dev {
 	struct list_head bus_list;	/* Node in per-bus list */
@@ -383,6 +388,33 @@ struct pci_dev {
 					   supported from root to here */
 	int		l1ss_cap_ptr;	/* L1SS cap ptr, 0 if not supported */
 	u32		l1ss_cap;	/* L1 PM substate Capabilities */
+
+	struct pci_dev	*parent;	/* pointer to the parent */
+	struct pci_dev	*root;		/* pointer to the root port */
+	struct pci_dev	*downstream;	/* Downstream component, function 0 */
+	struct list_head sibling;	/* node in link_list */
+
+	/* ASPM state */
+	u32 aspm_support:7;             /* Supported ASPM state */
+	u32 aspm_enabled:7;             /* Enabled ASPM state */
+	u32 aspm_capable:7;             /* Capable ASPM state with latency */
+	u32 aspm_default:7;             /* Default ASPM state by BIOS */
+	u32 aspm_disable:7;             /* Disabled ASPM state */
+
+	/* Clock PM state */
+	u32 clkpm_capable:1;            /* Clock PM capable? */
+	u32 clkpm_enabled:1;            /* Current Clock PM state */
+	u32 clkpm_default:1;            /* Default Clock PM state by BIOS */
+	u32 clkpm_disable:1;            /* Clock PM disabled */
+
+	/* Exit latencies */
+	struct aspm_latency latency_up;	/* Upstream direction exit latency */
+	struct aspm_latency latency_dw;	/* Downstream direction exit latency */
+	/*
+	 * Endpoint acceptable latencies. A pcie downstream port only
+	 * has one slot under it, so at most there are 8 functions.
+	 */
+	struct aspm_latency acceptable[8];
 #endif
 	unsigned int	eetlp_prefix_path:1;	/* End-to-End TLP Prefix */
 
-- 
2.18.4

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
