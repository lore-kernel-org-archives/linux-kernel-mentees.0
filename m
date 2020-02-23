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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D1EC35671
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 17:20:22 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB3AB206E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 23 Feb 2020 17:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2tC5sIv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB3AB206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 97C5284974;
	Sun, 23 Feb 2020 17:20:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GN9130RgLJ1B; Sun, 23 Feb 2020 17:20:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 42F5D84961;
	Sun, 23 Feb 2020 17:20:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2DA22C18DA;
	Sun, 23 Feb 2020 17:20:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 52735C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 17:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4150C8409C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 17:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jiRMng+NqTAQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 17:20:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B9C5A83C53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 17:20:19 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id j7so3024238plt.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 23 Feb 2020 09:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MUfs7lyaep1+x1XygloZl4yBc6FlYxcZEd+NqGjQwiM=;
 b=K2tC5sIvThPq+B1y9vvTpJ7jDeA5hkzOt3jM1gpmMFemAmqb2DZ13w/miPvObBb9s4
 f+fYuH1up+UuDtdTWIoQB7wbpkfOO1WWyFo3mXzs2vDP5+RFnt9U45shdE3HEou5MZ78
 HUtsEwyuz3mGc6vzuZ3tqIkOkHcgAZEoOSeqxIubgspZcBWnZMYZw9w0o6i90ps7ZmOQ
 XMXuMUCOsMAoret4ITR+0aS2xSQK3F4dv7+Ha9M0X3OtCr5WrjEJV26jpgA5shrfM8Fv
 KFxh8UcR8tuZdt8jlArw+CieGDz3+ZrX2pYpDptX6J4gIx8IeSF7/3xZssGRaf7pMaGn
 r4KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MUfs7lyaep1+x1XygloZl4yBc6FlYxcZEd+NqGjQwiM=;
 b=h+6Zyd/xN0LwFotWmp9Ak633NbPJi0pM1yLTMsBzFjAvR6DDHtKODonR+VP0LA6g5U
 FoHFYAX3uDk873Sv/jh17ARTwMIns2gS/mm4et06uP+2+pQCB5MWMZlMKf+woStfDxcA
 gLnXVHS8kdrZ4GgeE32m655A0vDHXStxEFpM6pSzQn74BFuEXf8yPhXFl1Lk65xmNi/C
 PhYgpZp8aOE6Qn5c/KYy/6LWWs5dQn7ZZSqIKDplkyc7R/XX9ivzuz3p/MpwSDjHw+9O
 RAdiTGSgR/Wmfgu7gCY/BbmtqKTdp9Z8c0sgqIB9mFm87AeV9U5B+l81E8NJHqhNyLcA
 jdhQ==
X-Gm-Message-State: APjAAAVQ+h6Y4r5BQ7y++jqjtV28BOr2KXQua02jFz9F+/naDzDFMG9X
 RR2YKONpfbDRjq+jlAI2ogI=
X-Google-Smtp-Source: APXvYqybLZBvG94s/8G7V0fd+jZvZdno/xiWU3JfXcc3IQ+YviQtpNXXBQra6Ll5xFmSqG4cefrHSw==
X-Received: by 2002:a17:902:8eca:: with SMTP id
 x10mr45052337plo.94.1582478419297; 
 Sun, 23 Feb 2020 09:20:19 -0800 (PST)
Received: from localhost.localdomain ([103.87.57.33])
 by smtp.googlemail.com with ESMTPSA id 13sm9505424pfj.68.2020.02.23.09.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2020 09:20:18 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>, Florian Westphal <fw@strlen.de>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Date: Sun, 23 Feb 2020 22:49:45 +0530
Message-Id: <20200223171945.11391-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, coreteam@netfilter.org,
 netfilter-devel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/2] netfilter: Pass lockdep
	expression to __instance_lookup traversal
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

log->instance_table[] may be traversed outside RCU read-side
critical section but under the protection of log->instances_lock.

Hence, add the corresponding lockdep expression to silence
false-positive warnings.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 net/netfilter/nfnetlink_log.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netfilter/nfnetlink_log.c b/net/netfilter/nfnetlink_log.c
index 0ba020ca38e6..09acc579b566 100644
--- a/net/netfilter/nfnetlink_log.c
+++ b/net/netfilter/nfnetlink_log.c
@@ -104,7 +104,8 @@ __instance_lookup(struct nfnl_log_net *log, u_int16_t group_num)
 	struct nfulnl_instance *inst;
 
 	head = &log->instance_table[instance_hashfn(group_num)];
-	hlist_for_each_entry_rcu(inst, head, hlist) {
+	hlist_for_each_entry_rcu(inst, head, hlist,
+				 lockdep_is_held(&log->instances_lock)) {
 		if (inst->group_num == group_num)
 			return inst;
 	}
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
