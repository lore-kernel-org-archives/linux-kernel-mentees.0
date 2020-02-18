Return-Path: <SRS0=Ux9x=4G=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F0DC34026
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 18:17:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D3EC21D56
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 18 Feb 2020 18:17:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhOhNOGM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D3EC21D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 243B82048E;
	Tue, 18 Feb 2020 18:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HsMyPjE2008k; Tue, 18 Feb 2020 18:17:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id BBAD920427;
	Tue, 18 Feb 2020 18:17:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B2DC4C1D84;
	Tue, 18 Feb 2020 18:17:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0481CC013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 18:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E5997849D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 18:17:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PY4PtRx8vDqJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 18:17:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 880B18499A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 18:17:49 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id a6so8405533plm.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 Feb 2020 10:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=tw386GnWn7lj+7DS5UVonCjIBe7s4kOvANVaGw+hVzg=;
 b=YhOhNOGMg32OFt9+hY8OakRL4DmVH0jPNRRNE/E6tkW/9ccBR09BQA7dCQUs2MkmUu
 mARR3uHwAkKSOVX+kcW1sZFEihdGg6YcfHt4rgk3uekBDYLocuAG+oOBDcBhvv6BsqXJ
 dyy0x6j8c8aQy6Jqv4YLREsxGD1wl7U/nD+ADGhKoWCDJcETad+RpMrhLuuK565r68VM
 Irhn27ZhTQ/t/CZGbPPj4qvukPMUzUZO3UAYtopsVf+MDqOh9vs86Kummox/0AfpMKaX
 CEPGdzAzvbMiar11LAE1NX7bNRqXtJKzzgSyrUXJ00luH0kGWCXk5u9z6qaC70WAs3BD
 XClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tw386GnWn7lj+7DS5UVonCjIBe7s4kOvANVaGw+hVzg=;
 b=Rr89VKaWjqLQIBYTy0ZVBHcNeCEpr23WZsMqp0qvQYpKs0q34OsMboyUbBYAENgvlR
 UVGMf8Tf0wLWWFOzK9m7RCPTK1MchmEzco6bqD5aUXXS916iSczY+ajyOsxrtmZfXBeV
 L56Kao9d/61Ty/kxY4gdk6HXD7u+q6RpUgkNQvCb45k/IwPyw9O5imb1e14dv7Yeu4KB
 ZbjI857q/VQa0/uE+neoRlmrx1fYt0i/GYpK4cZUSHTG7tlwYc21/Sax+rGoiUkOu+vk
 T7MmS/7y4hzdEriOt0BSt22MbXFU+NOFuaWvGWWh3goFEnnMeIv0dZuZBti3riodSiHF
 oAHQ==
X-Gm-Message-State: APjAAAU2s8fCEYjujmzP4n8TxlRbKjLJp/sjz9aNk02zriwm9dt5XyHO
 0aHWCTiMc13uSmE+SDUdtg==
X-Google-Smtp-Source: APXvYqwOgUC5exI24u36RZ9dseIdpW0+8p5dXgCQ/NuN3Ou6YZrerHkWr3LK9lWM9jlF1o9vCDlFuw==
X-Received: by 2002:a17:902:b68c:: with SMTP id
 c12mr21462103pls.160.1582049869131; 
 Tue, 18 Feb 2020 10:17:49 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:54c:a276:f869:e1e5:121e:cdbf])
 by smtp.gmail.com with ESMTPSA id f3sm5474950pga.38.2020.02.18.10.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 10:17:48 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: paul@paul-moore.com,
	davem@davemloft.net
Date: Tue, 18 Feb 2020 23:47:18 +0530
Message-Id: <20200218181718.7258-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
 linux-security-module@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] net: netlabel: Use built-in RCU list
	checking
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

list_for_each_entry_rcu() has built-in RCU and lock checking.

Pass cond argument to list_for_each_entry_rcu() to silence
false lockdep warning when CONFIG_PROVE_RCU_LIST is enabled
by default.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/netlabel/netlabel_unlabeled.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/netlabel/netlabel_unlabeled.c b/net/netlabel/netlabel_unlabeled.c
index d2e4ab8d1cb1..77bb1bb22c3b 100644
--- a/net/netlabel/netlabel_unlabeled.c
+++ b/net/netlabel/netlabel_unlabeled.c
@@ -207,7 +207,8 @@ static struct netlbl_unlhsh_iface *netlbl_unlhsh_search_iface(int ifindex)
 
 	bkt = netlbl_unlhsh_hash(ifindex);
 	bkt_list = &netlbl_unlhsh_rcu_deref(netlbl_unlhsh)->tbl[bkt];
-	list_for_each_entry_rcu(iter, bkt_list, list)
+	list_for_each_entry_rcu(iter, bkt_list, list,
+				lockdep_is_held(&netlbl_unlhsh_lock))
 		if (iter->valid && iter->ifindex == ifindex)
 			return iter;
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
