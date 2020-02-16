Return-Path: <SRS0=3/iO=4E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A3FC3B1BF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 07:43:39 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 199C520857
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 16 Feb 2020 07:43:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUR/n/eo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 199C520857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DA1A686477;
	Sun, 16 Feb 2020 07:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AzPceb8omz9i; Sun, 16 Feb 2020 07:43:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4638B86356;
	Sun, 16 Feb 2020 07:43:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31C7AC0881;
	Sun, 16 Feb 2020 07:43:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9B53CC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 07:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 921A686477
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 07:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vMTCw0DZ5Coa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 07:43:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id F29C986356
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 16 Feb 2020 07:43:35 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id c23so5484401plz.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 15 Feb 2020 23:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=mV1qixM+hRHgqOUWXlliAy9s0rAvz7UfT2PUrmz0Bbg=;
 b=mUR/n/eo7hViVFepH9tBOF/4d1CJP8nF9GlkVeBEkVqnXhxjxvJnJwh0iuPO7Yw9Pq
 ic68Yo9yDUpiX3Bcizh1bbCkeOfelr4g3Hy7ErKX5zIYMyf9rJxqse6a/q2cyfS8OQv9
 yoxhiGISRhvTM4pk5UU8qzFaey69bWTxWSLwjfta1y19Hug1pn8nxtWV1qFrKCLZwrDG
 SF7Wc0/LnNpYjACve6jb6VqQRnZ6P8AkZENSI6iCEGUNPm67GWp/vwaH1RJ8Iip7MYKi
 lU6JEthhHG/OvxrnAGQJREBdExrfsXSd+3MzSHwQzSehGGbVDkNWiq6x5Q/ofvVN3Z0B
 igGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=mV1qixM+hRHgqOUWXlliAy9s0rAvz7UfT2PUrmz0Bbg=;
 b=ng/Kp+4g66GHGHgI0gWECjM+Zqq18ARCa6+iwYxuRofBFzxhCeoKPg++0vckFnO8ia
 eKd688wmIQG292eC6TGkKIg3klwmSCULLU1bynTr8aJCDH4QPsrgaZy4eoDbI4iGGUs6
 oHd74T8Py+X+CY6tIyWfNQIGDF52u3I3xukW/fZfa2yAVjmgKm29ifRrXMQEvRrk8XKZ
 trUqW5Fz2UtKOjg35JohH4pasZWJHGVDYUk/EOk9g1wEU3seZnFLHblDcU+6uEtif0V1
 eizzrjGNcNfkhnFDq6FmxVQrD4KFUQuy3UnNA76gZwwZLiLzDk0kHhgVvrtYpFS6vQwI
 HKtw==
X-Gm-Message-State: APjAAAU6n1SlD1C/MKqAMTuSI57nZDsOUCqwEkv/Z4C2SW7XZSyOal11
 oHCqSufay/3hzxjv9lVgpww=
X-Google-Smtp-Source: APXvYqzsqrs4KzGyTV7cuCbvzAVRqRkATFzF6Sh9VtOVBsQyT5MYbXW0QCTaF3SFN81jzDCWkw8tmQ==
X-Received: by 2002:a17:90a:a48a:: with SMTP id
 z10mr13288587pjp.52.1581839015446; 
 Sat, 15 Feb 2020 23:43:35 -0800 (PST)
Received: from workstation-portable ([103.211.17.250])
 by smtp.gmail.com with ESMTPSA id 199sm12896682pfu.71.2020.02.15.23.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2020 23:43:34 -0800 (PST)
Date: Sun, 16 Feb 2020 13:13:30 +0530
From: Amol Grover <frextrite@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Message-ID: <20200216074330.GA14025@workstation-portable>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email 2.24.1
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RESEND] kernel: time: posix-timers:
 Pass lockdep expression to RCU lists
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
