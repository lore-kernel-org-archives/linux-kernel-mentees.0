Return-Path: <SRS0=/lQp=4L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8CEC35673
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 17:20:27 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04FCB206E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 17:20:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNzhGR+x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04FCB206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id C6AE0870A1;
	Sun, 23 Feb 2020 17:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QNxI9vrOPs7H; Sun, 23 Feb 2020 17:20:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5F92987089;
	Sun, 23 Feb 2020 17:20:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C472C18DA;
	Sun, 23 Feb 2020 17:20:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C4DBEC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 17:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BC75520387
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 17:20:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aHa9J4RLnl9K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 17:20:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 1A30C20384
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 17:20:24 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id gv17so3050290pjb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 09:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xM5ras975p0Tzn0AuQOvcenknUI3u0IBL1jh0ZA+WuQ=;
 b=cNzhGR+x91SUFBvtXojwfDzu/7qK3SG6d+HdeMkmTDaOCAeTuN/7OrYOWaJ5TNp3jv
 nxH8krORBX1l+0cI2mTSjCpqLGxuBmaOvfoi2eNHIE2sWnFgqhv8V+BZmmd6HJ6HtW5A
 7lrRptjJNIo9aCxh+dRgWonVLM8JmvES0w0G5obacQzr5y7hVuJx5YbxUarmb6Ity/Am
 J2vjWDjxKOilrz2sDExP2gLmkC/aRHhLputa1s2dKuGJUCdke4Qq8MJwngpedGOfMUIU
 MRC3bnah4NLrS1LC/jzDXN0PqPCCYG6AlNfXlG5723V/RGkiZoEe32cMqpwRxcEvL5eR
 B/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xM5ras975p0Tzn0AuQOvcenknUI3u0IBL1jh0ZA+WuQ=;
 b=KesUoZfVnAW2sDFYe3/ArbYPfMbeeuaRwhXaf23ZoFQbXkoWDGDDm9+GhS9aO+FtNo
 fAhnEVZutHzOddvrF6YS9ZqGrL1p6hdlpbwd8xa/m8sCEHoI8E6k3OhmtP7u9Fhm4Nag
 BOsWC92PDaDKwBDMoKFS5J9DDMO3ptYaGqkW5nu9Vqc/cb+WGEvMhZ2cvn3IlZn3MeUA
 w/52wHCinaTUmjquo9WTKA/UZ35W1KM4B6CUZyVP2uzWeMqBVgKkgo+VCEZUmPUjzqmc
 97bHTfi2aKI5zZZUX2eK5Hzvbmw8qlRldGbUQim3c200w1hfZ7OgFRdDQ/Zjg7OGrxpI
 +SnQ==
X-Gm-Message-State: APjAAAUBZBTrGi0mMb7lajSse1fCp4TfXAt3HXu9Qsy5SxKYtGi0nkl+
 6brf0+aogjSdQy+0ao18kng=
X-Google-Smtp-Source: APXvYqxDhCPLqPA5RnVmZfA4rmg+IVQHA0vM8maBAyDA85AuIvnSjzr1DyVrQYqi6zUsbOcwQ2uD/w==
X-Received: by 2002:a17:902:463:: with SMTP id
 90mr48781720ple.213.1582478423623; 
 Sun, 23 Feb 2020 09:20:23 -0800 (PST)
Received: from localhost.localdomain ([103.87.57.33])
 by smtp.googlemail.com with ESMTPSA id 13sm9505424pfj.68.2020.02.23.09.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 09:20:23 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Sun, 23 Feb 2020 22:49:46 +0530
Message-Id: <20200223171945.11391-2-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200223171945.11391-1-frextrite@gmail.com>
References: <20200223171945.11391-1-frextrite@gmail.com>
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, coreteam@netfilter.org,
 netfilter-devel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/2] netfilter: Pass lockdep
	expression to instance_lookup traversal
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

q->instance_table[] may be traversed outside an RCU read-side
critical section but under the protection of q->instances_lock.

Hence, add the corresponding lockdep expression to silence
false-positive lockdep warnings.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 net/netfilter/nfnetlink_queue.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nfnetlink_queue.c b/net/netfilter/nfnetlink_queue.c
index feabdfb22920..5aef41847774 100644
--- a/net/netfilter/nfnetlink_queue.c
+++ b/net/netfilter/nfnetlink_queue.c
@@ -105,7 +105,8 @@ instance_lookup(struct nfnl_queue_net *q, u_int16_t queue_num)
 	struct nfqnl_instance *inst;
 
 	head = &q->instance_table[instance_hashfn(queue_num)];
-	hlist_for_each_entry_rcu(inst, head, hlist) {
+	hlist_for_each_entry_rcu(inst, head, hlist,
+				 lockdep_is_held(&q->instances_lock)) {
 		if (inst->queue_num == queue_num)
 			return inst;
 	}
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
