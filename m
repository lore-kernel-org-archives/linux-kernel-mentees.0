Return-Path: <SRS0=WoZ7=NO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D588DC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Aug 2021 11:59:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AEE36127B
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 23 Aug 2021 11:59:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AEE36127B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EB4840147;
	Mon, 23 Aug 2021 11:59:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jxlIq1ToK60S; Mon, 23 Aug 2021 11:59:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 386DA40015;
	Mon, 23 Aug 2021 11:59:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 06527C001A;
	Mon, 23 Aug 2021 11:59:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63380C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 11:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49A8140132
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 11:59:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFSGdsV8C9RQ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 11:59:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9F8C40015
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 23 Aug 2021 11:59:40 +0000 (UTC)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id CCA551FFA3;
 Mon, 23 Aug 2021 11:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629719977;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BESaVzWySM8MXkEGouzerEshPVrP3HKXPu/uHXkrhwI=;
 b=kHGZLtTY+Gs7Oj1qVf070uaKICe8JgaEHS9j2CCnv9GKbtG8HGfju0hJoPKd+5urA8UOEO
 ILJvqK2rFKtTnG7OrX1EiNb15YqEKpK83cQP1mjrWbvYrqVqENi8fVVbchWUpnF+hn2a8V
 hoCBFyWXq8IsaJON2R5c+v0w0hm7ge4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629719977;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BESaVzWySM8MXkEGouzerEshPVrP3HKXPu/uHXkrhwI=;
 b=pR2Lrg+KcYA6OfPtqtcUdoYpi3/SpQBeZu6LdJQURQqar8N95INkQJ9wyFCH1ZVVHUMUtG
 c/RGgRuTBaR8ECAQ==
Received: from ds.suse.cz (ds.suse.cz [10.100.12.205])
 by relay2.suse.de (Postfix) with ESMTP id BBA8EA3BB2;
 Mon, 23 Aug 2021 11:59:37 +0000 (UTC)
Received: by ds.suse.cz (Postfix, from userid 10065)
 id 7B224DA725; Mon, 23 Aug 2021 13:56:38 +0200 (CEST)
Date: Mon, 23 Aug 2021 13:56:38 +0200
From: David Sterba <dsterba@suse.cz>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Subject: Re: [PATCH] btrfs: reset replace target device to allocation state
 on close
Message-ID: <20210823115638.GY5047@twin.jikos.cz>
Mail-Followup-To: dsterba@suse.cz,
 Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>, clm@fb.com,
 josef@toxicpanda.com, dsterba@suse.com, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 gregkh@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20210820175040.586806-1-desmondcheongzx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210820175040.586806-1-desmondcheongzx@gmail.com>
User-Agent: Mutt/1.5.23.1-rc1 (2014-03-12)
Cc: josef@toxicpanda.com, linux-kernel@vger.kernel.org, clm@fb.com,
 dsterba@suse.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-btrfs@vger.kernel.org
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
Reply-To: dsterba@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, Aug 21, 2021 at 01:50:40AM +0800, Desmond Cheong Zhi Xi wrote:
> This crash was observed with a failed assertion on device close:
> 
>   BTRFS: Transaction aborted (error -28)
>   WARNING: CPU: 1 PID: 3902 at fs/btrfs/extent-tree.c:2150 btrfs_run_delayed_refs+0x1d2/0x1e0 [btrfs]
>   Modules linked in: btrfs blake2b_generic libcrc32c crc32c_intel xor zstd_decompress zstd_compress xxhash lzo_compress lzo_decompress raid6_pq loop
>   CPU: 1 PID: 3902 Comm: kworker/u8:4 Not tainted 5.14.0-rc5-default+ #1532
>   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.0-59-gc9ba527-rebuilt.opensuse.org 04/01/2014
>   Workqueue: events_unbound btrfs_async_reclaim_metadata_space [btrfs]
>   RIP: 0010:btrfs_run_delayed_refs+0x1d2/0x1e0 [btrfs]
>   RSP: 0018:ffffb7a5452d7d80 EFLAGS: 00010282
>   RAX: 0000000000000000 RBX: 0000000000000003 RCX: 0000000000000000
>   RDX: 0000000000000001 RSI: ffffffffabee13c4 RDI: 00000000ffffffff
>   RBP: ffff97834176a378 R08: 0000000000000001 R09: 0000000000000001
>   R10: 0000000000000000 R11: 0000000000000001 R12: ffff97835195d388
>   R13: 0000000005b08000 R14: ffff978385484000 R15: 000000000000016c
>   FS:  0000000000000000(0000) GS:ffff9783bd800000(0000) knlGS:0000000000000000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: 000056190d003fe8 CR3: 000000002a81e005 CR4: 0000000000170ea0
>   Call Trace:
>    flush_space+0x197/0x2f0 [btrfs]
>    btrfs_async_reclaim_metadata_space+0x139/0x300 [btrfs]
>    process_one_work+0x262/0x5e0
>    worker_thread+0x4c/0x320
>    ? process_one_work+0x5e0/0x5e0
>    kthread+0x144/0x170
>    ? set_kthread_struct+0x40/0x40
>    ret_from_fork+0x1f/0x30
>   irq event stamp: 19334989
>   hardirqs last  enabled at (19334997): [<ffffffffab0e0c87>] console_unlock+0x2b7/0x400
>   hardirqs last disabled at (19335006): [<ffffffffab0e0d0d>] console_unlock+0x33d/0x400
>   softirqs last  enabled at (19334900): [<ffffffffaba0030d>] __do_softirq+0x30d/0x574
>   softirqs last disabled at (19334893): [<ffffffffab0721ec>] irq_exit_rcu+0x12c/0x140
>   ---[ end trace 45939e308e0dd3c7 ]---
>   BTRFS: error (device vdd) in btrfs_run_delayed_refs:2150: errno=-28 No space left
>   BTRFS info (device vdd): forced readonly
>   BTRFS warning (device vdd): failed setting block group ro: -30
>   BTRFS info (device vdd): suspending dev_replace for unmount
>   assertion failed: !test_bit(BTRFS_DEV_STATE_REPLACE_TGT, &device->dev_state), in fs/btrfs/volumes.c:1150
>   ------------[ cut here ]------------
>   kernel BUG at fs/btrfs/ctree.h:3431!
>   invalid opcode: 0000 [#1] PREEMPT SMP
>   CPU: 1 PID: 3982 Comm: umount Tainted: G        W         5.14.0-rc5-default+ #1532
>   Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.12.0-59-gc9ba527-rebuilt.opensuse.org 04/01/2014
>   RIP: 0010:assertfail.constprop.0+0x18/0x1a [btrfs]
>   RSP: 0018:ffffb7a5454c7db8 EFLAGS: 00010246
>   RAX: 0000000000000068 RBX: ffff978364b91c00 RCX: 0000000000000000
>   RDX: 0000000000000000 RSI: ffffffffabee13c4 RDI: 00000000ffffffff
>   RBP: ffff9783523a4c00 R08: 0000000000000001 R09: 0000000000000001
>   R10: 0000000000000000 R11: 0000000000000001 R12: ffff9783523a4d18
>   R13: 0000000000000000 R14: 0000000000000004 R15: 0000000000000003
>   FS:  00007f61c8f42800(0000) GS:ffff9783bd800000(0000) knlGS:0000000000000000
>   CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>   CR2: 000056190cffa810 CR3: 0000000030b96002 CR4: 0000000000170ea0
>   Call Trace:
>    btrfs_close_one_device.cold+0x11/0x55 [btrfs]
>    close_fs_devices+0x44/0xb0 [btrfs]
>    btrfs_close_devices+0x48/0x160 [btrfs]
>    generic_shutdown_super+0x69/0x100
>    kill_anon_super+0x14/0x30
>    btrfs_kill_super+0x12/0x20 [btrfs]
>    deactivate_locked_super+0x2c/0xa0
>    cleanup_mnt+0x144/0x1b0
>    task_work_run+0x59/0xa0
>    exit_to_user_mode_loop+0xe7/0xf0
>    exit_to_user_mode_prepare+0xaf/0xf0
>    syscall_exit_to_user_mode+0x19/0x50
>    do_syscall_64+0x4a/0x90
>    entry_SYSCALL_64_after_hwframe+0x44/0xae
> 
> This happens when close_ctree is called while a dev_replace hasn't
> completed. In close_ctree, we suspend the dev_replace, but keep the
> replace target around so that we can resume the dev_replace procedure
> when we mount the root again. This is the call trace:
> 
>   close_ctree():
>     btrfs_dev_replace_suspend_for_unmount();
>     btrfs_close_devices():
>       btrfs_close_fs_devices():
>         btrfs_close_one_device():
>           ASSERT(!test_bit(BTRFS_DEV_STATE_REPLACE_TGT,
>                  &device->dev_state));
> 
> However, since the replace target sticks around, there is a device
> with BTRFS_DEV_STATE_REPLACE_TGT set on close, and we fail the
> assertion in btrfs_close_one_device.
> 
> To fix this, if we come across the replace target device when
> closing, we should properly reset it back to allocation state. This
> fix also ensures that if a non-target device has a corrupted state and
> has the BTRFS_DEV_STATE_REPLACE_TGT bit set, the assertion will still
> catch the error.
> 
> Reported-by: David Sterba <dsterba@suse.com>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>

Thanks, added to misc-next.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
