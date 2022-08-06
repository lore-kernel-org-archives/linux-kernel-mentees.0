Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C344C25B0C
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  6 Aug 2022 07:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B083640201;
	Sat,  6 Aug 2022 07:44:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B083640201
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=oZ3ucd7n
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxPq-imszT8l; Sat,  6 Aug 2022 07:44:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 9B80240192;
	Sat,  6 Aug 2022 07:44:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B80240192
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7237EC0032;
	Sat,  6 Aug 2022 07:44:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 407BEC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 07:44:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0828C41769
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 07:44:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0828C41769
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=oZ3ucd7n
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1mKf9fbxVOZy
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 07:44:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EF1741761
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EF1741761
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Aug 2022 07:44:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1659771854; cv=none; d=zohomail.in; s=zohoarc; 
 b=OyqiYSCCh3C8uVr2eRNnqEcgNmJCAo5kB/fZrYFxYEr3NXXK/vQ8sP0VEmCVEnfGdyv4O69kP8GZoaAFEQ9Bm4trftPckv3JdSgjTAI8nEWlta/GXrcqoBxf2EaKvxMGGBOIP4/rGBOY5EHIX7lCOS4WEZRqRjUNCMPFdlIXKaI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1659771854;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=I7Q4D57L0Fon5Y8OnWeD+j+i4yBdJ+wVG0hPi+xhFQ8=; 
 b=UPI7h69+BeNNjIxPU3XSK6PFbBKYtLl4YacsgEsnk8XnHtUDYNGHup1EHLaK7DmqLblxBpOiw+sRA5AvbqakctBMOR0EO5yX6bZBje+wRmR8YX7YEoCizViax2NwQfmNIXTe3UWBJkJpz4Y3VUfLWt2HLpWNVwuinaQYG52T2rY=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1659771854; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=I7Q4D57L0Fon5Y8OnWeD+j+i4yBdJ+wVG0hPi+xhFQ8=;
 b=oZ3ucd7nzUTF/dDakhdjR4W3epTJmeattNdaAZavk8/m+LE8bM+hjnMgBcsn1gru
 IGqn7S3MEl2wXgH5IDjd5UcWLnw0K+OTaIfBm1GQH7cYLa9jDSzlE4huvx8Q2xIJyCO
 byekvomJwF/3gVdAiFa7dfp8HJ7nvSm+KNGY6pbE=
Received: from localhost.localdomain (43.250.158.93 [43.250.158.93]) by
 mx.zoho.in with SMTPS id 1659771853673529.5982041718509;
 Sat, 6 Aug 2022 13:14:13 +0530 (IST)
To: Eric Biggers <ebiggers@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Howells <dhowells@redhat.com>, Randy Dunlap <rdunlap@infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Eric Dumazet <edumazet@google.com>
Message-ID: <d25b2a4772bf8d2a37bbf1bd2c6ad82b13081762.1659771577.git.code@siddh.me>
Subject: [PATCH v2 1/2] include/linux/watch_queue: Improve documentation
Date: Sat,  6 Aug 2022 13:13:41 +0530
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1659771577.git.code@siddh.me>
References: <cover.1659771577.git.code@siddh.me>
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

Introduce kerneldoc-style comments, and document a couple of things
explicitly.

Signed-off-by: Siddh Raman Pant <code@siddh.me>
---
 include/linux/watch_queue.h | 102 ++++++++++++++++++++++++++----------
 1 file changed, 75 insertions(+), 27 deletions(-)

diff --git a/include/linux/watch_queue.h b/include/linux/watch_queue.h
index fc6bba20273b..7f8b1f15634b 100644
--- a/include/linux/watch_queue.h
+++ b/include/linux/watch_queue.h
@@ -18,57 +18,103 @@
 
 struct cred;
 
+/**
+ * struct watch_type_filter - Filter on watch type
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
+ * struct watch_filter - Filter on watch
+ *
+ * @rcu: RCU head (in union with type_filter)
+ * @type_filter: Bitmask of accepted types (in union with rcu)
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
+ * struct watch_queue - General notification queue
+ *
+ * @rcu: RCU head
+ * @filter: Filter to use on watches
+ * @pipe: The pipe we're using as a buffer
+ * @watches: Contributory watches
+ * @notes: Preallocated notifications
+ * @notes_bitmap: Allocation bitmap for notes
+ * @usage: Object usage count
+ * @lock: To serialize accesses and removes
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
+ * struct watch - Representation of a watch on an object
+ *
+ * @rcu: RCU head (in union with info_id)
+ * @info_id: ID to be OR'd in to info field (in union with rcu)
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
+ * struct watch_list - List of watches on an object
+ *
+ * @rcu: RCU head
+ * @watchers: List head
+ * @release_watch: Function to release watch
+ * @lock: To protect addition and removal of watches
  */
 struct watch_list {
 	struct rcu_head		rcu;
@@ -118,8 +164,10 @@ static inline void remove_watch_list(struct watch_list *wlist, u64 id)
 }
 
 /**
- * watch_sizeof - Calculate the information part of the size of a watch record,
- * given the structure size.
+ * watch_sizeof() - Calculate the information part of the size of a watch
+ *		    record, given the structure size.
+ *
+ * @STRUCT: The structure whose size is to be given
  */
 #define watch_sizeof(STRUCT) (sizeof(STRUCT) << WATCH_INFO_LENGTH__SHIFT)
 
-- 
2.35.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
