Return-Path: <SRS0=8tby=Z3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3789C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Dec 2019 18:54:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCE102464D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Dec 2019 18:54:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YJuwZ9C5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCE102464D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9DA3E88482;
	Thu,  5 Dec 2019 18:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lyCuwr8RhXjH; Thu,  5 Dec 2019 18:54:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 186558847B;
	Thu,  5 Dec 2019 18:54:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F06DBC18DD;
	Thu,  5 Dec 2019 18:54:27 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 72D23C077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 18:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 59FD525C73
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 18:54:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zT5NE7vIX3EH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 18:54:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id C3CF025C6F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 18:54:25 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id bb5so1613253plb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 05 Dec 2019 10:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=WN8ERINy6PXUGcWY7m9MoPwmPVqxaKRp2RAYWnDloq4=;
 b=YJuwZ9C5x9gP/4dhKBFCfhkq+pDYAjYcl10yYW0hgcWgTz3pG4ORfl5iAzoThLRWZC
 2uPWnUdI2s6YnkL+puMXun/cNGR9tT8YX/DLIw2CzXA+wy70ln6mSGkai9+EHU9mw0+9
 eKhiKH9w+t/Dj4b8L+a0PQ+rjGi7q5V46LzUKrLz2VHTEjJ+nXK5It8gRRDR8KD5tQTI
 xEl7F90XB98VydSe82zxNn2DaLwPSA5SAHNsPt6dueTBl9vmlbaVVwPKvtPmrFw7I/Wv
 Gn5jIuYbzKI7I1TTijHskJivYyKGLQenmM9y4MSl27IoH/u7Kj6nOnchzyiMBioxmIz6
 NZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WN8ERINy6PXUGcWY7m9MoPwmPVqxaKRp2RAYWnDloq4=;
 b=XWuz/jaKWE0aus3SPt2LF6u+k8nkr/n9nYXlFTQI/zo1VhUaMBR39kWYRtrnr0wiwP
 Yr4UAWvoCiRJuoh3C/lPq/E8lp+fscu/zh5BhQWq3gZGockAJVwPNCFLMglJy+HzTWdu
 RX/G76C4xGxki0dm0DPozHMbnKn08/tenDIytE55ShbC+2hcB33km4DYWSKLPeUVuTWE
 tt24kKMtIM3Q2nNl94Vyom37kVktnfzA0acvbtyy3A+jCL+Aduaiuamymi0QSqGMHGu+
 vsGqw44m+O2sH2O5Eo7GUEBKxfhtcMitVK4mxXdpVVJh2F7uyBxnAWLFEZ4diAVw9YjE
 L32g==
X-Gm-Message-State: APjAAAXzc6mvlYC5iURisbdBiIkDhEUgb4pu/RstD9m00RMi+A4lhOp5
 xMmja8kdeZQzwb9YmBEhjYI=
X-Google-Smtp-Source: APXvYqzh8EYHVNRpV4wFsffi47Ko9oBUP66rlZ+yK5qxrXBj3EBpf5iASprcZ8zOukIdAWSERYqTtA==
X-Received: by 2002:a17:902:860a:: with SMTP id
 f10mr10632648plo.326.1575572064915; 
 Thu, 05 Dec 2019 10:54:24 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:cf3:351e:3984:ab1:9b44:803])
 by smtp.gmail.com with ESMTPSA id
 73sm12114203pgc.13.2019.12.05.10.54.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Dec 2019 10:54:24 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: paulmck@kernel.org,
	josh@joshtriplett.org,
	joel@joelfernandes.org
Date: Fri,  6 Dec 2019 00:23:52 +0530
Message-Id: <20191205185352.1957-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: rcu@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] include: linux: rculist_nulls:
	Change docbook comment headers
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

This patch changes the docbook comment "head for your list"
to "head of the list".

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 include/linux/rculist_nulls.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/rculist_nulls.h b/include/linux/rculist_nulls.h
index 517a06f36c7a..bea311c884b3 100644
--- a/include/linux/rculist_nulls.h
+++ b/include/linux/rculist_nulls.h
@@ -104,7 +104,7 @@ static inline void hlist_nulls_add_head_rcu(struct hlist_nulls_node *n,
  * hlist_nulls_for_each_entry_rcu - iterate over rcu list of given type
  * @tpos:	the type * to use as a loop cursor.
  * @pos:	the &struct hlist_nulls_node to use as a loop cursor.
- * @head:	the head for your list.
+ * @head:	the head of the list.
  * @member:	the name of the hlist_nulls_node within the struct.
  *
  * The barrier() is needed to make sure compiler doesn't cache first element [1],
@@ -124,7 +124,7 @@ static inline void hlist_nulls_add_head_rcu(struct hlist_nulls_node *n,
  *   iterate over list of given type safe against removal of list entry
  * @tpos:	the type * to use as a loop cursor.
  * @pos:	the &struct hlist_nulls_node to use as a loop cursor.
- * @head:	the head for your list.
+ * @head:	the head of the list.
  * @member:	the name of the hlist_nulls_node within the struct.
  */
 #define hlist_nulls_for_each_entry_safe(tpos, pos, head, member)		\
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
