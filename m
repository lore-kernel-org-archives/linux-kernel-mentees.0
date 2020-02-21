Return-Path: <SRS0=GVOk=4J=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D9FC35658
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 16:21:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D36CE208E4
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Feb 2020 16:21:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DE+SrDBP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D36CE208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B346F86451;
	Fri, 21 Feb 2020 16:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id crXtW2S1Hsk8; Fri, 21 Feb 2020 16:21:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 64B7985FB9;
	Fri, 21 Feb 2020 16:21:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 538DAC07FE;
	Fri, 21 Feb 2020 16:21:36 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 56041C013E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 16:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 51AC687D0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 16:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zj7uc1RtkkPs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 16:21:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 35C4D87CD6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 16:21:34 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id d5so950143pjz.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Feb 2020 08:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JyA56Sz4rDYUzhUKZvP6bdIvgdElbbaajnOFHJnaXLc=;
 b=DE+SrDBPDDTb1TICMcYIxzYdqSDYAiveqSaQQvK4xYbNYQrkmkO3WErz1+/yhArJPk
 ZzWT7gaLw2np4/JB9+AZDLNiYB+ohDTEJhXPjkXUHmxJ5b/QhbAjMchUAQmJLJ03wuMo
 FMoSfPkDz5CscZa217W/Qk9bjgHhYDniErdBHlGDZJS1p555vqsMg/rRpsK3N0PG8WCN
 ZZh2aDcsREILdE753ELtLSyt+pye1kQ0+mL4v7N0cMIAYEi5mZL3NDlCcZ7JcBGpQezL
 JGyZJd8jQf97o6Qd7kGLc/T5e3F2847OD23UKX20gkd4EqMgXd9CFDX/VO2dkqEVMQVr
 856A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JyA56Sz4rDYUzhUKZvP6bdIvgdElbbaajnOFHJnaXLc=;
 b=OfkU9XZsEspSVHDpPHU2R60Thtf5G+CdewOVvCP5KHoJdDYrfcNE99Mmxc8mxOERq0
 xQVh6HpLLNwKDs7dTLxlyABOVXL6Gp7NJrsx5PENo9xmz5TJyOjLQ9LMNjkTjnEkkUsy
 QNeuSte2lPlxpH9clcQbLFfz0lMIRGowus3Vd7CO4CIH3jvRgWrG1Tz1RFx6YPAsKAaO
 9x73IA0IAi0PmaJSeOiNv5o2bkXgdUvY2QNvdfMp0ruC5dWFULCqO3frbat81WDLSNt8
 Db0W/ZNTfvtvXhCAGxCIED5ROtzGb/t2exc7GpaJfdvXpIamiP5NQYdXTdmZvdyNVkBI
 4Kwg==
X-Gm-Message-State: APjAAAVYp2hlSjpw1xixO9J1P4L3NQkNfDcCdJ6r4pysCxxS/PRzRs6Q
 jZB2MJ4G/q+XOS4/ghSC4Q==
X-Google-Smtp-Source: APXvYqwXCzQMECdVFGJVUJX++W20f3DOsoPhx7ymDk5W84p9+jpmBSJLZBPQFXOtSP4alzuXmkRpHA==
X-Received: by 2002:a17:90a:5d97:: with SMTP id
 t23mr3957136pji.61.1582302093578; 
 Fri, 21 Feb 2020 08:21:33 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee0:fe5e:d03d:769b:c838:c146])
 by smtp.gmail.com with ESMTPSA id j15sm2440183pga.11.2020.02.21.08.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 08:21:32 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: davem@davemloft.net, gregkh@linuxfoundation.org, tglx@linutronix.de,
 allison@lohutok.net
Date: Fri, 21 Feb 2020 21:49:47 +0530
Message-Id: <20200221161947.11536-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] net: 802: psnap.c: Use built-in RCU
	list checking
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
 net/802/psnap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/802/psnap.c b/net/802/psnap.c
index 40ab2aea7b31..4492e8d7ad20 100644
--- a/net/802/psnap.c
+++ b/net/802/psnap.c
@@ -30,7 +30,7 @@ static struct datalink_proto *find_snap_client(const unsigned char *desc)
 {
 	struct datalink_proto *proto = NULL, *p;
 
-	list_for_each_entry_rcu(p, &snap_list, node) {
+	list_for_each_entry_rcu(p, &snap_list, node, lockdep_is_held(&snap_lock)) {
 		if (!memcmp(p->type, desc, 5)) {
 			proto = p;
 			break;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
