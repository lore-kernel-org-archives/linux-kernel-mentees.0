Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33407ECAAD8
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Sep 2022 09:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C24EB60B3D;
	Wed, 21 Sep 2022 09:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C24EB60B3D
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=KHkdOqbn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BTgnpDRn44o5; Wed, 21 Sep 2022 09:28:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 80B046009C;
	Wed, 21 Sep 2022 09:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80B046009C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 60147C0033;
	Wed, 21 Sep 2022 09:28:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CD75DC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Sep 2022 09:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A6C2840288
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Sep 2022 09:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6C2840288
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=KHkdOqbn
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a6AISnlYCzzi
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Sep 2022 09:28:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E288E402DC
Received: from sender-of-o50.zoho.in (sender-of-o50.zoho.in [103.117.158.50])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E288E402DC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Sep 2022 09:28:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1663752495; cv=none; d=zohomail.in; s=zohoarc; 
 b=G9QcHFjbsR871k+Cbhy5B0zjthU5f6ch+fY/ifdFea6Es0koCe/g3yCuMvWAQ/jKPM/q3lEDoJo3P+4YuN8KoTDtyJmRFKOWZJLoRu28rR3BjnLEKTAyKO7H1L2ZrcMz7neIEEGy1WqYFK5T/Eg+OmKxjmSlAToeYWayEV7odg8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1663752495;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=I7Q4D57L0Fon5Y8OnWeD+j+i4yBdJ+wVG0hPi+xhFQ8=; 
 b=fVbGu5VtiLsiJyrGK1iUx8c+rQS96j+ULBB324CGBlDzhT+mrlaWT5JRVcwwE5fb4b590tXiImiXD/CpUzqpNZa12CwLXAPhZxmvgjwGVQDnD8mDIpSkZ7aWZo9zlCZzZIkT3gEfiBdZO8Fk5g3ciXUxnX6Tbc0hlbnKNAMw5Vw=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663752495; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:Date:Date:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=I7Q4D57L0Fon5Y8OnWeD+j+i4yBdJ+wVG0hPi+xhFQ8=;
 b=KHkdOqbnBJLLKT1BFAXNVSisHH4n9XTRXo2qHqofp8OynLZuAODLEP1cU4cyyscm
 fRuoTkU23VYk6RSvBXlgHkwrjHofgaEQ3QbzrqHFk8TN/Wu1BmuC2ak7xaSvowUdsQf
 w/FtBXjws7zrEWTU+Y95PTmDnNPeEYq1fKW+Glr8=
Received: from localhost.localdomain (103.240.204.191 [103.240.204.191]) by
 mx.zoho.in with SMTPS id 1663752492715535.2396971290508;
 Wed, 21 Sep 2022 14:58:12 +0530 (IST)
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, David Howells <dhowells@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 Eric Dumazet <edumazet@google.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Eric Biggers <ebiggers@kernel.org>
Message-ID: <3cdc67df35a283c4d1a341d039d0c2251ff72930.1663750794.git.code@siddh.me>
Subject: [RESEND PATCH v2 1/2] include/linux/watch_queue: Improve documentation
Date: Wed, 21 Sep 2022 14:57:45 +0530
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1663750794.git.code@siddh.me>
References: <cover.1663750794.git.code@siddh.me>
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-security-module <linux-security-module@vger.kernel.org>,
 keyrings <keyrings@vger.kernel.org>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>,
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
