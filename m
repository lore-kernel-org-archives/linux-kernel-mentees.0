Return-Path: <SRS0=2/a+=CV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7DAC43461
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 10:24:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7534214D8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 12 Sep 2020 10:24:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YgPeku7X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7534214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 887798770B;
	Sat, 12 Sep 2020 10:24:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I7RkDcHW+j9S; Sat, 12 Sep 2020 10:24:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EE6AA8770C;
	Sat, 12 Sep 2020 10:24:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8EA2C0859;
	Sat, 12 Sep 2020 10:24:20 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28254C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 10:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 107E386FA7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 10:24:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sWOLUwJEzkYP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 10:24:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3539686117
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 10:24:18 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id o16so2959657pjr.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 12 Sep 2020 03:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K41lXPEXhtriRTvEA20PbR1JTl5zSR6Y019sMKtFmvQ=;
 b=YgPeku7XYoG9gbJgAjzf7i7Nz7UM8Y+vvomXWKqboc/J71cO8KeMFeQc7IUaOxgLz6
 dO3D+1NjwZKGspHfN5B5T7TXDsIqdp6iv71wn7MehaN5TnqAcHaWS/KllTWn5VVUmkO3
 +43Tqu47KdbhI4+Qmd0Sa8mli4f7vVWK/vhP6AU8DAhx30jYrl5p0iPY7Zcj/XvNyAFv
 PEA9dzDmXp1dHw6+nU1goQ0Fp5ThR7egU+dJtCmppGmAvVRHX6n7J1SmGXQvB2bLHuCO
 4yA3rTpj6XppKs+le43FZ8HVtM6nMnzIutV9GO9eMYwmz9KAmzuX6RuK2nHy3qMKiQML
 jnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K41lXPEXhtriRTvEA20PbR1JTl5zSR6Y019sMKtFmvQ=;
 b=qA6ohhjdk6XvN8amJreDxC8NJ3WsPdtsneasJkfb+tqqkVyonCbw/CMhj+dzkytZAR
 8e4MVNV6MZL1Gs0pQ+4yNfs8CC23BEBBK+wsDk5o504vs3Du8ocIuEqPeH/oOSc9tuU7
 rXxkdWqn0k8uMs306YN4AZEDGwCytnPuHU5MMtHIV1Mh8lsLBghD0K+3ThoxhvX9qHGw
 xbZNPIwRScEQy6WkIQ/vdBK/Ami5C7St/AfaUpk7DTEsBEGb08JpD6Alp6iVMZ+5On4M
 goHucPu6Ffb1lgDsNpSeGX7nI5fr5LQ/kmskr5ON7/zGvoOZHIfG9ZeXyDsiR1XUC+T7
 RDsw==
X-Gm-Message-State: AOAM532Y4fsbghUBqjhzSvU85I1LEEelsEe+uqz5mbZn9kfNsKgdV4yV
 qklwDWMTKI9sDKPjIKFKpQ==
X-Google-Smtp-Source: ABdhPJzs5WmlP13J6EpGQ2ny/5LqUYvMuasn077V89lvM37mWRZCgAzk1psfpLgIuTMedkyqXde6lw==
X-Received: by 2002:a17:902:d913:b029:d0:cbe1:e712 with SMTP id
 c19-20020a170902d913b02900d0cbe1e712mr6314346plz.32.1599906257759; 
 Sat, 12 Sep 2020 03:24:17 -0700 (PDT)
Received: from localhost.localdomain (n11212042027.netvigator.com.
 [112.120.42.27])
 by smtp.gmail.com with ESMTPSA id 203sm4722682pfz.131.2020.09.12.03.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 03:24:17 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Ying Xue <ying.xue@windriver.com>
Date: Sat, 12 Sep 2020 06:22:30 -0400
Message-Id: <20200912102230.1529402-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <000000000000879057058f193fb5@google.com>
References: <000000000000879057058f193fb5@google.com>
MIME-Version: 1.0
Cc: Hillf Danton <hdanton@sina.com>, netdev@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, tipc-discussion@lists.sourceforge.net,
 Jakub Kicinski <kuba@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH net] tipc: Fix memory leak in
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
Decoded syzbot reproducer in pseudo-C:

	fd0 = socket(AF_TIPC, SOCK_DGRAM, 0);

	sockaddr_tipc.family = AF_TIPC;
	sockaddr_tipc.addrtype = TIPC_ADDR_NAMESEQ;
	sockaddr_tipc.scope = 0;
	sockaddr_tipc.addr.namesq.type = TIPC_RESERVED_TYPES + 1;
	bind(fd0, &sockaddr_tipc, sizeof(sockaddr_tipc));

	tipc_group_req0.type = TIPC_RESERVED_TYPES + 1;
	setsockopt(fd0, SOL_TIPC, TIPC_GROUP_JOIN, &tipc_group_req0, sizeof(tipc_group_req0));

	fd1 = socket(AF_TIPC, SOCK_STREAM, 0);

	tipc_group_req1.type = TIPC_RESERVED_TYPES + 1;
	tipc_group_req1.scope = TIPC_CLUSTER_SCOPE;
	setsockopt(fd1, SOL_TIPC, TIPC_GROUP_JOIN, &tipc_group_req1, sizeof(tipc_group_req1));

 net/tipc/group.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/net/tipc/group.c b/net/tipc/group.c
index 588c2d2b0c69..553cf08b4d76 100644
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
+			return -1;
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
