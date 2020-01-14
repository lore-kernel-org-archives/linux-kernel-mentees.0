Return-Path: <SRS0=Bxrf=3D=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CA66C33C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 16:24:40 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D000824655
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jan 2020 16:24:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2E6iTOF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D000824655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 88A768790D;
	Tue, 14 Jan 2020 16:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MkeuwauRxr6C; Tue, 14 Jan 2020 16:24:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B7786878FE;
	Tue, 14 Jan 2020 16:24:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A4681C1D83;
	Tue, 14 Jan 2020 16:24:34 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 65CE4C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 16:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id D8C2984471
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 16:24:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P6EnKv4NcGeQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 16:24:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A5D4384456
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 16:24:27 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 4so6812052pfz.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jan 2020 08:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=PDyuI6D5hJtH0+thVw4r/qR9DD4Csl28GlClVXYvOmo=;
 b=V2E6iTOF2PVQVslEQICUxmidoKU9xM7zyf01P1l8489cYNbLJV+ZZQtrMLKoe+T8eg
 +RvB47tw077vmFFz1SAkZawppGOeh5OaoMD9v2r5r1y94MTQOQ6ddLw8/VsovLd9ksgB
 NRfbzmyWdVy3/z1cel1683RKLbEehtnBUjZFDT9EgMVCocxLnMwj/o8KvPBRJEnJFrTE
 JkPCEEOTnwhprwu9BJGSmZVnaIEEWLsJ7amXbOu8f9YNbGqjmxFz/NVL57hroXB+ioMA
 3NljDF2X1l1v6dnYyjtA60qgRV+7ya0pidazHJ7gkZ7fLKb0XTCN8wyGHq696y0+STxM
 qqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PDyuI6D5hJtH0+thVw4r/qR9DD4Csl28GlClVXYvOmo=;
 b=UrFS/Wz+dKtPr35aE0wFANhkEu+UKdeuls2og0RZ6E5iVeiOyA6r8GG3814kX3clWw
 b/d+/VA8yVLDVogxM4xlSuQSxcfaqYkqMs7sJHazeuEbnrXNh3OSSpe6GjbXRdVMXGcw
 sZoB2rSgn8d/5I7whxE5dKN/oiPrjdG/2UU0pA88K4U7hlNdfSjRSshjCwaFZO6u/B2M
 /AaMT74B3GzTxuG2eRdQxzsUIw8UmxpX+Nc2r9XrUPEzjmJVklEFkTe075Gj0NzAm3hD
 pENAzQhiY1KTl4y244M2hCUM3bLtJbyTWlZlYUEMAh/pW+0T+cqf9vORXakszCQ+aMCg
 YF+A==
X-Gm-Message-State: APjAAAX0ftVHEXz2hpsts2ylJqxIxPp4qH7A3Y3bwKpdSPOiK5Rh8Zkm
 NFlu8jneXFNbxLSloE5QXPc=
X-Google-Smtp-Source: APXvYqz88bNIaPHzcim/6S/uUF9DpjERKnfgOQ8Qhg0gQstgjbriVUc2j5BW+2+pkvXrCW1t1Hmc0Q==
X-Received: by 2002:a65:56c6:: with SMTP id w6mr28444928pgs.167.1579019067136; 
 Tue, 14 Jan 2020 08:24:27 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee7:f789:438:77e9:83ea:bb95])
 by smtp.gmail.com with ESMTPSA id s20sm17511918pjn.2.2020.01.14.08.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jan 2020 08:24:26 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: mike.marciniszyn@intel.com, dennis.dalessandro@intel.com, jgg@ziepe.ca,
 paulmck@kernel.org
Date: Tue, 14 Jan 2020 21:53:45 +0530
Message-Id: <20200114162345.19995-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/3] infiniband: hw: hfi1: verbs.c:
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

list_for_each_entry_rcu has built-in RCU and lock checking.
Pass cond argument to list_for_each_entry_rcu.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 drivers/infiniband/hw/hfi1/verbs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hfi1/verbs.c b/drivers/infiniband/hw/hfi1/verbs.c
index 089e201d7550..22f2d4fd2577 100644
--- a/drivers/infiniband/hw/hfi1/verbs.c
+++ b/drivers/infiniband/hw/hfi1/verbs.c
@@ -515,7 +515,7 @@ static inline void hfi1_handle_packet(struct hfi1_packet *packet,
 				       opa_get_lid(packet->dlid, 9B));
 		if (!mcast)
 			goto drop;
-		list_for_each_entry_rcu(p, &mcast->qp_list, list) {
+		list_for_each_entry_rcu(p, &mcast->qp_list, list, lockdep_is_held(&(ibp->rvp.lock))) {
 			packet->qp = p->qp;
 			if (hfi1_do_pkey_check(packet))
 				goto drop;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
