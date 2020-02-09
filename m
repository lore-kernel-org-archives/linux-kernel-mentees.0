Return-Path: <SRS0=6+LU=35=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 887A7C35250
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 10:27:48 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ED2420726
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Feb 2020 10:27:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMTyRY67"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ED2420726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 23F0E87B5B;
	Sun,  9 Feb 2020 10:27:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kI7cqAqBlxUe; Sun,  9 Feb 2020 10:27:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 78A3387A2F;
	Sun,  9 Feb 2020 10:27:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D6AEC089F;
	Sun,  9 Feb 2020 10:27:47 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AD7E6C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 10:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A9FCE87B41
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 10:27:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mv+14j97FOkh
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 10:27:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0E14C87A2F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Feb 2020 10:27:45 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id r67so2890930pjb.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 09 Feb 2020 02:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jCjPuJNh7y163fuH52924U0TilCQIyk7AKarrYQwMlU=;
 b=UMTyRY67J7q7nfTqxlM+hkep+sBdWFUkE55jCan1M80XHmn203vz9vk5ErmbaX2l0G
 E6z3iMi11iNM4IUbmzW3ohn8C6QvP5+B81q8W5gl3Vzr1zjVh5f3NnMvV+QACnobO9rC
 2kLOKI4lqVfAoUT/cydVRvLqDx6azKixg6UqwepYix+Qo7koYT17LUa3Zm3wVncGCT7G
 3UJUKswtdkuOD93WyGTWUDNKWmxRI3HFKlFHPW27WMzIH2WzsueIoRQiVEYpQc8ZXtzF
 d8ZMAZTkf2Xt1XQSEPe8OOO3ZeJui6y8XcWeKxBFFrcaeeMEM+QpOtpOMOZ1VECJItc3
 qe4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jCjPuJNh7y163fuH52924U0TilCQIyk7AKarrYQwMlU=;
 b=CmuJJYwodMMh2I1Wy5n5kd/ptHRhZ52fu03qj3UuGPcts5oKz/d9uCCF6afQGFA06f
 zlmK51j/QG1HpPsqy6/k9exiGFebClF2FIBSyoWjkl4YNlHG4iBrRAAs8qAAIHQlnAoy
 668ER6ltAPz+Owaj1CROUN8u3zmaFDSCEZCJIMKn3wEz6Pvh/TBeZCARfhkt20QlUhYA
 2QP4y8h4LflUDrs7nanO+jIcqfpGp4iz2XoqyUF3TisXvIL8Y3RVd8cv1XQ3gzokEuI3
 Z0OuSLgh6AnZMCKYvYIQ1Hdc4DqOZJAd5n9GK4jSohs8/kp5HT0jNS07tiHgpK4fPmYo
 Kfpw==
X-Gm-Message-State: APjAAAWC98BpF+91WQ09pheFvhkVUJdfFXsVhC7uiyvxltHstd8+JRj/
 LuUAEJsV6Jiu0AB0ptNZWgY=
X-Google-Smtp-Source: APXvYqxLokrORpCd3uP+Ci8jY/uWzSUx1jpQbdDjBsVfD45FYuN7BOq6NlmOdzTqMMTuxQc0eESPzA==
X-Received: by 2002:a17:902:34a:: with SMTP id
 68mr7332999pld.250.1581244064528; 
 Sun, 09 Feb 2020 02:27:44 -0800 (PST)
Received: from localhost.localdomain ([146.196.37.155])
 by smtp.googlemail.com with ESMTPSA id 196sm9030786pfy.86.2020.02.09.02.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 02:27:43 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>
Date: Sun,  9 Feb 2020 15:55:31 +0530
Message-Id: <20200209102530.26115-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] perf_event: Annotate rb pointer with
	__rcu
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

perf_event::rb is used in RCU context, tell sparse
about it aswell to eliminate false-positives.

Fixes the following instances of sparse error:
incompatible types in comparison expression (different address spaces)
kernel/events/core.c:5596:9
kernel/events/core.c:5302:22
kernel/events/core.c:5438:14
kernel/events/core.c:5471:14
kernel/events/core.c:5528:14
kernel/events/core.c:5614:14
kernel/events/core.c:5627:14
kernel/events/core.c:7182:13
kernel/events/ring_buffer.c:169:14
kernel/events/ring_buffer.c:169:14
kernel/events/ring_buffer.c:169:14

This introduces the following 2 new sparse errors:
kernel/events/core.c:7212:9
kernel/events/core.c:5749:31

which are fixed by using RCU primitives, rcu_dereference()
and rcu_access_pointer() on perf_event::rb.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 include/linux/perf_event.h | 2 +-
 kernel/events/core.c       | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 6d4c22aee384..1691107d2800 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -694,7 +694,7 @@ struct perf_event {
 	struct mutex			mmap_mutex;
 	atomic_t			mmap_count;
 
-	struct ring_buffer		*rb;
+	struct ring_buffer __rcu	*rb;
 	struct list_head		rb_entry;
 	unsigned long			rcu_batches;
 	int				rcu_pending;
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 2173c23c25b4..7b9411d21165 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -5746,7 +5746,7 @@ static void perf_mmap_close(struct vm_area_struct *vma)
 		 * still restart the iteration to make sure we're not now
 		 * iterating the wrong list.
 		 */
-		if (event->rb == rb)
+		if (rcu_access_pointer(event->rb) == rb)
 			ring_buffer_attach(event, NULL);
 
 		mutex_unlock(&event->mmap_mutex);
@@ -7209,7 +7209,8 @@ static void perf_pmu_output_stop(struct perf_event *event)
 
 restart:
 	rcu_read_lock();
-	list_for_each_entry_rcu(iter, &event->rb->event_list, rb_entry) {
+	list_for_each_entry_rcu(iter, &rcu_dereference(event->rb)->event_list,
+				rb_entry) {
 		/*
 		 * For per-CPU events, we need to make sure that neither they
 		 * nor their children are running; for cpu==-1 events it's
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
