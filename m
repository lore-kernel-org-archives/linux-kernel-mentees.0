Return-Path: <SRS0=gjYE=ND=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8D1C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 00:00:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB1016108C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Aug 2021 00:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB1016108C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F05B40235;
	Thu, 12 Aug 2021 00:00:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cmNtmANaH8sx; Thu, 12 Aug 2021 00:00:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 4A5024018C;
	Thu, 12 Aug 2021 00:00:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0DE33C0010;
	Thu, 12 Aug 2021 00:00:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A65A8C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 00:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81EE8828EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 00:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WBpjv-JY8z53
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 00:00:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 729CF828B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Aug 2021 00:00:09 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 cp15-20020a17090afb8fb029017891959dcbso12354343pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 11 Aug 2021 17:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KgEdvsrca1SF5BWDushaiKJ06kC9hIpnUAyfu0HpOFc=;
 b=B7VkmiO3h2XR7G2FVqaGzhMv0Ps38Udsf8F2g8R1NG7Pvhf+P+bINWGWULZtfpx1Dy
 plQ9otZwDXIeW/ZVQyZtbRsgUhJE5XIAYMoPmJuDrse9IBrcnqTKA9JGwHlwWTIUvgUH
 y4w4KZV9GZA40CBWma/k3Z0B0H3M5DQe16EluXTuK5G8bOH5JsZJcP+W2AwpAHewaHIt
 OwLPNGc8oBpich8fe+E/Ibjd2Ze4bX5RNBZ8HZG4BRmiqUGxJ/crF5kcZkGxiB96pMX1
 8JwVGxRHMGaNHACwT7exfKZ3is2m1gc/ltB2ksflk1LqbB5iJhz5m2eYDwwHn2YGz20C
 AZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KgEdvsrca1SF5BWDushaiKJ06kC9hIpnUAyfu0HpOFc=;
 b=hu5XrBQ2GcpBNBLcjHcnuJf05eL6uZAcJooPfZvwcOe1d8FgvAXYaJM++Sqnf7xVR2
 HpdxbyhAc9De9cqU4GoSNjbhHhnbswdl4lL0rZVzX3S4RCilDSDIx4nFeeOCwp8oO5Rr
 5y2Zns8BvuLAp9TnIIDfSxUyZw22BTqgz7ig9yO6OQPc/kcM+efNqJUf1BC52X4FkidI
 mnIIM8tqtu1sL1U0yIauLhIkBaREsTN8C39IsBGx8VmAMPpzZbV309EN0g5dqtaBmgwS
 bPBN79OVEh7hM7j825IFgt3TDODjlHVtMoWb6OF4q4sroLe587sJzTvMc7k4jO7a/z69
 4dzg==
X-Gm-Message-State: AOAM531yYrbWZaZzkG4jdRF6SKlj8sZ/w1V7rEpBcFHhqb62VOAVRD65
 b0wMqTasoLmkxCQek1tJboA=
X-Google-Smtp-Source: ABdhPJxK4Nh5mOO6hzUscxWSTVLCtL+5kfxQU0/wJbk06HcMAQ5tA/jGj108pcu3I4KEs98kq18G8Q==
X-Received: by 2002:a17:90b:3802:: with SMTP id
 mq2mr1215768pjb.19.1628726408807; 
 Wed, 11 Aug 2021 17:00:08 -0700 (PDT)
Received: from localhost.localdomain (bb42-60-144-185.singnet.com.sg.
 [42.60.144.185])
 by smtp.gmail.com with ESMTPSA id g14sm762359pfr.31.2021.08.11.17.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 17:00:08 -0700 (PDT)
From: Nguyen Dinh Phi <phind.uet@gmail.com>
To: davem@davemloft.net, kuba@kernel.org, ast@kernel.org, daniel@iogearbox.net,
 hawk@kernel.org, john.fastabend@gmail.com, andrii@kernel.org, kafai@fb.com,
 songliubraving@fb.com, yhs@fb.com, kpsingh@kernel.org, edumazet@google.com,
 atenart@kernel.org, alobakin@pm.me, weiwan@google.com, ap420073@gmail.com,
 bjorn@kernel.org, memxor@gmail.com
Subject: [PATCH] net: drop skbs in napi->rx_list when removing the napi
 context.
Date: Thu, 12 Aug 2021 07:59:59 +0800
Message-Id: <20210811235959.1099333-1-phind.uet@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: netdev@vger.kernel.org,
 syzbot+989efe781c74de1ddb54@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

The napi->rx_list is used to hold the GRO_NORMAL skbs before passing
them to the stack, these skbs only passed to stack at the flush time or
when the list's weight matches the predefined condition. In case the
rx_list contains pending skbs when we remove the napi context, we need
to clean out this list, otherwise, a memory leak will happen.

Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
Reported-by: syzbot+989efe781c74de1ddb54@syzkaller.appspotmail.com
---
 net/core/dev.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/net/core/dev.c b/net/core/dev.c
index b51e41d0a7fe..319fffc62ce6 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -7038,6 +7038,13 @@ void __netif_napi_del(struct napi_struct *napi)
 	list_del_rcu(&napi->dev_list);
 	napi_free_frags(napi);

+	if (napi->rx_count) {
+		struct sk_buff *skb, *n;
+
+		list_for_each_entry_safe(skb, n, &napi->rx_list, list)
+			kfree_skb(skb);
+	}
+
 	flush_gro_hash(napi);
 	napi->gro_bitmask = 0;

--
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
