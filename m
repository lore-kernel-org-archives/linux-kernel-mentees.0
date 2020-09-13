Return-Path: <SRS0=DUpp=CW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24C6CC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 08:07:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8D782074B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 13 Sep 2020 08:07:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QGc9lwWg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8D782074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 49C5E8717B;
	Sun, 13 Sep 2020 08:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id he05sqIaKNxT; Sun, 13 Sep 2020 08:07:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C5B818717A;
	Sun, 13 Sep 2020 08:07:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B9202C0052;
	Sun, 13 Sep 2020 08:07:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63E33C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 08:07:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 52AF08717B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 08:07:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qeuoFLUX4MuN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 08:07:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9C0818717A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 08:07:00 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id a9so3866555pjg.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 13 Sep 2020 01:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PiRXJ912GcTHzMS72bOz8QrdAfQcqmOEUJxAFOgJvbg=;
 b=QGc9lwWgf5NerXkqu9+ZoGieDaatgMHiEiU2p5UIPkj4EDENI6TbqavtyFb4suN9Ri
 9QsJiLZgNhHpQ9Yl3k029NQIXmFo5NM3xdYUIzfqF65ZptNKk2g2ZUkBVjGRnqpvBrJu
 He+bTf07W/6726d7WxHQjfhPGPG9cHfu+En8pS5luqTgcz67v/JZi2qMdoCWaD+KApZv
 H1ZkSm6MfIhIkQiP6awHN/VSrHkZLHDTmCJnstJPgE5BXSSwDcL2Z9D6Pg3t9kE67jhi
 ES+8LvB+KDf4C6SonfgkXEWE3avd9N0+Jxk4xsw6kIAklW/9XtqzIj7t1AbN1Tn/EClv
 OoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PiRXJ912GcTHzMS72bOz8QrdAfQcqmOEUJxAFOgJvbg=;
 b=c1DeDUfyHRFsxecnck3zNnzh2wnN1vbjjYz3Xz/8KD07Pi5N3Ih4qc8ER6hiy7K8GI
 wfqK1uV3FsGwjcTlc/P2JkMm/siv1WKh5+ThgnFyPB54nsoYh90Ss5tmTdDSLvxMx85g
 GWuYsG9sxqD1hi0K/FecfDtYYXLqNvxWb9ZS3yOxIGcaO7k/5rKkZPkXtdGeCKKiKEy4
 iZtgozuVPSswP6csrxSvQ0QDVcSY/d+zPq6i7CsCu5VhHSLde+bpDwIyvjtrmKHsfZfp
 Fu5NbBckfVQ03qPp5dzO9ysur7MVFcbTqbHh201cnZ5D/L2YkoYD/JrxvhIrweFFdzv6
 Shlw==
X-Gm-Message-State: AOAM533sJwcFZfSM+B9Gc21mOx1I0BBbTGPVcDRr3gQv6Jebl9JbtLdz
 CXkVP0RfJWs/sVlb2eRX/w==
X-Google-Smtp-Source: ABdhPJwX2uWrqEI++fVuamaLjbp0qx3XQ7+4q46NmkFCE1ctQepGve1woAqfwChaoqeZAqlygrfpxw==
X-Received: by 2002:a17:902:8306:b029:d0:cbe1:e7aa with SMTP id
 bd6-20020a1709028306b02900d0cbe1e7aamr9546517plb.27.1599984420118; 
 Sun, 13 Sep 2020 01:07:00 -0700 (PDT)
Received: from localhost.localdomain (n11212042027.netvigator.com.
 [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id q190sm7119793pfc.176.2020.09.13.01.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 01:06:59 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>
Date: Sun, 13 Sep 2020 04:06:05 -0400
Message-Id: <20200913080605.1542170-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200912102230.1529402-1-yepeilin.cs@gmail.com>
References: <20200912102230.1529402-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Cc: Hillf Danton <hdanton@sina.com>, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, tipc-discussion@lists.sourceforge.net,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH net v2] tipc: Fix memory leak in
	tipc_group_create_member()
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

tipc_group_add_to_tree() returns silently if `key` matches `nkey` of an
existing node, causing tipc_group_create_member() to leak memory. Let
tipc_group_add_to_tree() return an error in such a case, so that
tipc_group_create_member() can handle it properly.

Fixes: 75da2163dbb6 ("tipc: introduce communication groups")
Reported-and-tested-by: syzbot+f95d90c454864b3b5bc9@syzkaller.appspotmail.com
Cc: Hillf Danton <hdanton@sina.com>
Link: https://syzkaller.appspot.com/bug?id=048390604fe1b60df34150265479202f10e13aff
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Change in v2:
    - let tipc_group_add_to_tree() return a real error code instead of -1.
      (Suggested by David Miller <davem@davemloft.net>)

 net/tipc/group.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/net/tipc/group.c b/net/tipc/group.c
index 588c2d2b0c69..b1fcd2ad5ecf 100644
--- a/net/tipc/group.c
+++ b/net/tipc/group.c
@@ -273,8 +273,8 @@ static struct tipc_member *tipc_group_find_node(struct tipc_group *grp,
 	return NULL;
 }
 
-static void tipc_group_add_to_tree(struct tipc_group *grp,
-				   struct tipc_member *m)
+static int tipc_group_add_to_tree(struct tipc_group *grp,
+				  struct tipc_member *m)
 {
 	u64 nkey, key = (u64)m->node << 32 | m->port;
 	struct rb_node **n, *parent = NULL;
@@ -291,10 +291,11 @@ static void tipc_group_add_to_tree(struct tipc_group *grp,
 		else if (key > nkey)
 			n = &(*n)->rb_right;
 		else
-			return;
+			return -EEXIST;
 	}
 	rb_link_node(&m->tree_node, parent, n);
 	rb_insert_color(&m->tree_node, &grp->members);
+	return 0;
 }
 
 static struct tipc_member *tipc_group_create_member(struct tipc_group *grp,
@@ -302,6 +303,7 @@ static struct tipc_member *tipc_group_create_member(struct tipc_group *grp,
 						    u32 instance, int state)
 {
 	struct tipc_member *m;
+	int ret;
 
 	m = kzalloc(sizeof(*m), GFP_ATOMIC);
 	if (!m)
@@ -314,8 +316,12 @@ static struct tipc_member *tipc_group_create_member(struct tipc_group *grp,
 	m->port = port;
 	m->instance = instance;
 	m->bc_acked = grp->bc_snd_nxt - 1;
+	ret = tipc_group_add_to_tree(grp, m);
+	if (ret < 0) {
+		kfree(m);
+		return NULL;
+	}
 	grp->member_cnt++;
-	tipc_group_add_to_tree(grp, m);
 	tipc_nlist_add(&grp->dests, m->node);
 	m->state = state;
 	return m;
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
