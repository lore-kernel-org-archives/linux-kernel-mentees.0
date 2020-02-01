Return-Path: <SRS0=SV+z=3V=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F967C33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Feb 2020 12:58:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0D7A206E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  1 Feb 2020 12:58:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VzPZwDZT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0D7A206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A049686100;
	Sat,  1 Feb 2020 12:58:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqs9AzHj1-hh; Sat,  1 Feb 2020 12:58:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4090F860A3;
	Sat,  1 Feb 2020 12:58:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2FD9DC0176;
	Sat,  1 Feb 2020 12:58:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 23837C0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Feb 2020 12:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0C8D586100
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Feb 2020 12:58:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dl0FqG-12-Ij
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Feb 2020 12:58:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 828C3860A3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  1 Feb 2020 12:58:41 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id i6so4948507pfc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 01 Feb 2020 04:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Sg2eOI3lpxVLDcDQYQkxI8yUvrkJbYXCIF4uNleTtLs=;
 b=VzPZwDZTiS0OoC9iJdqoQZ1rJQirI983lgb8kIAJifeN7iI9AFpWSkW3lfGLH/Wqny
 9SPjmGclSfOzm0g88K0e38IsOKwyGaexWV6Er/Ua0KH43NACA+d4KQQkN7ig5POv38+M
 YturwSNZ1zWY+IpsyBi5TWxl3a9tp9tJEQH4KuG5IBwYJK2KryuioiFI/o+DDsViZP/I
 JaucO0AUmY/47JkO3fIw7Ch4v5pPPLE+6CWVMKIYfugruQT8AR+1XkDXiL6j8HTGplAW
 cP9PMZvYhP8K+ibnghXfauWD7g1oCGNOR17tbzDyTbaKXAVHH+LK0580wn3RirUXrLsb
 QYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Sg2eOI3lpxVLDcDQYQkxI8yUvrkJbYXCIF4uNleTtLs=;
 b=IyYBSs+QaDtsB9agOBoguH7TDBylRb3oh7Z7vnEqKRNBp1mQDhm1zBzx2qVJH5Vp2o
 kxEqsrFFLCdhdotlGrmwY4FiV+sGYpzV86CCR3gGQNv+Ox1SW9s+IZHsZvEpAmwSs5ND
 j4VnMpw6Qb4zu9HopA73be1CIKFezr/FHo84IFlGVZaYjt7vFW4meeThUjcCeygbZajj
 fD1UK4ZCv8O3MyYiMGq8CtHkNF3Wp6ccjyLjwRbaFFks38HzVKpDvz8hERlB7uS5SnUu
 DfLYWweKyNt3Hjlet3TG0IWuBvwyeN/H/+z8F2RLBHhpyHCT115SEdK/NwL5K0VA9NqY
 7qLQ==
X-Gm-Message-State: APjAAAUbk70E+eLxNdXpeOWFbtTaNE8E4SaDiDena7n2RSaBPqOPBOTw
 GD3Zf+KXDVuidbTybarxUw==
X-Google-Smtp-Source: APXvYqworotb8yqMSLn48khNRtGO3KrwLk+wNzdBnnKoVNx2LbrYoU5BvXU8otqmX/6laJRxkocHmg==
X-Received: by 2002:a63:1a08:: with SMTP id a8mr15444283pga.425.1580561921051; 
 Sat, 01 Feb 2020 04:58:41 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:cd2:8ab5:f87d:af67:e1a2:1634])
 by smtp.gmail.com with ESMTPSA id g22sm13607889pgk.85.2020.02.01.04.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2020 04:58:40 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com
Date: Sat,  1 Feb 2020 18:28:03 +0530
Message-Id: <20200201125803.20245-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] sched.h: Annotate curr pointer in rq
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

This patch fixes the following sparse errors in sched/core.c
and sched/membarrier.c
:
kernel/sched/core.c:2372:27: error: incompatible types in comparison expression
kernel/sched/core.c:4061:17: error: incompatible types in comparison expression
kernel/sched/core.c:6067:9: error: incompatible types in comparison expression
kernel/sched/membarrier.c:108:21: error: incompatible types in comparison expression
kernel/sched/membarrier.c:177:21: error: incompatible types in comparison expression
kernel/sched/membarrier.c:243:21: error: incompatible types in comparison expression

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 kernel/sched/sched.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 280a3c735935..97b1396b6008 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -896,7 +896,7 @@ struct rq {
 	 */
 	unsigned long		nr_uninterruptible;
 
-	struct task_struct	*curr;
+	struct task_struct __rcu	*curr;
 	struct task_struct	*idle;
 	struct task_struct	*stop;
 	unsigned long		next_balance;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
