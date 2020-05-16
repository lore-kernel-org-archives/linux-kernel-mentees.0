Return-Path: <SRS0=xHEe=66=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6558CC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 16 May 2020 08:22:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EBC4206F4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 16 May 2020 08:22:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSHTwd5e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2EBC4206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C7E4D87E20;
	Sat, 16 May 2020 08:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FDvcfrCIcNAP; Sat, 16 May 2020 08:22:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5D1C5878F6;
	Sat, 16 May 2020 08:22:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5204DC0859;
	Sat, 16 May 2020 08:22:41 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45008C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 May 2020 08:22:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2C5CC89717
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 May 2020 08:22:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kz2jlK-+1mt2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 May 2020 08:22:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AB56F89715
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 May 2020 08:22:39 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id f15so1915167plr.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 16 May 2020 01:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=n8zeuSyWYmnUTCcGG4KcbVscwA04lg+t/YXhdGOdoRk=;
 b=kSHTwd5eDGUl/K2MsusgZkFTMR3AophuUBe1kXDJlVfE5ua9O9OGjGOTYBUA3y5LCn
 8hfYpuOH9CiRvEIBKKz0DdncM80p7x2LCzSJsHtx9GOPiVNuYor8fBKkYpooLG+K18tI
 8c2l3vKaAQh3GcMZwwMvWipE1/aFXrVcw2aOz/ihBV690LmRmrcCqn4JXXF9u7tpAnRQ
 ymfsLBjAXaAY2/IYj7vPtMnKY5CNAK5wHgJ846IwYx/qZmLwhq4NKXE0mqvPU0LgGQxw
 YgOazcAPN8DRZkJWwS5Ds8FcdLH04a4/lCqZhFVRLctKTXmMN+hM+6Jb5xlsWjDkNWYd
 sudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=n8zeuSyWYmnUTCcGG4KcbVscwA04lg+t/YXhdGOdoRk=;
 b=ZQzddS/7eOsX9Ck2Nu13X3AxVGmrgUYVgs25MNl2NS+gNWmNFeUDSlZpgkq2PE8zMF
 2FupQmWP+g2Q524tKUXr9z/ewhlLx0wSYGyCquqK6ZbwM1QQZmGWGemzl9/LFBjf0dwg
 4JN+vAUyFgl225bHgMCXtwQbUTGyeWZHJjnbBjcxRNvkGadO1kTrujeQJHD1nwo1fc5i
 GkOuz07UqL+nr0Q05bxIdqEDOkWv96zZUVxvhcVXkrr1XNRRBFIW/1Ls3ydzPx9dgtKv
 S/d99X2yEiwumA0cFTgNsQSE4pqoELwrLSjv4+JmmYlK3iYwAY1JcZAQhxshk33AbK+j
 vSLw==
X-Gm-Message-State: AOAM531Q+G7bRKHDvOMC80mRPQGwU+KcMHTUfF9jCMIMD3/E4PdqO113
 HBgEKoW5d3SG/jdHkF2wOA==
X-Google-Smtp-Source: ABdhPJy0lauqLn17lbGE3w8KJHGHD9NuhDV2LLqXRRaRQTMDJP5PCGFyuaHLhQCh2EmHugUqCHILZg==
X-Received: by 2002:a17:90b:1492:: with SMTP id
 js18mr1459691pjb.212.1589617359233; 
 Sat, 16 May 2020 01:22:39 -0700 (PDT)
Received: from localhost.localdomain
 ([2402:3a80:13a5:a61b:b5d4:b438:1bc1:57f3])
 by smtp.gmail.com with ESMTPSA id j7sm3695288pfi.160.2020.05.16.01.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 May 2020 01:22:38 -0700 (PDT)
From: madhuparnabhowmik10@gmail.com
To: pbonzini@redhat.com, sean.j.christopherson@intel.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, tglx@linutronix.de,
 bp@alien8.de
Date: Sat, 16 May 2020 13:52:27 +0530
Message-Id: <20200516082227.22194-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: kvm@vger.kernel.org, paulmck@kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] kvm: Fix false positive RCU usage
	warning
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

Fix the following false positive warnings:

[ 9403.765413][T61744] =============================
[ 9403.786541][T61744] WARNING: suspicious RCU usage
[ 9403.807865][T61744] 5.7.0-rc1-next-20200417 #4 Tainted: G             L
[ 9403.838945][T61744] -----------------------------
[ 9403.860099][T61744] arch/x86/kvm/mmu/page_track.c:257 RCU-list traversed in non-reader section!!

and

[ 9405.859252][T61751] =============================
[ 9405.859258][T61751] WARNING: suspicious RCU usage
[ 9405.880867][T61755] -----------------------------
[ 9405.911936][T61751] 5.7.0-rc1-next-20200417 #4 Tainted: G             L
[ 9405.911942][T61751] -----------------------------
[ 9405.911950][T61751] arch/x86/kvm/mmu/page_track.c:232 RCU-list traversed in non-reader section!!

Since srcu read lock is held, these are false positive warnings.
Therefore, pass condition srcu_read_lock_held() to
list_for_each_entry_rcu().

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
v2:
-Rebase v5.7-rc5

 arch/x86/kvm/mmu/page_track.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/page_track.c b/arch/x86/kvm/mmu/page_track.c
index ddc1ec3bdacd..1ad79c7aa05b 100644
--- a/arch/x86/kvm/mmu/page_track.c
+++ b/arch/x86/kvm/mmu/page_track.c
@@ -229,7 +229,8 @@ void kvm_page_track_write(struct kvm_vcpu *vcpu, gpa_t gpa, const u8 *new,
 		return;
 
 	idx = srcu_read_lock(&head->track_srcu);
-	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node)
+	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node,
+				srcu_read_lock_held(&head->track_srcu))
 		if (n->track_write)
 			n->track_write(vcpu, gpa, new, bytes, n);
 	srcu_read_unlock(&head->track_srcu, idx);
@@ -254,7 +255,8 @@ void kvm_page_track_flush_slot(struct kvm *kvm, struct kvm_memory_slot *slot)
 		return;
 
 	idx = srcu_read_lock(&head->track_srcu);
-	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node)
+	hlist_for_each_entry_rcu(n, &head->track_notifier_list, node,
+				srcu_read_lock_held(&head->track_srcu))
 		if (n->track_flush_slot)
 			n->track_flush_slot(kvm, slot, n);
 	srcu_read_unlock(&head->track_srcu, idx);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
