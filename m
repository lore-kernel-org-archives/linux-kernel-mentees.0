Return-Path: <SRS0=+2mV=3M=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F61C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 14:53:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E3E121835
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 23 Jan 2020 14:53:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFUCclZb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E3E121835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2D72C2043D;
	Thu, 23 Jan 2020 14:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t7hHUGo04BcN; Thu, 23 Jan 2020 14:53:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 7756A2042C;
	Thu, 23 Jan 2020 14:53:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B9EDC0176;
	Thu, 23 Jan 2020 14:53:58 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 035D9C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 14:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id ED16A86B12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 14:53:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SWC6qB8FNWhf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 14:53:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7DBD686B11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 14:53:56 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id n9so1636330pff.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Jan 2020 06:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=gx1EwHhSeFAygAuuMCDt/vxczuYsXqL8AapATfNX7y8=;
 b=VFUCclZbsvs3ZYUE86h0BVB6542Nh/HbW0yALhQI9boAo07OpF99xuKWuhlGDBTVxq
 mX7S38mG1dVdVZ4scl37EJFo06E1JlA+w5S67OIBhcOcj99mA6/WXvnaA7qwLOomD7zX
 LxP/fa1TGRCaYGqYGXZTFJhaXd0YPTXYIhH2ycGMovnVFf5lZrJlCknZ2tlvCAHh1mXD
 KySUmdepz5hkHoGY24P8TtSto5IsSsMlDPJmjnxcyFU89hMKaryDZMBMSzDYVZvcHpEZ
 Nu4WsFHqPSa7/i1MMK636JOHUwJFlvT1q5Pnf667EQcLC485+XsaNE/uIRLFGODYxMAy
 VeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gx1EwHhSeFAygAuuMCDt/vxczuYsXqL8AapATfNX7y8=;
 b=gtt8FFYF8PrmVTuaRcDUAuUL3CNyRMTNMZkjZU5iFADwst/tmxHzlhYlnfYSz3G5eE
 2UvWvYa2/rxj+2yufbmuWA9ijZzJmmoE0FQXzv+2GktPSEvyguKdAdgwxsI03ZLTMfn1
 xgoIKf+v5r02k76yNsqXiJE9OtGlJ1lMQti5i1LCphSq42EsPuKwuf1OAG+EUAlYXg4q
 QZaWpP82eQlTFC4UPTmGkn5gpJIeiy8T53Y3TuRMaHGVK2MnCODZ+ckgdEe/MwACbcZw
 N7Qncbt5XJfLgO+IAOj7udO9gUiRLbY7O/bN+JeJPK7NfEAhJ+6mn5AtzZ8cz0qM9mOV
 AlPA==
X-Gm-Message-State: APjAAAV73pO4dtvhwmPwmZ023ZsVlpvAM9KB8+ZDxcuPttnxdbC6mbww
 u28TMKbOP35pslq0Jn0q/w==
X-Google-Smtp-Source: APXvYqzuuPGh4gpKk33IILFsa7XJBoe6la2FVwOIjW02LC/QfoGe4XDCFdwUi/OzBda0oBPz4ggbWQ==
X-Received: by 2002:a63:213:: with SMTP id 19mr4382178pgc.160.1579791236088;
 Thu, 23 Jan 2020 06:53:56 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee5:f6bd:65db:7abb:c28f:eeed])
 by smtp.gmail.com with ESMTPSA id o184sm3206955pgo.62.2020.01.23.06.53.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2020 06:53:55 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, ebiederm@xmission.com,
 christian.brauner@ubuntu.com, oleg@redhat.com, paulmck@kernel.org
Date: Thu, 23 Jan 2020 20:23:05 +0530
Message-Id: <20200123145305.10652-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] sched.h: Annotate sighand_struct
	with __rcu
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

This patch fixes the following sparse errors by annotating the
sighand_struct with __rcu

kernel/fork.c:1511:9: error: incompatible types in comparison expression
kernel/exit.c:100:19: error: incompatible types in comparison expression
kernel/signal.c:1370:27: error: incompatible types in comparison expression

This fix introduces the following sparse error in signal.c due to
checking the sighand pointer without rcu primitives:

kernel/signal.c:1386:21: error: incompatible types in comparison expression

This new sparse error is also addressed in this patch.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 include/linux/sched.h | 2 +-
 kernel/signal.c       | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index b511e178a89f..7a351360ad54 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -918,7 +918,7 @@ struct task_struct {
 
 	/* Signal handlers: */
 	struct signal_struct		*signal;
-	struct sighand_struct		*sighand;
+	struct sighand_struct __rcu		*sighand;
 	sigset_t			blocked;
 	sigset_t			real_blocked;
 	/* Restored if set_restore_sigmask() was used: */
diff --git a/kernel/signal.c b/kernel/signal.c
index bcd46f547db3..1272def37462 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -1383,7 +1383,8 @@ struct sighand_struct *__lock_task_sighand(struct task_struct *tsk,
 		 * must see ->sighand == NULL.
 		 */
 		spin_lock_irqsave(&sighand->siglock, *flags);
-		if (likely(sighand == tsk->sighand))
+		if (likely(sighand == rcu_dereference_protected(tsk->sighand,
+						lockdep_is_held(&sighand->siglock))))
 			break;
 		spin_unlock_irqrestore(&sighand->siglock, *flags);
 	}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
