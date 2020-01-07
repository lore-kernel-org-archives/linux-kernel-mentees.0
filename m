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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC2F8C282DD
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 19:31:30 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8493D206DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 19:31:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ayegAG88"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8493D206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 53E1A203D1;
	Tue,  7 Jan 2020 19:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iPN-YvLkaRKE; Tue,  7 Jan 2020 19:31:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BB4EB2044E;
	Tue,  7 Jan 2020 19:31:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6FABC1796;
	Tue,  7 Jan 2020 19:31:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D0F68C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 19:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id B791786256
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 19:31:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XDwGriHf+2NX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 19:31:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 58BC086235
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 19:31:28 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id k3so349537pgc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jan 2020 11:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=3ST/dj3po+BlNeYM5PMnB4Z+srpzBM2wonPJAfu44pg=;
 b=ayegAG88ic4ZMzTrQ5veoMKLjpAiwBmaJgBtFHY14G+/hkJWblccaas0os4TVCGKU0
 JGskHw2/EF9g9oqgXWRZsQu4bwEUv/mzKh0vtW8N5JbfoEpH5mc0iHPYBSMiPx+kQ2Ii
 UuR8zZmrVymnRwa0240MOFfMrmIM7RKUC65YyifibGP5k6UoAFQFrFilwcrjFwwEBxtx
 G+FprGREsEVGy+JsYmWUJV4/xv8NtSNKW/yHeoQktpOY5C/saZF2HMvWjOEQKzWmNd40
 +W24LHsjIQZ/DDnBiyXvFxhjBBjSMsYlbxPM5KLkvs/s/edJ/HDUCfqpw616E4/D+1Rq
 114g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=3ST/dj3po+BlNeYM5PMnB4Z+srpzBM2wonPJAfu44pg=;
 b=n6TKTeio/4AwE5zPkqLz8QuvsgxMDmPkcRCs5R6dqI2Z7rkHWXWJN3PBorPAxfjXZ3
 IeFudoaSk5Usfd2YwHZ3gw65JsdjWHB0w7jgNEz9v9pZoI5zM9M0l3Hgtmey2JOtyEWN
 exVaKtBmn/AiSwYyHeZnLehPN7uLwbS93sD7F0D+HPWnxQJiutzuCWfRVeOWkRGIPlh2
 pvAX2bcg0jmLfJvyPBbjtC7tA+zomFOZPXB6YcnIhDcG+Pn9rE58nHOoAfWxzunsFwZZ
 z2oGLJd6RmavALqWw609BWTZG9qzZnjqbHH9oZpyJYuje5fUr0BnCiP1+2pbCth23jPI
 CX8A==
X-Gm-Message-State: APjAAAVq2KAheIgwIAwLt/UGsOSB69ZggH8EJBv0DJ+iHUFRDK/u+P51
 Rl4ZLnEqvWe1u4dnXtx/Pzs=
X-Google-Smtp-Source: APXvYqwEJ4DGXraHQ+XTpgucybYYLANGWqLS0H5FRZ2LWC/vCHUIp2l5InPQcrZS3vIu3NDqkcJVHA==
X-Received: by 2002:a62:1548:: with SMTP id 69mr837034pfv.239.1578425487834;
 Tue, 07 Jan 2020 11:31:27 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee3:fd53:8500:6ea8:4ef2:c9be])
 by smtp.gmail.com with ESMTPSA id b4sm365817pfd.18.2020.01.07.11.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 11:31:26 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: dennis.dalessandro@intel.com, mike.marciniszyn@intel.com,
 dledford@redhat.com, paulmck@kernel.org
Date: Wed,  8 Jan 2020 01:01:19 +0530
Message-Id: <20200107193119.22915-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 3/3] infiniband: sw: rdmavt: mcast.c:
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

Use built-in RCU and lock-checking for list_for_each_entry_rcu()
by passing the cond argument.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 drivers/infiniband/sw/rdmavt/mcast.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/sw/rdmavt/mcast.c b/drivers/infiniband/sw/rdmavt/mcast.c
index dd11c6fcd060..983cf6d06dfc 100644
--- a/drivers/infiniband/sw/rdmavt/mcast.c
+++ b/drivers/infiniband/sw/rdmavt/mcast.c
@@ -224,7 +224,8 @@ static int rvt_mcast_add(struct rvt_dev_info *rdi, struct rvt_ibport *ibp,
 		}
 
 		/* Search the QP list to see if this is already there. */
-		list_for_each_entry_rcu(p, &tmcast->qp_list, list) {
+		list_for_each_entry_rcu(p, &tmcast->qp_list, list,
+					lock_is_held(&(ibp->lock).dep_map)) {
 			if (p->qp == mqp->qp) {
 				ret = ESRCH;
 				goto bail;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
