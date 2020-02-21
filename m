Return-Path: <SRS0=GVOk=4J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030A2C3565A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 17:57:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD4F020722
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 17:57:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ww5wf2M+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD4F020722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9F437221C6;
	Fri, 21 Feb 2020 17:57:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id REi3OMknr9jD; Fri, 21 Feb 2020 17:57:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CF4AD22177;
	Fri, 21 Feb 2020 17:57:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA91CC1D81;
	Fri, 21 Feb 2020 17:57:56 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A381EC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 8E15C87605
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:57:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oBmEuaOs5pQs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:57:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id EB6D286E7F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 17:57:54 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 6so1369046pgk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 09:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/D8p3umAJnu2Rmie5wIDoJw/XtMw5bg4kYLl7SwrZqU=;
 b=Ww5wf2M+U9Q9PdbDPXvGrX8xRuaMm0OJNS0dg5taavKaGzja/6wQ3vcI5viCda1hJs
 lT90s9PxizSUnPh3GM6n7qW+L3P2b19jUVhx2RfEwGHYN5izqrmRByIp/87hBfNltO8L
 2SUidAyZB5hV0u7D/3L+t/gBL0725j/KTFVW8YciNMCupa5X8m0xJpz+hBaOwEDO3j0M
 D70mPvxlyGYUSS7hCu9AF9eReMfQR1OCoJub8D0zPtzVxw+LsuGB5Bqdx0sjEpijjpN+
 Zt7HxKVu/v4sDrpVaLWN+j95T8BCuWMRsMOScR551d1agjYGg6MXaD679cRGftp+HHcn
 VkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/D8p3umAJnu2Rmie5wIDoJw/XtMw5bg4kYLl7SwrZqU=;
 b=OqTjvtxt0Djl+kCP1t2deWdJjWBZaNHVOJ3pPQKjQqmNWwRID6boB1SDBXroNFNLP0
 qoDQIVncUP7fGN+gujAdFqW24UkbGwsiEDGERnutsOdOec9mV0lDOkP3AUGPtzXz6O7n
 vSIgFUeSAzha5vHLqz+xIc+bMbj1EtswqRnaoS69uHFYeiAVdzB5f+JrC15htCZUYIR8
 NWVQ81Q2uAeFFlODtuQM+DCqKt/HhNGDGbg+jUx+YPUNlF3zo5X619A+UGlxJYFB24Bq
 oByGdaby0vt2D9fMrVRtP9dbruZSU7nT0ZKjRkkJLr8tWLwFMVUuVxcsm/ySfrU1unm+
 bz6w==
X-Gm-Message-State: APjAAAXYSZY4JYX3krZeulEGsOx/pr0SIbDP6kEa9knpqvL75v3Z6k6H
 3RMADLoa7lZGfQVmAHofK9s=
X-Google-Smtp-Source: APXvYqyuPt2CUyWo6GMoDeY5O469l5MPv7Qd2vF+TA+kyd9ggfinqj2ZrCDRKtEIY+r/Ko20/RKbnA==
X-Received: by 2002:a63:cd03:: with SMTP id i3mr40862108pgg.257.1582307874467; 
 Fri, 21 Feb 2020 09:57:54 -0800 (PST)
Received: from localhost.localdomain ([103.87.57.170])
 by smtp.googlemail.com with ESMTPSA id t19sm3128544pgg.23.2020.02.21.09.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 09:57:54 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Eric Dumazet <edumazet@google.com>,
 "David S . Miller" <davem@davemloft.net>,
 Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 Jakub Kicinski <kuba@kernel.org>
Date: Fri, 21 Feb 2020 23:27:14 +0530
Message-Id: <20200221175713.2112-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] tcp: ipv4: Pass lockdep expression
	to RCU lists
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

md5sig->head maybe traversed using hlist_for_each_entry_rcu
outside an RCU read-side critical section but under the protection
of socket lock.

Hence, add corresponding lockdep expression to silence false-positive
warnings, and harden RCU lists.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 net/ipv4/tcp_ipv4.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
index 1c7326e04f9b..6519429f32cd 100644
--- a/net/ipv4/tcp_ipv4.c
+++ b/net/ipv4/tcp_ipv4.c
@@ -1000,7 +1000,8 @@ struct tcp_md5sig_key *__tcp_md5_do_lookup(const struct sock *sk,
 	if (!md5sig)
 		return NULL;
 
-	hlist_for_each_entry_rcu(key, &md5sig->head, node) {
+	hlist_for_each_entry_rcu(key, &md5sig->head, node,
+				 lockdep_sock_is_held(sk)) {
 		if (key->family != family)
 			continue;
 
@@ -1043,7 +1044,8 @@ static struct tcp_md5sig_key *tcp_md5_do_lookup_exact(const struct sock *sk,
 	if (family == AF_INET6)
 		size = sizeof(struct in6_addr);
 #endif
-	hlist_for_each_entry_rcu(key, &md5sig->head, node) {
+	hlist_for_each_entry_rcu(key, &md5sig->head, node,
+				 lockdep_sock_is_held(sk)) {
 		if (key->family != family)
 			continue;
 		if (!memcmp(&key->addr, addr, size) &&
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
