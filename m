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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F33C6C33CB1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jan 2020 13:40:54 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6B0E20661
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 17 Jan 2020 13:40:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rfGNejPU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6B0E20661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7EAA786AF9;
	Fri, 17 Jan 2020 13:40:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ee5GUL98u1YI; Fri, 17 Jan 2020 13:40:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C555C86ACE;
	Fri, 17 Jan 2020 13:40:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C156CC1D81;
	Fri, 17 Jan 2020 13:40:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8820DC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 13:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7630C20104
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 13:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8qrkxTXdpnZN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 13:40:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 096531FEAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 13:40:42 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id g6so9907632plt.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 17 Jan 2020 05:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zXrfRGNxYaptzdQKW3ruvzzoYeLM85KhG9IY8/I3S9U=;
 b=rfGNejPUGagicxyRLxw219tfyG1rWkQUrCufiG/ctiahenXe6veGihg1afmK6k7fRD
 HjqzJaOuJ0cZ6hKv3Q5dvTsOriNgi8CIf/dgIVfu4BhSVCc2HZ9V60/zQsrrgSkcmz45
 GcHb1sAPN64xCEuHl7nh+/9hTJb96sQSxucahqnXOpNARYiyaLf1D3CqGoS9WEPEVkET
 41z4H4Oyb2K3667qt8ZT9nZ57LL0FO7wz0DeeIqHFKrOEyAlD9B2Grv1xe/2VgS9Eh0P
 97smQtjSUd8uig9i+qSUvCEs6W8DyR8J9ssHB1sy8crxrcxJbrntR6P7NpYBVeKUJGqn
 cruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zXrfRGNxYaptzdQKW3ruvzzoYeLM85KhG9IY8/I3S9U=;
 b=a0JNr0oBxnNplSRud0iWHlKLNXWXttxjXOLHpv1CY3+BvxX/1ZUCF4v4GuDKC76pHL
 WvPujgJliNGaJrCkjIxcHXlvt9krdQOg+LZ9frxFdDcLCBNp1D85sds2q8VTsb0L8KvK
 s+h/h+v4VOkKyykZ43iLAPyW8+LITkfWZ/LRcg2D9Kvy9xhLNRPBrCwGv5TyJGKI/uxT
 xd5r4CqGo+8fEFoFA8VgIofQ2kRxf/cChbBq3/yQHe0XF18wqbzSa9dtE/UuYI9cjrNm
 NcgEHZ643cxdYYix5jk34wucpRGK5yjEyEZzp8B2svHPah3WUCniDfyyGn4QzEs2aoad
 jNiA==
X-Gm-Message-State: APjAAAVsE8rFdaXwJC8CPZ/qf3T9++pP7G+BKo7S4s3ryi2p4Y+M09u4
 M810yRElimZRJTdSZSMGdbA=
X-Google-Smtp-Source: APXvYqyVc05WyoVE5bUoLutO0bBZRHMtNK98gCIWNtZTIBNQWPX3L9VS2Qlm+6mjOLaR241hPcn+/g==
X-Received: by 2002:a17:902:d915:: with SMTP id
 c21mr38236848plz.295.1579268441647; 
 Fri, 17 Jan 2020 05:40:41 -0800 (PST)
Received: from localhost.localdomain ([103.211.17.168])
 by smtp.googlemail.com with ESMTPSA id
 s18sm29522422pfh.179.2020.01.17.05.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jan 2020 05:40:41 -0800 (PST)
From: Amol Grover <frextrite@gmail.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 17 Jan 2020 19:08:55 +0530
Message-Id: <20200117133854.32550-2-frextrite@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200117133854.32550-1-frextrite@gmail.com>
References: <20200117133854.32550-1-frextrite@gmail.com>
MIME-Version: 1.0
Cc: "Paul E . McKenney" <paulmck@kernel.org>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, target-devel@vger.kernel.org,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 2/3] drivers: target:
	target_core_tpg: Pass lockdep expression to RCU lists
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

tpg->tpg_lun_hlist is traversed with hlist_for_each_entry_rcu
outside an RCU read-side critical section but under the
protection of tpg->tpg_lun_mutex.

Hence, add the corresponding lockdep expression to the list traversal
primitive to silence false-positive lockdep warnings, and
harden RCU lists.

Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 drivers/target/target_core_tpg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/target/target_core_tpg.c b/drivers/target/target_core_tpg.c
index d24e0a3ba3ff..7aa0240a7948 100644
--- a/drivers/target/target_core_tpg.c
+++ b/drivers/target/target_core_tpg.c
@@ -110,7 +110,8 @@ void core_tpg_add_node_to_devs(
 	struct se_device *dev;
 
 	mutex_lock(&tpg->tpg_lun_mutex);
-	hlist_for_each_entry_rcu(lun, &tpg->tpg_lun_hlist, link) {
+	hlist_for_each_entry_rcu(lun, &tpg->tpg_lun_hlist, link,
+				 lockdep_is_held(&tpg->tpg_lun_mutex)) {
 		if (lun_orig && lun != lun_orig)
 			continue;
 
-- 
2.24.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
