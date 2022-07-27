Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6E5DC19F28
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Jul 2022 14:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AF40823CF;
	Wed, 27 Jul 2022 14:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AF40823CF
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NsLRq+hP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-IdN4-FGypH; Wed, 27 Jul 2022 14:46:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 36E4782456;
	Wed, 27 Jul 2022 14:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36E4782456
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED122C0033;
	Wed, 27 Jul 2022 14:46:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D507C002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Jul 2022 14:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2564C40393
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Jul 2022 14:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2564C40393
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=NsLRq+hP
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xUiPM4CpnvnR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Jul 2022 14:46:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B524B4013D
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B524B4013D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Jul 2022 14:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658933209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xuFpOaXJaj/gAOk0ci5YpbcXaLPN1T4Ab/tSiyAfQzA=;
 b=NsLRq+hPbp+tWiBi5UbayTFT8IJpJ5LoFT9uRIpMrjEVii7V00TXxxEvoY852pZjVfIJ/5
 Fu0enjD1GQLMdp/W57gGahlEaoRif/5VBNW6ddYEgASleq6cfU1+UzE6RC5p21VlEN8NIX
 tPwEd3rVZ+ltcjlnwOe15dBBbaQEHms=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-zjaeplmAPJ668snlUMnWUQ-1; Wed, 27 Jul 2022 10:46:42 -0400
X-MC-Unique: zjaeplmAPJ668snlUMnWUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FA543C10222;
 Wed, 27 Jul 2022 14:46:42 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E06FA1415121;
 Wed, 27 Jul 2022 14:46:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <1822b768504.1d4e377e236061.5518350412857967240@siddh.me>
References: <1822b768504.1d4e377e236061.5518350412857967240@siddh.me>
 <20220723135447.199557-1-code@siddh.me> <Ytv/4Tljvlt0PJ2r@kroah.com>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
MIME-Version: 1.0
Content-ID: <3558069.1658933200.1@warthog.procyon.org.uk>
Date: Wed, 27 Jul 2022 15:46:40 +0100
Message-ID: <3558070.1658933200@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Cc: syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 linux-security-modules <linux-security-module@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, dhowells@redhat.com,
 Eric Dumazet <edumazet@google.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "Fabio
 M. De Francesco" <fmdefrancesco@gmail.com>,
 linux-kernel-mentees <linux-kernel-mentees@lists.linuxfoundation.org>
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

Siddh Raman Pant <code@siddh.me> wrote:

> Greg KH <gregkh@linuxfoundation.org> wrote:

> > > -	spin_unlock_bh(&wqueue->lock);
> > >  	rcu_read_unlock();
> >
> > Also you now have a spinlock held when calling rcu_read_unlock(), are
> > you sure that's ok?

Worse, we have softirqs disabled still, which might cause problems for
rcu_read_unlock()?

> We logically should not do write operations in a read critical section, so the
> nulling of `wqueue->pipe->watch_queue` should happen after rcu_read_unlock().
> Also, since we already have a spinlock, we can use it to ensure the nulling.
> So I think it is okay.

Read/write locks are perhaps misnamed in this sense; they perhaps should be
shared/exclusive.  But, yes, we *can* do certain write operations with the
lock held - if we're careful.  Locks are required if we need to pairs of
related memory accesses; if we're only making a single non-dependent write,
then we don't necessarily need a write lock.

However, you're referring to RCU read lock.  That's a very special lock that
has to do with maintenance of persistence of objects without taking any other
lock.  The moment you drop that lock, anything you accessed under RCU protocol
rules should be considered to have evaporated.

Think of it more as a way to have a deferred destructor/deallocator.

So I would do:

+
+	/* Clearing the watch queue, so we should clean the associated pipe. */
+	if (wqueue->pipe) {
+		wqueue->pipe->watch_queue = NULL;
+		wqueue->pipe = NULL;
+	}
+
	spin_unlock_bh(&wqueue->lock);
 	rcu_read_unlock();
 }

However, since you're now changing wqueue->pipe whilst a notification is being
posted, you need a barrier in post_one_notification() to prevent the compiler
from reloading the value:

	struct pipe_inode_info *pipe = READ_ONCE(wqueue->pipe);

David

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
