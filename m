Return-Path: <SRS0=QgwC=L2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09F10C11F6D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 11:44:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA79361413
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  2 Jul 2021 11:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA79361413
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78279402E6;
	Fri,  2 Jul 2021 11:44:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MCrPBXjxxWM2; Fri,  2 Jul 2021 11:44:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6D9754002B;
	Fri,  2 Jul 2021 11:44:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3AEFAC001D;
	Fri,  2 Jul 2021 11:44:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8DD3BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 11:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BDD960B5A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 11:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hTx8OCTMt3nN
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 11:44:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71B1A6077A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Jul 2021 11:44:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3ED5F61402;
 Fri,  2 Jul 2021 11:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625226290;
 bh=6BZPEDKAj+7kvkj991rbBYP4cz+T/5lQA2vpcgGtwcU=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=cPyRTlp20NdcAXAR+EjKnqf7Mh9jzhMAESmqRd6Ukuwh92MIeciNqVVHB3zsLbALQ
 ayKVqghJxGvQFtseUyJNu4iA5qE0EtoiBBjtBbRBnjDkXA5QGyMFpVvuYelneeRu3r
 tub4AdXgAktQRlodmqWOErWQlMi1mUUE8V3oIUYNDgNDh+Yz9mXyDn44WcsTm8dgPO
 DghL1e5W7E2SyCKa0O1SFeb5DIs2qturxcyWNEA+yXA7kVpEK5+6NyBumcUoQJkdTp
 304WLhGsKQFnaNNIEYwtO6ySYRt7dnmuQkB3WTLZNLfjnSs0LWzu9PFqCvfy8zAuHG
 JpLmk2p4XMdiA==
Message-ID: <43b5f2c7e7e5e5ed35c8e3de2eafeb960f267836.camel@kernel.org>
Subject: Re: [PATCH 1/2] fcntl: fix potential deadlocks for &fown_struct.lock
From: Jeff Layton <jlayton@kernel.org>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>, bfields@fieldses.org,
 viro@zeniv.linux.org.uk
Date: Fri, 02 Jul 2021 07:44:48 -0400
In-Reply-To: <20210702091831.615042-2-desmondcheongzx@gmail.com>
References: <20210702091831.615042-1-desmondcheongzx@gmail.com>
 <20210702091831.615042-2-desmondcheongzx@gmail.com>
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

On Fri, 2021-07-02 at 17:18 +0800, Desmond Cheong Zhi Xi wrote:
> Syzbot reports a potential deadlock in do_fcntl:
> 
> ========================================================
> WARNING: possible irq lock inversion dependency detected
> 5.12.0-syzkaller #0 Not tainted
> --------------------------------------------------------
> syz-executor132/8391 just changed the state of lock:
> ffff888015967bf8 (&f->f_owner.lock){.+..}-{2:2}, at: f_getown_ex fs/fcntl.c:211 [inline]
> ffff888015967bf8 (&f->f_owner.lock){.+..}-{2:2}, at: do_fcntl+0x8b4/0x1200 fs/fcntl.c:395
> but this lock was taken by another, HARDIRQ-safe lock in the past:
>  (&dev->event_lock){-...}-{2:2}
> 
> and interrupts could create inverse lock ordering between them.
> 
> other info that might help us debug this:
> Chain exists of:
>   &dev->event_lock --> &new->fa_lock --> &f->f_owner.lock
> 
>  Possible interrupt unsafe locking scenario:
> 
>        CPU0                    CPU1
>        ----                    ----
>   lock(&f->f_owner.lock);
>                                local_irq_disable();
>                                lock(&dev->event_lock);
>                                lock(&new->fa_lock);
>   <Interrupt>
>     lock(&dev->event_lock);
> 
>  *** DEADLOCK ***
> 
> This happens because there is a lock hierarchy of
> &dev->event_lock --> &new->fa_lock --> &f->f_owner.lock
> from the following call chain:
> 
>   input_inject_event():
>     spin_lock_irqsave(&dev->event_lock,...);
>     input_handle_event():
>       input_pass_values():
>         input_to_handler():
>           evdev_events():
>             evdev_pass_values():
>               spin_lock(&client->buffer_lock);
>               __pass_event():
>                 kill_fasync():
>                   kill_fasync_rcu():
>                     read_lock(&fa->fa_lock);
>                     send_sigio():
>                       read_lock_irqsave(&fown->lock,...);
> 
> However, since &dev->event_lock is HARDIRQ-safe, interrupts have to be
> disabled while grabbing &f->f_owner.lock, otherwise we invert the lock
> hierarchy.
> 
> Hence, we replace calls to read_lock/read_unlock on &f->f_owner.lock,
> with read_lock_irq/read_unlock_irq.
> 

Patches look reasonable overall, but why does this one use read_lock_irq
and the other one use read_lock_irqsave? Don't we need to *_irqsasve in
both patches?


> Reported-and-tested-by: syzbot+e6d5398a02c516ce5e70@syzkaller.appspotmail.com
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---
>  fs/fcntl.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/fcntl.c b/fs/fcntl.c
> index dfc72f15be7f..cf9e81dfa615 100644
> --- a/fs/fcntl.c
> +++ b/fs/fcntl.c
> @@ -150,7 +150,8 @@ void f_delown(struct file *filp)
>  pid_t f_getown(struct file *filp)
>  {
>  	pid_t pid = 0;
> -	read_lock(&filp->f_owner.lock);
> +
> +	read_lock_irq(&filp->f_owner.lock);
>  	rcu_read_lock();
>  	if (pid_task(filp->f_owner.pid, filp->f_owner.pid_type)) {
>  		pid = pid_vnr(filp->f_owner.pid);
> @@ -158,7 +159,7 @@ pid_t f_getown(struct file *filp)
>  			pid = -pid;
>  	}
>  	rcu_read_unlock();
> -	read_unlock(&filp->f_owner.lock);
> +	read_unlock_irq(&filp->f_owner.lock);
>  	return pid;
>  }
>  
> @@ -208,7 +209,7 @@ static int f_getown_ex(struct file *filp, unsigned long arg)
>  	struct f_owner_ex owner = {};
>  	int ret = 0;
>  
> -	read_lock(&filp->f_owner.lock);
> +	read_lock_irq(&filp->f_owner.lock);
>  	rcu_read_lock();
>  	if (pid_task(filp->f_owner.pid, filp->f_owner.pid_type))
>  		owner.pid = pid_vnr(filp->f_owner.pid);
> @@ -231,7 +232,7 @@ static int f_getown_ex(struct file *filp, unsigned long arg)
>  		ret = -EINVAL;
>  		break;
>  	}
> -	read_unlock(&filp->f_owner.lock);
> +	read_unlock_irq(&filp->f_owner.lock);
>  
>  	if (!ret) {
>  		ret = copy_to_user(owner_p, &owner, sizeof(owner));
> @@ -249,10 +250,10 @@ static int f_getowner_uids(struct file *filp, unsigned long arg)
>  	uid_t src[2];
>  	int err;
>  
> -	read_lock(&filp->f_owner.lock);
> +	read_lock_irq(&filp->f_owner.lock);
>  	src[0] = from_kuid(user_ns, filp->f_owner.uid);
>  	src[1] = from_kuid(user_ns, filp->f_owner.euid);
> -	read_unlock(&filp->f_owner.lock);
> +	read_unlock_irq(&filp->f_owner.lock);
>  
>  	err  = put_user(src[0], &dst[0]);
>  	err |= put_user(src[1], &dst[1]);

-- 
Jeff Layton <jlayton@kernel.org>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
