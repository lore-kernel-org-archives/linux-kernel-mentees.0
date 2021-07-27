Return-Path: <SRS0=JmfH=MT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A396C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Jul 2021 14:37:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0587E61AF0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Jul 2021 14:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0587E61AF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B26174044C;
	Tue, 27 Jul 2021 14:37:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id frQrSzMSbA_H; Tue, 27 Jul 2021 14:37:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 42369402C6;
	Tue, 27 Jul 2021 14:37:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0D1FDC001A;
	Tue, 27 Jul 2021 14:37:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D33DC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 14:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AF0E403DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 14:37:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=infradead.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qUflNS-soYqz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 14:37:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ACD19400BF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Jul 2021 14:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7JGTPyc+EQAmJMLeawxbIpd5nxKaSoB1NrO5dhBDcSg=; b=Z1QWHyfBAudsewtVZ8tqnA9Zbe
 j7krK+aZ2Zsve4mh2dBwCSB44HSDKQ0euh1GAIQ6kNWAtVaIoKZQd8wNgQ7TCvuBFV5rJNtSG0e4t
 m5+mGVrmjRQ9ES/wMXEbwAmky2+Qyb9Xs6s6D6wO4GkeA40a3GFrw2wPM9hbVcTk93YrWsDKBKeRG
 3+/Sq1R6enZLH+TZn6chT/YHadroZd3KO2N0yelV5eB27FwFx9da4HDEzPx+6zweL+6d9bihFwgwB
 +ZJEuEuEW5kcfrqL/etrGmj5yfV6mIsX7jIOea2y6EXyXYnWmzBzqewuLAzypZFKOD6Hv8jbsm4qM
 2lzBbYVg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8OCz-003Sbi-7Y; Tue, 27 Jul 2021 14:37:25 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5D8F130005A;
 Tue, 27 Jul 2021 16:37:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 4CE37213986E1; Tue, 27 Jul 2021 16:37:22 +0200 (CEST)
Date: Tue, 27 Jul 2021 16:37:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH 1/3] drm: use the lookup lock in drm_is_current_master
Message-ID: <YQAaIrNUXa6i2gxD@hirez.programming.kicks-ass.net>
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
 <20210722092929.244629-2-desmondcheongzx@gmail.com>
 <YPlKkvelm/mcnCj0@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPlKkvelm/mcnCj0@phenom.ffwll.local>
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

On Thu, Jul 22, 2021 at 12:38:10PM +0200, Daniel Vetter wrote:
> On Thu, Jul 22, 2021 at 05:29:27PM +0800, Desmond Cheong Zhi Xi wrote:
> > Inside drm_is_current_master, using the outer drm_device.master_mutex
> > to protect reads of drm_file.master makes the function prone to creating
> > lock hierarchy inversions. Instead, we can use the
> > drm_file.master_lookup_lock that sits at the bottom of the lock
> > hierarchy.
> > 
> > Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> > ---
> >  drivers/gpu/drm/drm_auth.c | 9 +++++----
> >  1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> > index f00354bec3fb..9c24b8cc8e36 100644
> > --- a/drivers/gpu/drm/drm_auth.c
> > +++ b/drivers/gpu/drm/drm_auth.c
> > @@ -63,8 +63,9 @@
> >  
> >  static bool drm_is_current_master_locked(struct drm_file *fpriv)
> >  {
> > -	lockdep_assert_held_once(&fpriv->minor->dev->master_mutex);
> > -
> > +	/* Either drm_device.master_mutex or drm_file.master_lookup_lock
> > +	 * should be held here.
> > +	 */
> 
> Disappointing that lockdep can't check or conditions for us, a
> lockdep_assert_held_either would be really neat in some cases.
> 
> Adding lockdep folks, maybe they have ideas.

#ifdef CONFIG_LOCKDEP
	WARN_ON_ONCE(debug_locks && !(lockdep_is_held(&drm_device.master_mutex) ||
				      lockdep_is_held(&drm_file.master_lookup_lock)));
#endif

doesn't exactly roll off the tongue, but should do as you want I
suppose.

Would something like:

#define lockdep_assert(cond)	WARN_ON_ONCE(debug_locks && !(cond))

Such that we can write:

	lockdep_assert(lockdep_is_held(&drm_device.master_mutex) ||
		       lockdep_is_held(&drm_file.master_lookup_lock));

make it better ?

---
Subject: locking/lockdep: Provide lockdep_assert{,_once}() helpers

Extract lockdep_assert{,_once}() helpers to more easily write composite
assertions like, for example:

	lockdep_assert(lockdep_is_held(&drm_device.master_mutex) ||
		       lockdep_is_held(&drm_file.master_lookup_lock));

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 5cf387813754..0da67341c1fb 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -306,31 +306,29 @@ extern void lock_unpin_lock(struct lockdep_map *lock, struct pin_cookie);
 
 #define lockdep_depth(tsk)	(debug_locks ? (tsk)->lockdep_depth : 0)
 
-#define lockdep_assert_held(l)	do {					\
-		WARN_ON(debug_locks &&					\
-			lockdep_is_held(l) == LOCK_STATE_NOT_HELD);	\
-	} while (0)
+#define lockdep_assert(cond)		\
+	do { WARN_ON(debug_locks && !(cond)); } while (0)
 
-#define lockdep_assert_not_held(l)	do {				\
-		WARN_ON(debug_locks &&					\
-			lockdep_is_held(l) == LOCK_STATE_HELD);		\
-	} while (0)
+#define lockdep_assert_once(cond)	\
+	do { WARN_ON_ONCE(debug_locks && !(cond)); } while (0)
 
-#define lockdep_assert_held_write(l)	do {			\
-		WARN_ON(debug_locks && !lockdep_is_held_type(l, 0));	\
-	} while (0)
+#define lockdep_assert_held(l)		\
+	lockdep_assert(lockdep_is_held(l) != LOCK_STAT_NOT_HELD)
 
-#define lockdep_assert_held_read(l)	do {				\
-		WARN_ON(debug_locks && !lockdep_is_held_type(l, 1));	\
-	} while (0)
+#define lockdep_assert_not_held(l)	\
+	lockdep_assert(lockdep_is_held(l) != LOCK_STATE_HELD)
 
-#define lockdep_assert_held_once(l)	do {				\
-		WARN_ON_ONCE(debug_locks && !lockdep_is_held(l));	\
-	} while (0)
+#define lockdep_assert_held_write(l)	\
+	lockdep_assert(lockdep_is_held_type(l, 0))
 
-#define lockdep_assert_none_held_once()	do {				\
-		WARN_ON_ONCE(debug_locks && current->lockdep_depth);	\
-	} while (0)
+#define lockdep_assert_held_read(l)	\
+	lockdep_assert(lockdep_is_held_type(l, 1))
+
+#define lockdep_assert_held_once(l)		\
+	lockdep_assert_once(lockdep_is_held(l) != LOCK_STAT_NOT_HELD)
+
+#define lockdep_assert_none_held_once()		\
+	lockdep_assert_once(!current->lockdep_depth)
 
 #define lockdep_recursing(tsk)	((tsk)->lockdep_recursion)
 
@@ -407,6 +405,9 @@ extern int lock_is_held(const void *);
 extern int lockdep_is_held(const void *);
 #define lockdep_is_held_type(l, r)		(1)
 
+#define lockdep_assert(c)			do { } while (0)
+#define lockdep_assert_once(c)			do { } while (0)
+
 #define lockdep_assert_held(l)			do { (void)(l); } while (0)
 #define lockdep_assert_not_held(l)		do { (void)(l); } while (0)
 #define lockdep_assert_held_write(l)		do { (void)(l); } while (0)

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
