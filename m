Return-Path: <SRS0=uoqP=3Z=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 599B7C35247
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 17:24:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CD3820702
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  5 Feb 2020 17:24:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqmHy6Fl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CD3820702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D633687592;
	Wed,  5 Feb 2020 17:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HG2X59PGoC5U; Wed,  5 Feb 2020 17:24:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 601D88750A;
	Wed,  5 Feb 2020 17:24:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46526C0175;
	Wed,  5 Feb 2020 17:24:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C3C9FC0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 17:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BA59A20418
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 17:24:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gM8O1-wHCzuQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 17:24:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 2719620399
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  5 Feb 2020 17:24:47 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id m13so1277930pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 05 Feb 2020 09:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=O6f8gSgy3dUNcsUeRgZv0meSXKvjWlJqGpm0K3VBOCs=;
 b=pqmHy6FlDFSnQTIoMyzxnCIO3vTFZBIJD8KS7Z+9fLKfInJEp4+siGb96YZdi2U/vq
 gpiTIcphcC5tJSNHywZtP46vitKr8JYlaNWJ+5mLDRVSs8rPMPp9HCd80OUajqkZjXoU
 tpz6igUy92z8T7nMp/mMC+LvlqhQH0pIdYrctucWZBrqgxUWcyRGfj+3oNNyjIA6Nwrn
 6Q6NM6A53DtEBINqLyR/FdVA0ub5Hvb8ArLEu98csLwjFBC0Fvy3goCT4AMlAMRfBstr
 viyAPXhdj3bu2kYouTvGwfut6IFdzzoUMjNl6YfyBeMOR7MWyCmHTHNyUWXScbQ9f8Sq
 0RnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=O6f8gSgy3dUNcsUeRgZv0meSXKvjWlJqGpm0K3VBOCs=;
 b=MAOo/gyrFUrq6yRSC9HeudB6ajVSUoqx+9eJPJmyAI/nQwdp9G8X1IORTb5D6tFz3E
 /fJYafWLhc2D/j+I871SsWS2xk3W/7xKNLEcte8RDykvBvz1bpbenDtTEzlhDwuja3wz
 XFcDfmTSoBAFWA1sTDGH9xOD8ZFdKiemcVpFyexXAOYImJNSJKWaXxmwf3IbqAgdkMxb
 NJ3EtRYKV79GoFI4aGW9ZuHKnTkeIgCpzT2v855eJr/CZJK7VR7ZjojMtba7TBYhfQQj
 V/l6WhvaB92Eg/GWMcPp+03LIkgqzRS3OyI+ETquOuMzYTi2/IDfTjTAPvB3yqs1BrIR
 /DfA==
X-Gm-Message-State: APjAAAXB2DHKSHtijvpNVUpW7KsvgR9JMVt4nk6us+SHEqZ4bCiktfYW
 6wOsRfRyLhQ6LZZyfdl4ug==
X-Google-Smtp-Source: APXvYqxtTBOgoPDcxh6PIkSnVx/zJCV3zhZwsNOWrF+JuOTPHDX4FolSZAmV6z8eyurcnom2FdvQ2A==
X-Received: by 2002:a17:90a:7303:: with SMTP id
 m3mr6915519pjk.62.1580923486794; 
 Wed, 05 Feb 2020 09:24:46 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:542:9945:9d58:40ca:c55a:7c02])
 by smtp.gmail.com with ESMTPSA id w11sm106767pfn.4.2020.02.05.09.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 09:24:46 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: ebiederm@xmission.com, oleg@redhat.com, christian.brauner@ubuntu.com,
 guro@fb.com, tj@kernel.org
Date: Wed,  5 Feb 2020 22:54:37 +0530
Message-Id: <20200205172437.10113-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] signal.c: Fix sparse warnings
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

This patch fixes the following two sparse warnings caused due to
accessing RCU protected pointer tsk->parent without rcu primitives.

kernel/signal.c:1948:65: warning: incorrect type in argument 1 (different address spaces)
kernel/signal.c:1948:65:    expected struct task_struct *tsk
kernel/signal.c:1948:65:    got struct task_struct [noderef] <asn:4> *parent
kernel/signal.c:1949:40: warning: incorrect type in argument 1 (different address spaces)
kernel/signal.c:1949:40:    expected void const volatile *p
kernel/signal.c:1949:40:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *
kernel/signal.c:1949:40: warning: incorrect type in argument 1 (different address spaces)
kernel/signal.c:1949:40:    expected void const volatile *p
kernel/signal.c:1949:40:    got struct cred const [noderef] <asn:4> *[noderef] <asn:4> *

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 kernel/signal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index 9ad8dea93dbb..8227058ea8c4 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1945,8 +1945,8 @@ bool do_notify_parent(struct task_struct *tsk, int sig)
 	 * correct to rely on this
 	 */
 	rcu_read_lock();
-	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(tsk->parent));
-	info.si_uid = from_kuid_munged(task_cred_xxx(tsk->parent, user_ns),
+	info.si_pid = task_pid_nr_ns(tsk, task_active_pid_ns(rcu_dereference(tsk->parent)));
+	info.si_uid = from_kuid_munged(task_cred_xxx(rcu_dereference(tsk->parent), user_ns),
 				       task_uid(tsk));
 	rcu_read_unlock();
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
