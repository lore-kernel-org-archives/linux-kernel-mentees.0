Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF59FC04A68
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 27 Jul 2022 16:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BC5340136;
	Wed, 27 Jul 2022 16:21:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BC5340136
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=siddh.me header.i=code@siddh.me header.a=rsa-sha256 header.s=zmail header.b=WBiMOvQo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6gDhM_T-LOc3; Wed, 27 Jul 2022 16:21:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 43B1B40608;
	Wed, 27 Jul 2022 16:21:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43B1B40608
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E586FC0033;
	Wed, 27 Jul 2022 16:21:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F34BC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Jul 2022 16:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C093260E5B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Jul 2022 16:21:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C093260E5B
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=siddh.me header.i=code@siddh.me
 header.a=rsa-sha256 header.s=zmail header.b=WBiMOvQo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SwwS3g45Hh_x
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Jul 2022 16:21:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33F7660E4E
Received: from sender-of-o53.zoho.in (sender-of-o53.zoho.in [103.117.158.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33F7660E4E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 27 Jul 2022 16:21:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1658938862; cv=none; d=zohomail.in; s=zohoarc; 
 b=YPp9A7wZ03tp8wezdjbFc7e9zwHpNpauHaJ6PHEKXYAihY+pGlTxgXZNIVVwMzJDCqoExmkzi+bP88Vs+c84o3IveIS0vlBR9TY6ieWSSQqFIt7ItCbxLv1/8+ZNksi6lMeMPg+lLvvwSVKOziC4MwzwgqqC5bK9eHPilrNGj1I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1658938862;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=9bWNAdarOcU8borJ9QY+qCVRT1DHj4b2kF/jYpSU85c=; 
 b=WLnR68oCZhvr3LV8cR3r+pA1PahfvotNElQAGKwKistPSqtxzjgjDZuO+uSuL0Nea+ID0/WmdXNxQgb6mzCksukbuDYsRXUww3HbemDvK1iNcvR28RonnH6fwYPq8Qi633QtCoBwBKSdXeXcZTZHLxYKM3xZt3pNt9zulc/2OW0=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1658938862; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=9bWNAdarOcU8borJ9QY+qCVRT1DHj4b2kF/jYpSU85c=;
 b=WBiMOvQofgnmrlX/KDTIEWdpfV4rkfLrTG5khAOmhrYCG98rlbYRkEUNabWjw6nu
 OFttNqXLjHsqjrq7SLioHW6hhVhlA9XdS14RGv9TzPfbf9FA1BKrD7RJauVo/ezCWMM
 El4HJjMSakXH4IOQchuwITyfgJ3Cg3vVrwzdqWUQ=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 1658938852066566.1813973782993;
 Wed, 27 Jul 2022 21:50:52 +0530 (IST)
Date: Wed, 27 Jul 2022 21:50:52 +0530
To: "David Howells" <dhowells@redhat.com>
Message-ID: <182407602ce.190e58816827.7904364186178466266@siddh.me>
In-Reply-To: <3558070.1658933200@warthog.procyon.org.uk>
References: <1822b768504.1d4e377e236061.5518350412857967240@siddh.me>
 <20220723135447.199557-1-code@siddh.me> <Ytv/4Tljvlt0PJ2r@kroah.com>
 <3558070.1658933200@warthog.procyon.org.uk>
Subject: Re: [PATCH] kernel/watch_queue: Make pipe NULL while clearing
 watch_queue
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Cc: syzbot+c70d87ac1d001f29a058
 <syzbot+c70d87ac1d001f29a058@syzkaller.appspotmail.com>,
 linux-security-modules <linux-security-module@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Eric Dumazet <edumazet@google.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
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
From: Siddh Raman Pant via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Siddh Raman Pant <code@siddh.me>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, 27 Jul 2022 20:16:40 +0530  David Howells <dhowells@redhat.com> wrote:
> Siddh Raman Pant <code@siddh.me> wrote:
> 
> > Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> > > > - spin_unlock_bh(&wqueue->lock);
> > > >   rcu_read_unlock();
> > >
> > > Also you now have a spinlock held when calling rcu_read_unlock(), are
> > > you sure that's ok?
> 
> Worse, we have softirqs disabled still, which might cause problems for
> rcu_read_unlock()?
> 
> > We logically should not do write operations in a read critical section, so the
> > nulling of `wqueue->pipe->watch_queue` should happen after rcu_read_unlock().
> > Also, since we already have a spinlock, we can use it to ensure the nulling.
> > So I think it is okay.
> 
> Read/write locks are perhaps misnamed in this sense; they perhaps should be
> shared/exclusive.  But, yes, we *can* do certain write operations with the
> lock held - if we're careful.  Locks are required if we need to pairs of
> related memory accesses; if we're only making a single non-dependent write,
> then we don't necessarily need a write lock.
> 
> However, you're referring to RCU read lock.  That's a very special lock that
> has to do with maintenance of persistence of objects without taking any other
> lock.  The moment you drop that lock, anything you accessed under RCU protocol
> rules should be considered to have evaporated.
> 
> Think of it more as a way to have a deferred destructor/deallocator.
> 
> So I would do:
> 
> +
> +       /* Clearing the watch queue, so we should clean the associated pipe. */
> +       if (wqueue->pipe) {
> +               wqueue->pipe->watch_queue = NULL;
> +               wqueue->pipe = NULL;
> +       }
> +
>         spin_unlock_bh(&wqueue->lock);
>         rcu_read_unlock();
>  }
> 
> However, since you're now changing wqueue->pipe whilst a notification is being
> posted, you need a barrier in post_one_notification() to prevent the compiler
> from reloading the value:
> 
>         struct pipe_inode_info *pipe = READ_ONCE(wqueue->pipe);
> 
> David
> 

Thank you for explaining it!

I will send a v3. Should I add a Suggested-by tag mentioning you?

Thanks,
Siddh
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
