Return-Path: <SRS0=MteQ=24=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EBBC33C8C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 17:36:15 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CBD3208C4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 17:36:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DetI79OZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CBD3208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 70FB7852D5;
	Tue,  7 Jan 2020 17:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CZ2IYVAHrjkv; Tue,  7 Jan 2020 17:36:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 113358526D;
	Tue,  7 Jan 2020 17:36:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1381C1796;
	Tue,  7 Jan 2020 17:36:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C282C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 17:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 47E7885F8E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 17:36:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3J-Zwt74K1YC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 17:36:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E32A4859C2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 17:36:12 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id d5so80235pjz.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jan 2020 09:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=biLJqx330MZclQKessEfLfXglMmNrWIIv270QImnfKc=;
 b=DetI79OZZiQHKwD5ytiJKZTadN7iND/zQ69WntNloQLAuUnsnXLxQbxbT302EGkP0k
 JKVSpJJWgoVaIKkfSKz+E8+2ap8U3uS+flJoget1HgVrMlQpsqaoZBLe6WZnuiWBzFks
 qrrbwymrQDXDzQwOtRm47krEls20N/8pNSGrR2zjBPxaEPuoCIezIQY7wkRtH0ocALOW
 p5ouOZ4Ztu4Zd/d5CSrAo51KYnMc0otMcQN0SBhHB8YgL4yR1F1OvT8tRizdRtmKMgs3
 wZ97riPRtD5cQMMgmHYQoViL5wvfIBl51CHzszJHkWDCr9/36owjkqFCzcqn86Jc/ih+
 Hn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=biLJqx330MZclQKessEfLfXglMmNrWIIv270QImnfKc=;
 b=FNn78DeMesj/y/fomz/ivX3dYBlTAlTBx7TMNRScQpr7iI11xfskUleAtK6SiMh7Dm
 vAJ8nteI82PoUxzL0lspo4gVY0RlF1Xgil8nVFiZwbgVE6oyBJZ1m7Zv3Ddcly3rSiWl
 MXdk62c4CrR06foytjwEEfQtorjiA+Obf7nWlsDgKz2Ay/rCwSMxIgSaMCi/gWbJifII
 0qxsM2UdX+fyfJfSxpUaa7PMYx1pk8QANmbR67Vzhixm6MjVzpR5FL6Sv0bA4S+0fROs
 /C18FE0E8TQp26y5B1WO3OS0UtToalmB1TnzwIs1JDVzAVbpabzaqlHIaVlINYho/pPh
 ph0g==
X-Gm-Message-State: APjAAAVZqvp21n16yFcdr0n/wg09uOFP+JfSLZngeftj3uUnBS5hOvga
 0SuJcpm0Gu3XUcUYey73fq8=
X-Google-Smtp-Source: APXvYqwufFongLMRCZQI7krPgU64ZUrZqMS981mDC0wZjM39AA/2YeOgJm3A7rVk2a6ElDanPjotbw==
X-Received: by 2002:a17:90a:fb4f:: with SMTP id
 iq15mr961026pjb.86.1578418572370; 
 Tue, 07 Jan 2020 09:36:12 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee3:fd53:981d:523f:a647:bef8])
 by smtp.gmail.com with ESMTPSA id d3sm130091pfn.113.2020.01.07.09.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 09:36:12 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: dennis.dalessandro@intel.com, mike.marciniszyn@intel.com,
 dledford@redhat.com, paulmck@kernel.org
Date: Tue,  7 Jan 2020 23:05:09 +0530
Message-Id: <20200107173510.20320-2-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200107173510.20320-1-madhuparnabhowmik04@gmail.com>
References: <20200107173510.20320-1-madhuparnabhowmik04@gmail.com>
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 2/3] infiniband: hw: qib: qib_verbs:
	Use built-in RCU list checking
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

From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

Use built-in RCU and lock checking for list_for_each_entry_rcu
by passing cond argument to it.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 drivers/infiniband/hw/qib/qib_verbs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/qib/qib_verbs.c b/drivers/infiniband/hw/qib/qib_verbs.c
index 33778d451b82..4dc7514ce626 100644
--- a/drivers/infiniband/hw/qib/qib_verbs.c
+++ b/drivers/infiniband/hw/qib/qib_verbs.c
@@ -329,7 +329,8 @@ void qib_ib_rcv(struct qib_ctxtdata *rcd, void *rhdr, void *data, u32 tlen)
 		if (mcast == NULL)
 			goto drop;
 		this_cpu_inc(ibp->pmastats->n_multicast_rcv);
-		list_for_each_entry_rcu(p, &mcast->qp_list, list)
+		list_for_each_entry_rcu(p, &mcast->qp_list, list
+								lock_is_held(&(ibp->rvp.lock).dep_map))
 			qib_qp_rcv(rcd, hdr, 1, data, tlen, p->qp);
 		/*
 		 * Notify rvt_multicast_detach() if it is waiting for us
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
