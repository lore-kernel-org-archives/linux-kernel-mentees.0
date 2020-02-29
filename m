Return-Path: <SRS0=WAM0=4R=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1DF7C3F2C6
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 29 Feb 2020 19:46:51 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B45BF2468A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 29 Feb 2020 19:46:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9+7onl+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B45BF2468A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6F96986F5C;
	Sat, 29 Feb 2020 19:46:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7zyF9baec2fg; Sat, 29 Feb 2020 19:46:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0A95486F21;
	Sat, 29 Feb 2020 19:46:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6A8FC07FE;
	Sat, 29 Feb 2020 19:46:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 57D5EC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 19:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4EA9B85B7C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 19:46:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pvy7L_ZNAxET
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 19:46:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E38EE84741
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 19:46:48 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id l184so892376pfl.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 29 Feb 2020 11:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JCesXVwgXHb5ysMOKa3arGKHG24qGlhlxiB/OtEgvZ8=;
 b=O9+7onl+8Ln649LKaJ960xJjzwy8r6D1JVvKic42Vt90mZI5POrix2k+Ab2F93X6EU
 6+NqRcrDpz6Xbq5w+v7b3KmohuetV7n/O9f4+IdjUCX4TP6H8rIFgKmHLQpK2ir1QN8p
 hNVjisxiodJElMbLepZ5IPcJEJwgfeB2koTRDcq+dQUice1mHjx/N1f1MEVnLvq3Ud39
 yv6+FyAAsujpKg8tHzgPPNdJrUr74JImtMSXcofUXb8MqFmyj97QGrvYq0/2ZRnXJeCa
 +VUjwI+RLkxdV+v5fB6V6XSrSO6JK/MJnlcm3wYebfmNBtbybfMOhe2oDkj8baF7mT6m
 O53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JCesXVwgXHb5ysMOKa3arGKHG24qGlhlxiB/OtEgvZ8=;
 b=GvkLV84PEV9or7BABXlFykHwbkkRwkp3IPoyERumPlbrqT+jFRWfpsbqEuqs7tDzZZ
 G5IBK8jS5thFAZdhVklMXLxW64bTtucvRcT2TSwB/DISwPzAuHH5gh47r8qVErNwP4Tc
 dsMxtaVIyitsAEOWfPqmK9t2YupRrOrUNqxNWYnV4gqodpkBHWwr7KqEbhC8Sms0PEUN
 UBODTwPYP2KBs5hKxa7q+njTryv1OshOXv7DE2WmTmVZTvNv7I4ESwi55awhzdTgQgSg
 6Xl2jBpeRscdu6jJBGnEWJISaL30xmJMl1RJW1TZobuu9rTAF1BOBuYRHMPWz8P+0h+u
 mWrA==
X-Gm-Message-State: APjAAAUDzUkHTELfOe6OoUBZ7A4YRhBgN0ES8J7DKwV40tIONGmM7sdw
 4f5mZmnTpZixEaahC6y+lW0=
X-Google-Smtp-Source: APXvYqwX47HOpGvO+VLPfoF5otPSelYJv3E7fKGp9enh2mko5B+3TkHUczUfvDYUv0QTigC5wCbdWA==
X-Received: by 2002:a63:78c4:: with SMTP id t187mr10959911pgc.88.1583005608288; 
 Sat, 29 Feb 2020 11:46:48 -0800 (PST)
Received: from localhost.localdomain ([103.118.34.152])
 by smtp.gmail.com with ESMTPSA id j12sm450707pga.78.2020.02.29.11.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Feb 2020 11:46:47 -0800 (PST)
From: Pawan Kumar Meena <pawank1804@gmail.com>
To: josh@joshtriplett.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
 corbet@lwn.net, joel@joelfernandes.org
Date: Sun,  1 Mar 2020 01:16:36 +0530
Message-Id: <20200229194636.11494-1-pawank1804@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, linux-doc@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] Documentation: RCU: lockdep.txt:
	Convert to lockdep.rst
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

This patch converts lockdep.txt to lockdep.rst and adds it to index.rst.

Signed-off-by: Pawan Kumar Meena <pawank1804@gmail.com>
---
 Documentation/RCU/index.rst                    | 1 +
 Documentation/RCU/{lockdep.txt => lockdep.rst} | 2 ++
 2 files changed, 3 insertions(+)
 rename Documentation/RCU/{lockdep.txt => lockdep.rst} (99%)

diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
index 81a0a1e5f767..109dea13f165 100644
--- a/Documentation/RCU/index.rst
+++ b/Documentation/RCU/index.rst
@@ -10,6 +10,7 @@ RCU concepts
    arrayRCU
    rcubarrier
    rcu_dereference
+   lockdep
    whatisRCU
    rcu
    listRCU
diff --git a/Documentation/RCU/lockdep.txt b/Documentation/RCU/lockdep.rst
similarity index 99%
rename from Documentation/RCU/lockdep.txt
rename to Documentation/RCU/lockdep.rst
index 89db949eeca0..4e71f77bdd28 100644
--- a/Documentation/RCU/lockdep.txt
+++ b/Documentation/RCU/lockdep.rst
@@ -1,3 +1,5 @@
+.. _lockdep_doc:
+
 RCU and lockdep checking
 
 All flavors of RCU have lockdep checking available, so that lockdep is
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
