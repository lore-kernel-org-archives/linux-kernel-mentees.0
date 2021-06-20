Return-Path: <SRS0=+n2V=LO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41E57C2B9F4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Jun 2021 02:46:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6BB3611CE
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 20 Jun 2021 02:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6BB3611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68338404E9;
	Sun, 20 Jun 2021 02:46:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VzDRsomVP6m1; Sun, 20 Jun 2021 02:46:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 49B77404DD;
	Sun, 20 Jun 2021 02:46:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24F1DC000E;
	Sun, 20 Jun 2021 02:46:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88F2FC000C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 02:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77FEA839BD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 02:46:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MVZZvYY9Tu3D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 02:46:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail3-165.sinamail.sina.com.cn (mail3-165.sinamail.sina.com.cn
 [202.108.3.165])
 by smtp1.osuosl.org (Postfix) with SMTP id C8C0C8394A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Jun 2021 02:46:41 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([123.115.166.128])
 by sina.com (172.16.97.32) with ESMTP
 id 60CEAB7C00032F08; Sun, 20 Jun 2021 10:44:14 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 847391628823
From: Hillf Danton <hdanton@sina.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH v2] block: genhd: don't call probe function with
 major_names_lock held
Date: Sun, 20 Jun 2021 10:44:03 +0800
Message-Id: <20210620024403.820-1-hdanton@sina.com>
In-Reply-To: <c4edf07f-92e1-a350-2743-f0b0234a2b6c@i-love.sakura.ne.jp>
References: <f790f8fb-5758-ea4e-a527-0ee4af82dd44@i-love.sakura.ne.jp>
 <YM2STfTN5AupWlSa@kroah.com>
MIME-Version: 1.0
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, vigneshr@ti.com,
 syzbot+6a8a0d93c91e8fbf2e80@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, hch@infradead.org, richard@nod.at,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 desmondcheongzx@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
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

On Sat, 19 Jun 2021 17:47:30 +0900 Tetsuo Handa wrote:
>On 2021/06/19 15:44, Greg KH wrote:
>>> Note that regardless of this patch, it is up to probe function to
>>> serialize module's __init function and probe function in that module
>>> by using e.g. a mutex. This patch simply makes sure that module's __exit
>>> function won't be called when probe function is about to be called.
>> 
>> module init functions ARE serialized.
>
>The __init functions between module foo and module bar are serialized.
>But the __init function for module foo and the probe function for module
>foo are not serialized.
>
>> The module owner should not matter here.
>
>The __exit functions between module foo and module bar are serialized.
>But the __exit function for module bar and the probe function for module
>bar are not serialized.
>
>You can observe a deadlock via the following steps.
>
>(1) Build loop.ko with CONFIG_BLK_DEV_LOOP_MIN_COUNT=0 and
>    a delay injection patch shown below.
>
>----------
>diff --git a/block/genhd.c b/block/genhd.c
>index 9f8cb7beaad1..fe0360dc8c5d 100644
>--- a/block/genhd.c
>+++ b/block/genhd.c
>@@ -680,6 +680,11 @@ void blk_request_module(dev_t devt)
> 	mutex_lock(&major_names_lock);
> 	for (n = &major_names[major_to_index(major)]; *n; n = &(*n)->next) {
> 		if ((*n)->major == major && (*n)->probe) {
>+			if (!strcmp(current->comm, "bash")) {
>+				pr_info("sleep injection start\n");
>+				schedule_timeout_killable(10 * HZ); // Call "rmmod" here.
>+				pr_info("sleep injection end\n");
>+			}
> 			(*n)->probe(devt);
> 			mutex_unlock(&major_names_lock);
> 			return;
>----------
>
>(2) Run the following commands from bash shell.
>
># modprobe loop
># mknod /dev/loop0 b 7 0
># exec 100<>/dev/loop0 & sleep 1; rmmod loop
>
>(3) See dmesg output.
>
>----------
>[   32.260467][ T2873] loop: module loaded
>[   32.289961][ T2880] sleep injection start
>[   42.484039][ T2880] sleep injection end
>[   42.484218][ T2880]
>[   42.484248][ T2880] ======================================================
>[   42.484381][ T2880] WARNING: possible circular locking dependency detected
>[   42.484455][ T2880] 5.13.0-rc6+ #867 Not tainted
>[   42.484508][ T2880] ------------------------------------------------------
>[   42.484579][ T2880] bash/2880 is trying to acquire lock:
>[   42.484638][ T2880] ffffffffc075b468 (loop_ctl_mutex){+.+.}-{3:3}, at: loop_probe+0x44/0x90 [loop]
>[   42.484760][ T2880]
>[   42.484760][ T2880] but task is already holding lock:
>[   42.484836][ T2880] ffffffff873ffe28 (major_names_lock){+.+.}-{3:3}, at: blk_request_module+0x1f/0x100
>[   42.484950][ T2880]
>[   42.484950][ T2880] which lock already depends on the new lock.
>[   42.484950][ T2880]
>[   42.485053][ T2880]
>[   42.485053][ T2880] the existing dependency chain (in reverse order) is:
>[   42.485144][ T2880]
>[   42.485144][ T2880] -> #1 (major_names_lock){+.+.}-{3:3}:
>[   42.485230][ T2880]        lock_acquire+0xb3/0x380
>[   42.485292][ T2880]        __mutex_lock+0x89/0x8f0
>[   42.485350][ T2880]        mutex_lock_nested+0x16/0x20
>[   42.485410][ T2880]        unregister_blkdev+0x38/0xb0
>[   42.485469][ T2880]        loop_exit+0x44/0xd84 [loop]

Good craft in regard to triggering the ABBA deadlock, but curious why not
move unregister_blkdev out of and before loop_ctl_mutex, given it will also
serialise with the prober.

>[   42.485534][ T2880]        __x64_sys_delete_module+0x135/0x210
>[   42.485602][ T2880]        do_syscall_64+0x36/0x70
>[   42.485660][ T2880]        entry_SYSCALL_64_after_hwframe+0x44/0xae
>[   42.485733][ T2880]
>[   42.485733][ T2880] -> #0 (loop_ctl_mutex){+.+.}-{3:3}:
>[   42.485817][ T2880]        check_prevs_add+0x16a/0x1040
>[   42.487091][ T2880]        __lock_acquire+0x118b/0x1580
>[   42.488427][ T2880]        lock_acquire+0xb3/0x380
>[   42.489701][ T2880]        __mutex_lock+0x89/0x8f0
>[   42.490960][ T2880]        mutex_lock_nested+0x16/0x20
>[   42.492374][ T2880]        loop_probe+0x44/0x90 [loop]
>[   42.493756][ T2880]        blk_request_module+0xa3/0x100
>[   42.495207][ T2880]        blkdev_get_no_open+0x93/0xc0
>[   42.496516][ T2880]        blkdev_get_by_dev+0x56/0x200
>[   42.497735][ T2880]        blkdev_open+0x5d/0xa0
>[   42.498919][ T2880]        do_dentry_open+0x163/0x3b0
>[   42.500157][ T2880]        vfs_open+0x28/0x30
>[   42.501312][ T2880]        path_openat+0x7e6/0xad0
>[   42.502443][ T2880]        do_filp_open+0x9f/0x110
>[   42.503592][ T2880]        do_sys_openat2+0x245/0x310
>[   42.504647][ T2880]        do_sys_open+0x48/0x80
>[   42.505689][ T2880]        __x64_sys_open+0x1c/0x20
>[   42.506730][ T2880]        do_syscall_64+0x36/0x70
>[   42.507795][ T2880]        entry_SYSCALL_64_after_hwframe+0x44/0xae
>[   42.508890][ T2880]
>[   42.508890][ T2880] other info that might help us debug this:
>[   42.508890][ T2880]
>[   42.511436][ T2880]  Possible unsafe locking scenario:
>[   42.511436][ T2880]
>[   42.512303][ T2880]        CPU0                    CPU1
>[   42.512727][ T2880]        ----                    ----
>[   42.513143][ T2880]   lock(major_names_lock);
>[   42.513557][ T2880]                                lock(loop_ctl_mutex);
>[   42.513987][ T2880]                                lock(major_names_lock);
>[   42.514417][ T2880]   lock(loop_ctl_mutex);
>[   42.514841][ T2880]
>[   42.514841][ T2880]  *** DEADLOCK ***
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
