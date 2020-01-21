Return-Path: <SRS0=cM1+=3K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41144C2D0CE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 13:12:43 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0302A21569
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 13:12:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8J8xUgv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0302A21569
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CD92485683;
	Tue, 21 Jan 2020 13:12:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k9qsW0bj8caF; Tue, 21 Jan 2020 13:12:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id DDFF685660;
	Tue, 21 Jan 2020 13:12:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B609BC0176;
	Tue, 21 Jan 2020 13:12:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 30830C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 13:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1E14C20013
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 13:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vAeL1R3-ogoa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 13:12:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 8FC0220012
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 13:12:27 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id s94so994234pjc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 05:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mV1qixM+hRHgqOUWXlliAy9s0rAvz7UfT2PUrmz0Bbg=;
 b=Z8J8xUgv8y94kuhtX71q1/CgB8A/sNC1KYd1fA4XQ8dsGsaiP8ZgINBuCPnzRg4jHV
 CderUAy51B78k5hydIFo8YC5g4HekpmRgr3HyEQaYAgvf6qtS8Aji3Xgdw3dAdkh7Lu9
 rbyrLtr0sphBHAJXTzNAIU/PPtgvQu1s9enlYvGdqLY7A+118uke39A8zjn1l+gy0Csu
 u1H7QAonjdPZPsxVEQjA9Cq5C0irlKLA3lGcMYyt7ZKo4oSVRQtsag//IGj7nJHYLaXg
 C5a0GPYzOBtZkQzlXuV2WhmR17axvDCbDCM8N3tX/9uSQmdOy+L85hYnf/5L1kItG67Y
 FSEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mV1qixM+hRHgqOUWXlliAy9s0rAvz7UfT2PUrmz0Bbg=;
 b=XV/fLhIOce81lg9JRMWfQZnZgaXjiudi+p2fgTH6xC3Kc0Q4sy+qL+1ivRUxsTrNpF
 C5XUlCgz67BHxy4juc1FlCItrKmoAbonFjlsqUaW8OZnCTIakdwAKGoH6VxVRWh91cY5
 H2F1nbXlwQY5OveTpyFxN9PalqppZjSDT4yALEw5xJomc5i57aHmXYBKUHnUU5EFWQzB
 jiJ+8JfwAeFmV4p7kxu3b37Ki7jjQxWqAns9TDKFTrBLEYaREOayeFDUu9oAm/x3oK74
 LjT4MJELi/UyrIiFgjYCYLs1yA7hY35rNQZLM7cowuIygFpUl9fiia2hsVYqDvnllKo4
 hJGg==
X-Gm-Message-State: APjAAAX7DZf5jygotXfxh7+xia9Z4IE/yTl/IAvjVy+Jqomx3EP+Orh3
 1gZTgZzNyelLj1B9PrQ/jIM=
X-Google-Smtp-Source: APXvYqyEZrfngkxRMK2d39FAOYp9BghixyVDEshJdO27mt1aBls2Y29kbpl7VvmR8iQqVYQg2VnG/Q==
X-Received: by 2002:a17:90a:1697:: with SMTP id
 o23mr5418876pja.62.1579612347118; 
 Tue, 21 Jan 2020 05:12:27 -0800 (PST)
Received: from localhost.localdomain ([146.196.37.201])
 by smtp.googlemail.com with ESMTPSA id i8sm44027333pfa.109.2020.01.21.05.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 05:12:26 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Date: Tue, 21 Jan 2020 18:41:33 +0530
Message-Id: <20200121131132.15830-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] kernel: time: posix-timers: Pass
	lockdep expression to RCU lists
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

head is traversed using hlist_for_each_entry_rcu outside an
RCU read-side critical section but under the protection
of hash_lock.

Hence, add corresponding lockdep expression to silence false-positive
lockdep warnings, and harden RCU lists.

Add macro for the corresponding lockdep expression.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 kernel/time/posix-timers.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/time/posix-timers.c b/kernel/time/posix-timers.c
index 0ec5b7a1d769..2ccce00af177 100644
--- a/kernel/time/posix-timers.c
+++ b/kernel/time/posix-timers.c
@@ -50,6 +50,8 @@ static struct kmem_cache *posix_timers_cache;
 
 static DEFINE_HASHTABLE(posix_timers_hashtable, 9);
 static DEFINE_SPINLOCK(hash_lock);
+#define hash_lock_held() \
+	lockdep_is_held(&hash_lock)
 
 static const struct k_clock * const posix_clocks[];
 static const struct k_clock *clockid_to_kclock(const clockid_t id);
@@ -120,7 +122,7 @@ static struct k_itimer *__posix_timers_find(struct hlist_head *head,
 {
 	struct k_itimer *timer;
 
-	hlist_for_each_entry_rcu(timer, head, t_hash) {
+	hlist_for_each_entry_rcu(timer, head, t_hash, hash_lock_held()) {
 		if ((timer->it_signal == sig) && (timer->it_id == id))
 			return timer;
 	}
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
