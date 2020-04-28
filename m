Return-Path: <SRS0=fGqK=6M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB35C83008
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 15:53:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72AA1205C9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Apr 2020 15:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fr2F0Coj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72AA1205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0E0E184539;
	Tue, 28 Apr 2020 15:53:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u-7yifiLXJgb; Tue, 28 Apr 2020 15:53:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8CD8D844C9;
	Tue, 28 Apr 2020 15:53:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 779F7C0863;
	Tue, 28 Apr 2020 15:53:01 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2987C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 15:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id EE55B87613
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 15:52:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jKriXhmjkprF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 15:52:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6BA1287605
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 15:52:59 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id f7so10846985pfa.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Apr 2020 08:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2c6uCE675m96/FbxOp/+YpjzTr8Ax/d5qUPMW5Gsuec=;
 b=fr2F0CojibBY6glD0TM6oVEEfkQR6dQ6Xta08+rELpBa63RJXHlQ2mjr8SnXIaQlFy
 9RQMGLd8lLgdOc1MTp+Wi0GWvc8S3nW8SVXeYeY/0/LC0PPafhRG+4JF7ffkYgvIhxDV
 7maE/trbhJ6Ios0CzPbWJTvYGUwsvrflXuGW/+tYnfQG4M7EFqyKKflPqIITL47MKb/Z
 d7VUKbgKbZywljxEDdeQCIfdJ1rAql+/0UW4r3avCnc46Ccf6GpzeSV35ZCihxt4DCZR
 5kD8b0tsu/Fno/T+Ax8w+h8OjNbveBrMTs3Xg8R6+CEP4e6Uzp08FvHSxdaco3GMQ2Zy
 Uqkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2c6uCE675m96/FbxOp/+YpjzTr8Ax/d5qUPMW5Gsuec=;
 b=X3/2JZ/Gep5PKVYgragsW5Ni825wJUeR9MrKIKLDQW5AGUpXnBqaSe4vaf8GgOsfYn
 9r4jfB35X2ndlZT4CuYLVk2mQC96hb+rT2LdMrprjhQUkePdytGpqhbBgYNtBrt75Y3t
 5fEu0Qvt7ym73103T0xJy0ysKokI4X6afhj4EHvxDoq29D1CvAlQ5zKkIO6r2U7OFQv4
 /YUwEO9+kXMT7Fwqr/nBZBfJAb0umioCjqewYK9KQbjJaTjtwm1WmruUZsIPRi6CZDAG
 20Vv9vdWhLRSRPTYA2+ZpPc6xQnwxIt7LjVQ33RN69Tm0hMgMCFwKf3vveNFf9e/n5K4
 XyVg==
X-Gm-Message-State: AGi0PuZYJWg3FhfvwM8RGKmuphSg/CDeKB154VMX+l6tyShvoWmtYx8M
 kJWsiUE+7SkV5JnBDUFfsg==
X-Google-Smtp-Source: APiQypLkMPf9eFxnHsSePauRQebG54rsN5Dm5KoC2usbs2Crxz6EJNZG48I0Ks+vIHv3SzRpf3pkAg==
X-Received: by 2002:a63:2403:: with SMTP id k3mr28091220pgk.295.1588089179049; 
 Tue, 28 Apr 2020 08:52:59 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:d33:c58:9c84:8ece:9d0f:426b])
 by smtp.gmail.com with ESMTPSA id
 mn1sm2410814pjb.24.2020.04.28.08.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 08:52:58 -0700 (PDT)
From: madhuparnabhowmik10@gmail.com
To: sean.j.christopherson@intel.com, wanpengli@tencent.com,
 jmattson@google.com, tglx@linutronix.de, bp@alien8.de, mingo@redhat.com
Date: Tue, 28 Apr 2020 21:22:49 +0530
Message-Id: <20200428155249.19990-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, kvm@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, cai@lca.pw,
 joel@joelfernandes.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] kvm: Fix false positive RCU usage
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
