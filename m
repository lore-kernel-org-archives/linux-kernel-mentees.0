Return-Path: <SRS0=LNDZ=Z7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D38DC43603
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Dec 2019 07:51:09 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE4C52071E
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Dec 2019 07:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N79GCO9l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE4C52071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8D67E8820B;
	Mon,  9 Dec 2019 07:51:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r5b7CZ9YFX80; Mon,  9 Dec 2019 07:51:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id ED5228821B;
	Mon,  9 Dec 2019 07:51:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D6F79C1D7D;
	Mon,  9 Dec 2019 07:51:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B8518C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Dec 2019 07:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9EC848822A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Dec 2019 07:51:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dzQwg8khzrTv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Dec 2019 07:51:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ED7408820A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Dec 2019 07:51:03 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z124so6669041pgb.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Dec 2019 23:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=T93KpotdGkFqtc77qF2EAzOUEnvgTHpxwI5GuqbP7b4=;
 b=N79GCO9lrJQ9kFidXylgJv1/NvbaQAqEtR6ip+va41MyO8Wgd+bFaBgZEiMHDCDrVq
 /O7SGbGzDccjAXV+VBWPQxIv1atxpYo3eQLR5auqJD4thxtmZvN+aL3Yytab6RYvg9lv
 1V6p6yZ/oPNWMWtS6hQQjdoTItOaYTHN1hiV3bLulK+0xwjDK2U+yp9wJ+nWKG2Wq07f
 G6LBjWE+zT+vPRZPAfr68TWQb/hn3uJUYymefKC/jQt7eKAhNf0qBtURZgB1PtIS0Q5e
 DDE9Li0cONlHxzXeylpBE04Z2FrtzF8auwGonb4CCCVaDr2H5kpXJEVBustMlQqKcSlt
 s5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=T93KpotdGkFqtc77qF2EAzOUEnvgTHpxwI5GuqbP7b4=;
 b=iYQjcohZgQZEsWgsnenSnIvC28toB+3zSXjfZkO73ZynErOBZU0DX+KW12PbxQfRRV
 MLSRLh0m2gHDWuyXMZfz6xnulwhr4+WPQQnsxalvNWmmFe9XBW34vnBdYxUjkuBhM3QM
 aCPfwRtRqpIdjKSauhhy1ST81OvfA5H0E+DOWa9a9LIeeA6SpMB4RscUPMXZ+hlNM8LJ
 YnbnsUICTYKdU3MdzoW0ZMxhjRydyvt95WXiG2ic4CUINHlscWptOnUgfFfpNeAxBdNj
 dvchYQtrat73gWV8ngogdsc5xbyxoBSTWynyuxNgzwhKE9S3IOoboxN9ck0xqseyM6Zl
 VDUQ==
X-Gm-Message-State: APjAAAUogtyzYDEa+RxAxa6dT/Tud4nHhpmgGfa/YVXpUrRDZz9N6IGu
 GABD8GWzWpBaK1h3kHaBloQ=
X-Google-Smtp-Source: APXvYqwNTJADqjLqVulG110m73ntGwb1QV+9AeWkSqjiWMdSBPgBwYxtAeEGWPWOQtdlvx/w1QW8SQ==
X-Received: by 2002:aa7:8096:: with SMTP id v22mr976843pff.240.1575877863074; 
 Sun, 08 Dec 2019 23:51:03 -0800 (PST)
Received: from localhost.localdomain
 ([2402:3a80:13bf:5229:e955:851e:da75:6e07])
 by smtp.gmail.com with ESMTPSA id z10sm2881079pfa.184.2019.12.08.23.51.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2019 23:51:02 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: paulmck@kernel.org,
	joel@joelfernandes.org
Date: Mon,  9 Dec 2019 13:20:43 +0530
Message-Id: <20191209075043.17947-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: rcu@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] rculist.h: Add list_tail_rcu()
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

This patch adds the macro list_tail_rcu() and document it.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 include/linux/rculist.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/rculist.h b/include/linux/rculist.h
index 4b7ae1bf50b3..9f21efa525ab 100644
--- a/include/linux/rculist.h
+++ b/include/linux/rculist.h
@@ -40,6 +40,16 @@ static inline void INIT_LIST_HEAD_RCU(struct list_head *list)
  */
 #define list_next_rcu(list)	(*((struct list_head __rcu **)(&(list)->next)))
 
+/**
+ * list_tail_rcu - returns the prev pointer of the head of the list
+ * @head: the head of the list
+ *
+ * Note: This should only be used with the list header,
+ * but only if list_del() and similar primitives are not
+ * also used on the list header.
+ */
+#define list_tail_rcu(head)	(*((struct list_head __rcu **)(&(head)->prev)))
+
 /*
  * Check during list traversal that we are within an RCU reader
  */
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
