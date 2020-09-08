Return-Path: <SRS0=zeZA=CR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1CD6C433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 23:33:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 780E72080C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  8 Sep 2020 23:33:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gD/1uUIj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 780E72080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2737987096;
	Tue,  8 Sep 2020 23:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3bYlxTxmg6ug; Tue,  8 Sep 2020 23:33:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8B6CA86E5E;
	Tue,  8 Sep 2020 23:33:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D2B8C0859;
	Tue,  8 Sep 2020 23:33:56 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45FE0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 23:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 19B0427E4C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 23:33:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDHotQh5Kfkw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 23:33:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 0181322F05
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  8 Sep 2020 23:33:53 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x123so484204pfc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 08 Sep 2020 16:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DY5gbi/kg3mlXEWhK+AT4noIdeJ5tpruTcO86qQV2fw=;
 b=gD/1uUIjxxvndXA66bjpe84ydOX7OCQ6pi8H39SCb1WcPm9hzkQBnoZFpEvLIgTf6B
 oAOvXXy3rXuK0i4ORtK7eJJFZNYcD9cD/HIOKI+ioF69hJKgSwlOZ9hlW0hsOlbCtXKu
 WoMBhlib6KwG6qMtjiXjXPPka8kCdQNheTBjyeSlzLe0i+GfJJvCObe8WRNFsDW/G0eb
 7gEu970QLGJlhG9fc6NdH/sL7yN94Lr784NdQN+UKXs7sG2FC3dpzjpAuxl1E55ZBPdB
 qguXxEEs1ocql+7X/dMt4av1HnCsEPFTjLADZLIIof6W5BbyfDBNZvbjE9b3oMEE1802
 bRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DY5gbi/kg3mlXEWhK+AT4noIdeJ5tpruTcO86qQV2fw=;
 b=fvkgK6aD3N/C7Qx67k4nVUiyxeoi7s6Vqw6PhImSxv/ndZ18hl1ml6XY5JpnUvnUwu
 yYeEuaeERvLLqXxq9WsU85Haac/7FqBFgqFV2kgox+QEbC4rbxXvIhCsVw3dVnQ3puzU
 Tf938/5PeoDERP1r8pTPCALZ2GNi2oyzdx1CkkaaDpLVnXbMXHG9ESCW38dwUOfRK+pQ
 Revtj59qCk8QAdT6pZ3DaL1AbnA8goguNjm/e2pYeaVpIBAzxgkJQhB5x0R8BQ7HB5Zn
 rUdKR3lRcRQFvMKbj03OOOnEomDo+mBWrrDczabMqBi80CJuYVWlJe6OQ92QVKxrnZbY
 v2vA==
X-Gm-Message-State: AOAM532c0E4wwI87fHHeGHdR2gOdENsJ2UrM+5wGWEWLradfgL4y+G2B
 it1x+Y+J7buEwVzTa4LitGCY5KXNcfgaRv9Wr40=
X-Google-Smtp-Source: ABdhPJyb8T9C7v1d33kdgNugE+3TPB7VCXh6XyWU6MplW7h01SgEPXkLa6ESccu35w5loo09tNI3iA==
X-Received: by 2002:a17:902:b088:b029:d1:8388:e6f8 with SMTP id
 p8-20020a170902b088b02900d18388e6f8mr71790plr.40.1599608032937; 
 Tue, 08 Sep 2020 16:33:52 -0700 (PDT)
Received: from localhost.localdomain ([49.207.193.206])
 by smtp.gmail.com with ESMTPSA id c7sm473216pfj.100.2020.09.08.16.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 16:33:52 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Wed,  9 Sep 2020 05:03:28 +0530
Message-Id: <20200908233329.200473-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 syzbot+c613e88b3093ebf3686e@syzkaller.appspotmail.com,
 syzbot+0f84f6eed90503da72fc@syzkaller.appspotmail.com,
 Masahiro Yamada <masahiroy@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 netdev@vger.kernel.org, syzbot+d0f27d9af17914bf253b@syzkaller.appspotmail.com,
 syzbot+3025b9294f8cb0ede850@syzkaller.appspotmail.com,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 "David S. Miller" <davem@davemloft.net>
Subject: [Linux-kernel-mentees] [PATCH] net: qrtr: Reintroduce ARCH_QCOM as
	a dependency for QRTR
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

Removing ARCH_QCOM, as a dependency for QRTR begins to give rise to
issues with respect to maintaining reference count integrity and
suspicious rcu usage.

The bugs resolved by making QRTR dependent on ARCH_QCOM include:

* WARNING: refcount bug in qrtr_node_lookup
Reported-by: syzbot+c613e88b3093ebf3686e@syzkaller.appspotmail.com
* WARNING: refcount bug in qrtr_recvmsg
Reported-by: syzbot+d0f27d9af17914bf253b@syzkaller.appspotmail.com
* WARNING: suspicious RCU usage in ctrl_cmd_new_lookup
Reported-by: syzbot+3025b9294f8cb0ede850@syzkaller.appspotmail.com
* WARNING: suspicious RCU usage in qrtr_ns_worker
Reported-by: syzbot+0f84f6eed90503da72fc@syzkaller.appspotmail.com

Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
As I understand it, QRTR was initially dependent upon ARCH_QCOM, but was 
removed since not all modems using IPC Router protocol required the 
support provided for Qualcomm platforms. 
However, wouldn't ARCH_QCOM be required by the modems that require the 
support provided for Qualcomm platforms?
The configuration ARCH_QCOM isn't exactly the easiest to find, especially, 
for those who don't know what they're looking for (syzbot included, I 
guess).
I don't feel like the tradeoff of not depending on ARCH_QCOM over giving 
rise to potential bugs is worth it. 
Is NOT having QRTR depend on ARCH_QCOM so critical that it supersedes the 
priority of not giving rise to potential bugs?

 net/qrtr/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/qrtr/Kconfig b/net/qrtr/Kconfig
index b4020b84760f..8156d0f3656b 100644
--- a/net/qrtr/Kconfig
+++ b/net/qrtr/Kconfig
@@ -4,6 +4,7 @@
 
 config QRTR
 	tristate "Qualcomm IPC Router support"
+	depends on ARCH_QCOM
 	help
 	  Say Y if you intend to use Qualcomm IPC router protocol.  The
 	  protocol is used to communicate with services provided by other
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
