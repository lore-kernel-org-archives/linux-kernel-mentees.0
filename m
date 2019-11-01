Return-Path: <SRS0=TMUh=YZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MIME_HTML_MOSTLY,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50101CA9EC9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Nov 2019 03:33:05 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13D742086D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Nov 2019 03:33:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GL3zb3O0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13D742086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BAE02F3B;
	Fri,  1 Nov 2019 03:33:04 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5B6D8CAA
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  1 Nov 2019 03:33:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1ABBF14D
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Fri,  1 Nov 2019 03:33:01 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id y194so7121594oie.4
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Thu, 31 Oct 2019 20:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S8gxxsxRKtgX+5eJniN/4JuAtyp1BaYZ2kDAks9nt0Q=;
	b=GL3zb3O0DrGkkOOJ9HBFh1WHjGbjPdaYvJh6CLGHOD/Kf4eYa8LqOoJfdGlGuOSEEQ
	IN7SM7C/+zRgKwE3MHp+qKHNE3Sg/00shdeXK0cNYGCLTK1kedS6/F7jjb/Ukb8E4imw
	Z0rEM8pjhKtdWQX2sNO21vjoSAOTKhFPBTnbRk2eAq8g5roX7NbWYJ/a/TUqugExrNSF
	6aTwgxRee+NyORkLgoqUndV5SqBO+M6ivZHcvxVYeJzy4k399UITBmLxNS3K3+rOQcwa
	cDycqc9LTpDLT2xjmMvLhPhOX+EkXCP2sk0Aohp9WEHhtmfXI5R9t30g3aQTxeyWYhhX
	uXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S8gxxsxRKtgX+5eJniN/4JuAtyp1BaYZ2kDAks9nt0Q=;
	b=G+TxXVsYRLZRZSh7GMh7RmyJcGKurHGq0Y/UwOwO9dVMgyY+BGAej1Ln3PGb8iLmyr
	evLbMrzz0QCjvDggHBbUQLH05h+69p7XgBPziY57rfk/sol0scVKwieUos5vB5muyFzW
	OElwvO8/J5eKxtLrr3hvOneptRMbcpHFLq5hqlu5UQtHk/GN+CL9WrOha9ueMkX9GZ7N
	J/BWyScs+5dZZCB/sUCEMqh2KXEjzKiWr01ElmLWL0KG3Gp5QsLT7UfPnjoMwwtKtCGA
	1ugPra0PtQh7hmx1lvjDiX3e41UA+edNFJSohZTRxxCXUoDEsabY459aaX/ykizAFDo0
	ULkg==
X-Gm-Message-State: APjAAAVL8AkjR8+hpdK+/l7FbYRj5ckgCpit/CYv0Uutje6EXp8GAUs1
	J2O2JOAjqqJs1+/gxCRnKQY7TTPVwBw7Bvu13Ro=
X-Google-Smtp-Source: APXvYqy/cGow/flEoAcrLlLBRzARv0n2yWaWz2FXkTCcY/yu3b9d8mbSyA8ZMieFuW92vNsXwrgI0tqJbyYUzZDMtt8=
X-Received: by 2002:aca:c590:: with SMTP id v138mr3061869oif.126.1572579179867;
	Thu, 31 Oct 2019 20:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191030233128.14997-1-tranmanphong@gmail.com>
	<20191031225439.GD20975@paulmck-ThinkPad-P72>
In-Reply-To: <20191031225439.GD20975@paulmck-ThinkPad-P72>
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Fri, 1 Nov 2019 09:03:57 +0530
Message-ID:
 <CAF65HP2yZkxjrqY+Jk9GYobo4NA3ePkrNcu3bZRCVZ8sxSUVrA@mail.gmail.com>
To: paulmck@kernel.org
Cc: corbet@lwn.net, linux-doc@vger.kernel.org, jiangshanlai@gmail.com,
	josh@joshtriplett.org, rostedt@goodmis.org,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	mathieu.desnoyers@efficios.com, joel@joelfernandes.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] Doc: convert whatisRCU.txt to rst
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
Content-Type: multipart/mixed; boundary="===============2266254298086874541=="
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Message-ID: <20191101033357.uDqDYeQl1bKHGHXxa8Rd1WLVYkeNeuvjPfgBxybkvP4@z>

--===============2266254298086874541==
Content-Type: multipart/alternative; boundary="00000000000065b4230596409fd4"

--00000000000065b4230596409fd4
Content-Type: text/plain; charset="UTF-8"

On Fri, 1 Nov, 2019, 4:24 AM Paul E. McKenney, <paulmck@kernel.org> wrote:

> On Thu, Oct 31, 2019 at 06:31:28AM +0700, Phong Tran wrote:
> > Sync the format with current state of kernel documentation.
> > This change base on rcu-dev branch
> > what changed:
> > - Format bullet lists
> > - Add literal blocks
> >
> > Signed-off-by: Phong Tran <tranmanphong@gmail.com>
>
> Queued and pushed with updated subject line and commit log, thank you!
>
> Could you and Madhuparna please review and test each other's
> .rst-conversion patches?
>

Sure, I will do it.
Regards
Madhuparna


>                                                         Thanx, Paul
>
> > ---
> >  Documentation/RCU/index.rst                   |   1 +
> >  .../RCU/{whatisRCU.txt => whatisRCU.rst}      | 150 +++++++++++-------
> >  2 files changed, 90 insertions(+), 61 deletions(-)
> >  rename Documentation/RCU/{whatisRCU.txt => whatisRCU.rst} (91%)
> >
> > diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
> > index 627128c230dc..b9b11481c727 100644
> > --- a/Documentation/RCU/index.rst
> > +++ b/Documentation/RCU/index.rst
> > @@ -8,6 +8,7 @@ RCU concepts
> >     :maxdepth: 3
> >
> >     arrayRCU
> > +   whatisRCU
> >     rcu
> >     listRCU
> >     NMI-RCU
> > diff --git a/Documentation/RCU/whatisRCU.txt
> b/Documentation/RCU/whatisRCU.rst
> > similarity index 91%
> > rename from Documentation/RCU/whatisRCU.txt
> > rename to Documentation/RCU/whatisRCU.rst
> > index 58ba05c4d97f..70d0e4c21917 100644
> > --- a/Documentation/RCU/whatisRCU.txt
> > +++ b/Documentation/RCU/whatisRCU.rst
> > @@ -1,15 +1,18 @@
> > +.. _rcu_doc:
> > +
> >  What is RCU?  --  "Read, Copy, Update"
> > +======================================
> >
> >  Please note that the "What is RCU?" LWN series is an excellent place
> >  to start learning about RCU:
> >
> > -1.   What is RCU, Fundamentally?  http://lwn.net/Articles/262464/
> > -2.   What is RCU? Part 2: Usage   http://lwn.net/Articles/263130/
> > -3.   RCU part 3: the RCU API      http://lwn.net/Articles/264090/
> > -4.   The RCU API, 2010 Edition    http://lwn.net/Articles/418853/
> > -     2010 Big API Table           http://lwn.net/Articles/419086/
> > -5.   The RCU API, 2014 Edition    http://lwn.net/Articles/609904/
> > -     2014 Big API Table           http://lwn.net/Articles/609973/
> > +| 1. What is RCU, Fundamentally?  http://lwn.net/Articles/262464/
> > +| 2. What is RCU? Part 2: Usage   http://lwn.net/Articles/263130/
> > +| 3. RCU part 3: the RCU API      http://lwn.net/Articles/264090/
> > +| 4. The RCU API, 2010 Edition    http://lwn.net/Articles/418853/
> > +|    2010 Big API Table           http://lwn.net/Articles/419086/
> > +| 5. The RCU API, 2014 Edition    http://lwn.net/Articles/609904/
> > +|    2014 Big API Table           http://lwn.net/Articles/609973/
> >
> >
> >  What is RCU?
> > @@ -51,6 +54,7 @@ never need this document anyway.  ;-)
> >
> >
> >  1.  RCU OVERVIEW
> > +----------------
> >
> >  The basic idea behind RCU is to split updates into "removal" and
> >  "reclamation" phases.  The removal phase removes references to data
> items
> > @@ -118,6 +122,7 @@ Read on to learn about how RCU's API makes this easy.
> >
> >
> >  2.  WHAT IS RCU'S CORE API?
> > +---------------------------
> >
> >  The core RCU API is quite small:
> >
> > @@ -166,7 +171,7 @@ synchronize_rcu()
> >       read-side critical sections on all CPUs have completed.
> >       Note that synchronize_rcu() will -not- necessarily wait for
> >       any subsequent RCU read-side critical sections to complete.
> > -     For example, consider the following sequence of events:
> > +     For example, consider the following sequence of events::
> >
> >                CPU 0                  CPU 1                 CPU 2
> >            ----------------- ------------------------- ---------------
> > @@ -248,13 +253,13 @@ rcu_dereference()
> >
> >       Common coding practice uses rcu_dereference() to copy an
> >       RCU-protected pointer to a local variable, then dereferences
> > -     this local variable, for example as follows:
> > +     this local variable, for example as follows::
> >
> >               p = rcu_dereference(head.next);
> >               return p->data;
> >
> >       However, in this case, one could just as easily combine these
> > -     into one statement:
> > +     into one statement::
> >
> >               return rcu_dereference(head.next)->data;
> >
> > @@ -267,7 +272,7 @@ rcu_dereference()
> >
> >       Note that the value returned by rcu_dereference() is valid
> >       only within the enclosing RCU read-side critical section [1].
> > -     For example, the following is -not- legal:
> > +     For example, the following is -not- legal::
> >
> >               rcu_read_lock();
> >               p = rcu_dereference(head.next);
> > @@ -315,6 +320,7 @@ rcu_dereference()
> >
> >  The following diagram shows how each API communicates among the
> >  reader, updater, and reclaimer.
> > +::
> >
> >
> >           rcu_assign_pointer()
> > @@ -377,10 +383,12 @@ for specialized uses, but are relatively uncommon.
> >
> >
> >  3.  WHAT ARE SOME EXAMPLE USES OF CORE RCU API?
> > +-----------------------------------------------
> >
> >  This section shows a simple use of the core RCU API to protect a
> >  global pointer to a dynamically allocated structure.  More-typical
> >  uses of RCU may be found in listRCU.txt, arrayRCU.txt, and NMI-RCU.txt.
> > +::
> >
> >       struct foo {
> >               int a;
> > @@ -467,13 +475,14 @@ arrayRCU.txt, and NMI-RCU.txt.
> >
> >
> >  4.  WHAT IF MY UPDATING THREAD CANNOT BLOCK?
> > +--------------------------------------------
> >
> >  In the example above, foo_update_a() blocks until a grace period
> elapses.
> >  This is quite simple, but in some cases one cannot afford to wait so
> >  long -- there might be other high-priority work to be done.
> >
> >  In such cases, one uses call_rcu() rather than synchronize_rcu().
> > -The call_rcu() API is as follows:
> > +The call_rcu() API is as follows::
> >
> >       void call_rcu(struct rcu_head * head,
> >                     void (*func)(struct rcu_head *head));
> > @@ -481,7 +490,7 @@ The call_rcu() API is as follows:
> >  This function invokes func(head) after a grace period has elapsed.
> >  This invocation might happen from either softirq or process context,
> >  so the function is not permitted to block.  The foo struct needs to
> > -have an rcu_head structure added, perhaps as follows:
> > +have an rcu_head structure added, perhaps as follows::
> >
> >       struct foo {
> >               int a;
> > @@ -490,7 +499,7 @@ have an rcu_head structure added, perhaps as follows:
> >               struct rcu_head rcu;
> >       };
> >
> > -The foo_update_a() function might then be written as follows:
> > +The foo_update_a() function might then be written as follows::
> >
> >       /*
> >        * Create a new struct foo that is the same as the one currently
> > @@ -520,7 +529,7 @@ The foo_update_a() function might then be written as
> follows:
> >               call_rcu(&old_fp->rcu, foo_reclaim);
> >       }
> >
> > -The foo_reclaim() function might appear as follows:
> > +The foo_reclaim() function might appear as follows::
> >
> >       void foo_reclaim(struct rcu_head *rp)
> >       {
> > @@ -552,7 +561,7 @@ o Use call_rcu() -after- removing a data element
> from an
> >
> >  If the callback for call_rcu() is not doing anything more than calling
> >  kfree() on the structure, you can use kfree_rcu() instead of call_rcu()
> > -to avoid having to write your own callback:
> > +to avoid having to write your own callback::
> >
> >       kfree_rcu(old_fp, rcu);
> >
> > @@ -560,6 +569,7 @@ Again, see checklist.txt for additional rules
> governing the use of RCU.
> >
> >
> >  5.  WHAT ARE SOME SIMPLE IMPLEMENTATIONS OF RCU?
> > +------------------------------------------------
> >
> >  One of the nice things about RCU is that it has extremely simple "toy"
> >  implementations that are a good first step towards understanding the
> > @@ -591,7 +601,7 @@ you allow nested rcu_read_lock() calls, you can
> deadlock.
> >  However, it is probably the easiest implementation to relate to, so is
> >  a good starting point.
> >
> > -It is extremely simple:
> > +It is extremely simple::
> >
> >       static DEFINE_RWLOCK(rcu_gp_mutex);
> >
> > @@ -614,7 +624,7 @@ It is extremely simple:
> >
> >  [You can ignore rcu_assign_pointer() and rcu_dereference() without
> missing
> >  much.  But here are simplified versions anyway.  And whatever you do,
> > -don't forget about them when submitting patches making use of RCU!]
> > +don't forget about them when submitting patches making use of RCU!]::
> >
> >       #define rcu_assign_pointer(p, v) \
> >       ({ \
> > @@ -659,6 +669,7 @@ This section presents a "toy" RCU implementation
> that is based on
> >  on features such as hotplug CPU and the ability to run in CONFIG_PREEMPT
> >  kernels.  The definitions of rcu_dereference() and rcu_assign_pointer()
> >  are the same as those shown in the preceding section, so they are
> omitted.
> > +::
> >
> >       void rcu_read_lock(void) { }
> >
> > @@ -707,10 +718,12 @@ Quick Quiz #3:  If it is illegal to block in an
> RCU read-side
> >
> >
> >  6.  ANALOGY WITH READER-WRITER LOCKING
> > +--------------------------------------
> >
> >  Although RCU can be used in many different ways, a very common use of
> >  RCU is analogous to reader-writer locking.  The following unified
> >  diff shows how closely related RCU and reader-writer locking can be.
> > +::
> >
> >       @@ -5,5 +5,5 @@ struct el {
> >               int data;
> > @@ -762,7 +775,7 @@ diff shows how closely related RCU and reader-writer
> locking can be.
> >               return 0;
> >        }
> >
> > -Or, for those who prefer a side-by-side listing:
> > +Or, for those who prefer a side-by-side listing::
> >
> >   1 struct el {                          1 struct el {
> >   2   struct list_head list;             2   struct list_head list;
> > @@ -774,40 +787,44 @@ Or, for those who prefer a side-by-side listing:
> >   8 rwlock_t listmutex;                  8 spinlock_t listmutex;
> >   9 struct el head;                      9 struct el head;
> >
> > - 1 int search(long key, int *result)    1 int search(long key, int
> *result)
> > - 2 {                                    2 {
> > - 3   struct list_head *lp;              3   struct list_head *lp;
> > - 4   struct el *p;                      4   struct el *p;
> > - 5                                      5
> > - 6   read_lock(&listmutex);             6   rcu_read_lock();
> > - 7   list_for_each_entry(p, head, lp) { 7   list_for_each_entry_rcu(p,
> head, lp) {
> > - 8     if (p->key == key) {             8     if (p->key == key) {
> > - 9       *result = p->data;             9       *result = p->data;
> > -10       read_unlock(&listmutex);      10       rcu_read_unlock();
> > -11       return 1;                     11       return 1;
> > -12     }                               12     }
> > -13   }                                 13   }
> > -14   read_unlock(&listmutex);          14   rcu_read_unlock();
> > -15   return 0;                         15   return 0;
> > -16 }                                   16 }
> > -
> > - 1 int delete(long key)                 1 int delete(long key)
> > - 2 {                                    2 {
> > - 3   struct el *p;                      3   struct el *p;
> > - 4                                      4
> > - 5   write_lock(&listmutex);            5   spin_lock(&listmutex);
> > - 6   list_for_each_entry(p, head, lp) { 6   list_for_each_entry(p,
> head, lp) {
> > - 7     if (p->key == key) {             7     if (p->key == key) {
> > - 8       list_del(&p->list);            8       list_del_rcu(&p->list);
> > - 9       write_unlock(&listmutex);      9       spin_unlock(&listmutex);
> > -                                       10       synchronize_rcu();
> > -10       kfree(p);                     11       kfree(p);
> > -11       return 1;                     12       return 1;
> > -12     }                               13     }
> > -13   }                                 14   }
> > -14   write_unlock(&listmutex);         15   spin_unlock(&listmutex);
> > -15   return 0;                         16   return 0;
> > -16 }                                   17 }
> > +::
> > +
> > +  1 int search(long key, int *result)    1 int search(long key, int
> *result)
> > +  2 {                                    2 {
> > +  3   struct list_head *lp;              3   struct list_head *lp;
> > +  4   struct el *p;                      4   struct el *p;
> > +  5                                      5
> > +  6   read_lock(&listmutex);             6   rcu_read_lock();
> > +  7   list_for_each_entry(p, head, lp) { 7   list_for_each_entry_rcu(p,
> head, lp) {
> > +  8     if (p->key == key) {             8     if (p->key == key) {
> > +  9       *result = p->data;             9       *result = p->data;
> > + 10       read_unlock(&listmutex);      10       rcu_read_unlock();
> > + 11       return 1;                     11       return 1;
> > + 12     }                               12     }
> > + 13   }                                 13   }
> > + 14   read_unlock(&listmutex);          14   rcu_read_unlock();
> > + 15   return 0;                         15   return 0;
> > + 16 }                                   16 }
> > +
> > +::
> > +
> > +  1 int delete(long key)                 1 int delete(long key)
> > +  2 {                                    2 {
> > +  3   struct el *p;                      3   struct el *p;
> > +  4                                      4
> > +  5   write_lock(&listmutex);            5   spin_lock(&listmutex);
> > +  6   list_for_each_entry(p, head, lp) { 6   list_for_each_entry(p,
> head, lp) {
> > +  7     if (p->key == key) {             7     if (p->key == key) {
> > +  8       list_del(&p->list);            8       list_del_rcu(&p->list);
> > +  9       write_unlock(&listmutex);      9
>  spin_unlock(&listmutex);
> > +                                        10       synchronize_rcu();
> > + 10       kfree(p);                     11       kfree(p);
> > + 11       return 1;                     12       return 1;
> > + 12     }                               13     }
> > + 13   }                                 14   }
> > + 14   write_unlock(&listmutex);         15   spin_unlock(&listmutex);
> > + 15   return 0;                         16   return 0;
> > + 16 }                                   17 }
> >
> >  Either way, the differences are quite small.  Read-side locking moves
> >  to rcu_read_lock() and rcu_read_unlock, update-side locking moves from
> > @@ -827,13 +844,14 @@ be used in place of synchronize_rcu().
> >
> >
> >  7.  FULL LIST OF RCU APIs
> > +-------------------------
> >
> >  The RCU APIs are documented in docbook-format header comments in the
> >  Linux-kernel source code, but it helps to have a full list of the
> >  APIs, since there does not appear to be a way to categorize them
> >  in docbook.  Here is the list, by category.
> >
> > -RCU list traversal:
> > +RCU list traversal::
> >
> >       list_entry_rcu
> >       list_first_entry_rcu
> > @@ -854,7 +872,7 @@ RCU list traversal:
> >       hlist_bl_first_rcu
> >       hlist_bl_for_each_entry_rcu
> >
> > -RCU pointer/list update:
> > +RCU pointer/list udate::
> >
> >       rcu_assign_pointer
> >       list_add_rcu
> > @@ -876,7 +894,9 @@ RCU pointer/list update:
> >       hlist_bl_del_rcu
> >       hlist_bl_set_first_rcu
> >
> > -RCU: Critical sections       Grace period            Barrier
> > +RCU::
> > +
> > +     Critical sections       Grace period            Barrier
> >
> >       rcu_read_lock           synchronize_net         rcu_barrier
> >       rcu_read_unlock         synchronize_rcu
> > @@ -885,7 +905,9 @@ RCU:      Critical sections       Grace period
>       Barrier
> >       rcu_dereference_check   kfree_rcu
> >       rcu_dereference_protected
> >
> > -bh:  Critical sections       Grace period            Barrier
> > +bh::
> > +
> > +     Critical sections       Grace period            Barrier
> >
> >       rcu_read_lock_bh        call_rcu                rcu_barrier
> >       rcu_read_unlock_bh      synchronize_rcu
> > @@ -896,7 +918,9 @@ bh:       Critical sections       Grace period
>       Barrier
> >       rcu_dereference_bh_protected
> >       rcu_read_lock_bh_held
> >
> > -sched:       Critical sections       Grace period            Barrier
> > +sched::
> > +
> > +     Critical sections       Grace period            Barrier
> >
> >       rcu_read_lock_sched     call_rcu                rcu_barrier
> >       rcu_read_unlock_sched   synchronize_rcu
> > @@ -910,7 +934,9 @@ sched:    Critical sections       Grace period
>       Barrier
> >       rcu_read_lock_sched_held
> >
> >
> > -SRCU:        Critical sections       Grace period            Barrier
> > +SRCU::
> > +
> > +     Critical sections       Grace period            Barrier
> >
> >       srcu_read_lock          call_srcu               srcu_barrier
> >       srcu_read_unlock        synchronize_srcu
> > @@ -918,13 +944,14 @@ SRCU:   Critical sections       Grace period
>       Barrier
> >       srcu_dereference_check
> >       srcu_read_lock_held
> >
> > -SRCU:        Initialization/cleanup
> > +SRCU: Initialization/cleanup::
> > +
> >       DEFINE_SRCU
> >       DEFINE_STATIC_SRCU
> >       init_srcu_struct
> >       cleanup_srcu_struct
> >
> > -All:  lockdep-checked RCU-protected pointer access
> > +All: lockdep-checked RCU-protected pointer access::
> >
> >       rcu_access_pointer
> >       rcu_dereference_raw
> > @@ -976,6 +1003,7 @@ the right tool for your job.
> >
> >
> >  8.  ANSWERS TO QUICK QUIZZES
> > +----------------------------
> >
> >  Quick Quiz #1:       Why is this argument naive?  How could a deadlock
> >               occur when using this algorithm in a real-world Linux
> > --
> > 2.20.1
> >
>

--00000000000065b4230596409fd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, 1 Nov, 2019, 4:24 AM Paul E. McKenney, &lt;<a =
href=3D"mailto:paulmck@kernel.org">paulmck@kernel.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">On Thu, Oct 31, 2019 at 06:31:28AM +0700,=
 Phong Tran wrote:<br>
&gt; Sync the format with current state of kernel documentation.<br>
&gt; This change base on rcu-dev branch<br>
&gt; what changed:<br>
&gt; - Format bullet lists<br>
&gt; - Add literal blocks<br>
&gt; <br>
&gt; Signed-off-by: Phong Tran &lt;<a href=3D"mailto:tranmanphong@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">tranmanphong@gmail.com</a>&gt;<br>
<br>
Queued and pushed with updated subject line and commit log, thank you!<br>
<br>
Could you and Madhuparna please review and test each other&#39;s<br>
.rst-conversion patches?<br></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Sure, I will do it.=C2=A0</div><div dir=3D"auto">Re=
gards=C2=A0</div><div dir=3D"auto">Madhuparna=C2=A0</div><div dir=3D"auto">=
<br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Thanx, Paul<br>
<br>
&gt; ---<br>
&gt;=C2=A0 Documentation/RCU/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 .../RCU/{whatisRCU.txt =3D&gt; whatisRCU.rst}=C2=A0 =C2=A0 =C2=
=A0 | 150 +++++++++++-------<br>
&gt;=C2=A0 2 files changed, 90 insertions(+), 61 deletions(-)<br>
&gt;=C2=A0 rename Documentation/RCU/{whatisRCU.txt =3D&gt; whatisRCU.rst} (=
91%)<br>
&gt; <br>
&gt; diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst=
<br>
&gt; index 627128c230dc..b9b11481c727 100644<br>
&gt; --- a/Documentation/RCU/index.rst<br>
&gt; +++ b/Documentation/RCU/index.rst<br>
&gt; @@ -8,6 +8,7 @@ RCU concepts<br>
&gt;=C2=A0 =C2=A0 =C2=A0:maxdepth: 3<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0arrayRCU<br>
&gt; +=C2=A0 =C2=A0whatisRCU<br>
&gt;=C2=A0 =C2=A0 =C2=A0rcu<br>
&gt;=C2=A0 =C2=A0 =C2=A0listRCU<br>
&gt;=C2=A0 =C2=A0 =C2=A0NMI-RCU<br>
&gt; diff --git a/Documentation/RCU/whatisRCU.txt b/Documentation/RCU/whati=
sRCU.rst<br>
&gt; similarity index 91%<br>
&gt; rename from Documentation/RCU/whatisRCU.txt<br>
&gt; rename to Documentation/RCU/whatisRCU.rst<br>
&gt; index 58ba05c4d97f..70d0e4c21917 100644<br>
&gt; --- a/Documentation/RCU/whatisRCU.txt<br>
&gt; +++ b/Documentation/RCU/whatisRCU.rst<br>
&gt; @@ -1,15 +1,18 @@<br>
&gt; +.. _rcu_doc:<br>
&gt; +<br>
&gt;=C2=A0 What is RCU?=C2=A0 --=C2=A0 &quot;Read, Copy, Update&quot;<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Please note that the &quot;What is RCU?&quot; LWN series is an e=
xcellent place<br>
&gt;=C2=A0 to start learning about RCU:<br>
&gt;=C2=A0 <br>
&gt; -1.=C2=A0 =C2=A0What is RCU, Fundamentally?=C2=A0 <a href=3D"http://lw=
n.net/Articles/262464/" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
p://lwn.net/Articles/262464/</a><br>
&gt; -2.=C2=A0 =C2=A0What is RCU? Part 2: Usage=C2=A0 =C2=A0<a href=3D"http=
://lwn.net/Articles/263130/" rel=3D"noreferrer noreferrer" target=3D"_blank=
">http://lwn.net/Articles/263130/</a><br>
&gt; -3.=C2=A0 =C2=A0RCU part 3: the RCU API=C2=A0 =C2=A0 =C2=A0 <a href=3D=
"http://lwn.net/Articles/264090/" rel=3D"noreferrer noreferrer" target=3D"_=
blank">http://lwn.net/Articles/264090/</a><br>
&gt; -4.=C2=A0 =C2=A0The RCU API, 2010 Edition=C2=A0 =C2=A0 <a href=3D"http=
://lwn.net/Articles/418853/" rel=3D"noreferrer noreferrer" target=3D"_blank=
">http://lwn.net/Articles/418853/</a><br>
&gt; -=C2=A0 =C2=A0 =C2=A02010 Big API Table=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<a href=3D"http://lwn.net/Articles/419086/" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">http://lwn.net/Articles/419086/</a><br>
&gt; -5.=C2=A0 =C2=A0The RCU API, 2014 Edition=C2=A0 =C2=A0 <a href=3D"http=
://lwn.net/Articles/609904/" rel=3D"noreferrer noreferrer" target=3D"_blank=
">http://lwn.net/Articles/609904/</a><br>
&gt; -=C2=A0 =C2=A0 =C2=A02014 Big API Table=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<a href=3D"http://lwn.net/Articles/609973/" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">http://lwn.net/Articles/609973/</a><br>
&gt; +| 1. What is RCU, Fundamentally?=C2=A0 <a href=3D"http://lwn.net/Arti=
cles/262464/" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lwn.ne=
t/Articles/262464/</a><br>
&gt; +| 2. What is RCU? Part 2: Usage=C2=A0 =C2=A0<a href=3D"http://lwn.net=
/Articles/263130/" rel=3D"noreferrer noreferrer" target=3D"_blank">http://l=
wn.net/Articles/263130/</a><br>
&gt; +| 3. RCU part 3: the RCU API=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://lw=
n.net/Articles/264090/" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
p://lwn.net/Articles/264090/</a><br>
&gt; +| 4. The RCU API, 2010 Edition=C2=A0 =C2=A0 <a href=3D"http://lwn.net=
/Articles/418853/" rel=3D"noreferrer noreferrer" target=3D"_blank">http://l=
wn.net/Articles/418853/</a><br>
&gt; +|=C2=A0 =C2=A0 2010 Big API Table=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<a href=3D"http://lwn.net/Articles/419086/" rel=3D"noreferrer norefer=
rer" target=3D"_blank">http://lwn.net/Articles/419086/</a><br>
&gt; +| 5. The RCU API, 2014 Edition=C2=A0 =C2=A0 <a href=3D"http://lwn.net=
/Articles/609904/" rel=3D"noreferrer noreferrer" target=3D"_blank">http://l=
wn.net/Articles/609904/</a><br>
&gt; +|=C2=A0 =C2=A0 2014 Big API Table=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0<a href=3D"http://lwn.net/Articles/609973/" rel=3D"noreferrer norefer=
rer" target=3D"_blank">http://lwn.net/Articles/609973/</a><br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 What is RCU?<br>
&gt; @@ -51,6 +54,7 @@ never need this document anyway.=C2=A0 ;-)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 1.=C2=A0 RCU OVERVIEW<br>
&gt; +----------------<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 The basic idea behind RCU is to split updates into &quot;removal=
&quot; and<br>
&gt;=C2=A0 &quot;reclamation&quot; phases.=C2=A0 The removal phase removes =
references to data items<br>
&gt; @@ -118,6 +122,7 @@ Read on to learn about how RCU&#39;s API makes thi=
s easy.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 2.=C2=A0 WHAT IS RCU&#39;S CORE API?<br>
&gt; +---------------------------<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 The core RCU API is quite small:<br>
&gt;=C2=A0 <br>
&gt; @@ -166,7 +171,7 @@ synchronize_rcu()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0read-side critical sections on all CPUs have=
 completed.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Note that synchronize_rcu() will -not- neces=
sarily wait for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0any subsequent RCU read-side critical sectio=
ns to complete.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0For example, consider the following sequence of e=
vents:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0For example, consider the following sequence of e=
vents::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPU 0=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CPU 1=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPU 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ----------------- -----------=
-------------- ---------------<br>
&gt; @@ -248,13 +253,13 @@ rcu_dereference()<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Common coding practice uses rcu_dereference(=
) to copy an<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0RCU-protected pointer to a local variable, t=
hen dereferences<br>
&gt; -=C2=A0 =C2=A0 =C2=A0this local variable, for example as follows:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0this local variable, for example as follows::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D rcu_derefe=
rence(head.next);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return p-&gt;dat=
a;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0However, in this case, one could just as eas=
ily combine these<br>
&gt; -=C2=A0 =C2=A0 =C2=A0into one statement:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0into one statement::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return rcu_deref=
erence(head.next)-&gt;data;<br>
&gt;=C2=A0 <br>
&gt; @@ -267,7 +272,7 @@ rcu_dereference()<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0Note that the value returned by rcu_derefere=
nce() is valid<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0only within the enclosing RCU read-side crit=
ical section [1].<br>
&gt; -=C2=A0 =C2=A0 =C2=A0For example, the following is -not- legal:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0For example, the following is -not- legal::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_lock();=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D rcu_derefe=
rence(head.next);<br>
&gt; @@ -315,6 +320,7 @@ rcu_dereference()<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 The following diagram shows how each API communicates among the<=
br>
&gt;=C2=A0 reader, updater, and reclaimer.<br>
&gt; +::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_assign_pointer()<br>
&gt; @@ -377,10 +383,12 @@ for specialized uses, but are relatively uncommo=
n.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 3.=C2=A0 WHAT ARE SOME EXAMPLE USES OF CORE RCU API?<br>
&gt; +-----------------------------------------------<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 This section shows a simple use of the core RCU API to protect a=
<br>
&gt;=C2=A0 global pointer to a dynamically allocated structure.=C2=A0 More-=
typical<br>
&gt;=C2=A0 uses of RCU may be found in listRCU.txt, arrayRCU.txt, and NMI-R=
CU.txt.<br>
&gt; +::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct foo {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int a;<br>
&gt; @@ -467,13 +475,14 @@ arrayRCU.txt, and NMI-RCU.txt.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 4.=C2=A0 WHAT IF MY UPDATING THREAD CANNOT BLOCK?<br>
&gt; +--------------------------------------------<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 In the example above, foo_update_a() blocks until a grace period=
 elapses.<br>
&gt;=C2=A0 This is quite simple, but in some cases one cannot afford to wai=
t so<br>
&gt;=C2=A0 long -- there might be other high-priority work to be done.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 In such cases, one uses call_rcu() rather than synchronize_rcu()=
.<br>
&gt; -The call_rcu() API is as follows:<br>
&gt; +The call_rcu() API is as follows::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void call_rcu(struct rcu_head * head,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0void (*func)(struct rcu_head *head));<br>
&gt; @@ -481,7 +490,7 @@ The call_rcu() API is as follows:<br>
&gt;=C2=A0 This function invokes func(head) after a grace period has elapse=
d.<br>
&gt;=C2=A0 This invocation might happen from either softirq or process cont=
ext,<br>
&gt;=C2=A0 so the function is not permitted to block.=C2=A0 The foo struct =
needs to<br>
&gt; -have an rcu_head structure added, perhaps as follows:<br>
&gt; +have an rcu_head structure added, perhaps as follows::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0struct foo {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int a;<br>
&gt; @@ -490,7 +499,7 @@ have an rcu_head structure added, perhaps as follo=
ws:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct rcu_head =
rcu;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt;=C2=A0 <br>
&gt; -The foo_update_a() function might then be written as follows:<br>
&gt; +The foo_update_a() function might then be written as follows::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Create a new struct foo that is the same =
as the one currently<br>
&gt; @@ -520,7 +529,7 @@ The foo_update_a() function might then be written =
as follows:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0call_rcu(&amp;ol=
d_fp-&gt;rcu, foo_reclaim);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -The foo_reclaim() function might appear as follows:<br>
&gt; +The foo_reclaim() function might appear as follows::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void foo_reclaim(struct rcu_head *rp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; @@ -552,7 +561,7 @@ o Use call_rcu() -after- removing a data element f=
rom an<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 If the callback for call_rcu() is not doing anything more than c=
alling<br>
&gt;=C2=A0 kfree() on the structure, you can use kfree_rcu() instead of cal=
l_rcu()<br>
&gt; -to avoid having to write your own callback:<br>
&gt; +to avoid having to write your own callback::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree_rcu(old_fp, rcu);<br>
&gt;=C2=A0 <br>
&gt; @@ -560,6 +569,7 @@ Again, see checklist.txt for additional rules gove=
rning the use of RCU.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 5.=C2=A0 WHAT ARE SOME SIMPLE IMPLEMENTATIONS OF RCU?<br>
&gt; +------------------------------------------------<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 One of the nice things about RCU is that it has extremely simple=
 &quot;toy&quot;<br>
&gt;=C2=A0 implementations that are a good first step towards understanding=
 the<br>
&gt; @@ -591,7 +601,7 @@ you allow nested rcu_read_lock() calls, you can de=
adlock.<br>
&gt;=C2=A0 However, it is probably the easiest implementation to relate to,=
 so is<br>
&gt;=C2=A0 a good starting point.<br>
&gt;=C2=A0 <br>
&gt; -It is extremely simple:<br>
&gt; +It is extremely simple::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0static DEFINE_RWLOCK(rcu_gp_mutex);<br>
&gt;=C2=A0 <br>
&gt; @@ -614,7 +624,7 @@ It is extremely simple:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 [You can ignore rcu_assign_pointer() and rcu_dereference() witho=
ut missing<br>
&gt;=C2=A0 much.=C2=A0 But here are simplified versions anyway.=C2=A0 And w=
hatever you do,<br>
&gt; -don&#39;t forget about them when submitting patches making use of RCU=
!]<br>
&gt; +don&#39;t forget about them when submitting patches making use of RCU=
!]::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0#define rcu_assign_pointer(p, v) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0({ \<br>
&gt; @@ -659,6 +669,7 @@ This section presents a &quot;toy&quot; RCU implem=
entation that is based on<br>
&gt;=C2=A0 on features such as hotplug CPU and the ability to run in CONFIG=
_PREEMPT<br>
&gt;=C2=A0 kernels.=C2=A0 The definitions of rcu_dereference() and rcu_assi=
gn_pointer()<br>
&gt;=C2=A0 are the same as those shown in the preceding section, so they ar=
e omitted.<br>
&gt; +::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0void rcu_read_lock(void) { }<br>
&gt;=C2=A0 <br>
&gt; @@ -707,10 +718,12 @@ Quick Quiz #3:=C2=A0 If it is illegal to block i=
n an RCU read-side<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 6.=C2=A0 ANALOGY WITH READER-WRITER LOCKING<br>
&gt; +--------------------------------------<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Although RCU can be used in many different ways, a very common u=
se of<br>
&gt;=C2=A0 RCU is analogous to reader-writer locking.=C2=A0 The following u=
nified<br>
&gt;=C2=A0 diff shows how closely related RCU and reader-writer locking can=
 be.<br>
&gt; +::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@@ -5,5 +5,5 @@ struct el {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int data;<br>
&gt; @@ -762,7 +775,7 @@ diff shows how closely related RCU and reader-writ=
er locking can be.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -Or, for those who prefer a side-by-side listing:<br>
&gt; +Or, for those who prefer a side-by-side listing::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A01 struct el {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 struct el {<br>
&gt;=C2=A0 =C2=A02=C2=A0 =C2=A0struct list_head list;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A02=C2=A0 =C2=A0struct list_head list;<br>
&gt; @@ -774,40 +787,44 @@ Or, for those who prefer a side-by-side listing:=
<br>
&gt;=C2=A0 =C2=A08 rwlock_t listmutex;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 8 spinlock_t listmutex;<br>
&gt;=C2=A0 =C2=A09 struct el head;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 9 struct el head;<br>
&gt;=C2=A0 <br>
&gt; - 1 int search(long key, int *result)=C2=A0 =C2=A0 1 int search(long k=
ey, int *result)<br>
&gt; - 2 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2 {<br>
&gt; - 3=C2=A0 =C2=A0struct list_head *lp;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 3=C2=A0 =C2=A0struct list_head *lp;<br>
&gt; - 4=C2=A0 =C2=A0struct el *p;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4=C2=A0 =C2=A0struct el *p;<br>
&gt; - 5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5<br>
&gt; - 6=C2=A0 =C2=A0read_lock(&amp;listmutex);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A06=C2=A0 =C2=A0rcu_read_lock();<br>
&gt; - 7=C2=A0 =C2=A0list_for_each_entry(p, head, lp) { 7=C2=A0 =C2=A0list_=
for_each_entry_rcu(p, head, lp) {<br>
&gt; - 8=C2=A0 =C2=A0 =C2=A0if (p-&gt;key =3D=3D key) {=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A08=C2=A0 =C2=A0 =C2=A0if (p-&gt;key =3D=3D key) =
{<br>
&gt; - 9=C2=A0 =C2=A0 =C2=A0 =C2=A0*result =3D p-&gt;data;=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A09=C2=A0 =C2=A0 =C2=A0 =C2=A0*result =3D p-&g=
t;data;<br>
&gt; -10=C2=A0 =C2=A0 =C2=A0 =C2=A0read_unlock(&amp;listmutex);=C2=A0 =C2=
=A0 =C2=A0 10=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_unlock();<br>
&gt; -11=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011=C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn 1;<br>
&gt; -12=C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012=C2=A0 =
=C2=A0 =C2=A0}<br>
&gt; -13=C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013=C2=A0 =
=C2=A0}<br>
&gt; -14=C2=A0 =C2=A0read_unlock(&amp;listmutex);=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 14=C2=A0 =C2=A0rcu_read_unlock();<br>
&gt; -15=C2=A0 =C2=A0return 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A015=C2=A0 =C2=A0return 0;<br>
&gt; -16 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016 }<br>
&gt; -<br>
&gt; - 1 int delete(long key)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A01 int delete(long key)<br>
&gt; - 2 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2 {<br>
&gt; - 3=C2=A0 =C2=A0struct el *p;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3=C2=A0 =C2=A0struct el *p;<br>
&gt; - 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4<br>
&gt; - 5=C2=A0 =C2=A0write_lock(&amp;listmutex);=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 5=C2=A0 =C2=A0spin_lock(&amp;listmutex);<br>
&gt; - 6=C2=A0 =C2=A0list_for_each_entry(p, head, lp) { 6=C2=A0 =C2=A0list_=
for_each_entry(p, head, lp) {<br>
&gt; - 7=C2=A0 =C2=A0 =C2=A0if (p-&gt;key =3D=3D key) {=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A07=C2=A0 =C2=A0 =C2=A0if (p-&gt;key =3D=3D key) =
{<br>
&gt; - 8=C2=A0 =C2=A0 =C2=A0 =C2=A0list_del(&amp;p-&gt;list);=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 8=C2=A0 =C2=A0 =C2=A0 =C2=A0list_del_rcu(&amp;p=
-&gt;list);<br>
&gt; - 9=C2=A0 =C2=A0 =C2=A0 =C2=A0write_unlock(&amp;listmutex);=C2=A0 =C2=
=A0 =C2=A0 9=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;listmutex);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A010=C2=
=A0 =C2=A0 =C2=A0 =C2=A0synchronize_rcu();<br>
&gt; -10=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(p);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011=C2=A0 =C2=A0 =C2=A0 =C2=A0k=
free(p);<br>
&gt; -11=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012=C2=A0 =C2=A0 =C2=A0 =C2=A0r=
eturn 1;<br>
&gt; -12=C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013=C2=A0 =
=C2=A0 =C2=A0}<br>
&gt; -13=C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A014=C2=A0 =
=C2=A0}<br>
&gt; -14=C2=A0 =C2=A0write_unlock(&amp;listmutex);=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A015=C2=A0 =C2=A0spin_unlock(&amp;listmutex);<br>
&gt; -15=C2=A0 =C2=A0return 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016=C2=A0 =C2=A0return 0;<br>
&gt; -16 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A017 }<br>
&gt; +::<br>
&gt; +<br>
&gt; +=C2=A0 1 int search(long key, int *result)=C2=A0 =C2=A0 1 int search(=
long key, int *result)<br>
&gt; +=C2=A0 2 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2 {<br>
&gt; +=C2=A0 3=C2=A0 =C2=A0struct list_head *lp;=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 3=C2=A0 =C2=A0struct list_head *lp;<br>
&gt; +=C2=A0 4=C2=A0 =C2=A0struct el *p;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4=C2=A0 =C2=A0struct el *p;<br>
&gt; +=C2=A0 5=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5=
<br>
&gt; +=C2=A0 6=C2=A0 =C2=A0read_lock(&amp;listmutex);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A06=C2=A0 =C2=A0rcu_read_lock();<br>
&gt; +=C2=A0 7=C2=A0 =C2=A0list_for_each_entry(p, head, lp) { 7=C2=A0 =C2=
=A0list_for_each_entry_rcu(p, head, lp) {<br>
&gt; +=C2=A0 8=C2=A0 =C2=A0 =C2=A0if (p-&gt;key =3D=3D key) {=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08=C2=A0 =C2=A0 =C2=A0if (p-&gt;key =3D=3D=
 key) {<br>
&gt; +=C2=A0 9=C2=A0 =C2=A0 =C2=A0 =C2=A0*result =3D p-&gt;data;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A09=C2=A0 =C2=A0 =C2=A0 =C2=A0*result =
=3D p-&gt;data;<br>
&gt; + 10=C2=A0 =C2=A0 =C2=A0 =C2=A0read_unlock(&amp;listmutex);=C2=A0 =C2=
=A0 =C2=A0 10=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_unlock();<br>
&gt; + 11=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011=C2=A0 =C2=A0 =C2=A0 =C2=
=A0return 1;<br>
&gt; + 12=C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012=C2=A0 =
=C2=A0 =C2=A0}<br>
&gt; + 13=C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013=C2=A0 =
=C2=A0}<br>
&gt; + 14=C2=A0 =C2=A0read_unlock(&amp;listmutex);=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 14=C2=A0 =C2=A0rcu_read_unlock();<br>
&gt; + 15=C2=A0 =C2=A0return 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A015=C2=A0 =C2=A0return 0;<br=
>
&gt; + 16 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016 }<br>
&gt; +<br>
&gt; +::<br>
&gt; +<br>
&gt; +=C2=A0 1 int delete(long key)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A01 int delete(long key)<br>
&gt; +=C2=A0 2 {=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2 {<br>
&gt; +=C2=A0 3=C2=A0 =C2=A0struct el *p;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3=C2=A0 =C2=A0struct el *p;<br>
&gt; +=C2=A0 4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4=
<br>
&gt; +=C2=A0 5=C2=A0 =C2=A0write_lock(&amp;listmutex);=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 5=C2=A0 =C2=A0spin_lock(&amp;listmutex);<br>
&gt; +=C2=A0 6=C2=A0 =C2=A0list_for_each_entry(p, head, lp) { 6=C2=A0 =C2=
=A0list_for_each_entry(p, head, lp) {<br>
&gt; +=C2=A0 7=C2=A0 =C2=A0 =C2=A0if (p-&gt;key =3D=3D key) {=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A07=C2=A0 =C2=A0 =C2=A0if (p-&gt;key =3D=3D=
 key) {<br>
&gt; +=C2=A0 8=C2=A0 =C2=A0 =C2=A0 =C2=A0list_del(&amp;p-&gt;list);=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8=C2=A0 =C2=A0 =C2=A0 =C2=A0list_del_rcu=
(&amp;p-&gt;list);<br>
&gt; +=C2=A0 9=C2=A0 =C2=A0 =C2=A0 =C2=A0write_unlock(&amp;listmutex);=C2=
=A0 =C2=A0 =C2=A0 9=C2=A0 =C2=A0 =C2=A0 =C2=A0spin_unlock(&amp;listmutex);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 10=
=C2=A0 =C2=A0 =C2=A0 =C2=A0synchronize_rcu();<br>
&gt; + 10=C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(p);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A011=C2=A0 =C2=A0 =C2=A0 =C2=
=A0kfree(p);<br>
&gt; + 11=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A012=C2=A0 =C2=A0 =C2=A0 =C2=
=A0return 1;<br>
&gt; + 12=C2=A0 =C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A013=C2=A0 =
=C2=A0 =C2=A0}<br>
&gt; + 13=C2=A0 =C2=A0}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A014=C2=A0 =
=C2=A0}<br>
&gt; + 14=C2=A0 =C2=A0write_unlock(&amp;listmutex);=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A015=C2=A0 =C2=A0spin_unlock(&amp;listmutex);<br>
&gt; + 15=C2=A0 =C2=A0return 0;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A016=C2=A0 =C2=A0return 0;<br=
>
&gt; + 16 }=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A017 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Either way, the differences are quite small.=C2=A0 Read-side loc=
king moves<br>
&gt;=C2=A0 to rcu_read_lock() and rcu_read_unlock, update-side locking move=
s from<br>
&gt; @@ -827,13 +844,14 @@ be used in place of synchronize_rcu().<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 7.=C2=A0 FULL LIST OF RCU APIs<br>
&gt; +-------------------------<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 The RCU APIs are documented in docbook-format header comments in=
 the<br>
&gt;=C2=A0 Linux-kernel source code, but it helps to have a full list of th=
e<br>
&gt;=C2=A0 APIs, since there does not appear to be a way to categorize them=
<br>
&gt;=C2=A0 in docbook.=C2=A0 Here is the list, by category.<br>
&gt;=C2=A0 <br>
&gt; -RCU list traversal:<br>
&gt; +RCU list traversal::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_entry_rcu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_first_entry_rcu<br>
&gt; @@ -854,7 +872,7 @@ RCU list traversal:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hlist_bl_first_rcu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hlist_bl_for_each_entry_rcu<br>
&gt;=C2=A0 <br>
&gt; -RCU pointer/list update:<br>
&gt; +RCU pointer/list udate::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_assign_pointer<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0list_add_rcu<br>
&gt; @@ -876,7 +894,9 @@ RCU pointer/list update:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hlist_bl_del_rcu<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0hlist_bl_set_first_rcu<br>
&gt;=C2=A0 <br>
&gt; -RCU: Critical sections=C2=A0 =C2=A0 =C2=A0 =C2=A0Grace period=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier<br>
&gt; +RCU::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Critical sections=C2=A0 =C2=A0 =C2=A0 =C2=A0Grace=
 period=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_lock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0synchronize_net=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_barrier<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_unlock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0synchronize_rcu<br>
&gt; @@ -885,7 +905,9 @@ RCU:=C2=A0 =C2=A0 =C2=A0 Critical sections=C2=A0 =
=C2=A0 =C2=A0 =C2=A0Grace period=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 B=
arrier<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_dereference_check=C2=A0 =C2=A0kfree_rcu<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_dereference_protected<br>
&gt;=C2=A0 <br>
&gt; -bh:=C2=A0 Critical sections=C2=A0 =C2=A0 =C2=A0 =C2=A0Grace period=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier<br>
&gt; +bh::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Critical sections=C2=A0 =C2=A0 =C2=A0 =C2=A0Grace=
 period=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_lock_bh=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
call_rcu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_barrier=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_unlock_bh=C2=A0 =C2=A0 =C2=A0 synch=
ronize_rcu<br>
&gt; @@ -896,7 +918,9 @@ bh:=C2=A0 =C2=A0 =C2=A0 =C2=A0Critical sections=C2=
=A0 =C2=A0 =C2=A0 =C2=A0Grace period=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Barrier<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_dereference_bh_protected<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_lock_bh_held<br>
&gt;=C2=A0 <br>
&gt; -sched:=C2=A0 =C2=A0 =C2=A0 =C2=A0Critical sections=C2=A0 =C2=A0 =C2=
=A0 =C2=A0Grace period=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier<br>
&gt; +sched::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Critical sections=C2=A0 =C2=A0 =C2=A0 =C2=A0Grace=
 period=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_lock_sched=C2=A0 =C2=A0 =C2=A0call_=
rcu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rcu_barrier<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_unlock_sched=C2=A0 =C2=A0synchroniz=
e_rcu<br>
&gt; @@ -910,7 +934,9 @@ sched:=C2=A0 =C2=A0 Critical sections=C2=A0 =C2=A0=
 =C2=A0 =C2=A0Grace period=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_read_lock_sched_held<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -SRCU:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Critical sections=C2=A0 =C2=A0 =C2=
=A0 =C2=A0Grace period=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier<br>
&gt; +SRCU::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0Critical sections=C2=A0 =C2=A0 =C2=A0 =C2=A0Grace=
 period=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0srcu_read_lock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 call_srcu=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0srcu=
_barrier<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0srcu_read_unlock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
synchronize_srcu<br>
&gt; @@ -918,13 +944,14 @@ SRCU:=C2=A0 =C2=A0Critical sections=C2=A0 =C2=A0=
 =C2=A0 =C2=A0Grace period=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Barrier=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0srcu_dereference_check<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0srcu_read_lock_held<br>
&gt;=C2=A0 <br>
&gt; -SRCU:=C2=A0 =C2=A0 =C2=A0 =C2=A0 Initialization/cleanup<br>
&gt; +SRCU: Initialization/cleanup::<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_SRCU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DEFINE_STATIC_SRCU<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0init_srcu_struct<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cleanup_srcu_struct<br>
&gt;=C2=A0 <br>
&gt; -All:=C2=A0 lockdep-checked RCU-protected pointer access<br>
&gt; +All: lockdep-checked RCU-protected pointer access::<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_access_pointer<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rcu_dereference_raw<br>
&gt; @@ -976,6 +1003,7 @@ the right tool for your job.<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt;=C2=A0 8.=C2=A0 ANSWERS TO QUICK QUIZZES<br>
&gt; +----------------------------<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 Quick Quiz #1:=C2=A0 =C2=A0 =C2=A0 =C2=A0Why is this argument na=
ive?=C2=A0 How could a deadlock<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0occur when using=
 this algorithm in a real-world Linux<br>
&gt; -- <br>
&gt; 2.20.1<br>
&gt; <br>
</blockquote></div></div></div>

--00000000000065b4230596409fd4--

--===============2266254298086874541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============2266254298086874541==--
