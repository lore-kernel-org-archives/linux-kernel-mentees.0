Return-Path: <SRS0=qNpr=6O=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44C53C47247
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 17:36:34 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B1E4208D6
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Apr 2020 17:36:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N03tROzm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B1E4208D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D08668880E;
	Thu, 30 Apr 2020 17:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BkEwF+19XfRL; Thu, 30 Apr 2020 17:36:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 674FC88805;
	Thu, 30 Apr 2020 17:36:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 506ADC0889;
	Thu, 30 Apr 2020 17:36:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4691AC0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 17:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2A066204D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 17:36:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zWIRDegYUv8T
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 17:36:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 333A52050F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 17:36:29 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id y6so980750pjc.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Apr 2020 10:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=4K4QcAglqQHIVHuLYS6DjBHUlRjOBcFG0F/ETfmLQWg=;
 b=N03tROzm8pumHw1JUBD7EiC5oQJEswsiNzomuy7OpbRaSiKHk2QTN9f+q7w4sQSQe7
 fJy8T967jYwbfdR+88fl9XcFSj/miRIKv7/uFlVCJsQMc404QrlQXITn/JWTETl5Bm71
 WPdN9AP1+qU/FbOht0rP/BMs5kRFcMEecvGwmw0fGBsXKz9lSXY2pQD4W3dtCrjJwFog
 gDu/4TfsuXoHZ6Vs+VkQbDp3l/EyeA0cm0E0zJxNafRJzpLgo+y8JII6oljiWhDrmV+q
 mnw3EDm2Ziq8feN9f+chh/5S+ks2kqhfoQz7rVNgkvMcMyLv7Z+IhDFrikvWrHI2GrwC
 3BOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4K4QcAglqQHIVHuLYS6DjBHUlRjOBcFG0F/ETfmLQWg=;
 b=bPqH0YBERS0h2WW9ZJPCwUcpKXvBLvw9GLsYlB9Wy6I1cwRJg0ursvLG86AoDNBngH
 5Ph1MjgoUuE+zcCWHsEtz1Dj/9BI2VTigNyhFMjs4PvFgK47NavvmimxMLPnd3n17ej5
 RsTe5z/Rzg4/PC2WK2xt/zmdxmvnFkBBfJMrVR9avJ/fvsNKeM+N1GJizK536+upZSDL
 hqznhyd58pjf6mCmGm8TPzvgPnVJNmEQAi5RYO0IYQXLFXRMh+1iWAKmze69n3HCLRuV
 nPEEcLqFOEiE1I6KXJGRTR3J8ilQG4IpwDUK0SmS1KVKz6Xw2K4UY4OqEUR9blGIRPp4
 viiw==
X-Gm-Message-State: AGi0Pua32XhXxLD16KocVWxXS3FpeLS2b8imZ5jbQiULhZe2/s5p9Ye8
 sy+NL9x+tIe03pJ6gkpcTw==
X-Google-Smtp-Source: APiQypIpNnaMBruMNCU96VU9Vfk7isUuz5/L9xxODbz2kzqcpR2dMgbsqjWbTd1c/xhsSPmtI+Siog==
X-Received: by 2002:a17:902:8643:: with SMTP id y3mr64696plt.149.1588268188682; 
 Thu, 30 Apr 2020 10:36:28 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:d32:dd79:2591:468a:ee81:9c85])
 by smtp.gmail.com with ESMTPSA id l30sm337331pgu.29.2020.04.30.10.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 10:36:27 -0700 (PDT)
From: madhuparnabhowmik10@gmail.com
To: pbonzini@redhat.com,
	cai@lca.pw
Date: Thu, 30 Apr 2020 23:06:08 +0530
Message-Id: <20200430173608.14663-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: kvm@vger.kernel.org, paulmck@kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] kvm: Fix false-positive RCU list
	related warnings
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

This patch fixes the following warning and other usage of
RCU list in eventfd.c

[29179.937976][T75781] WARNING: suspicious RCU usage
[29179.942789][T75781] 5.7.0-rc3-next-20200429 #1 Tainted: G           O L
[29179.949752][T75781] -----------------------------
[29179.954498][T75781] arch/x86/kvm/../../../virt/kvm/eventfd.c:472 RCU-list traversed in non-reader section!!

Pass srcu_read_lock_held() as cond to list_for_each_entry_rcu().

Reported-by: Qian Cai <cai@lca.pw>
Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 virt/kvm/eventfd.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 67b6fc153e9c..a23787693127 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -77,7 +77,8 @@ irqfd_resampler_ack(struct kvm_irq_ack_notifier *kian)
 
 	idx = srcu_read_lock(&kvm->irq_srcu);
 
-	list_for_each_entry_rcu(irqfd, &resampler->list, resampler_link)
+	list_for_each_entry_rcu(irqfd, &resampler->list, resampler_link,
+				 srcu_read_lock_held(&kvm->irq_srcu))
 		eventfd_signal(irqfd->resamplefd, 1);
 
 	srcu_read_unlock(&kvm->irq_srcu, idx);
@@ -452,7 +453,7 @@ bool kvm_irq_has_notifier(struct kvm *kvm, unsigned irqchip, unsigned pin)
 	gsi = kvm_irq_map_chip_pin(kvm, irqchip, pin);
 	if (gsi != -1)
 		hlist_for_each_entry_rcu(kian, &kvm->irq_ack_notifier_list,
-					 link)
+					 link, srcu_read_lock_held(&kvm->irq_srcu))
 			if (kian->gsi == gsi) {
 				srcu_read_unlock(&kvm->irq_srcu, idx);
 				return true;
@@ -469,7 +470,7 @@ void kvm_notify_acked_gsi(struct kvm *kvm, int gsi)
 	struct kvm_irq_ack_notifier *kian;
 
 	hlist_for_each_entry_rcu(kian, &kvm->irq_ack_notifier_list,
-				 link)
+				 link, srcu_read_lock_held(&kvm->irq_srcu))
 		if (kian->gsi == gsi)
 			kian->irq_acked(kian);
 }
@@ -960,3 +961,4 @@ kvm_ioeventfd(struct kvm *kvm, struct kvm_ioeventfd *args)
 
 	return kvm_assign_ioeventfd(kvm, args);
 }
+
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
