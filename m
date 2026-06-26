Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE843E4C87
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Jun 2026 12:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478303; cv=none; b=dhnCGgsBn0kVaLWUsBUEbb31OLfoZX4XBUCVxLmfTTb5JUIRAIJr9WnxLtd6XrW9+E1BaAbrntPsceUnkd4RH2SKBeTuqv7W5At2d3y96Q7CHNOOEuVyqj4CUQ94pT2xd0bfUrCAWD0hrl0E+YuG9DHrKGoQDpMshrA4GcefKTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478303; c=relaxed/simple;
	bh=Vz3OhwOHlMpWJ+lWe2Y8uFTP7ZzrXzmJBCkG6aJWgaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EaSfE1J/G4Wdt9D6kBIeZ4QKLPyaSSNbf/dRcmjjZRy3iCu71bSjzCK88IwB0K/fhAETqIFYDKqCqO003lkAQDC3GZqfvzmnA6oqcnaFqIsdLgbUPneX9+CPZkELO9y/wwMCxeGvQTv6jIBVpYiPNeCuHU4Xyunc7HV8xCT6Nrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VOPZXxgs; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VOPZXxgs"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5964960F0C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Jun 2026 12:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HoghZ5VHq6pO for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 26 Jun 2026 12:51:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=mahad.ibrahim.dev@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 45BD860E08
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 45BD860E08
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VOPZXxgs
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 45BD860E08
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Jun 2026 12:51:39 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-c1217010b15so119012466b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 26 Jun 2026 05:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782478298; x=1783083098; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CAB1FbzWsnF9Lxhl7Ec6EQWiHnMDnluM1YpwBU/0JxI=;
        b=VOPZXxgswHNdmC4YQ1xtxfoUhC6irAxLsTTPVaAPyY5oC14tcacw48GPPF0yF4WjTG
         REZ6tPcqUEmqmuzAzsvLKULYFUxPHB5A7LIQefA65/svIGkDwNv4BXc129kVj3tuiQ+L
         DMUJQxgaqp8NZtMq42y/4VviRKeEiQUdZ3nWjhS1h1ZXllB1G32JH3a2B5Pmpakh77es
         jqCo5KvYFMInMu3YA21hBakjSfCi5nGQpXGaExGQhIHML22eApE7xNoh7h9AOeTVYw8C
         wybzqrPFvMD0vC5XN2S5nmAFaI9IGAuz3/bqP2tOCXyedDh2VjcanxlYD60IzErQqGPU
         Qy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782478298; x=1783083098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CAB1FbzWsnF9Lxhl7Ec6EQWiHnMDnluM1YpwBU/0JxI=;
        b=s1FtOW/mR+r1Wa95mdK2F0YFd/DCkdxgkYAzbmXf/ZyCCnJL/JH5VKczQoPr+dw01A
         ng2ku0FWIULBuF1UxmtEJ/Rr90erG7IafYtP3MVwWPegA9SpMicSHqbyfMmIhtJiBBiy
         VZmTs9xcFdOLsr8aG447gHJtrnY619UN4lEwf6YLcVjsk0IQirnI+YVm0SHJAyAV7DfK
         V8DEO9C08Qp1g+y1Wa5IyOWLpUfhW3lvthqPo9FeaBOOk3p/+kRVfR7wVJJEY4disdg+
         Gy23uhTvEPfF4U7xX0anOF06x/npV0rMRToNQZCGIo8CkeiNcaV2jP7yfjYhFRYM44yb
         XaMw==
X-Forwarded-Encrypted: i=1; AHgh+Rrun5HkdDq/r21POx2Fr04zHmtp6z7Fg6JRggq/p54M4zJly1RN6B4tTZH5Y8INqwzqoxlmTuA7MqnwLkOo3zVfy3h1gw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzZFdwEKmkai2DIdef8H+hjJAnGyWObyjAjZDt44EnFMY6KpT4l
	D88o8KWnosa9UuE872a1FH4XIkeC+t+6FWYDAjE2tl+XmsQ3q49Ma0Tq
X-Gm-Gg: AfdE7ckYFyhsNkWClwfT3DeEeBeGykHDMQxn21YZMHMM53TIRGwx3SPvYDMhlXk1Krm
	JPUlDNg0d39pudkmkcePYPwPQn+f+9wZGh7MW5uTesGCh0gWMbb/e/DHXwXXsCuVQRRU5giI6cM
	wPV+eza0zOf6CXz8TUScAySND6UpJycdS2p8FlHRXICL9mkWafeEgviEI4jLiT8PoI7NjfU0Qro
	fieJS7thZXAH/u1+/reEMKVazJPXX0YGBgDEdDutCpeQkXoaU2VWyBVyAioWyPsylG+MrhUE1/I
	FHLBYCOQSS8FRpQQWb+SScNwTXJT+8HrD0kAbcJZ4NifeDL+4lKnKtkahzW8/JHVxrb+AmjzkRw
	u5rF5O+kN+J9dOhxiMVhUJOahhhyHaOarcJYIuWkBdniXbfeZhhqYjdzYXY26JTBv3sVnPsuOu7
	ODYIFmp9W59neiar3RYKRVF30t79lB/eq1Mp0=
X-Received: by 2002:a17:906:7955:b0:c10:bfaf:6f73 with SMTP id a640c23a62f3a-c1204495c0amr478108466b.22.1782478297610;
        Fri, 26 Jun 2026 05:51:37 -0700 (PDT)
Received: from localhost.localdomain ([72.255.58.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c121cd03f24sm122511466b.32.2026.06.26.05.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 05:51:37 -0700 (PDT)
From: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>,
	Amir Goldstein <amir73il@gmail.com>
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>
Subject: [PATCH v2] fuse: replace passthrough backing-id IDR with a counter and hashtable
Date: Fri, 26 Jun 2026 12:51:31 +0000
Message-ID: <20260626125131.2117-1-mahad.ibrahim.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260621183157.3490-1-mahad.ibrahim.dev@gmail.com>
References: <20260621183157.3490-1-mahad.ibrahim.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The passthrough backing-id IDR carries a /* FIXME: xarray might be space
inefficient */ on its idr_alloc_cyclic() call. Replace it with a cyclic
counter for allocation and a hashtable for lookup.

The hashtable keys are already the set of live ids, so allocation needs
only a counter: it takes the next value, skipping any already present,
all under fc->lock. A live-id count makes it return -ENOSPC when full.

The hashtable is allocated lazily when passthrough is negotiated, so it is
present whenever passthrough is enabled; every dereference is already gated
on fc->passthrough, so no NULL checks are added. On allocation failure
passthrough is left off and the mount continues.

Lookup is now O(chain) rather than the IDR's bounded walk, but runs only at
backing setup, off the read/write path.

Testing

Tested under KASAN and KCSAN in separate builds, since the two cannot be
enabled together. The workload was passthrough_hp under fio with parallel
open/close churn; ftrace confirmed concurrent allocation, lookup, and
removal across CPUs. No KASAN use-after-free and no KCSAN data race in
fs/fuse/backing.c.

Signed-off-by: Mahad Ibrahim <mahad.ibrahim.dev@gmail.com>

---

v2:
 - drop the IDA; allocate with a cyclic counter and resolve collisions
   via the hashtable's membership check under fc->lock (Miklos)
 - add a live-id count to bound allocation and return -ENOSPC when full

Uniqueness now comes from the hashtable rather than an allocator that owns
the id space, so this should stay clear of any future 64-bit or
user-assigned-id work. The id is kept 32-bit and kernel-allocated here.

Lookup uses 256 fixed buckets, so chains lengthen at very high backing
counts; an rhashtable would keep it flat but adds complexity. The fixed
table seemed simpler for the expected counts - happy to switch if you'd
prefer.

 fs/fuse/backing.c | 98 +++++++++++++++++++++++++++++++++++++----------
 fs/fuse/fuse_i.h  | 31 +++++++++++++--
 fs/fuse/inode.c   |  8 ++--
 3 files changed, 111 insertions(+), 26 deletions(-)

diff --git a/fs/fuse/backing.c b/fs/fuse/backing.c
index 472b6afa7dff..77f4d4b00bf4 100644
--- a/fs/fuse/backing.c
+++ b/fs/fuse/backing.c
@@ -35,49 +35,99 @@ void fuse_backing_put(struct fuse_backing *fb)
 
 void fuse_backing_files_init(struct fuse_conn *fc)
 {
-	idr_init(&fc->backing_files_map);
+	fc->backing_ids_count = 0;
+	fc->backing_files_next_id = 1;
+	fc->backing_htable = NULL;
 }
 
 static int fuse_backing_id_alloc(struct fuse_conn *fc, struct fuse_backing *fb)
 {
 	int id;
+	struct fuse_backing *iterator;
 
-	idr_preload(GFP_KERNEL);
 	spin_lock(&fc->lock);
-	/* FIXME: xarray might be space inefficient */
-	id = idr_alloc_cyclic(&fc->backing_files_map, fb, 1, 0, GFP_ATOMIC);
+
+	if (fc->backing_ids_count == INT_MAX) {
+		id = -ENOSPC;
+		goto out;
+	}
+
+retry:
+	id = fc->backing_files_next_id;
+	fc->backing_files_next_id = (id == INT_MAX) ? 1 : id + 1;
+
+	hash_for_each_possible(fc->backing_htable->backing_files_ht,
+			       iterator, node, id) {
+		if (iterator->id == id)
+			goto retry;
+	}
+
+	fb->id = id;
+	hash_add_rcu(fc->backing_htable->backing_files_ht, &fb->node, id);
+	fc->backing_ids_count++;
+
+out:
 	spin_unlock(&fc->lock);
-	idr_preload_end();
 
-	WARN_ON_ONCE(id == 0);
 	return id;
 }
 
+int fuse_backing_htable_alloc(struct fuse_conn *fc)
+{
+	struct fuse_backing_htable *ht;
+
+	ht = kzalloc_obj(struct fuse_backing_htable);
+	if (!ht)
+		return -ENOMEM;
+
+	hash_init(ht->backing_files_ht);
+	fc->backing_htable = ht;
+
+	return 0;
+}
+
 static struct fuse_backing *fuse_backing_id_remove(struct fuse_conn *fc,
 						   int id)
 {
-	struct fuse_backing *fb;
+	struct fuse_backing *iterator;
+	struct fuse_backing *fb = NULL;
 
 	spin_lock(&fc->lock);
-	fb = idr_remove(&fc->backing_files_map, id);
+	hash_for_each_possible(fc->backing_htable->backing_files_ht,
+			       iterator, node, id) {
+		if (iterator->id == id) {
+			hash_del_rcu(&iterator->node);
+			fb = iterator;
+			break;
+		}
+	}
+
+	if (fb)
+		fc->backing_ids_count--;
+
 	spin_unlock(&fc->lock);
 
 	return fb;
 }
 
-static int fuse_backing_id_free(int id, void *p, void *data)
+void fuse_backing_files_free(struct fuse_conn *fc)
 {
-	struct fuse_backing *fb = p;
+	struct fuse_backing *fb;
+	struct hlist_node *tmp;
+	int bkt;
 
-	WARN_ON_ONCE(refcount_read(&fb->count) != 1);
-	fuse_backing_free(fb);
-	return 0;
-}
+	if (!fc->backing_htable)
+		return;
 
-void fuse_backing_files_free(struct fuse_conn *fc)
-{
-	idr_for_each(&fc->backing_files_map, fuse_backing_id_free, NULL);
-	idr_destroy(&fc->backing_files_map);
+	hash_for_each_safe(fc->backing_htable->backing_files_ht,
+			   bkt, tmp, fb, node) {
+		hash_del_rcu(&fb->node);
+		WARN_ON_ONCE(refcount_read(&fb->count) != 1);
+		fuse_backing_free(fb);
+	}
+
+	kfree(fc->backing_htable);
+	fc->backing_htable = NULL;
 }
 
 int fuse_backing_open(struct fuse_conn *fc, struct fuse_backing_map *map)
@@ -169,10 +219,18 @@ int fuse_backing_close(struct fuse_conn *fc, int backing_id)
 
 struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, int backing_id)
 {
-	struct fuse_backing *fb;
+	struct fuse_backing *iterator;
+	struct fuse_backing *fb = NULL;
 
 	rcu_read_lock();
-	fb = idr_find(&fc->backing_files_map, backing_id);
+	hash_for_each_possible_rcu(fc->backing_htable->backing_files_ht,
+				   iterator, node, backing_id) {
+		if (iterator->id == backing_id) {
+			fb = iterator;
+			break;
+		}
+	}
+
 	fb = fuse_backing_get(fb);
 	rcu_read_unlock();
 
diff --git a/fs/fuse/fuse_i.h b/fs/fuse/fuse_i.h
index 85f738c53122..db4c07a496f0 100644
--- a/fs/fuse/fuse_i.h
+++ b/fs/fuse/fuse_i.h
@@ -30,6 +30,7 @@
 #include <linux/pid_namespace.h>
 #include <linux/refcount.h>
 #include <linux/user_namespace.h>
+#include <linux/hashtable.h>
 
 /** Default max number of pages that can be used in a single read request */
 #define FUSE_DEFAULT_MAX_PAGES_PER_REQ 32
@@ -94,6 +95,10 @@ struct fuse_backing {
 	/* refcount */
 	refcount_t count;
 	struct rcu_head rcu;
+
+	/* ID Allocation */
+	int id;
+	struct hlist_node node;
 };
 
 /**
@@ -407,6 +412,12 @@ struct fuse_sync_bucket {
 	struct rcu_head rcu;
 };
 
+#ifdef CONFIG_FUSE_PASSTHROUGH
+struct fuse_backing_htable {
+	DECLARE_HASHTABLE(backing_files_ht, 8);
+};
+#endif
+
 /**
  * struct fuse_conn - A Fuse connection.
  *
@@ -418,7 +429,9 @@ struct fuse_conn {
 	/**
 	 * @lock: Lock protecting:
 	 * - polled_files
-	 * - backing_files_map
+	 * - backing_files_next_id
+	 * - backing_ids_count
+	 * - backing_htable (modifications)
 	 * - curr_bucket
 	 */
 	spinlock_t lock;
@@ -759,8 +772,14 @@ struct fuse_conn {
 	struct fuse_sync_bucket __rcu *curr_bucket;
 
 #ifdef CONFIG_FUSE_PASSTHROUGH
-	/** @backing_files_map: IDR for backing files ids */
-	struct idr backing_files_map;
+	/** @backing_ids_count: Count of total allocated IDs */
+	unsigned int backing_ids_count;
+
+	/** @backing_files_next_id: Cursor for cyclic allocation */
+	unsigned int backing_files_next_id;
+
+	/** @backing_htable: Pointer to external hashtable */
+	struct fuse_backing_htable *backing_htable;
 #endif
 };
 
@@ -1259,6 +1278,7 @@ void fuse_file_release(struct inode *inode, struct fuse_file *ff,
 struct fuse_backing *fuse_backing_get(struct fuse_backing *fb);
 void fuse_backing_put(struct fuse_backing *fb);
 struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc, int backing_id);
+int fuse_backing_htable_alloc(struct fuse_conn *fc);
 #else
 
 static inline struct fuse_backing *fuse_backing_get(struct fuse_backing *fb)
@@ -1274,6 +1294,11 @@ static inline struct fuse_backing *fuse_backing_lookup(struct fuse_conn *fc,
 {
 	return NULL;
 }
+
+static inline int fuse_backing_htable_alloc(struct fuse_conn *fc)
+{
+	return -EOPNOTSUPP;
+}
 #endif
 
 void fuse_backing_files_init(struct fuse_conn *fc);
diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index d975073c6029..8adb1eb7ff51 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1389,9 +1389,11 @@ static void process_init_reply(struct fuse_args *args, int error)
 			    arg->max_stack_depth > 0 &&
 			    arg->max_stack_depth <= FILESYSTEM_MAX_STACK_DEPTH &&
 			    !(flags & FUSE_WRITEBACK_CACHE))  {
-				fc->passthrough = 1;
-				fc->max_stack_depth = arg->max_stack_depth;
-				fm->sb->s_stack_depth = arg->max_stack_depth;
+				if (!fuse_backing_htable_alloc(fc)) {
+					fc->passthrough = 1;
+					fc->max_stack_depth = arg->max_stack_depth;
+					fm->sb->s_stack_depth = arg->max_stack_depth;
+				}
 			}
 			if (flags & FUSE_NO_EXPORT_SUPPORT)
 				fm->sb->s_export_op = &fuse_export_fid_operations;
-- 
2.54.0

