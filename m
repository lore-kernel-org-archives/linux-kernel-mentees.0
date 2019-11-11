Return-Path: <SRS0=x9tq=ZD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79040C43331
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Nov 2019 18:12:29 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EE9320856
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 11 Nov 2019 18:12:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rAOdIV0c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EE9320856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 23CA0E0E;
	Mon, 11 Nov 2019 18:12:29 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 418EBDB5
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 11 Nov 2019 18:12:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D775D12E
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 11 Nov 2019 18:12:26 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id z188so3998286pgb.1
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 11 Nov 2019 10:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=nVbr8MtQ7ZO4CacZdX8JXbKAIcqSlSq2oEAfHRt0wK4=;
	b=rAOdIV0cCiN/zHYvwhWIVgXx6j5+Wf+Kltc5JVcq3LZqB2idl67vTbao209IAhsOJO
	980kByl8h8gzi5u9MoLkuIMU+J1tK13rnVQSpcIfxDynST3M8SY3mbwuUZmQnRjCzSVU
	xjyNPeWM+AOJWH8eAgXI0u7hoqLP+LFGs+D7Tgg3EYKvTEJy0i8MBPtSwU7LEQwNZIVC
	oFXqEEX2LUkWS48LTsa4ZCJarmvwhpV9sovnHsrGelEG2OW8+UQ9vhX82MdJCZcg2CIJ
	1l/iM03xHSUoVRcAr6zMMoTmIgNdySjl/H3XT9ofIHmTIeZWMdMox2/3Jq1KZWnRIovv
	+E5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=nVbr8MtQ7ZO4CacZdX8JXbKAIcqSlSq2oEAfHRt0wK4=;
	b=uUC25gMqi6KIFmL9jSUlyMyrO0QMkPx7tFwQqJqJr2AU80mJej8LhMlvGJMUs8umYu
	nRQQdaGlgVklvyj3A/uIpBaIv8odgrNAW2ydJfPBH+D1H4J6uamOJeXbnwDPfKvVowvX
	TxtoFT1FgoESKD3eVgb+k60rkoffogxfOJp3FqEas0LaOGAKt26q2N5QcK8cXi0bvYfj
	6ssNLnKHCZZw0gks/6+8Yt2k6LEKKdwNFSRUWiO2RdFNqt0ppVcAbznlQcjszr/CaZht
	MRZLr9odkZ2VqBOijApRfHQXOsgYIY4LKjVotxDZVj6ep6n4KK9BAjprhzZgApt0zKk2
	PaBQ==
X-Gm-Message-State: APjAAAXzq6Dbqczy7P3KY/FNJ2dumTzXSK0wiAS18FCKW4VEtDcmGWZB
	MCAlIiAEspovOX8IQRupebc=
X-Google-Smtp-Source: APXvYqzqab4rU4p2tyKosUenhapYrI0ueVPZGyWP01XeA+pX8HJKu1zEfgSHrqmDQY9JAg6YU5WFvA==
X-Received: by 2002:a65:6843:: with SMTP id q3mr24328556pgt.361.1573495945788; 
	Mon, 11 Nov 2019 10:12:25 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
	([2402:3a80:533:7f79:a8e9:b74c:7d75:d0c])
	by smtp.gmail.com with ESMTPSA id
	c12sm18301057pfp.67.2019.11.11.10.12.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 11 Nov 2019 10:12:25 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: paulmck@kernel.org, joel@joelfernandes.org, corbet@lwn.net,
	mchehab@kernel.org
Date: Mon, 11 Nov 2019 23:41:22 +0530
Message-Id: <20191111181122.28083-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] Documentation: RCU: whatisRCU:
	Updated full list of RCU API
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

This patch updates the list of RCU API in whatisRCU.rst.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 Documentation/RCU/whatisRCU.rst | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRCU.rst
index 2f6f6ebbc8b0..c7f147b8034f 100644
--- a/Documentation/RCU/whatisRCU.rst
+++ b/Documentation/RCU/whatisRCU.rst
@@ -884,11 +884,14 @@ in docbook.  Here is the list, by category.
 RCU list traversal::
 
 	list_entry_rcu
+	list_entry_lockless
 	list_first_entry_rcu
 	list_next_rcu
 	list_for_each_entry_rcu
 	list_for_each_entry_continue_rcu
 	list_for_each_entry_from_rcu
+	list_first_or_null_rcu
+	list_next_or_null_rcu
 	hlist_first_rcu
 	hlist_next_rcu
 	hlist_pprev_rcu
@@ -902,7 +905,7 @@ RCU list traversal::
 	hlist_bl_first_rcu
 	hlist_bl_for_each_entry_rcu
 
-RCU pointer/list udate::
+RCU pointer/list update::
 
 	rcu_assign_pointer
 	list_add_rcu
@@ -912,10 +915,12 @@ RCU pointer/list udate::
 	hlist_add_behind_rcu
 	hlist_add_before_rcu
 	hlist_add_head_rcu
+	hlist_add_tail_rcu
 	hlist_del_rcu
 	hlist_del_init_rcu
 	hlist_replace_rcu
-	list_splice_init_rcu()
+	list_splice_init_rcu
+	list_splice_tail_init_rcu
 	hlist_nulls_del_init_rcu
 	hlist_nulls_del_rcu
 	hlist_nulls_add_head_rcu
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
