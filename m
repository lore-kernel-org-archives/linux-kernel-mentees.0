Return-Path: <SRS0=D/cX=MZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC08C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 11:01:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFFFD60E76
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  2 Aug 2021 11:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFFFD60E76
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 927E04031B;
	Mon,  2 Aug 2021 11:01:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r7UQyymK_XdR; Mon,  2 Aug 2021 11:01:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B8B73402EC;
	Mon,  2 Aug 2021 11:01:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 973ECC001B;
	Mon,  2 Aug 2021 11:01:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 59381C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 11:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AEE34030C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 11:01:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UONNhRNVGYv3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 11:01:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB43A402EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Aug 2021 11:01:14 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so31003914pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 02 Aug 2021 04:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SBgORfE72/F8bvZ2E4Lkq7+Ur0TIBEwAuizWaZ2J00o=;
 b=nUF8d8HONixMnqI8KfeSi0XX6vf8czl8bmAdM5TZSurKWyLuq8slGlZ1u/ExTag0wL
 +WL30oVTWsvET+Btxr2a673Ykcm181eET849f3aGJIpKEvwr93Y2UesTHhvG24sNhbMe
 keTVOzXxcwRmlnoWysth40LzL80I6ca33GM/5GM/aiGZk7VbTx2XkHjpSu/L5Yndup13
 myM+rAua1+qQ4fQHRvD1XZyBSCZ3jK1Vz77BruQvm++/e/2drm9tj5QadwfNcBw/GGNi
 a86DwgmmBgqwyhkhfos8IjB3TQiTuI7UdDscFzzdq1VUtowC1HU0fh1f+1GKO7gDZxcs
 0JiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SBgORfE72/F8bvZ2E4Lkq7+Ur0TIBEwAuizWaZ2J00o=;
 b=IGFxsnqBCN00j7QhEJie1Mj3qT29jXUW8819+DejL/nk6L4Pm/CFEsMwVo0mvFgYmY
 ooNyemB1ornRA1n37I8QrgfAvsmOowpj0B7j74aEMeP32RisSx409X04mNAJrIkvTDs1
 As8FiKbhMEbymkgWgQpyjvPpI8TADJG6Qt/C6A1eJgjznTXHZkStptKPQYggi5bwZw0C
 +Q0WPRT4takNTEno+vjHGXU58yNAPhLQF3vvY8RH5fP3Yu/5KjwTnxTLafGr38pGvM7e
 Zv3QuYSICu7MgFvLi4+2za8Pt/oDysCixGl6QWf40YUqlsOUHtZcRqBeM+FB5VkBpPUs
 FKYw==
X-Gm-Message-State: AOAM532/NuOwI0nYZD3EKJZofWVRdCvvzaZ71WmPikA5ATWE51j8pnEO
 mFtDXdDXOTdNNwzWyIGOM4uJXiCSZUlMZk4m1p4=
X-Google-Smtp-Source: ABdhPJwGS8bFSLMvhhOrzq+iAjlK4pB4O1Rc9eIPpiwmKOfHgMBD/1xSQLFZW4Vl2TiTSWMuYQnz0w==
X-Received: by 2002:a17:90a:ab0b:: with SMTP id
 m11mr16262296pjq.221.1627902074168; 
 Mon, 02 Aug 2021 04:01:14 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id v30sm9709158pgk.25.2021.08.02.04.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 04:01:13 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, peterz@infradead.org, mingo@redhat.com,
 will@kernel.org, longman@redhat.com, boqun.feng@gmail.com,
 sumit.semwal@linaro.org, christian.koenig@amd.com
Subject: [RESEND PATCH v2 1/2] locking/lockdep: Provide lockdep_assert{,
 _once}() helpers
Date: Mon,  2 Aug 2021 18:59:56 +0800
Message-Id: <20210802105957.77692-2-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802105957.77692-1-desmondcheongzx@gmail.com>
References: <20210802105957.77692-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
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

From: Peter Zijlstra <peterz@infradead.org>

Extract lockdep_assert{,_once}() helpers to more easily write composite
assertions like, for example:

	lockdep_assert(lockdep_is_held(&drm_device.master_mutex) ||
		       lockdep_is_held(&drm_file.master_lookup_lock));

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Acked-by: Boqun Feng <boqun.feng@gmail.com>
Acked-by: Waiman Long <longman@redhat.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 include/linux/lockdep.h | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 5cf387813754..9fe165beb0f9 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -306,31 +306,29 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 
 #define lockdep_depth(tsk)	(debug_locks ? (tsk)->lockdep_depth : 0)
 
-#define lockdep_assert_held(l)	do {					\
-		WARN_ON(debug_locks &&					\
-			lockdep_is_held(l) == LOCK_STATE_NOT_HELD);	\
-	} while (0)
+#define lockdep_assert(cond)		\
+	do { WARN_ON(debug_locks && !(cond)); } while (0)
 
-#define lockdep_assert_not_held(l)	do {				\
-		WARN_ON(debug_locks &&					\
-			lockdep_is_held(l) == LOCK_STATE_HELD);		\
-	} while (0)
+#define lockdep_assert_once(cond)	\
+	do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
 
-#define lockdep_assert_held_write(l)	do {			\
-		WARN_ON(debug_locks && !lockdep_is_held_type(l, 0));	\
-	} while (0)
+#define lockdep_assert_held(l)		\
+	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
 
-#define lockdep_assert_held_read(l)	do {				\
-		WARN_ON(debug_locks && !lockdep_is_held_type(l, 1));	\
-	} while (0)
+#define lockdep_assert_not_held(l)	\
+	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
 
-#define lockdep_assert_held_once(l)	do {				\
-		WARN_ON_ONCE(debug_locks && !lockdep_is_held(l));	\
-	} while (0)
+#define lockdep_assert_held_write(l)	\
+	lockdep_assert(lockdep_is_held_type(l, 0))
 
-#define lockdep_assert_none_held_once()	do {				\
-		WARN_ON_ONCE(debug_locks && current->lockdep_depth);	\
-	} while (0)
+#define lockdep_assert_held_read(l)	\
+	lockdep_assert(lockdep_is_held_type(l, 1))
+
+#define lockdep_assert_held_once(l)		\
+	lockdep_assert_once(lockdep_is_held(l) != LOCK_STATE_NOT_HELD)
+
+#define lockdep_assert_none_held_once()		\
+	lockdep_assert_once(!current->lockdep_depth)
 
 #define lockdep_recursing(tsk)	((tsk)->lockdep_recursion)
 
@@ -407,6 +405,9 @@ extern int lock_is_held(const void *);
 extern int lockdep_is_held(const void *);
 #define lockdep_is_held_type(l, r)		(1)
 
+#define lockdep_assert(c)			do { } while (0)
+#define lockdep_assert_once(c)			do { } while (0)
+
 #define lockdep_assert_held(l)			do { (void)(l); } while (0)
 #define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
 #define lockdep_assert_held_write(l)		do { (void)(l); } while (0)
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
