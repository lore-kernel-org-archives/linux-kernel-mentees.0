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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D221C33C9B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 19:30:54 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65D09206DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 19:30:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="reG5fXVi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65D09206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 21EAB203D1;
	Tue,  7 Jan 2020 19:30:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hAcq-M9IQGC9; Tue,  7 Jan 2020 19:30:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8CA272012D;
	Tue,  7 Jan 2020 19:30:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7AF83C1796;
	Tue,  7 Jan 2020 19:30:53 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A7DE6C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 19:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A39F086235
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 19:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bRVVrjI4dVL2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 19:30:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3B02A8624E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 19:30:52 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id x17so118795pln.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jan 2020 11:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ydzbsY0i6MRr67P6Q3t/fs+mF8B+uFgZNEmwYDqmlq4=;
 b=reG5fXVibdr1/s8/SEGRIYgTyVBxOrtDm7KwQso8puDhJZxksCbfim8QllpxbDifoQ
 mS3J0KTvMA6FXU4JkXC8Pysm+hTpffxlUDJgxr+ftSOjddhSdlLVP8IHRctJN5TpHJgF
 QDMhdwBxf8ghJ/wiA/r/okq4FOGA3eeT0GS9ddHnDva/+js7icy2YYSbidm70QuFZExR
 Tgs9j9vXOGz0Rqwd1fwr0l9Kc6Qazv4qoxowPYg4ob0QYkQ2iVBnq7ZU4Q7BNR61m5eC
 v9+kyXWuSjA8jZuAJqmT4AFBQdajI68kaPZQv7cFNLjTcJV9zLDBVDo5AQajmeBjsDRn
 eI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ydzbsY0i6MRr67P6Q3t/fs+mF8B+uFgZNEmwYDqmlq4=;
 b=tdqZjUBy67gPq8LZiro+9AnzwlDUuj9lQ7MGrn7CZl2ohmjvsKbvz4kHPk1AykRys2
 o9ndqm97dDuSn4XskX7O2IKuAza5RvmzQQ1ln/0gd8PnhN9ckpNIKDeizXXUdLvc2z3l
 NmN4ETF8rGSOKiCVEmSzj5P5zaZJm6eN4QKFHklzT0k/E9StlndHEPpPnfmFvIVES3Xb
 9YnPNHZ21cL9Vf6/+JoA0PnR3YXGQOyAZTlJ83akdBfHkf0irI+pLgZ7MNtauOtYOeLA
 dLKDlDyotHHAMVeIoeNBAsCwuyzK7qjH84qqABGsFE/EyIbEzu62R6agXq/PBbwikoPH
 /xUg==
X-Gm-Message-State: APjAAAWZaObczs2tpg8nDRxywzefpMQ1RMr3D8s6+x0ZGDJjiZzNgVU+
 fl6CJkJ9Mm2lRPXdkCYVlZI=
X-Google-Smtp-Source: APXvYqyT8DiyCXnAXgGXM1MjaexNfnV7NDyjZ9hYDYGqwl0OuJyFXQ/FDcVHv+tz7Sd8H+/yMOK1tQ==
X-Received: by 2002:a17:902:c509:: with SMTP id
 o9mr1305510plx.112.1578425451687; 
 Tue, 07 Jan 2020 11:30:51 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee3:fd53:8500:6ea8:4ef2:c9be])
 by smtp.gmail.com with ESMTPSA id j9sm357775pff.6.2020.01.07.11.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 11:30:51 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: dennis.dalessandro@intel.com, mike.marciniszyn@intel.com,
 dledford@redhat.com, paulmck@kernel.org
Date: Wed,  8 Jan 2020 01:00:39 +0530
Message-Id: <20200107193039.22836-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
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
index 33778d451b82..845ba888734e 100644
--- a/drivers/infiniband/hw/qib/qib_verbs.c
+++ b/drivers/infiniband/hw/qib/qib_verbs.c
@@ -329,7 +329,8 @@ void qib_ib_rcv(struct qib_ctxtdata *rcd, void *rhdr, void *data, u32 tlen)
 		if (mcast == NULL)
 			goto drop;
 		this_cpu_inc(ibp->pmastats->n_multicast_rcv);
-		list_for_each_entry_rcu(p, &mcast->qp_list, list)
+		list_for_each_entry_rcu(p, &mcast->qp_list, list,
+					lock_is_held(&(ibp->rvp.lock).dep_map))
 			qib_qp_rcv(rcd, hdr, 1, data, tlen, p->qp);
 		/*
 		 * Notify rvt_multicast_detach() if it is waiting for us
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
