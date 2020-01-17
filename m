Return-Path: <SRS0=W785=3G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD98EC33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jan 2020 15:32:18 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A702B2073A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jan 2020 15:32:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GioBOV/K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A702B2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 64791220EF;
	Fri, 17 Jan 2020 15:32:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r+Xlr2AkQkSB; Fri, 17 Jan 2020 15:32:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BBD1520480;
	Fri, 17 Jan 2020 15:32:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F8A1C1D81;
	Fri, 17 Jan 2020 15:32:13 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AAA20C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 15:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 92D132050C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 15:32:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0PrkIjaFV5We
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 15:32:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 2794120480
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 15:32:06 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id a33so11848744pgm.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 07:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sSs36sQnxGTfCuz7UN6u9y3waBifKuK+zZ5r4rWQl60=;
 b=GioBOV/KlZBgBSV1q0vQurfbNol7EjftOdrGxJkmUfI5btZ9mmT2P/voLGPlsW0wzL
 /nU+vc4Y/pw03lRVA/59moxmZyf1/0Nu96uR1Mt17jKEOxDx+CVkgzVrItAMa+2ewdMh
 A2VFTLHgXu/a0NA1QIs/acmlS3QNxJ7mGZr6xcFsZkCv9CbEShW1hWOr3vaPk6i7egKH
 0LE5E/3FJT3t679mb4lIQaBqzqpKbio7Tvxh2fIbrwlLaFId386YkISWSfkNKsSGh/Fr
 mNabJ1YSUT9U1RVyOyIh9uCY/NZzQ0nFHzqdPTzX9YIj6AxjjDIVjfWXxCxQ1Y21SxHu
 fC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sSs36sQnxGTfCuz7UN6u9y3waBifKuK+zZ5r4rWQl60=;
 b=LwTYi7cmF9iThsIxlNRNYm8h1ajTjAvT0XGHajHoOWbxXCnQGtlgA1XB/bQ4E3OIMV
 OoPKLOZSa0WeBTF7RMDzR1hqm9mwc3gK/PzQ1VwGqmAhtPGfwU96KjDTt+ygELQRGYvO
 IJCTKjG/GETBsvjeia6IlHT1H8tSR2RthI7j/mxxODL/uwBWy/mKnVuTBBV/uCI+uDlC
 BXISBkK+Y+K2vJ1jkq7UJBZLqipNKWIIpnhcxH9uxMdXd6kvvf0ql+ulkkFHYwwrKWfJ
 //cw4OkA4Ej60wNu11sXkRRfG6NKQIn12yCxgqV7vPCNvEgCoh0RhbmTrNgN22zzgN2r
 tjDQ==
X-Gm-Message-State: APjAAAUWr6qarZ37fFIzKC+uzESZnpw1gHG5GleGklmxKwPS83VZoHvI
 b9/Cn/U+aQesdkIyjkjzalc=
X-Google-Smtp-Source: APXvYqxVVIklnjbZNKYIXkcvzWmglcKInwSSBwjMhbmrS1I+ZzuA3zSryE1Y17hbhg4HKjHYVGFVzw==
X-Received: by 2002:a62:e215:: with SMTP id a21mr3523890pfi.3.1579275125736;
 Fri, 17 Jan 2020 07:32:05 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.168])
 by smtp.googlemail.com with ESMTPSA id d20sm7851020pjs.2.2020.01.17.07.32.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 07:32:05 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Hannes Reinecke <hare@suse.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 17 Jan 2020 21:01:23 +0530
Message-Id: <20200117153123.2648-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>,
 linux-kernel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/2] drivers: scsi: fcoe: fcoe_ctlr:
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

lport->disc.rports and disc->rports are traversed using
list_for_each_entry_rcu outside an RCU read-side critical section but
under the protection of lport->disc.disc_mutex and disc->disc_mutex
respectively.

Hence, add corresponding lockdep expression to silence false-positive
lockdep warnings, and harden RCU lists.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 drivers/scsi/fcoe/fcoe_ctlr.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/fcoe/fcoe_ctlr.c b/drivers/scsi/fcoe/fcoe_ctlr.c
index 1791a393795d..0f59992c9cd9 100644
--- a/drivers/scsi/fcoe/fcoe_ctlr.c
+++ b/drivers/scsi/fcoe/fcoe_ctlr.c
@@ -2167,7 +2167,8 @@ static void fcoe_ctlr_disc_stop_locked(struct fc_lport *lport)
 	struct fc_rport_priv *rdata;
 
 	mutex_lock(&lport->disc.disc_mutex);
-	list_for_each_entry_rcu(rdata, &lport->disc.rports, peers) {
+	list_for_each_entry_rcu(rdata, &lport->disc.rports, peers,
+				lockdep_is_held(&lport->disc.disc_mutex)) {
 		if (kref_get_unless_zero(&rdata->kref)) {
 			fc_rport_logoff(rdata);
 			kref_put(&rdata->kref, fc_rport_destroy);
@@ -2703,7 +2704,8 @@ static unsigned long fcoe_ctlr_vn_age(struct fcoe_ctlr *fip)
 
 	next_time = jiffies + msecs_to_jiffies(FIP_VN_BEACON_INT * 10);
 	mutex_lock(&lport->disc.disc_mutex);
-	list_for_each_entry_rcu(rdata, &lport->disc.rports, peers) {
+	list_for_each_entry_rcu(rdata, &lport->disc.rports, peers,
+				lockdep_is_held(&lport->disc.disc_mutex)) {
 		if (!kref_get_unless_zero(&rdata->kref))
 			continue;
 		frport = fcoe_ctlr_rport(rdata);
@@ -3061,7 +3063,8 @@ static void fcoe_ctlr_vn_disc(struct fcoe_ctlr *fip)
 	mutex_lock(&disc->disc_mutex);
 	callback = disc->pending ? disc->disc_callback : NULL;
 	disc->pending = 0;
-	list_for_each_entry_rcu(rdata, &disc->rports, peers) {
+	list_for_each_entry_rcu(rdata, &disc->rports, peers,
+				lockdep_is_held(&disc->disc_mutex)) {
 		if (!kref_get_unless_zero(&rdata->kref))
 			continue;
 		frport = fcoe_ctlr_rport(rdata);
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
