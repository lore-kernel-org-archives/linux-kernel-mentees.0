Return-Path: <SRS0=V8/f=4P=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFE5C11D3D
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Feb 2020 17:05:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CC222469F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 27 Feb 2020 17:05:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PqBRJ9l2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CC222469F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4D24C86E15;
	Thu, 27 Feb 2020 17:05:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hpm3bnFBC9eK; Thu, 27 Feb 2020 17:05:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6BE0E869D7;
	Thu, 27 Feb 2020 17:05:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E4FAC08A0;
	Thu, 27 Feb 2020 17:05:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D7F1DC0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 17:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id BF74D86E15
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 17:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H11mSXhQoL6p
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 17:05:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 406D2869D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 17:05:38 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id l21so2792972qtr.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 27 Feb 2020 09:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rMDvnKR4QaWrkCqPXsb5peaCSNVpn+aChGJ03CxWG9o=;
 b=PqBRJ9l2pO1PEDlb9M2Ms/FR9gWmHjNkHEl0RCH5ayZIX99gpFB/JLO9rXqpW8fTBM
 Am+bVOn1DPw/bN5X69aG9uqNy+hofMSYCHkVLlHM3FV+H8oQkIZwVyUdCTKZxosFvAEj
 26nLFGP0LFXwXtwMmp81F256Z3LF9v4JVoe0isSXYF58Gp6b/q90xpR4nTNY1MHkPR9F
 9zPxv61CZOZCG7OrUbPrxOjzbz0XsZ6tV6/WszSKE6XqoCxZ8h00ft8D+LauyLb2LbZM
 yMoVnNejRhGS7/Q2PFgdPDC2Rp67ZYNsjQ2d9SaV97UixKrw/fvdqwsFBYz/wFw9ScsU
 1xlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rMDvnKR4QaWrkCqPXsb5peaCSNVpn+aChGJ03CxWG9o=;
 b=nSi0xBo0a5U8bVRvRrnW101GHSeJWKSyAlR7ns7aovpbl27duz0dim7zQ19yS5ULkL
 lxTeGgaeNWyI7paKRqGUgAe72T9jFzG16a3gHVuMXrCNy1PvqZm0kuP5GvBM403wI5w/
 BhPh/CaIHLYa+TH/1irG+dDeW4N6kixpJaDClBYdg2xDUXUbyz78WhmrUYLILy4m+OOd
 zTURxIJxsNZR3ZoxgoABz1FmmAQ+Kwyl8S6X9vcEPp1UvmXDYxqFozOXKx32wyM6DuI1
 AOe8hDSCUBqzK0BHCDfAaKfJ9o70HUK2B2u/e3tEJkpw+RAvbTHGoGTzzEFZIQazj9T8
 6nhQ==
X-Gm-Message-State: APjAAAVElleT7a0yW3fLJ2Zr7yCJ9wcPccLI+hovMWL1Mx/4sA2Yk0s1
 2OVFf1Gj1MCg2RqkKRPoVBHzvstJAmkpseWXBE4=
X-Google-Smtp-Source: APXvYqykTpB/QteOjU2OWfpr6Mjp2v261Q49PtjvHSxvPP8J4suiHvRuZSS7Kd5NYJX3BfxxuV+kK3hzbDhpJ42Hi5o=
X-Received: by 2002:ac8:7b9a:: with SMTP id p26mr83882qtu.281.1582823137074;
 Thu, 27 Feb 2020 09:05:37 -0800 (PST)
MIME-Version: 1.0
References: <20200227104448.10154-1-amanharitsh123@gmail.com>
 <20200227132836.GB161459@google.com>
In-Reply-To: <20200227132836.GB161459@google.com>
From: Aman Sharma <amanharitsh123@gmail.com>
Date: Thu, 27 Feb 2020 22:35:24 +0530
Message-ID: <CAO7WW36zSaybPXo8ZYDx_QskToF4OiXf8PUCaK=hOMiUwJgOrQ@mail.gmail.com>
To: Joel Fernandes <joel@joelfernandes.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 Josh Triplett <josh@joshtriplett.org>, Steven Rostedt <rostedt@goodmis.org>,
 linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] doc: Convert rculist_nulls.txt
	to rculist_nulls.rst
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
Content-Type: multipart/mixed; boundary="===============8579704578473607986=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8579704578473607986==
Content-Type: multipart/alternative; boundary="000000000000d3df6a059f91bafc"

--000000000000d3df6a059f91bafc
Content-Type: text/plain; charset="UTF-8"

Sure, I will do that.

On Thu, Feb 27, 2020, 6:58 PM Joel Fernandes <joel@joelfernandes.org> wrote:

> On Thu, Feb 27, 2020 at 04:14:46PM +0530, Aman Sharma wrote:
> > This patch converts rculist_nulls from .txt to .rst format, and also adds
> > it to the index.rst file.
>
> When posting such patches, could you clarify what has changed during the
> conversion when you write the commit message?
>
> thanks,
>
>  - Joel
>
>
> > Signed-off-by: Aman Sharma <amanharitsh123@gmail.com>
> > ---
> >  Documentation/RCU/index.rst         |   1 +
> >  Documentation/RCU/rculist_nulls.rst | 179 ++++++++++++++++++++++++++++
> >  Documentation/RCU/rculist_nulls.txt | 172 --------------------------
> >  3 files changed, 180 insertions(+), 172 deletions(-)
> >  create mode 100644 Documentation/RCU/rculist_nulls.rst
> >  delete mode 100644 Documentation/RCU/rculist_nulls.txt
> >
> > diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst
> > index d60eb4ba2cd0..2cf55bd141b3 100644
> > --- a/Documentation/RCU/index.rst
> > +++ b/Documentation/RCU/index.rst
> > @@ -10,6 +10,7 @@ RCU concepts
> >     arrayRCU
> >     rcubarrier
> >     rcu_dereference
> > +   rculist_nulls
> >     checklist
> >     whatisRCU
> >     rcu
> > diff --git a/Documentation/RCU/rculist_nulls.rst
> b/Documentation/RCU/rculist_nulls.rst
> > new file mode 100644
> > index 000000000000..8e04de44fe3d
> > --- /dev/null
> > +++ b/Documentation/RCU/rculist_nulls.rst
> > @@ -0,0 +1,179 @@
> > +.. _rculist_nulls_doc:
> > +
> > +Using hlist_nulls to protect read-mostly linked lists and objects using
> SLAB_TYPESAFE_BY_RCU allocations.
> >
> +=========================================================================================================
> > +
> > +Please read the basics in Documentation/RCU/listRCU.rst
> > +
> > +Using special makers (called 'nulls') is a convenient way
> > +to solve following problem :
> > +
> > +A typical RCU linked list managing objects which are
> > +allocated with SLAB_TYPESAFE_BY_RCU kmem_cache can
> > +use following algos :
> > +
> > +1. Lookup algo
> > +--------------
> > +::
> > +
> > +   rcu_read_lock()
> > +   begin:
> > +   obj = lockless_lookup(key);
> > +   if (obj) {
> > +   if (!try_get_ref(obj)) // might fail for free objects
> > +      goto begin;
> > +   /*
> > +      * Because a writer could delete object, and a writer could
> > +      * reuse these object before the RCU grace period, we
> > +      * must check key after getting the reference on object
> > +      */
> > +   if (obj->key != key) { // not the object we expected
> > +      put_ref(obj);
> > +      goto begin;
> > +      }
> > +   }
> > +   rcu_read_unlock();
> > +
> > +Beware that lockless_lookup(key) cannot use traditional
> hlist_for_each_entry_rcu()
> > +but a version with an additional memory barrier (smp_rmb()) ::
> > +
> > +   lockless_lookup(key)
> > +   {
> > +      struct hlist_node *node, *next;
> > +      for (pos = rcu_dereference((head)->first);
> > +            pos && ({ next = pos->next; smp_rmb(); prefetch(next); 1;
> }) &&
> > +            ({ tpos = hlist_entry(pos, typeof(*tpos), member); 1; });
> > +            pos = rcu_dereference(next))
> > +         if (obj->key == key)
> > +            return obj;
> > +      return NULL;
> > +
> > +And note the traditional hlist_for_each_entry_rcu() misses this
> smp_rmb() ::
> > +
> > +   struct hlist_node *node;
> > +   for (pos = rcu_dereference((head)->first);
> > +             pos && ({ prefetch(pos->next); 1; }) &&
> > +             ({ tpos = hlist_entry(pos, typeof(*tpos), member); 1; });
> > +             pos = rcu_dereference(pos->next))
> > +      if (obj->key == key)
> > +         return obj;
> > +   return NULL;
> > +}
> > +
> > +Quoting Corey Minyard :
> > +
> > +"If the object is moved from one list to another list in-between the
> > + time the hash is calculated and the next field is accessed, and the
> > + object has moved to the end of a new list, the traversal will not
> > + complete properly on the list it should have, since the object will
> > + be on the end of the new list and there's not a way to tell it's on a
> > + new list and restart the list traversal.  I think that this can be
> > + solved by pre-fetching the "next" field (with proper barriers) before
> > + checking the key."
> > +
> > +2. Insert algo
> > +----------------
> > +
> > +We need to make sure a reader cannot read the new 'obj->obj_next' value
> > +and previous value of 'obj->key'. Or else, an item could be deleted
> > +from a chain, and inserted into another chain. If new chain was empty
> > +before the move, 'next' pointer is NULL, and lockless reader can
> > +not detect it missed following items in original chain ::
> > +
> > +   /*
> > +   * Please note that new inserts are done at the head of list,
> > +   * not in the middle or end.
> > +   */
> > +   obj = kmem_cache_alloc(...);
> > +   lock_chain(); // typically a spin_lock()
> > +   obj->key = key;
> > +   /*
> > +   * we need to make sure obj->key is updated before obj->next
> > +   * or obj->refcnt
> > +   */
> > +   smp_wmb();
> > +   atomic_set(&obj->refcnt, 1);
> > +   hlist_add_head_rcu(&obj->obj_node, list);
> > +   unlock_chain(); // typically a spin_unlock()
> > +
> > +
> > +3. Remove algo
> > +--------------
> > +Nothing special here, we can use a standard RCU hlist deletion.
> > +But thanks to SLAB_TYPESAFE_BY_RCU, beware a deleted object can be
> reused
> > +very very fast (before the end of RCU grace period) ::
> > +
> > +   if (put_last_reference_on(obj) {
> > +      lock_chain(); // typically a spin_lock()
> > +      hlist_del_init_rcu(&obj->obj_node);
> > +      unlock_chain(); // typically a spin_unlock()
> > +      kmem_cache_free(cachep, obj);
> > +   }
> > +
> > +
> > +
> > +With hlist_nulls we can avoid extra smp_rmb() in lockless_lookup()
> > +and extra smp_wmb() in insert function.
> > +
> > +For example, if we choose to store the slot number as the 'nulls'
> > +end-of-list marker for each slot of the hash table, we can detect
> > +a race (some writer did a delete and/or a move of an object
> > +to another chain) checking the final 'nulls' value if
> > +the lookup met the end of chain. If final 'nulls' value
> > +is not the slot number, then we must restart the lookup at
> > +the beginning. If the object was moved to the same chain,
> > +then the reader doesn't care : It might eventually
> > +scan the list again without harm.
> > +
> > +
> > +1. lookup algo
> > +--------------
> > +::
> > +
> > +   head = &table[slot];
> > +   rcu_read_lock();
> > +   begin:
> > +   hlist_nulls_for_each_entry_rcu(obj, node, head, member) {
> > +      if (obj->key == key) {
> > +         if (!try_get_ref(obj)) // might fail for free objects
> > +            goto begin;
> > +         if (obj->key != key) { // not the object we expected
> > +            put_ref(obj);
> > +            goto begin;
> > +         }
> > +   goto out;
> > +   }
> > +   /*
> > +   * if the nulls value we got at the end of this lookup is
> > +   * not the expected one, we must restart lookup.
> > +   * We probably met an item that was moved to another chain.
> > +   */
> > +   if (get_nulls_value(node) != slot)
> > +      goto begin;
> > +   obj = NULL;
> > +
> > +   out:
> > +   rcu_read_unlock();
> > +
> > +2. Insert function
> > +------------------
> > +
> > +::
> > +
> > +   /*
> > +   * Please note that new inserts are done at the head of list,
> > +   * not in the middle or end.
> > +   */
> > +   obj = kmem_cache_alloc(cachep);
> > +   lock_chain(); // typically a spin_lock()
> > +   obj->key = key;
> > +   /*
> > +   * changes to obj->key must be visible before refcnt one
> > +   */
> > +   smp_wmb();
> > +   atomic_set(&obj->refcnt, 1);
> > +   /*
> > +   * insert obj in RCU way (readers might be traversing chain)
> > +   */
> > +   hlist_nulls_add_head_rcu(&obj->obj_node, list);
> > +   unlock_chain(); // typically a spin_unlock()
> > diff --git a/Documentation/RCU/rculist_nulls.txt
> b/Documentation/RCU/rculist_nulls.txt
> > deleted file mode 100644
> > index 23f115dc87cf..000000000000
> > --- a/Documentation/RCU/rculist_nulls.txt
> > +++ /dev/null
> > @@ -1,172 +0,0 @@
> > -Using hlist_nulls to protect read-mostly linked lists and
> > -objects using SLAB_TYPESAFE_BY_RCU allocations.
> > -
> > -Please read the basics in Documentation/RCU/listRCU.rst
> > -
> > -Using special makers (called 'nulls') is a convenient way
> > -to solve following problem :
> > -
> > -A typical RCU linked list managing objects which are
> > -allocated with SLAB_TYPESAFE_BY_RCU kmem_cache can
> > -use following algos :
> > -
> > -1) Lookup algo
> > ---------------
> > -rcu_read_lock()
> > -begin:
> > -obj = lockless_lookup(key);
> > -if (obj) {
> > -  if (!try_get_ref(obj)) // might fail for free objects
> > -    goto begin;
> > -  /*
> > -   * Because a writer could delete object, and a writer could
> > -   * reuse these object before the RCU grace period, we
> > -   * must check key after getting the reference on object
> > -   */
> > -  if (obj->key != key) { // not the object we expected
> > -     put_ref(obj);
> > -     goto begin;
> > -   }
> > -}
> > -rcu_read_unlock();
> > -
> > -Beware that lockless_lookup(key) cannot use traditional
> hlist_for_each_entry_rcu()
> > -but a version with an additional memory barrier (smp_rmb())
> > -
> > -lockless_lookup(key)
> > -{
> > -   struct hlist_node *node, *next;
> > -   for (pos = rcu_dereference((head)->first);
> > -          pos && ({ next = pos->next; smp_rmb(); prefetch(next); 1; })
> &&
> > -          ({ tpos = hlist_entry(pos, typeof(*tpos), member); 1; });
> > -          pos = rcu_dereference(next))
> > -      if (obj->key == key)
> > -         return obj;
> > -   return NULL;
> > -
> > -And note the traditional hlist_for_each_entry_rcu() misses this
> smp_rmb() :
> > -
> > -   struct hlist_node *node;
> > -   for (pos = rcu_dereference((head)->first);
> > -             pos && ({ prefetch(pos->next); 1; }) &&
> > -             ({ tpos = hlist_entry(pos, typeof(*tpos), member); 1; });
> > -             pos = rcu_dereference(pos->next))
> > -      if (obj->key == key)
> > -         return obj;
> > -   return NULL;
> > -}
> > -
> > -Quoting Corey Minyard :
> > -
> > -"If the object is moved from one list to another list in-between the
> > - time the hash is calculated and the next field is accessed, and the
> > - object has moved to the end of a new list, the traversal will not
> > - complete properly on the list it should have, since the object will
> > - be on the end of the new list and there's not a way to tell it's on a
> > - new list and restart the list traversal.  I think that this can be
> > - solved by pre-fetching the "next" field (with proper barriers) before
> > - checking the key."
> > -
> > -2) Insert algo :
> > -----------------
> > -
> > -We need to make sure a reader cannot read the new 'obj->obj_next' value
> > -and previous value of 'obj->key'. Or else, an item could be deleted
> > -from a chain, and inserted into another chain. If new chain was empty
> > -before the move, 'next' pointer is NULL, and lockless reader can
> > -not detect it missed following items in original chain.
> > -
> > -/*
> > - * Please note that new inserts are done at the head of list,
> > - * not in the middle or end.
> > - */
> > -obj = kmem_cache_alloc(...);
> > -lock_chain(); // typically a spin_lock()
> > -obj->key = key;
> > -/*
> > - * we need to make sure obj->key is updated before obj->next
> > - * or obj->refcnt
> > - */
> > -smp_wmb();
> > -atomic_set(&obj->refcnt, 1);
> > -hlist_add_head_rcu(&obj->obj_node, list);
> > -unlock_chain(); // typically a spin_unlock()
> > -
> > -
> > -3) Remove algo
> > ---------------
> > -Nothing special here, we can use a standard RCU hlist deletion.
> > -But thanks to SLAB_TYPESAFE_BY_RCU, beware a deleted object can be
> reused
> > -very very fast (before the end of RCU grace period)
> > -
> > -if (put_last_reference_on(obj) {
> > -   lock_chain(); // typically a spin_lock()
> > -   hlist_del_init_rcu(&obj->obj_node);
> > -   unlock_chain(); // typically a spin_unlock()
> > -   kmem_cache_free(cachep, obj);
> > -}
> > -
> > -
> > -
> >
> ---------------------------------------------------------------------------
> > -With hlist_nulls we can avoid extra smp_rmb() in lockless_lookup()
> > -and extra smp_wmb() in insert function.
> > -
> > -For example, if we choose to store the slot number as the 'nulls'
> > -end-of-list marker for each slot of the hash table, we can detect
> > -a race (some writer did a delete and/or a move of an object
> > -to another chain) checking the final 'nulls' value if
> > -the lookup met the end of chain. If final 'nulls' value
> > -is not the slot number, then we must restart the lookup at
> > -the beginning. If the object was moved to the same chain,
> > -then the reader doesn't care : It might eventually
> > -scan the list again without harm.
> > -
> > -
> > -1) lookup algo
> > -
> > - head = &table[slot];
> > - rcu_read_lock();
> > -begin:
> > - hlist_nulls_for_each_entry_rcu(obj, node, head, member) {
> > -   if (obj->key == key) {
> > -      if (!try_get_ref(obj)) // might fail for free objects
> > -         goto begin;
> > -      if (obj->key != key) { // not the object we expected
> > -         put_ref(obj);
> > -         goto begin;
> > -      }
> > -  goto out;
> > - }
> > -/*
> > - * if the nulls value we got at the end of this lookup is
> > - * not the expected one, we must restart lookup.
> > - * We probably met an item that was moved to another chain.
> > - */
> > - if (get_nulls_value(node) != slot)
> > -   goto begin;
> > - obj = NULL;
> > -
> > -out:
> > - rcu_read_unlock();
> > -
> > -2) Insert function :
> > ---------------------
> > -
> > -/*
> > - * Please note that new inserts are done at the head of list,
> > - * not in the middle or end.
> > - */
> > -obj = kmem_cache_alloc(cachep);
> > -lock_chain(); // typically a spin_lock()
> > -obj->key = key;
> > -/*
> > - * changes to obj->key must be visible before refcnt one
> > - */
> > -smp_wmb();
> > -atomic_set(&obj->refcnt, 1);
> > -/*
> > - * insert obj in RCU way (readers might be traversing chain)
> > - */
> > -hlist_nulls_add_head_rcu(&obj->obj_node, list);
> > -unlock_chain(); // typically a spin_unlock()
> > --
> > 2.20.1
> >
>

--000000000000d3df6a059f91bafc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sure, I will do that.=C2=A0</div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 27, 2020, 6:58 PM =
Joel Fernandes &lt;<a href=3D"mailto:joel@joelfernandes.org">joel@joelferna=
ndes.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Feb=
 27, 2020 at 04:14:46PM +0530, Aman Sharma wrote:<br>
&gt; This patch converts rculist_nulls from .txt to .rst format, and also a=
dds<br>
&gt; it to the index.rst file.<br>
<br>
When posting such patches, could you clarify what has changed during the<br=
>
conversion when you write the commit message?<br>
<br>
thanks,<br>
<br>
=C2=A0- Joel<br>
<br>
<br>
&gt; Signed-off-by: Aman Sharma &lt;<a href=3D"mailto:amanharitsh123@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">amanharitsh123@gmail.com</a>&gt;<=
br>
&gt; ---<br>
&gt;=C2=A0 Documentation/RCU/index.rst=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 Documentation/RCU/rculist_nulls.rst | 179 ++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 Documentation/RCU/rculist_nulls.txt | 172 ----------------------=
----<br>
&gt;=C2=A0 3 files changed, 180 insertions(+), 172 deletions(-)<br>
&gt;=C2=A0 create mode 100644 Documentation/RCU/rculist_nulls.rst<br>
&gt;=C2=A0 delete mode 100644 Documentation/RCU/rculist_nulls.txt<br>
&gt; <br>
&gt; diff --git a/Documentation/RCU/index.rst b/Documentation/RCU/index.rst=
<br>
&gt; index d60eb4ba2cd0..2cf55bd141b3 100644<br>
&gt; --- a/Documentation/RCU/index.rst<br>
&gt; +++ b/Documentation/RCU/index.rst<br>
&gt; @@ -10,6 +10,7 @@ RCU concepts<br>
&gt;=C2=A0 =C2=A0 =C2=A0arrayRCU<br>
&gt;=C2=A0 =C2=A0 =C2=A0rcubarrier<br>
&gt;=C2=A0 =C2=A0 =C2=A0rcu_dereference<br>
&gt; +=C2=A0 =C2=A0rculist_nulls<br>
&gt;=C2=A0 =C2=A0 =C2=A0checklist<br>
&gt;=C2=A0 =C2=A0 =C2=A0whatisRCU<br>
&gt;=C2=A0 =C2=A0 =C2=A0rcu<br>
&gt; diff --git a/Documentation/RCU/rculist_nulls.rst b/Documentation/RCU/r=
culist_nulls.rst<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..8e04de44fe3d<br>
&gt; --- /dev/null<br>
&gt; +++ b/Documentation/RCU/rculist_nulls.rst<br>
&gt; @@ -0,0 +1,179 @@<br>
&gt; +.. _rculist_nulls_doc:<br>
&gt; +<br>
&gt; +Using hlist_nulls to protect read-mostly linked lists and objects usi=
ng SLAB_TYPESAFE_BY_RCU allocations.<br>
&gt; +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +<br>
&gt; +Please read the basics in Documentation/RCU/listRCU.rst<br>
&gt; +<br>
&gt; +Using special makers (called &#39;nulls&#39;) is a convenient way<br>
&gt; +to solve following problem :<br>
&gt; +<br>
&gt; +A typical RCU linked list managing objects which are<br>
&gt; +allocated with SLAB_TYPESAFE_BY_RCU kmem_cache can<br>
&gt; +use following algos :<br>
&gt; +<br>
&gt; +1. Lookup algo<br>
&gt; +--------------<br>
&gt; +::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0rcu_read_lock()<br>
&gt; +=C2=A0 =C2=A0begin:<br>
&gt; +=C2=A0 =C2=A0obj =3D lockless_lookup(key);<br>
&gt; +=C2=A0 =C2=A0if (obj) {<br>
&gt; +=C2=A0 =C2=A0if (!try_get_ref(obj)) // might fail for free objects<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 goto begin;<br>
&gt; +=C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * Because a writer could delete object, and a wr=
iter could<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * reuse these object before the RCU grace period=
, we<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * must check key after getting the reference on =
object<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0if (obj-&gt;key !=3D key) { // not the object we expecte=
d<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 put_ref(obj);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 goto begin;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0rcu_read_unlock();<br>
&gt; +<br>
&gt; +Beware that lockless_lookup(key) cannot use traditional hlist_for_eac=
h_entry_rcu()<br>
&gt; +but a version with an additional memory barrier (smp_rmb()) ::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0lockless_lookup(key)<br>
&gt; +=C2=A0 =C2=A0{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 struct hlist_node *node, *next;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 for (pos =3D rcu_dereference((head)-&gt;first);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pos &amp;&amp; ({ next =3D =
pos-&gt;next; smp_rmb(); prefetch(next); 1; }) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ({ tpos =3D hlist_entry(pos=
, typeof(*tpos), member); 1; });<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pos =3D rcu_dereference(nex=
t))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (obj-&gt;key =3D=3D key)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return obj;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +<br>
&gt; +And note the traditional hlist_for_each_entry_rcu() misses this smp_r=
mb() ::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0struct hlist_node *node;<br>
&gt; +=C2=A0 =C2=A0for (pos =3D rcu_dereference((head)-&gt;first);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pos &amp;&amp; ({ pre=
fetch(pos-&gt;next); 1; }) &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0({ tpos =3D hlist_ent=
ry(pos, typeof(*tpos), member); 1; });<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pos =3D rcu_dereferen=
ce(pos-&gt;next))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if (obj-&gt;key =3D=3D key)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return obj;<br>
&gt; +=C2=A0 =C2=A0return NULL;<br>
&gt; +}<br>
&gt; +<br>
&gt; +Quoting Corey Minyard :<br>
&gt; +<br>
&gt; +&quot;If the object is moved from one list to another list in-between=
 the<br>
&gt; + time the hash is calculated and the next field is accessed, and the<=
br>
&gt; + object has moved to the end of a new list, the traversal will not<br=
>
&gt; + complete properly on the list it should have, since the object will<=
br>
&gt; + be on the end of the new list and there&#39;s not a way to tell it&#=
39;s on a<br>
&gt; + new list and restart the list traversal.=C2=A0 I think that this can=
 be<br>
&gt; + solved by pre-fetching the &quot;next&quot; field (with proper barri=
ers) before<br>
&gt; + checking the key.&quot;<br>
&gt; +<br>
&gt; +2. Insert algo<br>
&gt; +----------------<br>
&gt; +<br>
&gt; +We need to make sure a reader cannot read the new &#39;obj-&gt;obj_ne=
xt&#39; value<br>
&gt; +and previous value of &#39;obj-&gt;key&#39;. Or else, an item could b=
e deleted<br>
&gt; +from a chain, and inserted into another chain. If new chain was empty=
<br>
&gt; +before the move, &#39;next&#39; pointer is NULL, and lockless reader =
can<br>
&gt; +not detect it missed following items in original chain ::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0* Please note that new inserts are done at the head of l=
ist,<br>
&gt; +=C2=A0 =C2=A0* not in the middle or end.<br>
&gt; +=C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0obj =3D kmem_cache_alloc(...);<br>
&gt; +=C2=A0 =C2=A0lock_chain(); // typically a spin_lock()<br>
&gt; +=C2=A0 =C2=A0obj-&gt;key =3D key;<br>
&gt; +=C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0* we need to make sure obj-&gt;key is updated before obj=
-&gt;next<br>
&gt; +=C2=A0 =C2=A0* or obj-&gt;refcnt<br>
&gt; +=C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0smp_wmb();<br>
&gt; +=C2=A0 =C2=A0atomic_set(&amp;obj-&gt;refcnt, 1);<br>
&gt; +=C2=A0 =C2=A0hlist_add_head_rcu(&amp;obj-&gt;obj_node, list);<br>
&gt; +=C2=A0 =C2=A0unlock_chain(); // typically a spin_unlock()<br>
&gt; +<br>
&gt; +<br>
&gt; +3. Remove algo<br>
&gt; +--------------<br>
&gt; +Nothing special here, we can use a standard RCU hlist deletion.<br>
&gt; +But thanks to SLAB_TYPESAFE_BY_RCU, beware a deleted object can be re=
used<br>
&gt; +very very fast (before the end of RCU grace period) ::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0if (put_last_reference_on(obj) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 lock_chain(); // typically a spin_lock()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 hlist_del_init_rcu(&amp;obj-&gt;obj_node);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 unlock_chain(); // typically a spin_unlock()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 kmem_cache_free(cachep, obj);<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +<br>
&gt; +<br>
&gt; +With hlist_nulls we can avoid extra smp_rmb() in lockless_lookup()<br=
>
&gt; +and extra smp_wmb() in insert function.<br>
&gt; +<br>
&gt; +For example, if we choose to store the slot number as the &#39;nulls&=
#39;<br>
&gt; +end-of-list marker for each slot of the hash table, we can detect<br>
&gt; +a race (some writer did a delete and/or a move of an object<br>
&gt; +to another chain) checking the final &#39;nulls&#39; value if<br>
&gt; +the lookup met the end of chain. If final &#39;nulls&#39; value<br>
&gt; +is not the slot number, then we must restart the lookup at<br>
&gt; +the beginning. If the object was moved to the same chain,<br>
&gt; +then the reader doesn&#39;t care : It might eventually<br>
&gt; +scan the list again without harm.<br>
&gt; +<br>
&gt; +<br>
&gt; +1. lookup algo<br>
&gt; +--------------<br>
&gt; +::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0head =3D &amp;table[slot];<br>
&gt; +=C2=A0 =C2=A0rcu_read_lock();<br>
&gt; +=C2=A0 =C2=A0begin:<br>
&gt; +=C2=A0 =C2=A0hlist_nulls_for_each_entry_rcu(obj, node, head, member) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 if (obj-&gt;key =3D=3D key) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!try_get_ref(obj)) // might fai=
l for free objects<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto begin;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (obj-&gt;key !=3D key) { // not =
the object we expected<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 put_ref(obj);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto begin;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0goto out;<br>
&gt; +=C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0* if the nulls value we got at the end of this lookup is=
<br>
&gt; +=C2=A0 =C2=A0* not the expected one, we must restart lookup.<br>
&gt; +=C2=A0 =C2=A0* We probably met an item that was moved to another chai=
n.<br>
&gt; +=C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0if (get_nulls_value(node) !=3D slot)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 goto begin;<br>
&gt; +=C2=A0 =C2=A0obj =3D NULL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0out:<br>
&gt; +=C2=A0 =C2=A0rcu_read_unlock();<br>
&gt; +<br>
&gt; +2. Insert function<br>
&gt; +------------------<br>
&gt; +<br>
&gt; +::<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0* Please note that new inserts are done at the head of l=
ist,<br>
&gt; +=C2=A0 =C2=A0* not in the middle or end.<br>
&gt; +=C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0obj =3D kmem_cache_alloc(cachep);<br>
&gt; +=C2=A0 =C2=A0lock_chain(); // typically a spin_lock()<br>
&gt; +=C2=A0 =C2=A0obj-&gt;key =3D key;<br>
&gt; +=C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0* changes to obj-&gt;key must be visible before refcnt o=
ne<br>
&gt; +=C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0smp_wmb();<br>
&gt; +=C2=A0 =C2=A0atomic_set(&amp;obj-&gt;refcnt, 1);<br>
&gt; +=C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0* insert obj in RCU way (readers might be traversing cha=
in)<br>
&gt; +=C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0hlist_nulls_add_head_rcu(&amp;obj-&gt;obj_node, list);<b=
r>
&gt; +=C2=A0 =C2=A0unlock_chain(); // typically a spin_unlock()<br>
&gt; diff --git a/Documentation/RCU/rculist_nulls.txt b/Documentation/RCU/r=
culist_nulls.txt<br>
&gt; deleted file mode 100644<br>
&gt; index 23f115dc87cf..000000000000<br>
&gt; --- a/Documentation/RCU/rculist_nulls.txt<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,172 +0,0 @@<br>
&gt; -Using hlist_nulls to protect read-mostly linked lists and<br>
&gt; -objects using SLAB_TYPESAFE_BY_RCU allocations.<br>
&gt; -<br>
&gt; -Please read the basics in Documentation/RCU/listRCU.rst<br>
&gt; -<br>
&gt; -Using special makers (called &#39;nulls&#39;) is a convenient way<br>
&gt; -to solve following problem :<br>
&gt; -<br>
&gt; -A typical RCU linked list managing objects which are<br>
&gt; -allocated with SLAB_TYPESAFE_BY_RCU kmem_cache can<br>
&gt; -use following algos :<br>
&gt; -<br>
&gt; -1) Lookup algo<br>
&gt; ---------------<br>
&gt; -rcu_read_lock()<br>
&gt; -begin:<br>
&gt; -obj =3D lockless_lookup(key);<br>
&gt; -if (obj) {<br>
&gt; -=C2=A0 if (!try_get_ref(obj)) // might fail for free objects<br>
&gt; -=C2=A0 =C2=A0 goto begin;<br>
&gt; -=C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0* Because a writer could delete object, and a writer cou=
ld<br>
&gt; -=C2=A0 =C2=A0* reuse these object before the RCU grace period, we<br>
&gt; -=C2=A0 =C2=A0* must check key after getting the reference on object<b=
r>
&gt; -=C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 if (obj-&gt;key !=3D key) { // not the object we expected<br>
&gt; -=C2=A0 =C2=A0 =C2=A0put_ref(obj);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0goto begin;<br>
&gt; -=C2=A0 =C2=A0}<br>
&gt; -}<br>
&gt; -rcu_read_unlock();<br>
&gt; -<br>
&gt; -Beware that lockless_lookup(key) cannot use traditional hlist_for_eac=
h_entry_rcu()<br>
&gt; -but a version with an additional memory barrier (smp_rmb())<br>
&gt; -<br>
&gt; -lockless_lookup(key)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0struct hlist_node *node, *next;<br>
&gt; -=C2=A0 =C2=A0for (pos =3D rcu_dereference((head)-&gt;first);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pos &amp;&amp; ({ next =3D pos-&gt=
;next; smp_rmb(); prefetch(next); 1; }) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ({ tpos =3D hlist_entry(pos, typeo=
f(*tpos), member); 1; });<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pos =3D rcu_dereference(next))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 if (obj-&gt;key =3D=3D key)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return obj;<br>
&gt; -=C2=A0 =C2=A0return NULL;<br>
&gt; -<br>
&gt; -And note the traditional hlist_for_each_entry_rcu() misses this smp_r=
mb() :<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0struct hlist_node *node;<br>
&gt; -=C2=A0 =C2=A0for (pos =3D rcu_dereference((head)-&gt;first);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pos &amp;&amp; ({ pre=
fetch(pos-&gt;next); 1; }) &amp;&amp;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0({ tpos =3D hlist_ent=
ry(pos, typeof(*tpos), member); 1; });<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pos =3D rcu_dereferen=
ce(pos-&gt;next))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 if (obj-&gt;key =3D=3D key)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return obj;<br>
&gt; -=C2=A0 =C2=A0return NULL;<br>
&gt; -}<br>
&gt; -<br>
&gt; -Quoting Corey Minyard :<br>
&gt; -<br>
&gt; -&quot;If the object is moved from one list to another list in-between=
 the<br>
&gt; - time the hash is calculated and the next field is accessed, and the<=
br>
&gt; - object has moved to the end of a new list, the traversal will not<br=
>
&gt; - complete properly on the list it should have, since the object will<=
br>
&gt; - be on the end of the new list and there&#39;s not a way to tell it&#=
39;s on a<br>
&gt; - new list and restart the list traversal.=C2=A0 I think that this can=
 be<br>
&gt; - solved by pre-fetching the &quot;next&quot; field (with proper barri=
ers) before<br>
&gt; - checking the key.&quot;<br>
&gt; -<br>
&gt; -2) Insert algo :<br>
&gt; -----------------<br>
&gt; -<br>
&gt; -We need to make sure a reader cannot read the new &#39;obj-&gt;obj_ne=
xt&#39; value<br>
&gt; -and previous value of &#39;obj-&gt;key&#39;. Or else, an item could b=
e deleted<br>
&gt; -from a chain, and inserted into another chain. If new chain was empty=
<br>
&gt; -before the move, &#39;next&#39; pointer is NULL, and lockless reader =
can<br>
&gt; -not detect it missed following items in original chain.<br>
&gt; -<br>
&gt; -/*<br>
&gt; - * Please note that new inserts are done at the head of list,<br>
&gt; - * not in the middle or end.<br>
&gt; - */<br>
&gt; -obj =3D kmem_cache_alloc(...);<br>
&gt; -lock_chain(); // typically a spin_lock()<br>
&gt; -obj-&gt;key =3D key;<br>
&gt; -/*<br>
&gt; - * we need to make sure obj-&gt;key is updated before obj-&gt;next<br=
>
&gt; - * or obj-&gt;refcnt<br>
&gt; - */<br>
&gt; -smp_wmb();<br>
&gt; -atomic_set(&amp;obj-&gt;refcnt, 1);<br>
&gt; -hlist_add_head_rcu(&amp;obj-&gt;obj_node, list);<br>
&gt; -unlock_chain(); // typically a spin_unlock()<br>
&gt; -<br>
&gt; -<br>
&gt; -3) Remove algo<br>
&gt; ---------------<br>
&gt; -Nothing special here, we can use a standard RCU hlist deletion.<br>
&gt; -But thanks to SLAB_TYPESAFE_BY_RCU, beware a deleted object can be re=
used<br>
&gt; -very very fast (before the end of RCU grace period)<br>
&gt; -<br>
&gt; -if (put_last_reference_on(obj) {<br>
&gt; -=C2=A0 =C2=A0lock_chain(); // typically a spin_lock()<br>
&gt; -=C2=A0 =C2=A0hlist_del_init_rcu(&amp;obj-&gt;obj_node);<br>
&gt; -=C2=A0 =C2=A0unlock_chain(); // typically a spin_unlock()<br>
&gt; -=C2=A0 =C2=A0kmem_cache_free(cachep, obj);<br>
&gt; -}<br>
&gt; -<br>
&gt; -<br>
&gt; -<br>
&gt; ----------------------------------------------------------------------=
-----<br>
&gt; -With hlist_nulls we can avoid extra smp_rmb() in lockless_lookup()<br=
>
&gt; -and extra smp_wmb() in insert function.<br>
&gt; -<br>
&gt; -For example, if we choose to store the slot number as the &#39;nulls&=
#39;<br>
&gt; -end-of-list marker for each slot of the hash table, we can detect<br>
&gt; -a race (some writer did a delete and/or a move of an object<br>
&gt; -to another chain) checking the final &#39;nulls&#39; value if<br>
&gt; -the lookup met the end of chain. If final &#39;nulls&#39; value<br>
&gt; -is not the slot number, then we must restart the lookup at<br>
&gt; -the beginning. If the object was moved to the same chain,<br>
&gt; -then the reader doesn&#39;t care : It might eventually<br>
&gt; -scan the list again without harm.<br>
&gt; -<br>
&gt; -<br>
&gt; -1) lookup algo<br>
&gt; -<br>
&gt; - head =3D &amp;table[slot];<br>
&gt; - rcu_read_lock();<br>
&gt; -begin:<br>
&gt; - hlist_nulls_for_each_entry_rcu(obj, node, head, member) {<br>
&gt; -=C2=A0 =C2=A0if (obj-&gt;key =3D=3D key) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 if (!try_get_ref(obj)) // might fail for free ob=
jects<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto begin;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 if (obj-&gt;key !=3D key) { // not the object we=
 expected<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0put_ref(obj);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto begin;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 goto out;<br>
&gt; - }<br>
&gt; -/*<br>
&gt; - * if the nulls value we got at the end of this lookup is<br>
&gt; - * not the expected one, we must restart lookup.<br>
&gt; - * We probably met an item that was moved to another chain.<br>
&gt; - */<br>
&gt; - if (get_nulls_value(node) !=3D slot)<br>
&gt; -=C2=A0 =C2=A0goto begin;<br>
&gt; - obj =3D NULL;<br>
&gt; -<br>
&gt; -out:<br>
&gt; - rcu_read_unlock();<br>
&gt; -<br>
&gt; -2) Insert function :<br>
&gt; ---------------------<br>
&gt; -<br>
&gt; -/*<br>
&gt; - * Please note that new inserts are done at the head of list,<br>
&gt; - * not in the middle or end.<br>
&gt; - */<br>
&gt; -obj =3D kmem_cache_alloc(cachep);<br>
&gt; -lock_chain(); // typically a spin_lock()<br>
&gt; -obj-&gt;key =3D key;<br>
&gt; -/*<br>
&gt; - * changes to obj-&gt;key must be visible before refcnt one<br>
&gt; - */<br>
&gt; -smp_wmb();<br>
&gt; -atomic_set(&amp;obj-&gt;refcnt, 1);<br>
&gt; -/*<br>
&gt; - * insert obj in RCU way (readers might be traversing chain)<br>
&gt; - */<br>
&gt; -hlist_nulls_add_head_rcu(&amp;obj-&gt;obj_node, list);<br>
&gt; -unlock_chain(); // typically a spin_unlock()<br>
&gt; -- <br>
&gt; 2.20.1<br>
&gt; <br>
</blockquote></div>

--000000000000d3df6a059f91bafc--

--===============8579704578473607986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8579704578473607986==--
