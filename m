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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE49CC33CA4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 17:07:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 822682072E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 10 Jan 2020 17:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qq/eSddV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 822682072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 513F286B82;
	Fri, 10 Jan 2020 17:07:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9yFRGHh260Ve; Fri, 10 Jan 2020 17:06:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D87F786B15;
	Fri, 10 Jan 2020 17:06:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7E12C1D7D;
	Fri, 10 Jan 2020 17:06:59 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CB3CFC0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B8E6322264
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:06:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id if+CnF0zh6rn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:06:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 0940D22219
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 17:06:58 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id z124so1254815pgb.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 10 Jan 2020 09:06:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kIXyMxyHb52Dqb3xzKBUlHwhFwf+AsnzOx4pqWqWlWY=;
 b=Qq/eSddVaNrHi4aFsdIW47GKoMp5/AouAcANV8I9EI/aUy0FYixHPk3LViqJkSvjq3
 MfYGuA+R3Nl7y4cxOBJ/grgL+QF0Otmarxdzx2nDg0/J6Az3VA3Vvwiq1jaJpXGaROLC
 nxMK6xmFicvJ/4LYtB0+WZ7kd1EeNxydqiQoHB9fIwBMPWpzD1gQbgDQF2twLFHxiokD
 wno1xRcPl8aeQQ9a7/OWDqfTw+jWp3AqGLIhWZnQzuh2pkgCQVuCUjjnWGzT39X9sc6m
 G2VGSavSYYCXhNuW0gc1g4HGhlDCDmpnRvQ7BrHJzpC4/g8vCIUdNcgl830i3mr6Gjc/
 SArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kIXyMxyHb52Dqb3xzKBUlHwhFwf+AsnzOx4pqWqWlWY=;
 b=tglDBPCBXrE0oKgYP5d/WCigu7h5bck7bHrPnu8qs5P/MI7KpX1Dj6SKNQAkCSn48N
 6G4ylZarma7W0VEvMwM1pR4IhRaniZVlUWG1cyAEouIOkuAfk/2Gs27rKC/TEkqoSZEH
 /Sh3Ym2ZHTBWSphSY80W9+D1f+quZK3pYsa87nxuivxBZVCXHOB/NrXCaB5PIGs84SJ1
 4tF2mK5DRjHrWrWIBeToZn9+URJk3W/N2uXdkK9ahdVEgT/UoDfL0DGmGHQjnMa+v2fg
 3aaZDZjs8cnNzmsvFtpyOd5f+T8+3Qi2lap3E/bCUM7I1Medty+9QovjvhuFYqTbjQoN
 jWRw==
X-Gm-Message-State: APjAAAW6SEsrsjRCVpAV2+f84FMYQhCsyarNd8y/VN1tQ9GmSERiSoLm
 hnZF7TPLWPNtyeVlattdP4A=
X-Google-Smtp-Source: APXvYqx1bOJJ1EYx+JdDvHs8uo8AXTRyG4cSwLpVeu4x3iHlpshx7fU4qmCEoHVe+Y77WlnkQkEjOg==
X-Received: by 2002:a65:52ca:: with SMTP id z10mr5668585pgp.47.1578676017609; 
 Fri, 10 Jan 2020 09:06:57 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.220])
 by smtp.googlemail.com with ESMTPSA id x4sm3613268pff.143.2020.01.10.09.06.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2020 09:06:57 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 10 Jan 2020 22:35:59 +0530
Message-Id: <20200110170558.23466-3-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200110170558.23466-1-frextrite@gmail.com>
References: <20200110170558.23466-1-frextrite@gmail.com>
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, target-devel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2 3/3] drivers: target: tcm_fc:
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
