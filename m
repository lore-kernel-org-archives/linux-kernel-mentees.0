Return-Path: <SRS0=QLdQ=3E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37E27C3F68F
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 15:56:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1964222C3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 15 Jan 2020 15:56:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pfZQgYjB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1964222C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A313081D08;
	Wed, 15 Jan 2020 15:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id prXipUnUoudD; Wed, 15 Jan 2020 15:56:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B660981C6B;
	Wed, 15 Jan 2020 15:56:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB463C1D83;
	Wed, 15 Jan 2020 15:56:44 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2915C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9A2C2204AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:56:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s-wgTgEeiKYk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:56:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 5DD2A2040A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 15:56:38 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id i6so8716434pfc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 15 Jan 2020 07:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=HwV9sGACUDknSqn3rZRjdfv8PQfY2jtJrBDpPLg25bE=;
 b=pfZQgYjBcjyCtn6E2E//UIWWV7YF8uAjc6ggh4p5mbPc/GNDh/t8TClwCoKqEY9iKm
 31WcNv/TU4fwcs85/hvITBoBQwLVXKXc/pq1wY9AFtXF2yclNcKLougfpxo4Rk7HthPf
 JKGNTLguhyvB97/Am9L/CUP3MrCj/46w4fxjcRfkXO25T4sy6vMUxLTAtfX+DvZ+ztaN
 0TJinWp2KwiFxkOa5ztbYrQZYs73Hv1EuT6dgymCzvzr+fdm6LEZUH2G+6yYELu7EAOO
 KM6yEegZ79mbzuNRVufVKJ2z4+wCZyjhs7MRMvV9HWkgyOvBGAQgQiMD9SVbFGb4EqZn
 upRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HwV9sGACUDknSqn3rZRjdfv8PQfY2jtJrBDpPLg25bE=;
 b=PaEheQjtbAPNpLHaID8rv9cu9flGDJOJtLsYtZdeeQ59v5pXdj32v7TixK0qHTunPf
 w7i2oEeiFH0LZRqpQrAprVP0hl6Th+FtCKcFJYzqA6x1Sd7wVqXsXCUz+6Z75KSzj0L0
 DTCGjETME+XKrGnxBWuEuA2NuuHs5Euxayg4mfpaCdRYKDH9z9dS3dQpxYALp0dAs8ap
 mpzoZsNZHXKnrHIYmRmY0/M0c1BmvO5c/FLqS+zOeKCEjjA8VcVdlvr+nGJeqgOLo/Fa
 TPB5LKAqEZDWycd21rG8wc9s5bxTl0DiyiPf35F4qaP1HOYgj3Rvrw34UMjGcjp9Fhyo
 BtEA==
X-Gm-Message-State: APjAAAVvzAsDoIQEsY5rqmfCKDWKCvIvr3e9p8CUJ6aUwoHSUx4vKmxX
 Siv0hM3Yz7tA+Yw0QaKf+HU=
X-Google-Smtp-Source: APXvYqwfBfFNxEYPBk1P4r0u33EcwZqChtsYsDBcPVXmULzU6XIoKIK5xPGRQ8bZGAylr4brUje92g==
X-Received: by 2002:a63:4b50:: with SMTP id k16mr34152524pgl.386.1579103797712; 
 Wed, 15 Jan 2020 07:56:37 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee8:ed72:75ba:e01f:bdbc:c547])
 by smtp.gmail.com with ESMTPSA id b8sm22755599pfr.64.2020.01.15.07.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2020 07:56:37 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: wei.liu@kernel.org,
	paul@xen.org
Date: Wed, 15 Jan 2020 21:25:53 +0530
Message-Id: <20200115155553.13471-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 joel@joelfernandes.org, xen-devel@lists.xenproject.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] net: xen-netback: hash.c: Use
	built-in RCU list checking
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
 drivers/net/xen-netback/hash.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/xen-netback/hash.c b/drivers/net/xen-netback/hash.c
index 10d580c3dea3..6b7532f7c936 100644
--- a/drivers/net/xen-netback/hash.c
+++ b/drivers/net/xen-netback/hash.c
@@ -51,7 +51,8 @@ static void xenvif_add_hash(struct xenvif *vif, const u8 *tag,
 
 	found = false;
 	oldest = NULL;
-	list_for_each_entry_rcu(entry, &vif->hash.cache.list, link) {
+	list_for_each_entry_rcu(entry, &vif->hash.cache.list, link,
+				lockdep_is_held(&vif->hash.cache.lock)) {
 		/* Make sure we don't add duplicate entries */
 		if (entry->len == len &&
 		    memcmp(entry->tag, tag, len) == 0)
@@ -102,7 +103,8 @@ static void xenvif_flush_hash(struct xenvif *vif)
 
 	spin_lock_irqsave(&vif->hash.cache.lock, flags);
 
-	list_for_each_entry_rcu(entry, &vif->hash.cache.list, link) {
+	list_for_each_entry_rcu(entry, &vif->hash.cache.list, link,
+				lockdep_is_held(&vif->hash.cache.lock)) {
 		list_del_rcu(&entry->link);
 		vif->hash.cache.count--;
 		kfree_rcu(entry, rcu);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
