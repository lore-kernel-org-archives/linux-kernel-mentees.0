Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176ACC19F2A
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  4 Aug 2022 13:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFA2B828AA;
	Thu,  4 Aug 2022 13:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFA2B828AA
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=iOPoGrRI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z485xZvfvcyl; Thu,  4 Aug 2022 13:31:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 84A58829B1;
	Thu,  4 Aug 2022 13:31:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84A58829B1
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4C50BC0071;
	Thu,  4 Aug 2022 13:31:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 401D4C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 13:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D1FF40B9D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 13:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D1FF40B9D
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=iOPoGrRI
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GG9-oA9anQQs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 13:31:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 876E340B68
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 876E340B68
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  4 Aug 2022 13:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659619870; cv=none; d=zohomail.in; s=zohoarc; 
 b=Q2ub6m9aXLeA4anYH/ssE1c1c5p5f0KYhUQW7SWGpRY5bRaCcWoLbELYckVz3zNmbVBPcRirxdPZ0IZTKi8jN+fqoGnWLkX5iVNcyw4CMN+IcNE9BTOEULiKoCbdLm0s7KzkYWMqHrvMH7pRCCn8yUWMwqddHTW0r7VFuZv4470=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659619870;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=ML2EqkeHNsgj3TjKde7zyuOTBKOcYW9uCOulr/NrERw=; 
 b=VumQp9GlQJAVdZoNgv7hWqG33TBtUGfyarYgiTklkHdvx1dadwucNhF1nTa4qfvyq5L2sULKeGOu+/aRIJJgIBxiw4RFMpbZjv5K4RtUZsycwW4hVdJneTBmcSzU2w+LVMK4ImE1TZ4CM0uIiQ3ZoCJOXP5UdSuHHmj+V/TgVVA=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659619870; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=ML2EqkeHNsgj3TjKde7zyuOTBKOcYW9uCOulr/NrERw=;
 b=iOPoGrRI9AkzB0ea2/BWWElK0YYqhqfQfx3CV83lDrqlCu2P3mxYZKzMJIfE1dxQ
 7TU0bSgTnFnSkwt1g6XY/D8TuH72kyp9jzLPcPJh4eK8tMsrtto8AipTxfKWsiXCscD
 fv/P1TC/LHa/AVx6BxEogrKryFm8L8Aotdje8gsk=
Received: from localhost.localdomain (103.250.137.206 [103.250.137.206]) by
 mx.zoho.in with SMTPS id 16596198680111014.2940277369726;
 Thu, 4 Aug 2022 19:01:08 +0530 (IST)
To: Eric Biggers <ebiggers@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Howells <dhowells@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Eric Dumazet <edumazet@google.com>
Message-ID: <6bac2d4c2b50d921eb16fa5344ffe258be90c651.1659618705.git.code@siddh.me>
Subject: [PATCH 2/3] kernel/watch_queue: Improve struct annotation formatting
Date: Thu,  4 Aug 2022 19:00:23 +0530
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1659618705.git.code@siddh.me>
References: <cover.1659618705.git.code@siddh.me>
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Improve formatting struct annotations in watch_queue.h, so that they
fall in the preferred 80 character limit.

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 include/linux/watch_queue.h | 96 +++++++++++++++++++++++++++----------
 1 file changed, 71 insertions(+), 25 deletions(-)

diff --git a/include/linux/watch_queue.h b/include/linux/watch_queue.h
index fc6bba20273b..c99c39ec6548 100644
--- a/include/linux/watch_queue.h
+++ b/include/linux/watch_queue.h
@@ -18,57 +18,103 @@
 
 struct cred;
 
+/**
+ * watch_type_filter - Filter on watch type
+ *
+ * @type: Type of watch_notification
+ * @subtype_filter: Bitmask of subtypes to filter on
+ * @info_filter: Filter on watch_notification::info
+ * @info_mask: Mask of relevant bits in info_filter
+ */
 struct watch_type_filter {
 	enum watch_notification_type type;
-	__u32		subtype_filter[1];	/* Bitmask of subtypes to filter on */
-	__u32		info_filter;		/* Filter on watch_notification::info */
-	__u32		info_mask;		/* Mask of relevant bits in info_filter */
+	__u32		subtype_filter[1];
+	__u32		info_filter;
+	__u32		info_mask;
 };
 
+/**
+ * watch_filter - Filter on watch
+ *
+ * @rcu: (union) RCU head
+ * @type_filter: (union) Bitmask of accepted types
+ * @nr_filters: Number of filters
+ * @filters: Array of watch_type_filter
+ */
 struct watch_filter {
 	union {
 		struct rcu_head	rcu;
-		/* Bitmask of accepted types */
 		DECLARE_BITMAP(type_filter, WATCH_TYPE__NR);
 	};
-	u32			nr_filters;	/* Number of filters */
+	u32			 nr_filters;
 	struct watch_type_filter filters[];
 };
 
+/**
+ * watch_queue - General notification queue
+ *
+ * @rcu: RCU head
+ * @filter: Filter on watch_notification::info
+ * @pipe: The pipe we're using as a buffer.
+ * @watches: Contributory watches
+ * @notes: Preallocated notifications
+ * @notes_bitmap: Allocation bitmap for notes
+ * @usage: Object usage count
+ * @lock: Spinlock
+ * @nr_notes: Number of notes
+ * @nr_pages: Number of pages in notes[]
+ * @defunct: True when queues closed
+ */
 struct watch_queue {
 	struct rcu_head		rcu;
 	struct watch_filter __rcu *filter;
-	struct pipe_inode_info	*pipe;		/* The pipe we're using as a buffer */
-	struct hlist_head	watches;	/* Contributory watches */
-	struct page		**notes;	/* Preallocated notifications */
-	unsigned long		*notes_bitmap;	/* Allocation bitmap for notes */
-	struct kref		usage;		/* Object usage count */
+	struct pipe_inode_info	*pipe;
+	struct hlist_head	watches;
+	struct page		**notes;
+	unsigned long		*notes_bitmap;
+	struct kref		usage;
 	spinlock_t		lock;
-	unsigned int		nr_notes;	/* Number of notes */
-	unsigned int		nr_pages;	/* Number of pages in notes[] */
-	bool			defunct;	/* T when queues closed */
+	unsigned int		nr_notes;
+	unsigned int		nr_pages;
+	bool			defunct;
 };
 
-/*
- * Representation of a watch on an object.
+/**
+ * watch - Representation of a watch on an object.
+ *
+ * @rcu: (union) RCU head
+ * @info_id: (union) ID to be OR'd in to info field
+ * @queue: Queue to post events to
+ * @queue_node: Link in queue->watches
+ * @watch_list: Link in watch_list->watchers
+ * @list_node: The list node
+ * @cred: Creds of the owner of the watch
+ * @private: Private data for the watched object
+ * @id: Internal identifier
+ * @usage: Object usage count
  */
 struct watch {
 	union {
 		struct rcu_head	rcu;
-		u32		info_id;	/* ID to be OR'd in to info field */
+		u32		info_id;
 	};
-	struct watch_queue __rcu *queue;	/* Queue to post events to */
-	struct hlist_node	queue_node;	/* Link in queue->watches */
+	struct watch_queue __rcu *queue;
+	struct hlist_node	queue_node;
 	struct watch_list __rcu	*watch_list;
-	struct hlist_node	list_node;	/* Link in watch_list->watchers */
-	const struct cred	*cred;		/* Creds of the owner of the watch */
-	void			*private;	/* Private data for the watched object */
-	u64			id;		/* Internal identifier */
-	struct kref		usage;		/* Object usage count */
+	struct hlist_node	list_node;
+	const struct cred	*cred;
+	void			*private;
+	u64			id;
+	struct kref		usage;
 };
 
-/*
- * List of watches on an object.
+/**
+ * watch_list - List of watches on an object.
+ *
+ * @rcu: RCU head
+ * @watchers: List head
+ * @release_watch: Function to release watch
+ * @lock: Spinlock
  */
 struct watch_list {
 	struct rcu_head		rcu;
-- 
2.35.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
