Return-Path: <SRS0=vIBS=4A=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED01C3B188
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Feb 2020 07:23:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98882206DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 12 Feb 2020 07:23:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oxVdvJbp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98882206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 630F12039C;
	Wed, 12 Feb 2020 07:23:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EWo0pFm+6cfJ; Wed, 12 Feb 2020 07:23:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BE13320390;
	Wed, 12 Feb 2020 07:23:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A22ECC07FE;
	Wed, 12 Feb 2020 07:23:48 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1D1F1C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 07:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F30448551F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 07:23:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wsruSpCCSbGC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 07:23:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 747388550D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 12 Feb 2020 07:23:46 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id i6so799628pfc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 11 Feb 2020 23:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=sSs36sQnxGTfCuz7UN6u9y3waBifKuK+zZ5r4rWQl60=;
 b=oxVdvJbpI1X86ZupSuF4fCCHh+VlIFzg0QuIchF1F8Njm3jM6YS3bgcGYc3tMmJUtj
 0dY2OWYizLldYRAF3MUfzDF+zSm+bnim1+dDYY2k1a3JvG383nyFfMMLm2yiiFtnIrUb
 q2/gx7A+fTMuyvZCD4e31RC4BE18ZrXePmBYX5dn4KE0n/Qa45iYJgrQivYVkwmD3yH5
 iiQH2Yl0JfvPr1YBNks97L97Z3o/f0kE9JGU7wHrjO/X+8G2jQ3IEAYrkEVW2Cc9VEYq
 ixOxCWE4q5ekznrz1Y8s83snb7YkWP2zWmnQCT8q2CbydlM7y/xyo/+7aWsGElBj22Is
 ZeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=sSs36sQnxGTfCuz7UN6u9y3waBifKuK+zZ5r4rWQl60=;
 b=ObJueku4AenqocWwpRlGSFHD0bYuc1LXXG63V3ELbZsWGEgAQR23OCnsNRM2jAwb/l
 IySJ620JO4AsZZrPtR6MpGA2QT+ZXWMjkVMmffd8BRxP0GIXybLi6+zMoK2QC6IA4Wm6
 cb9mvWJmD9abRfKeP5Za8ZjdrTE2djtzYzhS695oHpKYa9Vht6N2nxvaYv1JtVnoKJux
 ZH+s9lYqWC9pWqBqHx/Iw6C4mgJsPQvaxuHeul06CyNsNORaCm4OQUHO719c1t51qOvr
 KuE+Yjp3cJP3AlQfFAhzunrtgoHerX6yH+0SEq/Ey4IP6JH5glWqLhNNO59PfpksUhnN
 iTcg==
X-Gm-Message-State: APjAAAVMfsMBIBwx6fafdlguumujEW1ze5Jp3o7pNTOCSLoBYF/wQwuU
 VLBZ7ainLMPmpFpJ7ShW3dM=
X-Google-Smtp-Source: APXvYqwBNgRED6yRsaWlnJLa6J3Vw4BvD2nWSBTOSjouHQDAwr2BAFix1nNzBKQslqhWrzDRlDiVAg==
X-Received: by 2002:a65:4305:: with SMTP id j5mr11447953pgq.315.1581492226092; 
 Tue, 11 Feb 2020 23:23:46 -0800 (PST)
Received: from workstation-portable ([103.211.17.79])
 by smtp.gmail.com with ESMTPSA id r26sm6398986pga.55.2020.02.11.23.23.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 23:23:45 -0800 (PST)
Date: Wed, 12 Feb 2020 12:53:39 +0530
From: Amol Grover <frextrite@gmail.com>
To: Hannes Reinecke <hare@suse.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Message-ID: <20200212072339.GH14453@workstation-portable>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email 2.24.1
Cc: linux-scsi@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>,
 linux-kernel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/2 RESEND] scsi: fcoe: fcoe_ctlr:
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
