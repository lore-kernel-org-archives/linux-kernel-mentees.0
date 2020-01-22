Return-Path: <SRS0=N8o/=3L=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD93C2D0DB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jan 2020 17:03:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA1862465A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 22 Jan 2020 17:03:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="udoNc8+p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA1862465A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id AF6D487E19;
	Wed, 22 Jan 2020 17:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id luVJVjBmNCc1; Wed, 22 Jan 2020 17:03:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4452887E0A;
	Wed, 22 Jan 2020 17:03:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 27B33C1796;
	Wed, 22 Jan 2020 17:03:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F366C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jan 2020 17:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6853F204FE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jan 2020 17:03:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B-CCEIIfBouq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jan 2020 17:03:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 05ECE2036D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jan 2020 17:03:32 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id e11so165795pjt.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 22 Jan 2020 09:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=jqNBkbZMwy19kOHcx6NrygN9IcG823sl9KjLJVX13II=;
 b=udoNc8+pJuT1/uLXNiK/pdBWmz4h5ouYltOmOXxoesWun39QRITmN2aPCFYQurU1yr
 zANY36cnhereu90S2EOXl+gUtZOy/uMty/7j+ukXQlE1/Dfkwnieuw4opEpaux0Eos/k
 T3CaW1rdIFo/Fw6jMYE7xwFZwjJ6u3qoweN4+reZw3dJXhDfEgeJEWnwiNeWaINTr8Aq
 xA60sss57Rq+7/EHNVwlLB6VzhO3yhq5S4I/SXA8KZme5qbJqmBs7iN1TuaxF3/5qEd2
 ZQu0vOXzMgtcJdO55ITMCXUYlfa4byZjiRQiRMsKLl8kGBQTxb4kBzJ7Sl70QQLSMNjl
 EI/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=jqNBkbZMwy19kOHcx6NrygN9IcG823sl9KjLJVX13II=;
 b=lo1wJCht+ublpsLe21s4ojpWyxN35k/CkE5l4G7ksKUjcT6Bl5s1USMVnjFEoCbvp7
 8BqsKEElybN8RherQRPYVosj6A8vq2BQWPtr+0Vsvb3GBBZiFrpU8zrIj+BBYM3UVePM
 d2GFoomSsVNKVX1AVvnDrFMoEmOCYQIekT7iY1hI2+kmw1nxG2GC6dGQPckFHtVGli61
 zMEs7//1OVZsYpQNOaKjUjzzR1IOX/8tLmSI9OcVvLBWdMP3UAPtb4zX5StXhYeQk2rx
 ONidWCXKn+eLWHIuoIOxVkw2uJ9NNXspAv6LZhKXmKZC7eRQOS1k5TcfhF3njYwbVfP1
 NRdQ==
X-Gm-Message-State: APjAAAXrgbx8bf98qFx2u1nRwkx2E7ZF0QlWhuHDQJpL6NEOeXzkaLce
 86H9urhiYQ7y4az0J7zR/w==
X-Google-Smtp-Source: APXvYqy99bLz1JWoyph9iIgOzcLd/caqRGosXjDmnNy32D/Yy85xL9gRmYMlNuhEsnqM5Xbl3ZZ63g==
X-Received: by 2002:a17:90a:fa88:: with SMTP id
 cu8mr3848711pjb.141.1579712611677; 
 Wed, 22 Jan 2020 09:03:31 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1eee:fc60:1df1:6c1a:3227:9ec0])
 by smtp.gmail.com with ESMTPSA id b8sm48682682pfr.64.2020.01.22.09.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 09:03:31 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: steffen.klassert@secunet.com
Date: Wed, 22 Jan 2020 22:32:46 +0530
Message-Id: <20200122170246.20177-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 linux-crypto@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] padata.h: Annotate parallel_data
	with __rcu
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

From: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>

This patch fixes the following sparse errors:
kernel/padata.c:110:14: error: incompatible types in comparison expression
kernel/padata.c:520:9: error: incompatible types in comparison expression
kernel/padata.c:1000:9: error: incompatible types in comparison expression

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 include/linux/padata.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/padata.h b/include/linux/padata.h
index 23717eeaad23..72a081dd2b73 100644
--- a/include/linux/padata.h
+++ b/include/linux/padata.h
@@ -143,7 +143,7 @@ struct padata_instance {
 	struct hlist_node		 node;
 	struct workqueue_struct		*parallel_wq;
 	struct workqueue_struct		*serial_wq;
-	struct parallel_data		*pd;
+	struct parallel_data __rcu		*pd;
 	struct padata_cpumask		cpumask;
 	struct blocking_notifier_head	 cpumask_change_notifier;
 	struct kobject                   kobj;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
