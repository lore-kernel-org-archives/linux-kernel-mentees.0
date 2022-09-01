Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D2FECAAD3
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Sep 2022 20:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7699282433;
	Thu,  1 Sep 2022 20:07:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7699282433
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=kjaGyJiN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-rS9SC4YHGL; Thu,  1 Sep 2022 20:07:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 59C868239A;
	Thu,  1 Sep 2022 20:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59C868239A
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 273C8C0032;
	Thu,  1 Sep 2022 20:07:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 78D5EC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 20:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 381FC41750
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 20:07:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 381FC41750
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=kjaGyJiN
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UU1BRZbn6A1z
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 20:07:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A59E415F6
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A59E415F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Sep 2022 20:07:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1662062827; cv=none; d=zohomail.in; s=zohoarc; 
 b=Rf1j8K/KdrjOCktJBWQ9w4/pPA2paAXghYAT+PuhwVT/ZnJ5VIXn2Rrne/IGYrK3zdNekHIQh1iwaJdpTgBO3vk++LpTckOci5EQOZ3E+OWbwEu0uevWEVh0CVoQphidoNV1a1DfVso8pJClXk0NxKPpBfNepsR2R5Tjdr0bbPM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1662062827;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=I7Q4D57L0Fon5Y8OnWeD+j+i4yBdJ+wVG0hPi+xhFQ8=; 
 b=eudYhq4D5FR2DVAJOb+fULyYGnOopgc3xvFeV5GOCf9zT2HCoyuHwLygIrbblafmhE+ruxfw2shjBwQH+yJwwhlyjaYGYf/bKe2LaiJc7t0bgJXh0ehvoVPx48kR20hmSdOYLtaQV+SsOKi4jmUmH5Y5NEQuZLBqdAxCi+TUegA=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1662062827; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=I7Q4D57L0Fon5Y8OnWeD+j+i4yBdJ+wVG0hPi+xhFQ8=;
 b=kjaGyJiNGdsp7tCnBdynKy0CKxm9tr+Kt6XiF0/s2ngbOS9FKzcwdYZS6qxCW952
 ZnPCzwjL4TzSE3CIRCYMT4EFLgxBzHsOc9A2E1HnF5keqqXAvX+ieFpMNaWttlS95uW
 p/OJYF+SKStRmENyy3E16fYcTWt5EMdGYW42p7lI=
Received: from localhost.localdomain (103.249.233.18 [103.249.233.18]) by
 mx.zoho.in with SMTPS id 1662062825546686.9552803263169;
 Fri, 2 Sep 2022 01:37:05 +0530 (IST)
To: Jonathan Corbet <corbet@lwn.net>, David Howells <dhowells@redhat.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Eric Dumazet <edumazet@google.com>, Eric Biggers <ebiggers@kernel.org>
Message-ID: <d25b2a4772bf8d2a37bbf1bd2c6ad82b13081762.1659771577.git.code@siddh.me>
Subject: [RESEND PATCH v2 1/2] include/linux/watch_queue: Improve documentation
Date: Fri,  2 Sep 2022 01:36:55 +0530
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
Message-ID: <20220901200655.wYuKLfc5Wlygsbj1yBMEgMfzjSOO_Rkx-X4M4RziC30@z>

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
