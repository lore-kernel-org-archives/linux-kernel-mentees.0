Return-Path: <SRS0=9c4A=45=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9E7C2BB1D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Mar 2020 05:35:21 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EE2320739
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Mar 2020 05:35:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c+2LTb9+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EE2320739
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 0D97A2309D;
	Thu, 12 Mar 2020 05:35:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Je0sYS--sh0t; Thu, 12 Mar 2020 05:35:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4633722D24;
	Thu, 12 Mar 2020 05:35:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CA52C07FF;
	Thu, 12 Mar 2020 05:35:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 639FAC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Mar 2020 05:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 51F2C2309D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Mar 2020 05:35:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JuakOIvKvH70
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Mar 2020 05:35:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by silver.osuosl.org (Postfix) with ESMTPS id D1F2A22D24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Mar 2020 05:35:18 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id p14so2669879pfn.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Mar 2020 22:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=stwA2atqbUCSZq4KpX2D3kb+kLw99koUYCFDWaQWTYY=;
 b=c+2LTb9+TDoWjVsOSzRYQ/GyJ1SnMYpWlrLYXSWHaxOmgsyMloLr1rt+u9HTJLx696
 QSofxKcuxrOK9U7YS2yroW3NSx+k6NnfHfC+4L16s9iIwm1cXNpyBPDBv1qSEzY9rs+1
 6FzxzrSUg8gnMZMB/N0U3Z90XGfA0aAEXeaZJnIV7vQdZfTxiFqVdPuJeVzHN1Zfd3z3
 b4FGqqzXT9PXwsrwSautOzff+x30/DveyJMOXNCkUCbbgv94Gs0A8TjoOfUKdt5tX+AW
 /zATJfg6b6ZPl0Cl7NnlwiLnvIMvIU8nGtjsWuw7uq8V7HOc/cnk3DhgprJrH09Dxfo8
 KY1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=stwA2atqbUCSZq4KpX2D3kb+kLw99koUYCFDWaQWTYY=;
 b=c/No9gDskWtFnYqJgfC7OwrDIb95siaUJMGE4dXRpnisqkh37+UjN18FEEkuS0ljDq
 UlXMglLaSMiWhGxDD440L5s0Xs/GrykQH/gCBEsAL9+wzHTjhALIUGZAu3CsbrP71i1Y
 2jiba2rNow3vN4po0JaqsCW8w1ON5DGAwYNdAEPllyVkXD8ylIRL2lVT5FQWGaB6KMs8
 ok747r3+7q9/ByVFuYuSRTPlF5pj5PM36bQvKRN6GDllvmyG+Rs3nYsqOxlYwTUzBsRn
 5NldDgvTPUY6wOxPTXMCP3Fm2ADWEVGlw6grNOswDkQmST9Vrg5Y2bq8QNhzH9fNYzZu
 1AVw==
X-Gm-Message-State: ANhLgQ01ElgAc193qhewmabb1qlBeYma1Usu35N3wjXLv8mesb4HmnFc
 v+jXtn7x6+/mQo6xKzZcVVg=
X-Google-Smtp-Source: ADFU+vtGhEmB7fIfL1kzxqIYJIrliTlHfxflxUGtKE7RGVusYuXarENOJ/ZHyPaZy07TXdfhvk0RcA==
X-Received: by 2002:a62:1909:: with SMTP id 9mr6362078pfz.196.1583991318416;
 Wed, 11 Mar 2020 22:35:18 -0700 (PDT)
Received: from localhost.localdomain ([103.87.57.89])
 by smtp.gmail.com with ESMTPSA id mp5sm7095820pjb.48.2020.03.11.22.35.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 22:35:17 -0700 (PDT)
From: Amol Grover <frextrite@gmail.com>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Richard Fontana <rfontana@redhat.com>,
 Allison Randal <allison@lohutok.net>, Paolo Abeni <pabeni@redhat.com>
Date: Thu, 12 Mar 2020 11:04:20 +0530
Message-Id: <20200312053419.12258-1-frextrite@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: kernel test robot <lkp@intel.com>, "Paul E . Mckenney" <paulmck@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] net: caif: Add lockdep expression to
	RCU traversal primitive
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

caifdevs->list is traversed using list_for_each_entry_rcu()
outside an RCU read-side critical section but under the
protection of rtnl_mutex. Hence, add the corresponding lockdep
expression to silence the following false-positive warning:

[   10.868467] =============================
[   10.869082] WARNING: suspicious RCU usage
[   10.869817] 5.6.0-rc1-00177-g06ec0a154aae4 #1 Not tainted
[   10.870804] -----------------------------
[   10.871557] net/caif/caif_dev.c:115 RCU-list traversed in non-reader section!!

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Amol Grover <frextrite@gmail.com>
---
 net/caif/caif_dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/caif/caif_dev.c b/net/caif/caif_dev.c
index 03c7cdd8e4cb..195d2d67be8a 100644
--- a/net/caif/caif_dev.c
+++ b/net/caif/caif_dev.c
@@ -112,7 +112,8 @@ static struct caif_device_entry *caif_get(struct net_device *dev)
 	    caif_device_list(dev_net(dev));
 	struct caif_device_entry *caifd;
 
-	list_for_each_entry_rcu(caifd, &caifdevs->list, list) {
+	list_for_each_entry_rcu(caifd, &caifdevs->list, list,
+				lockdep_rtnl_is_held()) {
 		if (caifd->netdev == dev)
 			return caifd;
 	}
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
