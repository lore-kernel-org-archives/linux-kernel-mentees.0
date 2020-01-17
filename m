Return-Path: <SRS0=W785=3G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1649EC33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jan 2020 13:41:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE1312082F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jan 2020 13:41:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyKqaoH+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE1312082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A5A9B86440;
	Fri, 17 Jan 2020 13:41:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EEioABzeMaao; Fri, 17 Jan 2020 13:41:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1594786449;
	Fri, 17 Jan 2020 13:41:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 037E4C1D81;
	Fri, 17 Jan 2020 13:41:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32909C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 13:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2C29486AE3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 13:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hwDTUCoFjmDs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 13:41:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id BABD086ACE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 13:41:06 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id a6so9908195plm.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 05:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vE1QPJ0SsgxgZYx5CvnPncdHxn/8vBh0HdyoKU9Gboc=;
 b=QyKqaoH+S7cm0Jz+wqB3aUsuCAEVsyOkfTyoJu/lD2StQmcz4wXD9K4G6QCJGCqJyM
 d2GaoGlBDsQTgTAbsBMghbdHZGNTkKoNN/DoCzG3LXNr01LjT/0frdFgMrklukbG6UkS
 uMbn1hNP7RqshM6Im9nt0ybplspZwD9uvUKqaYpiTNAQv0cW1yC7kmj0cxSw1ZLl+bp4
 bP/OAeQWtk2y8K2aPR2ZzcbNaI18TycgH+uPEzHEgYl1y3xUhvqQ+avg3+LJ51WLuDQ2
 8mtSSe0hsaUh5/yfj9bYt9zDuU+3MKYHfDvD1cpMG1toB8N7sLZdjUGMuOCjICoh7QDC
 Nxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vE1QPJ0SsgxgZYx5CvnPncdHxn/8vBh0HdyoKU9Gboc=;
 b=qU7gu2oaqcWweRA3VRbuIPX57zvWcK5+9pw96lNzx1mPsEv8yFRwrJu+od9PWj8q4O
 q12zKBo2l/Lxjof5MwQSpmwXs9F6obYFwhh53ExRXS2BaYKCatQK3J2pRUtwM6tFSYom
 APfY7SYiT3fjGGKqQgwAkBFZ3wSEcjTKUiVCp6uTTUx3jW/sG+v8uT8huHrE3dxgeCUM
 uatXmNSHFPp3Vp984NRak/qJHiUPxTAfrY4fpLfkCee7jnyN0aCus+HmcEXsqb47WcAY
 cHcwjtMRjlRbPfDyc+OPEwoHPsO2WpZh0XgM1k75XTCgaz6EMUMJ1axiGirw7c1Bm7ct
 VNRQ==
X-Gm-Message-State: APjAAAUo7JriQjls+d2ZaeCb46JZ711hTirhA3mGKVKNToHhGQ5uHNgy
 sZlHNHJ2sX8H4PHs5SeUhfo=
X-Google-Smtp-Source: APXvYqyQiDEahs+oIzffeKILq7/OIWWVxIE6YttQb0yHyVlEqqUNkaiw4IM+bhlTOdmqc4t/23TRKA==
X-Received: by 2002:a17:90a:fe8:: with SMTP id 95mr5663027pjz.98.1579268466421; 
 Fri, 17 Jan 2020 05:41:06 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.168])
 by smtp.googlemail.com with ESMTPSA id
 s18sm29522422pfh.179.2020.01.17.05.41.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 05:41:05 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 17 Jan 2020 19:08:57 +0530
Message-Id: <20200117133854.32550-3-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117133854.32550-1-frextrite@gmail.com>
References: <20200117133854.32550-1-frextrite@gmail.com>
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, target-devel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 3/3] drivers: target: tcm_fc:
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

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 drivers/target/tcm_fc/tfc_sess.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/target/tcm_fc/tfc_sess.c b/drivers/target/tcm_fc/tfc_sess.c
index 4fd6a1de947c..bb70f61237a6 100644
--- a/drivers/target/tcm_fc/tfc_sess.c
+++ b/drivers/target/tcm_fc/tfc_sess.c
@@ -170,7 +170,8 @@ static struct ft_sess *ft_sess_get(struct fc_lport *lport, u32 port_id)
 	}
 
 	head = &tport->hash[ft_sess_hash(port_id)];
-	hlist_for_each_entry_rcu(sess, head, hash) {
+	hlist_for_each_entry_rcu(sess, head, hash,
+				 lockdep_is_held(&ft_lport_lock)) {
 		if (sess->port_id == port_id) {
 			kref_get(&sess->kref);
 			rcu_read_unlock();
@@ -215,7 +216,8 @@ static struct ft_sess *ft_sess_create(struct ft_tport *tport, u32 port_id,
 	ft_format_wwn(&initiatorname[0], TRANSPORT_IQN_LEN, rdata->ids.port_name);
 
 	head = &tport->hash[ft_sess_hash(port_id)];
-	hlist_for_each_entry_rcu(sess, head, hash)
+	hlist_for_each_entry_rcu(sess, head, hash,
+				 lockdep_is_held(&ft_lport_lock))
 		if (sess->port_id == port_id)
 			return sess;
 
@@ -264,7 +266,8 @@ static struct ft_sess *ft_sess_delete(struct ft_tport *tport, u32 port_id)
 	struct ft_sess *sess;
 
 	head = &tport->hash[ft_sess_hash(port_id)];
-	hlist_for_each_entry_rcu(sess, head, hash) {
+	hlist_for_each_entry_rcu(sess, head, hash,
+				 lockdep_is_held(&ft_lport_lock)) {
 		if (sess->port_id == port_id) {
 			ft_sess_unhash(sess);
 			return sess;
@@ -291,7 +294,8 @@ static void ft_sess_delete_all(struct ft_tport *tport)
 
 	for (head = tport->hash;
 	     head < &tport->hash[FT_SESS_HASH_SIZE]; head++) {
-		hlist_for_each_entry_rcu(sess, head, hash) {
+		hlist_for_each_entry_rcu(sess, head, hash,
+					 lockdep_is_held(&ft_lport_lock)) {
 			ft_sess_unhash(sess);
 			ft_close_sess(sess);	/* release from table */
 		}
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
