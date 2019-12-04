Return-Path: <SRS0=/i4J=Z2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B7EC2D0B1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 12:04:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC6472081B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  4 Dec 2019 12:04:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G+5KquLI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC6472081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 85EB686C20;
	Wed,  4 Dec 2019 12:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n4ao7qP21L5c; Wed,  4 Dec 2019 12:04:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3030386C04;
	Wed,  4 Dec 2019 12:04:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14827C18DD;
	Wed,  4 Dec 2019 12:04:18 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B7AAC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 12:04:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 28DFD86165
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 12:04:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MRiVjJGZ1A0x
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 12:04:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A5FB3876EE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  4 Dec 2019 12:04:16 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t3so3297233pgl.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Dec 2019 04:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=dDGPKtBgp3h3EHMEwrPDJs+i5FCz6x10d30Qfj8cLXo=;
 b=G+5KquLIPyJO0zJboz7wysKUs0fhu4LYyUcRaQcq8kKSnIY8RT4e7G7P1TZA/W7BS9
 tu1CIQHu8ZSxMVEkQr6X0X8Aufd6k3hp65D6J2VAf1CS5l9OmFKOrVEJIfdSrUfRyhrh
 gGVlkLnyZpXCD5j76b9CJp4IFHCwnuodXfqHVLtS5gAGw+ZFcBYYQ9xA0BegL2+aRc13
 L2KgDuwJasldw0IEKNiMAOCa2Pa8vpNPlNgeOlrtGGqm8rmqkM8WSP6pNT80UL7qG5tj
 QuAhcc8//BiOPKzS05gHbcHPgmSWOvK21cq7tLyOfZTci+w5q4TedQuTEnOEBxzkO/89
 cyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dDGPKtBgp3h3EHMEwrPDJs+i5FCz6x10d30Qfj8cLXo=;
 b=id85tksxcJ90DD6VWztu7L0my3JWYxZNJUJ/eyieYhoE12OefBb/TPGOXRz3uZfspU
 AiFVeAnfHiPdP/lez/EYTbs/puB8JYAgr7+awQswj2NGUZOIQPosxfvmGHPv5ghw0hrp
 VrgFC4410LWvympfLCbzUx+N7bNCnSRjU2gjQGL8X1jBVvQrPP4nIY5SzEw2jnWAwWCt
 JUpKX8ytF3Gm+3GQb+KHnq09QBTI2Cgd/30YSNDCNkeMLci7UMpR/ktFEqnGmuMcUgEi
 fUNt+8glUFziC+d/tf7eZwIJsHRiwY5MeQUp6GWT9yf6fBOuuJRpq7omPcScjfWETpTV
 WmtQ==
X-Gm-Message-State: APjAAAU6WoC4RzYT8LtMojtTlz0VCTfpeHdTlqzOaLlUKxZWqnnD1aup
 NxWGWSlB5SVzPT6oCtn0WKY=
X-Google-Smtp-Source: APXvYqziLwVs+guBWhEUUaw5KZIu96pJmkavqOVglly3MfmqrCcMBoE8vJV0ZG6RkkL1Qpdx1RkcJQ==
X-Received: by 2002:a63:181a:: with SMTP id y26mr3189363pgl.423.1575461055913; 
 Wed, 04 Dec 2019 04:04:15 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:cdb:94ce:3984:ab1:9b44:803])
 by smtp.gmail.com with ESMTPSA id
 f69sm6895076pje.32.2019.12.04.04.04.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 04:04:15 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: paulmck@kernel.org,
	joel@joelfernandes.org
Date: Wed,  4 Dec 2019 17:33:57 +0530
Message-Id: <20191204120357.11658-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: rcu@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] Include: Linux: rculist_nulls: Add
	docbook comment headers
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

This patch adds docbook comment headers for hlist_nulls_first_rcu
and hlist_nulls_next_rcu in rculist_nulls.h.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 include/linux/rculist_nulls.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/rculist_nulls.h b/include/linux/rculist_nulls.h
index 517a06f36c7a..d796ef18ec52 100644
--- a/include/linux/rculist_nulls.h
+++ b/include/linux/rculist_nulls.h
@@ -38,9 +38,17 @@ static inline void hlist_nulls_del_init_rcu(struct hlist_nulls_node *n)
 	}
 }
 
+/**
+ * hlist_nulls_first_rcu - returns the first element of the hash list.
+ * @head: the head for your list.
+ */
 #define hlist_nulls_first_rcu(head) \
 	(*((struct hlist_nulls_node __rcu __force **)&(head)->first))
 
+/**
+ * hlist_nulls_next_rcu - returns the element of the list next to @node.
+ * @node: Element of the list.
+ */
 #define hlist_nulls_next_rcu(node) \
 	(*((struct hlist_nulls_node __rcu __force **)&(node)->next))
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
