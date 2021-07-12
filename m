Return-Path: <SRS0=bgCq=ME=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F4FFC07E9E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Jul 2021 04:36:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 28D74610D2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Jul 2021 04:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 28D74610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0F95835D3;
	Mon, 12 Jul 2021 04:36:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LAzkK_VdhB6e; Mon, 12 Jul 2021 04:36:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 96E7D83547;
	Mon, 12 Jul 2021 04:36:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83495C0010;
	Mon, 12 Jul 2021 04:36:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA6FCC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 04:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9BD0A60709
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 04:36:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QSelhgEncYjm
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 04:36:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BD43605DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Jul 2021 04:36:01 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id cu14so4082218pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Jul 2021 21:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eqtuem0pDCqJ60ReBSt2sz2Ppq+kBwO0k3flKmvt0YI=;
 b=gpVU+Nizwy5fV7c592OCz5zlkJDtckkKHt+t8+m6hBQ3v6VktI37EJhTyrTUCRWDDJ
 b3plmZo9+FSFIt+Z+UUXPTDQ3ClQGN0xYSecEYW4uCTOTzZ38Vrj2Y1XpcH1mtoX09zX
 o5jDp4tZqaIxD77sQOOi01uTTGC+DWpf6OaNU3aCMwS+g6tjB3LsJ4ICiA0aLdqR5P6e
 WU91eDHeLOeBsm6wS+pqNydu/XtYdXjglcTrjvyxC6VZQasDQ2Ho0qe+FQJ1P8agROsb
 CPMYKT4cEoedcN2dKSZSDbZsGYojW/RAwBbsH00eF81UuyITQRI5v7uOGBTVDawQj+8c
 Y70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eqtuem0pDCqJ60ReBSt2sz2Ppq+kBwO0k3flKmvt0YI=;
 b=V+HCiuhKfvmU2lkvcCRVMHDE3poJJnFdadlpD5/nTfRxiPJTT+IRq+2mtBaR9jq+CE
 xkVi7fIoxfdtrN0HM6LuNwPIK5kNfVc42XLk/WF/8yJMOz5cHEr4PxELADy3tzE+chVn
 FclULabFE6pVXiJ+jxFBxaKwW2pJMbr1rwQOOvlHw/o7r7S6NJppRHm0wEvBbFO94S3w
 WjdH4yKkaPA9TT98KhWXBQaLNSKtxLFtc2/8fFq2XUgMOTC3ooBd4nr35opK6J1ktmEI
 f1T7xcv4eDPtMA+LyIHmiGXS7X1vy2C4x+zdgqBsc82RYrgY1W7sX0yuhjFYqOhI2zXG
 SrOw==
X-Gm-Message-State: AOAM533plh853oAq0ncnoPE2OF3h0OPHsor36eldvDvvHbh4PU1vuB8A
 tphUfHqePOJEHzJjtQZMfvM=
X-Google-Smtp-Source: ABdhPJycCswKA9Nno/Iq/J/lSwP8BAVU6u7omTvZ3+UDJe82eUYASx3d6Wullh/KvRQpYfU0QCH8xg==
X-Received: by 2002:a17:90a:2dce:: with SMTP id
 q14mr28029561pjm.42.1626064561464; 
 Sun, 11 Jul 2021 21:36:01 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id n3sm14242764pfn.216.2021.07.11.21.35.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 21:36:01 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org,
 christian.koenig@amd.com
Subject: [PATCH v8 2/5] drm: avoid blocking in drm_clients_info's rcu section
Date: Mon, 12 Jul 2021 12:35:05 +0800
Message-Id: <20210712043508.11584-3-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210712043508.11584-1-desmondcheongzx@gmail.com>
References: <20210712043508.11584-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: intel-gfx@lists.freedesktop.org, emil.l.velikov@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-media@vger.kernel.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Inside drm_clients_info, the rcu_read_lock is held to lock
pid_task()->comm. However, within this protected section, a call to
drm_is_current_master is made, which involves a mutex lock in a future
patch. However, this is illegal because the mutex lock might block
while in the RCU read-side critical section.

Since drm_is_current_master isn't protected by rcu_read_lock, we avoid
this by moving it out of the RCU critical section.

The following report came from intel-gfx ci's
igt@debugfs_test@read_all_entries testcase:

=============================
[ BUG: Invalid wait context ]
5.13.0-CI-Patchwork_20515+ #1 Tainted: G        W
-----------------------------
debugfs_test/1101 is trying to lock:
ffff888132d901a8 (&dev->master_mutex){+.+.}-{3:3}, at:
drm_is_current_master+0x1e/0x50
other info that might help us debug this:
context-{4:4}
3 locks held by debugfs_test/1101:
 #0: ffff88810fdffc90 (&p->lock){+.+.}-{3:3}, at:
 seq_read_iter+0x53/0x3b0
 #1: ffff888132d90240 (&dev->filelist_mutex){+.+.}-{3:3}, at:
 drm_clients_info+0x63/0x2a0
 #2: ffffffff82734220 (rcu_read_lock){....}-{1:2}, at:
 drm_clients_info+0x1b1/0x2a0
stack backtrace:
CPU: 8 PID: 1101 Comm: debugfs_test Tainted: G        W
5.13.0-CI-Patchwork_20515+ #1
Hardware name: Intel Corporation CometLake Client Platform/CometLake S
UDIMM (ERB/CRB), BIOS CMLSFWR1.R00.1263.D00.1906260926 06/26/2019
Call Trace:
 dump_stack+0x7f/0xad
 __lock_acquire.cold.78+0x2af/0x2ca
 lock_acquire+0xd3/0x300
 ? drm_is_current_master+0x1e/0x50
 ? __mutex_lock+0x76/0x970
 ? lockdep_hardirqs_on+0xbf/0x130
 __mutex_lock+0xab/0x970
 ? drm_is_current_master+0x1e/0x50
 ? drm_is_current_master+0x1e/0x50
 ? drm_is_current_master+0x1e/0x50
 drm_is_current_master+0x1e/0x50
 drm_clients_info+0x107/0x2a0
 seq_read_iter+0x178/0x3b0
 seq_read+0x104/0x150
 full_proxy_read+0x4e/0x80
 vfs_read+0xa5/0x1b0
 ksys_read+0x5a/0xd0
 do_syscall_64+0x39/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/drm_debugfs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 3d7182001004..b0a826489488 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -91,6 +91,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
 	mutex_lock(&dev->filelist_mutex);
 	list_for_each_entry_reverse(priv, &dev->filelist, lhead) {
 		struct task_struct *task;
+		bool is_current_master = drm_is_current_master(priv);
 
 		rcu_read_lock(); /* locks pid_task()->comm */
 		task = pid_task(priv->pid, PIDTYPE_PID);
@@ -99,7 +100,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
 			   task ? task->comm : "<unknown>",
 			   pid_vnr(priv->pid),
 			   priv->minor->index,
-			   drm_is_current_master(priv) ? 'y' : 'n',
+			   is_current_master ? 'y' : 'n',
 			   priv->authenticated ? 'y' : 'n',
 			   from_kuid_munged(seq_user_ns(m), uid),
 			   priv->magic);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
