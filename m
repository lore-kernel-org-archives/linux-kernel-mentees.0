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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C512C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jan 2020 15:32:22 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D316D2073A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jan 2020 15:32:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P84BI8hW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D316D2073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A1D862050C;
	Fri, 17 Jan 2020 15:32:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uhqZwT5b93w1; Fri, 17 Jan 2020 15:32:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E916822005;
	Fri, 17 Jan 2020 15:32:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E590FC1D81;
	Fri, 17 Jan 2020 15:32:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EB6D2C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 15:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D9B7686928
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 15:32:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kUVLDID0ywoj
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 15:32:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 83CA386925
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 15:32:09 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id 6so11854607pgk.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 07:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vsblHe4BrZXvpcTixylwUCR+Uct1lSaVWajbm+319XI=;
 b=P84BI8hWdgxcB+0kowQ9tTtH+clpCV53/uwgm1fVI3l8tZjFgkNNRf3A3bWGHBpJN1
 L2X6gHUqblk8BNR1ihsyAebJ9nWxkeTvSQXlYM/aorOhx5T5kWXu1H2RSP2jbA1+p2u1
 t1tVDMlGoGu+e++dT6VlGayNKXBK6Y7hnpBCTZ5PXF3rykHUEcgVb/2LROaEmBJPP7q1
 hr9Jwq4PHcB+SOOyvs8L8lFEd1AxMtB4Kji7061vXqQxlAHP6QjGtJH3DdLOG7QqzHxG
 GolP3+EQ6m2rIBo0KTDBekAbZ+vxVLOaBj7OQk5nQiyzvQu5LlaaiMyQv+qLtPew1jkK
 QR3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vsblHe4BrZXvpcTixylwUCR+Uct1lSaVWajbm+319XI=;
 b=RiBsyS0dT37s1cEfU1CZl9LxdV1Q63MPTqIoH1VXE5gc1Z9k7+4zn2zqoPqO23xt4a
 xnqknXJocTEHDz6wxGorYEX9JEDpS7G/K98c5bsB/j3VLL1n2buKdX3MF6e3zgXQnUE7
 eVz1BAutacT39scCuN4YWOC++PURqT9SKHjQHP/WPEZcEvgsKLKSj1scl6Uz9m60wf/o
 DRnuofD83LF5dlvRgHvOfhGBAhOxcZEgPjj/sjn16ReaiAigxufhTwrA3c1wNZxfQ8v3
 84JKNwgjQxSKEiODgUN/8oxmgCIKXH/LdsPDH9TfoniCF5FFk3RZB70OMLZR5QqUhRnt
 mlrg==
X-Gm-Message-State: APjAAAUjYqxuTLOwrzE1YLXbIKETBKwEIwTs4VNOQHCPBcqmEdi9matD
 XBx1oEL1Cx3p19auYvkb9bw=
X-Google-Smtp-Source: APXvYqyx/DoiLmiFuSGvMMgvwwNgyzCWwMzktxQaXrSFe6BTj7v3p5/Cs7TEnH62gct1Yemj0iRhcg==
X-Received: by 2002:a63:2842:: with SMTP id o63mr46669470pgo.317.1579275129159; 
 Fri, 17 Jan 2020 07:32:09 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.168])
 by smtp.googlemail.com with ESMTPSA id d20sm7851020pjs.2.2020.01.17.07.32.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 07:32:08 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: Hannes Reinecke <hare@suse.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 17 Jan 2020 21:01:24 +0530
Message-Id: <20200117153123.2648-2-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117153123.2648-1-frextrite@gmail.com>
References: <20200117153123.2648-1-frextrite@gmail.com>
MIME-Version: 1.0
Cc: linux-scsi@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>,
 linux-kernel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/2] drivers: scsi: qedf: qedf_main:
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

lport->disc.rports is traversed using list_for_each_entry_rcu
outside an RCU read-side critical section but under the protection
of lport->disc.disc_mutex.

Hence, add corresponding lockdep expression to silence false-positive
lockdep warnings, and harden RCU lists.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 drivers/scsi/qedf/qedf_main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/qedf/qedf_main.c b/drivers/scsi/qedf/qedf_main.c
index 604856e72cfb..17eab7f8cf05 100644
--- a/drivers/scsi/qedf/qedf_main.c
+++ b/drivers/scsi/qedf/qedf_main.c
@@ -420,7 +420,8 @@ static void qedf_link_recovery(struct work_struct *work)
 	 * ADISC since the rport is in state ready.
 	 */
 	mutex_lock(&lport->disc.disc_mutex);
-	list_for_each_entry_rcu(rdata, &lport->disc.rports, peers) {
+	list_for_each_entry_rcu(rdata, &lport->disc.rports, peers,
+				lockdep_is_held(&lport->disc.disc_mutex)) {
 		if (kref_get_unless_zero(&rdata->kref)) {
 			fc_rport_login(rdata);
 			kref_put(&rdata->kref, fc_rport_destroy);
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
