Return-Path: <SRS0=F6Pe=4N=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAC7C35E03
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Feb 2020 13:18:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84CDB24676
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 25 Feb 2020 13:18:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2XBe6KH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84CDB24676
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 3D1CF20397;
	Tue, 25 Feb 2020 13:18:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Ag0Dyh5IfPD; Tue, 25 Feb 2020 13:18:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9557D203E5;
	Tue, 25 Feb 2020 13:18:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 83FB4C18DA;
	Tue, 25 Feb 2020 13:18:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4F38EC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 43E4F20397
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:18:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljHQ5d7geyZ2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:18:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by silver.osuosl.org (Postfix) with ESMTPS id BD69720370
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 13:18:03 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id a14so6491161pgb.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 25 Feb 2020 05:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=djeXvgDX1dzPvkbFDL9oeL1hgiy4iMfslVEDwCPbhX8=;
 b=H2XBe6KHWh6J9Xj1yhLiU4JxY/ymRM7WHmVlQPgaKXfZTq+w9vv6WUKrnPWVWQ2iku
 EOHTt8zH2Q3iFRKI2oGz5xYqJQNLd8xpcTVZprVIddn0/NfOro7dhvRsFjrAeqkfh3Bm
 rtXTWdajE2f8cshEC/JB+YusWRnlD4sQpELYNAX8ziXxMm+zr1TuRJhtktdRuAlqJTf1
 WWPpqGq9vDjDezjJS+KXJzmlZmYTIsdWKOvQpqaN9QcXJ0ggI6oDuTr6pd7TaWOqGITd
 rugHlTWFQ1FFXqSmemh1mlAP0Uwo6HP7V/GdIZVPIF8cX0mQEwnr/5XqwVAb109Ev5u3
 4xOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=djeXvgDX1dzPvkbFDL9oeL1hgiy4iMfslVEDwCPbhX8=;
 b=Lt8aQEvc0O/mMDy2aSBP/YQ5RlIZ49mxyJmH6O7IZd3U7yqGccQdoc9owtrwqtTYtl
 /JP+Ir0xiQoQfAlOKOj3YrTVugfpowUzmUOWrd8ZTd97BACiJQ2o7XtzXAFIk6qJe0zz
 XJTc5ijuIvzCIeswe2EGqK+tdNwbqG0+bJvNiqlxVg+9AvDmQZKW0n5f92ITUdjZh953
 3Qbp1/VYkgUxDAr/QPVutQq4d/fWgLasQd4500JAztYf3q9/phF6H5FzuX4jVAOJ+rv5
 Ji0kb8ZxVw794i1dWQ860Edcow5h13r6qBl7gMUCa+7pd/ph9Gsw5gL4X7jM/7VkVixQ
 TbXg==
X-Gm-Message-State: APjAAAWSm1Uv2CVwqWL6LE8cWICY6cLcllbB+ArKc2OyNE3BCWNL96TO
 Ju7wqYtU5a2iTwZQi6xuNA==
X-Google-Smtp-Source: APXvYqyZWQbaPcpdmLzEFwfknc0aITQXNKV0KYUx6HCyo9h2Nn+noGbHX128va9+iOz5v+N0ts+zSw==
X-Received: by 2002:aa7:8717:: with SMTP id b23mr57736952pfo.53.1582636683296; 
 Tue, 25 Feb 2020 05:18:03 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee1:f355:dcbb:6353:6580:5d41])
 by smtp.gmail.com with ESMTPSA id m12sm17057416pfh.37.2020.02.25.05.17.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 05:18:02 -0800 (PST)
From: madhuparnabhowmik10@gmail.com
To: marcel@holtmann.org, johan.hedberg@gmail.com, davem@davemloft.net,
 kuba@kernel.org
Date: Tue, 25 Feb 2020 18:47:53 +0530
Message-Id: <20200225131753.690-1-madhuparnabhowmik10@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: paulmck@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org,
 Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] net: bluetooth: hci_core: Use
	list_for_each_entry_rcu() to traverse RCU list in RCU read-side CS
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

In function hci_is_blocked_key() RCU list is traversed with
list_for_each_entry() in RCU read-side CS.
Use list_for_each_entry_rcu() instead.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>
---
 net/bluetooth/hci_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 8ddd1bea02be..4e6d61a95b20 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -2327,7 +2327,7 @@ bool hci_is_blocked_key(struct hci_dev *hdev, u8 type, u8 val[16])
 	struct blocked_key *b;
 
 	rcu_read_lock();
-	list_for_each_entry(b, &hdev->blocked_keys, list) {
+	list_for_each_entry_rcu(b, &hdev->blocked_keys, list) {
 		if (b->type == type && !memcmp(b->val, val, sizeof(b->val))) {
 			blocked = true;
 			break;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
