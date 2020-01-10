Return-Path: <SRS0=OMk/=27=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0B0BC33CA4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 12:45:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91BFC2072E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 12:45:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSGy+ABE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91BFC2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3273786483;
	Fri, 10 Jan 2020 12:45:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJJ3+H4vwFPC; Fri, 10 Jan 2020 12:45:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B166E85455;
	Fri, 10 Jan 2020 12:45:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A023AC1796;
	Fri, 10 Jan 2020 12:45:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D2BDEC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 12:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BE92F883F5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 12:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3a1mNNc4I5Vy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 12:45:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 38603882AC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 12:45:21 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id x7so959016pgl.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 04:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kIXyMxyHb52Dqb3xzKBUlHwhFwf+AsnzOx4pqWqWlWY=;
 b=MSGy+ABEyjJHqfkpma0mmsRX+Uc9gPbqiEVJYZR0c24iUoUTjVte/QICQT5sU9I4w+
 DGzNNWyxHTi2QSD86mJ2nW26ainZZG+8VCaCx4ZiHMaESa44V7ievBtxPfIwbfG25vbd
 j9hUsK65W/rw4T3+4CmHr5BgpkmftWP91D/6S3Ce/cbwBO87Aq2oalpuPrPO8xw82aTw
 5XzmUEf1IZfc8Rv3qgg1YsgfPCRPrUtLC4zB3zSvx2y55MgRKTE99hNgVGvkfejHi1JP
 pCGJv5MFK2eN14Gh7he9aieLiX78y2uCsJSzbyeDHIA1GYGUj/ZqRSj1K9Ex5zbz+/f/
 d9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kIXyMxyHb52Dqb3xzKBUlHwhFwf+AsnzOx4pqWqWlWY=;
 b=GxUr2Ly3KOY5Bq7Y7HulX/ACV81d5whaPD/Dm/gdw0MetHRCGcLtJ1KsVQ+vXi3WJ0
 j7WZXSQ13ELetb8YJP2A11FqAXz3isDg7VURmfXMmXeM+RqT+K+UBYXvJ8DBH4WvUAem
 Hj8fWWRWGN4yiEKkdQdqcMqHdlTEaB88a1entszvJP7chBWml8ln2WSYr/b9VaQYA6w7
 dA3NxHYr3Se5fEiuywegXzzlGWRNzlNgx14QflNtaYDguKKRW7GjBN+sC+cMl08STes2
 ucR3464a40iUbY7WtejrM6/z96W9dmsVu/fHeMF3hC938P12YNMrKtG9NF7xM8xd8bLU
 vu6Q==
X-Gm-Message-State: APjAAAXLEkhJMuFym9KFjLgiTNLZ44X1C0AonCe/zMBxQkokTny9ZS4h
 iR7KFCsKPp80P+4Wq1puMjU=
X-Google-Smtp-Source: APXvYqxsIaCvT7AXhc5HwdvbwnGjpRwaKBcXZvcvLZoaWm6p426Edsi9yrJobhbKmJFqnsUmEQ66aw==
X-Received: by 2002:a63:4d1b:: with SMTP id a27mr4092403pgb.352.1578660320827; 
 Fri, 10 Jan 2020 04:45:20 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.220])
 by smtp.googlemail.com with ESMTPSA id d3sm2764724pfn.113.2020.01.10.04.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 04:45:20 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 10 Jan 2020 18:14:06 +0530
Message-Id: <20200110124403.27882-3-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200110124403.27882-1-frextrite@gmail.com>
References: <20200110124403.27882-1-frextrite@gmail.com>
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, target-devel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 3/3] drivers: target: tcm_fc:
	tfc_sess: Pass lockdep expression to RCU lists
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

head is traversed with hlist_for_each_entry_rcu
outside an RCU read-side critical section but under the
protection of ft_lport_lock.

Hence, add the corresponding lockdep expression to the list traversal
primitive to silence false-positive lockdep warnings, and
harden RCU lists.

Add macro for the corresponding lockdep expression to make the code
clean and concise.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 drivers/target/tcm_fc/tfc_sess.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/target/tcm_fc/tfc_sess.c b/drivers/target/tcm_fc/tfc_sess.c
index 4fd6a1de947c..8e9598010fb9 100644
--- a/drivers/target/tcm_fc/tfc_sess.c
+++ b/drivers/target/tcm_fc/tfc_sess.c
@@ -32,6 +32,9 @@
 		 (lport)->host->host_no,	   \
 		 (lport)->port_id, ##args )
 
+#define ft_lport_lock_held() \
+	lockdep_is_held(&ft_lport_lock)
+
 static void ft_sess_delete_all(struct ft_tport *);
 
 /*
@@ -45,7 +48,7 @@ static struct ft_tport *ft_tport_get(struct fc_lport *lport)
 	int i;
 
 	tport = rcu_dereference_protected(lport->prov[FC_TYPE_FCP],
-					  lockdep_is_held(&ft_lport_lock));
+							ft_lport_lock_held());
 	if (tport && tport->tpg)
 		return tport;
 
@@ -170,7 +173,7 @@ static struct ft_sess *ft_sess_get(struct fc_lport *lport, u32 port_id)
 	}
 
 	head = &tport->hash[ft_sess_hash(port_id)];
-	hlist_for_each_entry_rcu(sess, head, hash) {
+	hlist_for_each_entry_rcu(sess, head, hash, ft_lport_lock_held()) {
 		if (sess->port_id == port_id) {
 			kref_get(&sess->kref);
 			rcu_read_unlock();
@@ -215,7 +218,7 @@ static struct ft_sess *ft_sess_create(struct ft_tport *tport, u32 port_id,
 	ft_format_wwn(&initiatorname[0], TRANSPORT_IQN_LEN, rdata->ids.port_name);
 
 	head = &tport->hash[ft_sess_hash(port_id)];
-	hlist_for_each_entry_rcu(sess, head, hash)
+	hlist_for_each_entry_rcu(sess, head, hash, ft_lport_lock_held())
 		if (sess->port_id == port_id)
 			return sess;
 
@@ -264,7 +267,7 @@ static struct ft_sess *ft_sess_delete(struct ft_tport *tport, u32 port_id)
 	struct ft_sess *sess;
 
 	head = &tport->hash[ft_sess_hash(port_id)];
-	hlist_for_each_entry_rcu(sess, head, hash) {
+	hlist_for_each_entry_rcu(sess, head, hash, ft_lport_lock_held()) {
 		if (sess->port_id == port_id) {
 			ft_sess_unhash(sess);
 			return sess;
@@ -291,7 +294,7 @@ static void ft_sess_delete_all(struct ft_tport *tport)
 
 	for (head = tport->hash;
 	     head < &tport->hash[FT_SESS_HASH_SIZE]; head++) {
-		hlist_for_each_entry_rcu(sess, head, hash) {
+		hlist_for_each_entry_rcu(sess, head, hash, ft_lport_lock_held()) {
 			ft_sess_unhash(sess);
 			ft_close_sess(sess);	/* release from table */
 		}
@@ -454,7 +457,7 @@ static void ft_prlo(struct fc_rport_priv *rdata)
 
 	mutex_lock(&ft_lport_lock);
 	tport = rcu_dereference_protected(rdata->local_port->prov[FC_TYPE_FCP],
-					  lockdep_is_held(&ft_lport_lock));
+							ft_lport_lock_held());
 
 	if (!tport) {
 		mutex_unlock(&ft_lport_lock);
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
