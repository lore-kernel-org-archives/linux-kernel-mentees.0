Return-Path: <SRS0=QgwC=L2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF6CC11F6A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 14:28:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 456106142B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 14:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 456106142B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15B3983C04;
	Fri,  2 Jul 2021 14:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PqbwYX7DmsfD; Fri,  2 Jul 2021 14:28:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2D2EC83AEF;
	Fri,  2 Jul 2021 14:28:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03B0FC0010;
	Fri,  2 Jul 2021 14:28:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7320BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 14:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 627B060BA3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 14:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SXkAmEESLD8c
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 14:27:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AADAC60BA0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 14:27:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 945FD613CB;
 Fri,  2 Jul 2021 14:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625236078;
 bh=Pw2UjijmxArvxnQj8gvYfuXvf9j1wSJL58c++Z0g7RE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=J4jzySVKwZRSIcvupASpyfKKgud4m9ZwNXSNJ9/1k2/XR3HrcW0J23zQDtecbe1xf
 sNU9zAnxmCkRyLQ3nPpCYOqcXyrhfq3WBsHM91zs3xqEfTpURv2v9mHgGJRoIDDlnx
 VKWpFw5JWyFEzDP/AxDJxMV0xtdwiI45RwZToIpS5Ne8Ih4DKypD5HydBkH8OhG9lJ
 vHXC5ID5B4/qCvEtI60oJaJYrjxcO4YlOqfGUbS49I2prlbWy3dqCuuIa78k34NwkW
 aDGkm+7eXnB6p6jkFDcHuMWqTQBCt5XalGdxHenTeSWZSxBt3Z/NmvCod5tdaEvFcn
 WmVK+Dnjxzbsw==
Message-ID: <47d655dba51cd7d3cf3011f30f42bf7120c656db.camel@kernel.org>
Subject: Re: [PATCH 1/2] fcntl: fix potential deadlocks for &fown_struct.lock
From: Jeff Layton <jlayton@kernel.org>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>, bfields@fieldses.org,
 viro@zeniv.linux.org.uk
Date: Fri, 02 Jul 2021 10:27:56 -0400
In-Reply-To: <9e2a46b9-5735-d73b-d35e-f88dc994f6b4@gmail.com>
References: <20210702091831.615042-1-desmondcheongzx@gmail.com>
 <20210702091831.615042-2-desmondcheongzx@gmail.com>
 <43b5f2c7e7e5e5ed35c8e3de2eafeb960f267836.camel@kernel.org>
 <9e2a46b9-5735-d73b-d35e-f88dc994f6b4@gmail.com>
User-Agent: Evolution 3.40.2 (3.40.2-1.fc34) 
MIME-Version: 1.0
Cc: syzbot+e6d5398a02c516ce5e70@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On Fri, 2021-07-02 at 21:55 +0800, Desmond Cheong Zhi Xi wrote:
> On 2/7/21 7:44 pm, Jeff Layton wrote:
> > On Fri, 2021-07-02 at 17:18 +0800, Desmond Cheong Zhi Xi wrote:
> > > Syzbot reports a potential deadlock in do_fcntl:
> > > 
> > > ========================================================
> > > WARNING: possible irq lock inversion dependency detected
> > > 5.12.0-syzkaller #0 Not tainted
> > > --------------------------------------------------------
> > > syz-executor132/8391 just changed the state of lock:
> > > ffff888015967bf8 (&f->f_owner.lock){.+..}-{2:2}, at: f_getown_ex fs/fcntl.c:211 [inline]
> > > ffff888015967bf8 (&f->f_owner.lock){.+..}-{2:2}, at: do_fcntl+0x8b4/0x1200 fs/fcntl.c:395
> > > but this lock was taken by another, HARDIRQ-safe lock in the past:
> > >   (&dev->event_lock){-...}-{2:2}
> > > 
> > > and interrupts could create inverse lock ordering between them.
> > > 
> > > other info that might help us debug this:
> > > Chain exists of:
> > >    &dev->event_lock --> &new->fa_lock --> &f->f_owner.lock
> > > 
> > >   Possible interrupt unsafe locking scenario:
> > > 
> > >         CPU0                    CPU1
> > >         ----                    ----
> > >    lock(&f->f_owner.lock);
> > >                                 local_irq_disable();
> > >                                 lock(&dev->event_lock);
> > >                                 lock(&new->fa_lock);
> > >    <Interrupt>
> > >      lock(&dev->event_lock);
> > > 
> > >   *** DEADLOCK ***
> > > 
> > > This happens because there is a lock hierarchy of
> > > &dev->event_lock --> &new->fa_lock --> &f->f_owner.lock
> > > from the following call chain:
> > > 
> > >    input_inject_event():
> > >      spin_lock_irqsave(&dev->event_lock,...);
> > >      input_handle_event():
> > >        input_pass_values():
> > >          input_to_handler():
> > >            evdev_events():
> > >              evdev_pass_values():
> > >                spin_lock(&client->buffer_lock);
> > >                __pass_event():
> > >                  kill_fasync():
> > >                    kill_fasync_rcu():
> > >                      read_lock(&fa->fa_lock);
> > >                      send_sigio():
> > >                        read_lock_irqsave(&fown->lock,...);
> > > 
> > > However, since &dev->event_lock is HARDIRQ-safe, interrupts have to be
> > > disabled while grabbing &f->f_owner.lock, otherwise we invert the lock
> > > hierarchy.
> > > 
> > > Hence, we replace calls to read_lock/read_unlock on &f->f_owner.lock,
> > > with read_lock_irq/read_unlock_irq.
> > > 
> > 
> > Patches look reasonable overall, but why does this one use read_lock_irq
> > and the other one use read_lock_irqsave? Don't we need to *_irqsasve in
> > both patches?
> > 
> > 
> 
> My thinking was that the functions f_getown_ex and f_getowner_uids are 
> only called from do_fcntl, and f_getown is only called from do_fnctl and 
> sock_ioctl. do_fnctl itself is only called from syscalls.
> 
> For sock_ioctl, the chain is
>    compat_sock_ioctl():
>      compat_sock_ioctl_trans():
>        sock_ioctl()
> 
> For both paths, it doesn't seem that interrupts are disabled, so I used 
> the *irq variants.
> 
> But of course, I might be very mistaken on this, and I'd be happy to 
> make the change to *_irqsave.
> 
> Also, on further inspection, if these calls should be changed to 
> *_irqsave, then I believe the call to write_lock_irq in f_modown (called 
> from do_fcntl() --> f_setown() --> __f_setown() --> f_modown()) should 
> also be changed to *_irqsave.
> 
> There's also a call to write_lock_irq(&fa->fa_lock) in 
> fasync_remove_entry and fasync_insert_entry. Whether these should be 
> changed as well isn't as clear to me, but since it's safe to do, perhaps 
> it makes sense to use *_irqsave for them too. Thoughts?
> 


I think your reasoning is probably valid here and we don't need to
save/restore. It wasn't obvious to me until you pointed it out though.
It might be worth a comment, or maybe even this at the top of both
functions:

    WARN_ON_ONCE(irqs_disabled());

I'll pick these into linux-next soon and plan to merge them for v5.15.
Let me know if you think they need to go in sooner.


> > > Reported-and-tested-by: syzbot+e6d5398a02c516ce5e70@syzkaller.appspotmail.com
> > > Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> > > ---
> > >   fs/fcntl.c | 13 +++++++------
> > >   1 file changed, 7 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/fs/fcntl.c b/fs/fcntl.c
> > > index dfc72f15be7f..cf9e81dfa615 100644
> > > --- a/fs/fcntl.c
> > > +++ b/fs/fcntl.c
> > > @@ -150,7 +150,8 @@ void f_delown(struct file *filp)
> > >   pid_t f_getown(struct file *filp)
> > >   {
> > >   	pid_t pid = 0;
> > > -	read_lock(&filp->f_owner.lock);
> > > +
> > > +	read_lock_irq(&filp->f_owner.lock);
> > >   	rcu_read_lock();
> > >   	if (pid_task(filp->f_owner.pid, filp->f_owner.pid_type)) {
> > >   		pid = pid_vnr(filp->f_owner.pid);
> > > @@ -158,7 +159,7 @@ pid_t f_getown(struct file *filp)
> > >   			pid = -pid;
> > >   	}
> > >   	rcu_read_unlock();
> > > -	read_unlock(&filp->f_owner.lock);
> > > +	read_unlock_irq(&filp->f_owner.lock);
> > >   	return pid;
> > >   }
> > >   
> > > @@ -208,7 +209,7 @@ static int f_getown_ex(struct file *filp, unsigned long arg)
> > >   	struct f_owner_ex owner = {};
> > >   	int ret = 0;
> > >   
> > > -	read_lock(&filp->f_owner.lock);
> > > +	read_lock_irq(&filp->f_owner.lock);
> > >   	rcu_read_lock();
> > >   	if (pid_task(filp->f_owner.pid, filp->f_owner.pid_type))
> > >   		owner.pid = pid_vnr(filp->f_owner.pid);
> > > @@ -231,7 +232,7 @@ static int f_getown_ex(struct file *filp, unsigned long arg)
> > >   		ret = -EINVAL;
> > >   		break;
> > >   	}
> > > -	read_unlock(&filp->f_owner.lock);
> > > +	read_unlock_irq(&filp->f_owner.lock);
> > >   
> > >   	if (!ret) {
> > >   		ret = copy_to_user(owner_p, &owner, sizeof(owner));
> > > @@ -249,10 +250,10 @@ static int f_getowner_uids(struct file *filp, unsigned long arg)
> > >   	uid_t src[2];
> > >   	int err;
> > >   
> > > -	read_lock(&filp->f_owner.lock);
> > > +	read_lock_irq(&filp->f_owner.lock);
> > >   	src[0] = from_kuid(user_ns, filp->f_owner.uid);
> > >   	src[1] = from_kuid(user_ns, filp->f_owner.euid);
> > > -	read_unlock(&filp->f_owner.lock);
> > > +	read_unlock_irq(&filp->f_owner.lock);
> > >   
> > >   	err  = put_user(src[0], &dst[0]);
> > >   	err |= put_user(src[1], &dst[1]);
> > 
> 

-- 
Jeff Layton <jlayton@kernel.org>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
