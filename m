Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58664C47253
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 19:29:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2222E207DD
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 19:29:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oAOyVMbS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2222E207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id CCF35204AD;
	Thu, 30 Apr 2020 19:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gw9AipOAzv3a; Thu, 30 Apr 2020 19:29:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E8D7620465;
	Thu, 30 Apr 2020 19:29:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D21B9C0889;
	Thu, 30 Apr 2020 19:29:50 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAF9AC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 19:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C3874204AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 19:29:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r8dh2dq69aX2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 19:29:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id EBB3420465
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 19:29:48 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id fu13so1248433pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 12:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=S56vvjgUJgJIcs0iI3orpY7ejPb7V1V+KfOnIEgpemg=;
 b=oAOyVMbSFrTgrrXodp1aN7KVZh+59xE1YaGOAh56d1EC+I4gcm1UjNeI3p6/8+hOgz
 2i5s2bjByfGsW01ml/aHEdaRd6QMQb65ef4L1x3R+8Z0+tV6gA1tugOZkpG4hujd3F2r
 Uac4rrNRFI6dI2LsjxLXJEMUySVo8PN254L95aFVxbCN9Dg4IM81ws7Jkn7yhtZ4blTc
 fi8d6VgtOrxaL/fcC9qDPkwCkGFlncx/GTj6uDsN+gnU7fMsaJgz6t1xYsdW6feHEfUw
 ZWLFaCIYqIAtoUjGxBFLhY/4JIXbnLgCfZ9r7ZERjmZzVE7k+vVchNrCAoQRgXS/3200
 iBBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=S56vvjgUJgJIcs0iI3orpY7ejPb7V1V+KfOnIEgpemg=;
 b=j1viOewBnc18f4JeSaPHysBO/bBC3UIlgYAZNRJCiuxF/YIq4uZya87bmMP82KaKBR
 P/2K6PwXXdOF4O8g2Z5RcJT4pI6t8rdD5CuF8fw6/ECvuNxaLwCudS5q2T0RyIuq4iLb
 73XN6aiR0WbZ6tQ9pNfFFYRKvxrJC7nVqx7NhIcw7sPaMsmmVn2gXQke7Aup/gabIk7i
 c6N4WdK7C8Ij/Y3836Hk7iDmwSx9F144OWjW5VtGKRtKK1rnC2kyCUuQsgKBd9QYt9uA
 RTsYZrm+jFffshTSjSEZcs0uupEdUswXYFvYF+jJwgBSaME6JmdxGhhx7McAngotghlT
 svUg==
X-Gm-Message-State: AGi0PuYgTov6TXebgutbdu3UfP/WyX1kihS1LLnCBSiz9BTAX4Td0R5w
 cQ+LPe9nBeKyrpbgQ+OyNA==
X-Google-Smtp-Source: APiQypJ7Vu9QFxwaGegbDs+zHeszCr6lN9AOoLWTdbcpuof9RCZcoh1RtagVlKoWgPy1jwwJ8NQDRg==
X-Received: by 2002:a17:902:261:: with SMTP id 88mr537590plc.308.1588274988360; 
 Thu, 30 Apr 2020 12:29:48 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:d32:dd79:dd81:b49d:fd6a:d165])
 by smtp.gmail.com with ESMTPSA id e4sm461038pge.45.2020.04.30.12.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 12:29:47 -0700 (PDT)
From: madhuparnabhowmik10@gmail.com
To: mingo@redhat.com,
	pbonzini@redhat.com,
	bp@alien8.de
Date: Fri,  1 May 2020 00:59:32 +0530
Message-Id: <20200430192932.13371-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: kvm@vger.kernel.org, paulmck@kernel.org, linux-pci@vger.kernel.org,
 x86@kernel.org, linux-kernel@vger.kernel.org, sean.j.christopherson@intel.com,
 joel@joelfernandes.org, cai@lca.pw,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, bhelgaas@google.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] x86: Fix RCU list usage to avoid
	false positive warnings
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

From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

Use list_for_each_entry() instead of list_for_each_entry_rcu() whenever
spinlock or mutex is always held.
Otherwise, pass cond to list_for_each_entry_rcu().

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 arch/x86/kernel/nmi.c          | 2 +-
 arch/x86/kvm/irq_comm.c        | 3 ++-
 arch/x86/pci/mmconfig-shared.c | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/nmi.c b/arch/x86/kernel/nmi.c
index 6407ea21fa1b..999dc6c134d2 100644
--- a/arch/x86/kernel/nmi.c
+++ b/arch/x86/kernel/nmi.c
@@ -195,7 +195,7 @@ void unregister_nmi_handler(unsigned int type, const char *name)
 
 	raw_spin_lock_irqsave(&desc->lock, flags);
 
-	list_for_each_entry_rcu(n, &desc->head, list) {
+	list_for_each_entry(n, &desc->head, list) {
 		/*
 		 * the name passed in to describe the nmi handler
 		 * is used as the lookup key
diff --git a/arch/x86/kvm/irq_comm.c b/arch/x86/kvm/irq_comm.c
index c47d2acec529..5b88a648e079 100644
--- a/arch/x86/kvm/irq_comm.c
+++ b/arch/x86/kvm/irq_comm.c
@@ -258,7 +258,8 @@ void kvm_fire_mask_notifiers(struct kvm *kvm, unsigned irqchip, unsigned pin,
 	idx = srcu_read_lock(&kvm->irq_srcu);
 	gsi = kvm_irq_map_chip_pin(kvm, irqchip, pin);
 	if (gsi != -1)
-		hlist_for_each_entry_rcu(kimn, &kvm->arch.mask_notifier_list, link)
+		hlist_for_each_entry_rcu(kimn, &kvm->arch.mask_notifier_list, link,
+					srcu_read_lock_held(&kvm->irq_srcu))
 			if (kimn->irq == gsi)
 				kimn->func(kimn, mask);
 	srcu_read_unlock(&kvm->irq_srcu, idx);
diff --git a/arch/x86/pci/mmconfig-shared.c b/arch/x86/pci/mmconfig-shared.c
index 6fa42e9c4e6f..a096942690bd 100644
--- a/arch/x86/pci/mmconfig-shared.c
+++ b/arch/x86/pci/mmconfig-shared.c
@@ -797,7 +797,7 @@ int pci_mmconfig_delete(u16 seg, u8 start, u8 end)
 	struct pci_mmcfg_region *cfg;
 
 	mutex_lock(&pci_mmcfg_lock);
-	list_for_each_entry_rcu(cfg, &pci_mmcfg_list, list)
+	list_for_each_entry(cfg, &pci_mmcfg_list, list)
 		if (cfg->segment == seg && cfg->start_bus == start &&
 		    cfg->end_bus == end) {
 			list_del_rcu(&cfg->list);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
