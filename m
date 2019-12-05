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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCDC0C43603
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Dec 2019 06:17:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1B1D22464
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  5 Dec 2019 06:17:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMfoztu/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1B1D22464
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 71BB18805C;
	Thu,  5 Dec 2019 06:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IFsoAv2YPkHv; Thu,  5 Dec 2019 06:17:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0A686880CB;
	Thu,  5 Dec 2019 06:17:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E360BC18DD;
	Thu,  5 Dec 2019 06:17:10 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B81EC077D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 06:17:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1D3F38805C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 06:17:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uDHUui7EFX4V
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 06:17:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 96A70880CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  5 Dec 2019 06:17:08 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id s18so1089811pfm.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 04 Dec 2019 22:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=acB2hbSrI/zngLNzQkvvnIL+83xSTPG9++dKEaaJLZI=;
 b=MMfoztu/Me1Emx3utyq1RxfTAtVGJV+pxoVthxAIxzySRn3ULEfJGGm/zQCjbJ+Uc0
 /w+L5N/X0YRc5D1MQsR3RSK6DcNIWtmze2FRs+dodbN2YDz9y0uQj1m5SempvA6XTH8R
 4Rpp78ULGV7ENXoC+ZG2Mf+iDZg08Dh1Z6yLPu2d9pry2vs/izzBdoLaUf3yngJAL0h+
 FrI+rqU7V8l/AQrCUBhUYrrUolSWwRNXKdNszBVfsSb2B1y5ZMGAg5sEdolfpFIxdGg2
 xH7il97FP/96+E4qqOpChByhMLjhTBgYCKTDUza1d0/SPLdnNAHg+1IOJsUSHov1SVGd
 FXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=acB2hbSrI/zngLNzQkvvnIL+83xSTPG9++dKEaaJLZI=;
 b=gIcMXvqO/TPJDiYfs1pna3tt8C3bPHyVptvPH1QnBaQz+1qXUbGEuIotXpLWIhO8rA
 b0SBZP4+rXPnJrbmjVz61dULj23sYK1h0GQgX84El2AOha+uMW8RsXZYv0q1UzAffKhE
 CBROW0atIIYhUabYSX60ic9eQC4FzOWdoTRq9XLWndfqbrYSeGmZk1spdITt/INNUAQ1
 jKnZS2rUPzmRLqNTcRgIOv40CLOCRcRJSMG2CVoM9XyMdjLv4PpZ4/c7un9wGvqs7AOe
 1eCmezuxyZlsho2sDx1V3y0TlNasOT7KIlj8iL0O4G8/tDm+MzDrOiXMoVfF5o6g9Z7T
 ddbA==
X-Gm-Message-State: APjAAAUoIocC2Sbjj3HnVh9iF3nTrexuFd9EQtDJoApwsvd8xh2Nq6Bn
 KTuZkEQXkkFdK1mRQZnGr0E=
X-Google-Smtp-Source: APXvYqxDr+PpCs5MKoXD6jjM1Uvo4Bh5Yhcs1dGBSTBdmJ4LfNN3nJBH/VQwK2QZZWYCjmV0KlQ69Q==
X-Received: by 2002:a62:486:: with SMTP id 128mr7409735pfe.236.1575526627809; 
 Wed, 04 Dec 2019 22:17:07 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:cdb:3f28:3984:ab1:9b44:803])
 by smtp.gmail.com with ESMTPSA id
 s27sm10564375pfd.88.2019.12.04.22.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 22:17:07 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: paulmck@kernel.org, josh@joshtriplett.org, rostedt@goodmis.org,
 oel@joelfernandes.org
Date: Thu,  5 Dec 2019 11:46:49 +0530
Message-Id: <20191205061649.25339-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: rcu@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH 3/3] include: linux: rculist_nulls:
	Add docbook comments
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
index bc8206a8f30e..111a90e98ad3 100644
--- a/include/linux/rculist_nulls.h
+++ b/include/linux/rculist_nulls.h
@@ -38,9 +38,17 @@ static inline void hlist_nulls_del_init_rcu(struct hlist_nulls_node *n)
 	}
 }
 
+/**
+ * hlist_nulls_first_rcu - returns the first element of the hash list.
+ * @head: the head of the list.
+ */
 #define hlist_nulls_first_rcu(head) \
 	(*((struct hlist_nulls_node __rcu __force **)&(head)->first))
 
+/**
+ * hlist_nulls_next_rcu - returns the element of the list after @node.
+ * @node: element of the list.
+ */
 #define hlist_nulls_next_rcu(node) \
 	(*((struct hlist_nulls_node __rcu __force **)&(node)->next))
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
