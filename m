Return-Path: <SRS0=/NdJ=M2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E42D4C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 14:14:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81A0260560
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 14:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81A0260560
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 541D8402DA;
	Tue,  3 Aug 2021 14:14:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uA0chF0ibNcx; Tue,  3 Aug 2021 14:13:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id EC796400F2;
	Tue,  3 Aug 2021 14:13:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE3A0C001A;
	Tue,  3 Aug 2021 14:13:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73449C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69001404A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id djcqoVTBXmTa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:13:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CAF14049D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:13:54 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id x192so34171940ybe.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 07:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l207URFYNLc46RjCwnT8GYaTjyJwZPiC1XC9TC0lzKE=;
 b=hPzFB/+Qc/EshKcWT3RkKIDIT6v8JVHMx2Yh0um1wx56tAEX1Q3eOtW+IuM+wx1xoL
 mZKjWFfmgNJFm3JOulv+YlBeLrE+Zd2XN/Q9gULO6B1Of5Jbx5a6UYX3dDWcUA6bdQZN
 GUlnG63MWqYIOZ5hrTFGKHIx7mdCQ0Dkbd5gLI1nW8UneL19zK+iRs3RqFZKbnk9ro9O
 82g+f6ZCaM3EerflopFR0qnBSwvIEqYPX6QrcnWbRVMFRSqR41laiXKDMwxtIMWhqryZ
 zCkgDjBjWILbaenNIPD48glkhp0ZODkS9SMvG03/Yuur6V2cdAoI4pIk2Ga+h+49SSHd
 Ky1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l207URFYNLc46RjCwnT8GYaTjyJwZPiC1XC9TC0lzKE=;
 b=Rcimdjmjn8BmhNhTzUMthLgNCjfbs65afWO+6s38KiWT4cPlKEooKCvPiMDq/fYLiS
 oxFonqh6XFbnwtCslcfartR5DNFAUex3ivka7EodqgNQ7IZp+DPhiH6VjlIcxdr22SFL
 1o3iZR7Of6Hrq4I0OKF+EqWmaCeD1fb+1uyiLBNqzjS60qGYlKKyKQBxkPdzCH41L6C4
 vD8C745tz15o28CRQakBwxe6agckwjFbRXpSZ5PHSrR7t63d/CgLznB1yx6/V2awXD4l
 EKBq4nIYigOrMus72ExJ7mpn8XgyzQYunE81TkxYyM+bgDZ2o49DrzrtNDDOoQOukOUx
 vBXQ==
X-Gm-Message-State: AOAM530fXLk8ouUGmK5htsXm68BIPbnSyjqlohTD53cRUPY/yfH2h8JF
 28hbhs5fdVPqaBQAU4yEeP7vmj6pkkPzwJNA7vs=
X-Google-Smtp-Source: ABdhPJzBFPUP1vi+920jFR+fQIcSQN76KyqT1T4SljQVRnbKgF8GX4LNnjQvsBXKIgCSXCScRduyIt0dOsspBk3blBU=
X-Received: by 2002:a25:d052:: with SMTP id h79mr17106972ybg.246.1628000033183; 
 Tue, 03 Aug 2021 07:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210803141049.80422-1-rahulbalaji78@gmail.com>
In-Reply-To: <20210803141049.80422-1-rahulbalaji78@gmail.com>
From: Rahul Balaji <rahulbalaji78@gmail.com>
Date: Tue, 3 Aug 2021 18:13:42 +0400
Message-ID: <CADywMdrQshHBoVCZ8t9Z6GM0Qib8TA17DtnG9BctCPOO19O=jQ@mail.gmail.com>
Subject: Re: [PATCH v2] Task2: checkpatch.pl documentation mentorship: Remove
 semicolon warnings
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
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
Content-Type: multipart/mixed; boundary="===============8275663204704280651=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============8275663204704280651==
Content-Type: multipart/alternative; boundary="000000000000ac1a0205c8a84b45"

--000000000000ac1a0205c8a84b45
Content-Type: text/plain; charset="UTF-8"

Respected mentor,

Here are explanations for the changes I made.


drivers/mtd/ubi/block.c:408: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

removed the extra semicolon that caused the warning.
No functional change.
true positive.
file showed no errors on make.

checkpatch.pl on this file after change :

WARNING: quoted string split across lines
#354: FILE: drivers/mtd/ubi/block.c:354:
+ pr_warn("UBI: block: volume size is not a multiple of 512, "
+ "last %llu bytes are ignored!\n",

WARNING: braces {} are not necessary for single statement blocks
#374: FILE: drivers/mtd/ubi/block.c:374:
+ if (ret) {
+ return ret;
+ }

total: 0 errors, 2 warnings, 697 lines checked

drivers/gpu/drm/nouveau/nouveau_gem.c:342: WARNING:ONE_SEMICOLON:
Statements terminations use 1 semicolon

removed the extra semicolon that caused the warning.
no functional change.
true positive.
file showed no errors on make.

checkpatch.pl on this file after change :

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#1: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:1:
+/*

ERROR: do not use assignment in if condition
#165: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:165:
+ if (!(work = kmalloc(sizeof(*work), GFP_KERNEL))) {

ERROR: space prohibited after that '&' (ctx:WxW)
#183: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:183:
+ struct nouveau_vmm *vmm = cli->svm.cli ? &cli->svm : & cli->vmm;
                                                      ^

WARNING: Block comments use a trailing */ on a separate line
#241: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:241:
+ * to the caller, instead of a normal nouveau_bo ttm reference. */

WARNING: suspect code indent for conditional statements (8, 8)
#298: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:298:
+ else
+ if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA)

WARNING: quoted string split across lines
#458: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:458:
+ NV_PRINTK(err, cli, "multiple instances of buffer %d on "
+      "validation list\n", b->handle);

WARNING: Missing a blank line after declarations
#486: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:486:
+ struct nouveau_vma *vma = nouveau_vma_find(nvbo, vmm);
+ if (!vma) {

WARNING: suspect code indent for conditional statements (16, 16)
#502: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:502:
+ else
+ if (b->valid_domains & NOUVEAU_GEM_DOMAIN_VRAM)

WARNING: suspect code indent for conditional statements (16, 16)
#505: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:505:
+ else
+ if (b->valid_domains & NOUVEAU_GEM_DOMAIN_GART)

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
#625: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:625:
+u_memcpya(uint64_t user, unsigned nmemb, unsigned size)

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
#625: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:625:
+u_memcpya(uint64_t user, unsigned nmemb, unsigned size)

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
#651: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:651:
+ unsigned i;

WARNING: suspect code indent for conditional statements (16, 16)
#695: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:695:
+ else
+ if (r->flags & NOUVEAU_GEM_RELOC_HIGH)

WARNING: suspect code indent for conditional statements (8, 8)
#841: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:841:
+ } else
+ if (drm->client.device.info.chipset >= 0x25) {

WARNING: Avoid multiple line dereference - prefer
'nvbo->bo.resource->num_pages'
#874: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:874:
+  nvbo->bo.resource->
+  num_pages,

ERROR: do not use assignment in if condition
#902: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:902:
+ if (!(ret = nouveau_fence_wait(fence, false, false))) {

ERROR: do not use assignment in if condition
#903: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:903:
+ if ((ret = dma_fence_get_status(&fence->base)) == 1)

WARNING: suspect code indent for conditional statements (8, 8)
#937: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:937:
+ } else
+ if (drm->client.device.info.chipset >= 0x25) {

total: 4 errors, 14 warnings, 1016 lines checked

fs/block_dev.c:1271: WARNING:ONE_SEMICOLON: Statements terminations
use 1 semicolon

removed the semicolon that caused the warning.
no functional changes.
true positive.
file showed no errors on make.

checkpatch.pl on this file after change:

WARNING: Missing a blank line after declarations
#68: FILE: fs/block_dev.c:68:
+ char name[BDEVNAME_SIZE];
+ pr_warn_ratelimited("VFS: Dirty inode writeback failed "

WARNING: quoted string split across lines
#69: FILE: fs/block_dev.c:69:
+ pr_warn_ratelimited("VFS: Dirty inode writeback failed "
+    "for block device %s (err=%d).\n",

WARNING: Missing a blank line after declarations
#120: FILE: fs/block_dev.c:120:
+ int err = bd_prepare_to_claim(bdev, truncate_bdev_range);
+ if (err)

WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
#171: FILE: fs/block_dev.c:171:
+EXPORT_SYMBOL(set_blocksize);

WARNING: Block comments use a trailing */ on a separate line
#178: FILE: fs/block_dev.c:178:
+ * and it's value is between 512 and PAGE_SIZE */

WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
#184: FILE: fs/block_dev.c:184:
+EXPORT_SYMBOL(sb_set_blocksize);

WARNING: Missing a blank line after declarations
#189: FILE: fs/block_dev.c:189:
+ int minsize = bdev_logical_block_size(sb->s_bdev);
+ if (size < minsize)

WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
#194: FILE: fs/block_dev.c:194:
+EXPORT_SYMBOL(sb_min_blocksize);

WARNING: Missing a blank line after declarations
#547: FILE: fs/block_dev.c:547:
+ struct super_block *sb = get_super(bdev);
+ if (sb) {

WARNING: Missing a blank line after declarations
#549: FILE: fs/block_dev.c:549:
+ int res = sync_filesystem(sb);
+ drop_super(sb);

ERROR: "foo * bar" should be "foo *bar"
#642: FILE: fs/block_dev.c:642:
+static int blkdev_readpage(struct file * file, struct page * page)

ERROR: "foo * bar" should be "foo *bar"
#642: FILE: fs/block_dev.c:642:
+static int blkdev_readpage(struct file * file, struct page * page)

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
#653: FILE: fs/block_dev.c:653:
+ loff_t pos, unsigned len, unsigned flags,

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
#653: FILE: fs/block_dev.c:653:
+ loff_t pos, unsigned len, unsigned flags,

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
#661: FILE: fs/block_dev.c:661:
+ loff_t pos, unsigned len, unsigned copied,

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
#661: FILE: fs/block_dev.c:661:
+ loff_t pos, unsigned len, unsigned copied,

WARNING: Missing a blank line after declarations
#665: FILE: fs/block_dev.c:665:
+ int ret;
+ ret = block_write_end(file, mapping, pos, len, copied, page, fsdata);

ERROR: trailing whitespace
#688: FILE: fs/block_dev.c:688:
+^I$

ERROR: trailing whitespace
#694: FILE: fs/block_dev.c:694:
+^I$

ERROR: "foo * bar" should be "foo *bar"
#795: FILE: fs/block_dev.c:795:
+static struct kmem_cache * bdev_cachep __read_mostly;

WARNING: Missing a blank line after declarations
#830: FILE: fs/block_dev.c:830:
+ struct block_device *bdev = &BDEV_I(inode)->bdev;
+ truncate_inode_pages_final(&inode->i_data);

WARNING: Missing a blank line after declarations
#852: FILE: fs/block_dev.c:852:
+ struct pseudo_fs_context *ctx = init_pseudo(fc, BDEVFS_MAGIC);
+ if (!ctx)

ERROR: trailing whitespace
#967: FILE: fs/block_dev.c:967:
+ $

WARNING: please, no spaces at the start of a line
#967: FILE: fs/block_dev.c:967:
+ $

WARNING: please, no space before tabs
#988: FILE: fs/block_dev.c:988:
+^I^Ireturn false; ^I /* held by someone else */$

WARNING: please, no space before tabs
#990: FILE: fs/block_dev.c:990:
+^I^Ireturn true;  ^I /* is a whole device which isn't held */$

WARNING: please, no space before tabs
#993: FILE: fs/block_dev.c:993:
+^I^Ireturn true; ^I /* is a partition of a device that is being
partitioned */$

ERROR: "foo * bar" should be "foo *bar"
#1491: FILE: fs/block_dev.c:1491:
+static int blkdev_open(struct inode * inode, struct file * filp)

ERROR: "foo * bar" should be "foo *bar"
#1491: FILE: fs/block_dev.c:1491:
+static int blkdev_open(struct inode * inode, struct file * filp)

ERROR: do not use assignment in if condition
#1549: FILE: fs/block_dev.c:1549:
+ if ((bdev_free = !bdev->bd_holders))

ERROR: "foo * bar" should be "foo *bar"
#1583: FILE: fs/block_dev.c:1583:
+static int blkdev_close(struct inode * inode, struct file * filp)

ERROR: "foo * bar" should be "foo *bar"
#1583: FILE: fs/block_dev.c:1583:
+static int blkdev_close(struct inode * inode, struct file * filp)

WARNING: Missing a blank line after declarations
#1586: FILE: fs/block_dev.c:1586:
+ struct block_device *bdev = I_BDEV(bdev_file_inode(filp));
+ blkdev_put(bdev, filp->f_mode);

WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
#1590: FILE: fs/block_dev.c:1590:
+static long block_ioctl(struct file *file, unsigned cmd, unsigned long arg)

total: 11 errors, 23 warnings, 1878 lines checked

include/trace/events/iocost.h:163: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

removed the extra semicolon that caused the warning.
no functional change.
true positive.
showed no errors on "make -j8 all".

checkpatch.pl after changes :

WARNING: space prohibited between function name and open parenthesis '('
#21: FILE: include/trace/events/iocost.h:21:
+ TP_STRUCT__entry (

WARNING: quoted string split across lines
#52: FILE: include/trace/events/iocost.h:52:
+ TP_printk("[%s:%s] now=%llu:%llu vrate=%llu "
+  "period=%llu->%llu vtime=%llu "

WARNING: quoted string split across lines
#53: FILE: include/trace/events/iocost.h:53:
+  "period=%llu->%llu vtime=%llu "
+  "weight=%u/%u hweight=%llu/%llu",

WARNING: space prohibited between function name and open parenthesis '('
#85: FILE: include/trace/events/iocost.h:85:
+ TP_STRUCT__entry (

WARNING: space prohibited between function name and open parenthesis '('
#149: FILE: include/trace/events/iocost.h:149:
+ TP_STRUCT__entry (

WARNING: space prohibited between function name and open parenthesis '('
#190: FILE: include/trace/events/iocost.h:190:
+ TP_STRUCT__entry (

total: 0 errors, 6 warnings, 225 lines checked

net/sched/cls_rsvp.h:231: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

false positive.
no changes made.
a for loop will require 2 semicolons as per the rules of C.
we can maybe have a check for this rule where it can be ignored when
it is in a for loop ? or have a check for the number of consecutive
semicolons be less than 2.

net/sched/cls_u32.c:782: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

false positive.
no changes made.
a for loop will require 2 semicolons as per the rules of C.

drivers/net/ethernet/mediatek/mtk_star_emac.c:1089:
WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon

false positive.
no changes made.
a for loop will require 2 semicolons as per the rules of C.

arch/ia64/include/asm/mca_asm.h:139: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

arch/ia64/include/asm/mca_asm.h:213: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

arch/ia64/include/asm/native/inst.h:79: WARNING:ONE_SEMICOLON:
Statements terminations use 1 semicolon

arch/ia64/kernel/minstate.h:14: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

arch/ia64/kernel/minstate.h:151: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

arch/ia64/kernel/minstate.h:213: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

false positive.
i am not entirely sure of this rule,
but what i noticed is that the place where ";;"
is used is all under #define. I am not entirely sure of it's
function in c under .h files. Can you help me out on that one ?
but other than that, i am positive it shouldn't be removed,
or else the function might get altered or it might result in an error.

On Tue, Aug 3, 2021 at 6:11 PM Rahul Balaji <rahulbalaji78@gmail.com> wrote:

> Signed-off-by: Rahul Balaji <rahulbalaji78@gmail.com>
>
> no functional changes.
> ---
>  drivers/gpu/drm/nouveau/nouveau_gem.c | 2 +-
>  drivers/mtd/ubi/block.c               | 2 +-
>  fs/block_dev.c                        | 2 +-
>  include/trace/events/iocost.h         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
> b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 5b27845075a1..d476940ee97c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -339,7 +339,7 @@ nouveau_gem_set_domain(struct drm_gem_object *gem,
> uint32_t read_domains,
>         struct ttm_buffer_object *bo = &nvbo->bo;
>         uint32_t domains = valid_domains & nvbo->valid_domains &
>                 (write_domains ? write_domains : read_domains);
> -       uint32_t pref_domains = 0;;
> +       uint32_t pref_domains = 0;
>
>         if (!domains)
>                 return -EINVAL;
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index e003b4b44ffa..e0402c2f8959 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -405,7 +405,7 @@ int ubiblock_create(struct ubi_volume_info *vi)
>         ret = blk_mq_alloc_tag_set(&dev->tag_set);
>         if (ret) {
>                 dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set
> failed");
> -               goto out_free_dev;;
> +               goto out_free_dev;
>         }
>
>
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index 9ef4f1fc2cb0..61b938fa5d5b 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -1268,7 +1268,7 @@ static int blkdev_get_whole(struct block_device
> *bdev, fmode_t mode)
>         if (test_bit(GD_NEED_PART_SCAN, &disk->state))
>                 bdev_disk_changed(disk, false);
>         bdev->bd_openers++;
> -       return 0;;
> +       return 0;
>  }
>
>  static void blkdev_put_whole(struct block_device *bdev, fmode_t mode)
> diff --git a/include/trace/events/iocost.h b/include/trace/events/iocost.h
> index e282ce02fa2d..6d1626e7a4ce 100644
> --- a/include/trace/events/iocost.h
> +++ b/include/trace/events/iocost.h
> @@ -160,7 +160,7 @@ TRACE_EVENT(iocost_ioc_vrate_adj,
>
>         TP_fast_assign(
>                 __assign_str(devname, ioc_name(ioc));
> -               __entry->old_vrate = atomic64_read(&ioc->vtime_rate);;
> +               __entry->old_vrate = atomic64_read(&ioc->vtime_rate);
>                 __entry->new_vrate = new_vrate;
>                 __entry->busy_level = ioc->busy_level;
>                 __entry->read_missed_ppm = missed_ppm[READ];
> --
> 2.25.1
>

--000000000000ac1a0205c8a84b45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Respected mentor,<div><br></div><div>Here are explanations=
 for the changes I made.</div><div><br></div><div><br></div><div>drivers/mt=
d/ubi/block.c:408: WARNING:ONE_SEMICOLON: Statements<br>terminations use 1 =
semicolon<br><br>removed the extra semicolon that caused the warning.<br>No=
 functional change.<br>true positive.<br>file showed no errors on make.<br>=
<br><a href=3D"http://checkpatch.pl">checkpatch.pl</a> on this file after c=
hange :<br><br>WARNING: quoted string split across lines<br>#354: FILE: dri=
vers/mtd/ubi/block.c:354:<br>+		pr_warn(&quot;UBI: block: volume size is no=
t a multiple of 512, &quot;<br>+			&quot;last %llu bytes are ignored!\n&quo=
t;,<br><br>WARNING: braces {} are not necessary for single statement blocks=
<br>#374: FILE: drivers/mtd/ubi/block.c:374:<br>+	if (ret) {<br>+		return r=
et;<br>+	}<br><br>total: 0 errors, 2 warnings, 697 lines checked<br><br>dri=
vers/gpu/drm/nouveau/nouveau_gem.c:342: WARNING:ONE_SEMICOLON:<br>Statement=
s terminations use 1 semicolon<br><br>removed the extra semicolon that caus=
ed the warning.<br>no functional change.<br>true positive.<br>file showed n=
o errors on make.<br><br><a href=3D"http://checkpatch.pl">checkpatch.pl</a>=
 on this file after change :<br><br>WARNING: Missing or malformed SPDX-Lice=
nse-Identifier tag in line 1<br>#1: FILE: drivers/gpu/drm/nouveau/nouveau_g=
em.c:1:<br>+/*<br><br>ERROR: do not use assignment in if condition<br>#165:=
 FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:165:<br>+	if (!(work =3D kmall=
oc(sizeof(*work), GFP_KERNEL))) {<br><br>ERROR: space prohibited after that=
 &#39;&amp;&#39; (ctx:WxW)<br>#183: FILE: drivers/gpu/drm/nouveau/nouveau_g=
em.c:183:<br>+	struct nouveau_vmm *vmm =3D cli-&gt;svm.cli ? &amp;cli-&gt;s=
vm : &amp; cli-&gt;vmm;<br>=C2=A0	 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br>=
<br>WARNING: Block comments use a trailing */ on a separate line<br>#241: F=
ILE: drivers/gpu/drm/nouveau/nouveau_gem.c:241:<br>+	 * to the caller, inst=
ead of a normal nouveau_bo ttm reference. */<br><br>WARNING: suspect code i=
ndent for conditional statements (8, 8)<br>#298: FILE: drivers/gpu/drm/nouv=
eau/nouveau_gem.c:298:<br>+	else<br>+	if (cli-&gt;device.info.family &gt;=
=3D NV_DEVICE_INFO_V0_TESLA)<br><br>WARNING: quoted string split across lin=
es<br>#458: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:458:<br>+			NV_PRIN=
TK(err, cli, &quot;multiple instances of buffer %d on &quot;<br>+				 =C2=
=A0 =C2=A0 =C2=A0&quot;validation list\n&quot;, b-&gt;handle);<br><br>WARNI=
NG: Missing a blank line after declarations<br>#486: FILE: drivers/gpu/drm/=
nouveau/nouveau_gem.c:486:<br>+			struct nouveau_vma *vma =3D nouveau_vma_f=
ind(nvbo, vmm);<br>+			if (!vma) {<br><br>WARNING: suspect code indent for =
conditional statements (16, 16)<br>#502: FILE: drivers/gpu/drm/nouveau/nouv=
eau_gem.c:502:<br>+		else<br>+		if (b-&gt;valid_domains &amp; NOUVEAU_GEM_D=
OMAIN_VRAM)<br><br>WARNING: suspect code indent for conditional statements =
(16, 16)<br>#505: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:505:<br>+		el=
se<br>+		if (b-&gt;valid_domains &amp; NOUVEAU_GEM_DOMAIN_GART)<br><br>WARN=
ING: Prefer &#39;unsigned int&#39; to bare use of &#39;unsigned&#39;<br>#62=
5: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:625:<br>+u_memcpya(uint64_t =
user, unsigned nmemb, unsigned size)<br><br>WARNING: Prefer &#39;unsigned i=
nt&#39; to bare use of &#39;unsigned&#39;<br>#625: FILE: drivers/gpu/drm/no=
uveau/nouveau_gem.c:625:<br>+u_memcpya(uint64_t user, unsigned nmemb, unsig=
ned size)<br><br>WARNING: Prefer &#39;unsigned int&#39; to bare use of &#39=
;unsigned&#39;<br>#651: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:651:<br=
>+	unsigned i;<br><br>WARNING: suspect code indent for conditional statemen=
ts (16, 16)<br>#695: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:695:<br>+	=
	else<br>+		if (r-&gt;flags &amp; NOUVEAU_GEM_RELOC_HIGH)<br><br>WARNING: s=
uspect code indent for conditional statements (8, 8)<br>#841: FILE: drivers=
/gpu/drm/nouveau/nouveau_gem.c:841:<br>+	} else<br>+	if (drm-&gt;client.dev=
ice.info.chipset &gt;=3D 0x25) {<br><br>WARNING: Avoid multiple line derefe=
rence - prefer &#39;nvbo-&gt;bo.resource-&gt;num_pages&#39;<br>#874: FILE: =
drivers/gpu/drm/nouveau/nouveau_gem.c:874:<br>+							 =C2=A0nvbo-&gt;bo.re=
source-&gt;<br>+							 =C2=A0num_pages,<br><br>ERROR: do not use assignmen=
t in if condition<br>#902: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:902:=
<br>+		if (!(ret =3D nouveau_fence_wait(fence, false, false))) {<br><br>ERR=
OR: do not use assignment in if condition<br>#903: FILE: drivers/gpu/drm/no=
uveau/nouveau_gem.c:903:<br>+			if ((ret =3D dma_fence_get_status(&amp;fenc=
e-&gt;base)) =3D=3D 1)<br><br>WARNING: suspect code indent for conditional =
statements (8, 8)<br>#937: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:937:=
<br>+	} else<br>+	if (drm-&gt;client.device.info.chipset &gt;=3D 0x25) {<br=
><br>total: 4 errors, 14 warnings, 1016 lines checked<br><br>fs/block_dev.c=
:1271: WARNING:ONE_SEMICOLON: Statements terminations<br>use 1 semicolon<br=
><br>removed the semicolon that caused the warning.<br>no functional change=
s.<br>true positive.<br>file showed no errors on make.<br><br><a href=3D"ht=
tp://checkpatch.pl">checkpatch.pl</a> on this file after change:<br><br>WAR=
NING: Missing a blank line after declarations<br>#68: FILE: fs/block_dev.c:=
68:<br>+			char name[BDEVNAME_SIZE];<br>+			pr_warn_ratelimited(&quot;VFS: =
Dirty inode writeback failed &quot;<br><br>WARNING: quoted string split acr=
oss lines<br>#69: FILE: fs/block_dev.c:69:<br>+			pr_warn_ratelimited(&quot=
;VFS: Dirty inode writeback failed &quot;<br>+					 =C2=A0 =C2=A0&quot;for =
block device %s (err=3D%d).\n&quot;,<br><br>WARNING: Missing a blank line a=
fter declarations<br>#120: FILE: fs/block_dev.c:120:<br>+		int err =3D bd_p=
repare_to_claim(bdev, truncate_bdev_range);<br>+		if (err)<br><br>WARNING: =
EXPORT_SYMBOL(foo); should immediately follow its function/variable<br>#171=
: FILE: fs/block_dev.c:171:<br>+EXPORT_SYMBOL(set_blocksize);<br><br>WARNIN=
G: Block comments use a trailing */ on a separate line<br>#178: FILE: fs/bl=
ock_dev.c:178:<br>+	 * and it&#39;s value is between 512 and PAGE_SIZE */<b=
r><br>WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/v=
ariable<br>#184: FILE: fs/block_dev.c:184:<br>+EXPORT_SYMBOL(sb_set_blocksi=
ze);<br><br>WARNING: Missing a blank line after declarations<br>#189: FILE:=
 fs/block_dev.c:189:<br>+	int minsize =3D bdev_logical_block_size(sb-&gt;s_=
bdev);<br>+	if (size &lt; minsize)<br><br>WARNING: EXPORT_SYMBOL(foo); shou=
ld immediately follow its function/variable<br>#194: FILE: fs/block_dev.c:1=
94:<br>+EXPORT_SYMBOL(sb_min_blocksize);<br><br>WARNING: Missing a blank li=
ne after declarations<br>#547: FILE: fs/block_dev.c:547:<br>+	struct super_=
block *sb =3D get_super(bdev);<br>+	if (sb) {<br><br>WARNING: Missing a bla=
nk line after declarations<br>#549: FILE: fs/block_dev.c:549:<br>+		int res=
 =3D sync_filesystem(sb);<br>+		drop_super(sb);<br><br>ERROR: &quot;foo * b=
ar&quot; should be &quot;foo *bar&quot;<br>#642: FILE: fs/block_dev.c:642:<=
br>+static int blkdev_readpage(struct file * file, struct page * page)<br><=
br>ERROR: &quot;foo * bar&quot; should be &quot;foo *bar&quot;<br>#642: FIL=
E: fs/block_dev.c:642:<br>+static int blkdev_readpage(struct file * file, s=
truct page * page)<br><br>WARNING: Prefer &#39;unsigned int&#39; to bare us=
e of &#39;unsigned&#39;<br>#653: FILE: fs/block_dev.c:653:<br>+			loff_t po=
s, unsigned len, unsigned flags,<br><br>WARNING: Prefer &#39;unsigned int&#=
39; to bare use of &#39;unsigned&#39;<br>#653: FILE: fs/block_dev.c:653:<br=
>+			loff_t pos, unsigned len, unsigned flags,<br><br>WARNING: Prefer &#39;=
unsigned int&#39; to bare use of &#39;unsigned&#39;<br>#661: FILE: fs/block=
_dev.c:661:<br>+			loff_t pos, unsigned len, unsigned copied,<br><br>WARNIN=
G: Prefer &#39;unsigned int&#39; to bare use of &#39;unsigned&#39;<br>#661:=
 FILE: fs/block_dev.c:661:<br>+			loff_t pos, unsigned len, unsigned copied=
,<br><br>WARNING: Missing a blank line after declarations<br>#665: FILE: fs=
/block_dev.c:665:<br>+	int ret;<br>+	ret =3D block_write_end(file, mapping,=
 pos, len, copied, page, fsdata);<br><br>ERROR: trailing whitespace<br>#688=
: FILE: fs/block_dev.c:688:<br>+^I$<br><br>ERROR: trailing whitespace<br>#6=
94: FILE: fs/block_dev.c:694:<br>+^I$<br><br>ERROR: &quot;foo * bar&quot; s=
hould be &quot;foo *bar&quot;<br>#795: FILE: fs/block_dev.c:795:<br>+static=
 struct kmem_cache * bdev_cachep __read_mostly;<br><br>WARNING: Missing a b=
lank line after declarations<br>#830: FILE: fs/block_dev.c:830:<br>+	struct=
 block_device *bdev =3D &amp;BDEV_I(inode)-&gt;bdev;<br>+	truncate_inode_pa=
ges_final(&amp;inode-&gt;i_data);<br><br>WARNING: Missing a blank line afte=
r declarations<br>#852: FILE: fs/block_dev.c:852:<br>+	struct pseudo_fs_con=
text *ctx =3D init_pseudo(fc, BDEVFS_MAGIC);<br>+	if (!ctx)<br><br>ERROR: t=
railing whitespace<br>#967: FILE: fs/block_dev.c:967:<br>+ $<br><br>WARNING=
: please, no spaces at the start of a line<br>#967: FILE: fs/block_dev.c:96=
7:<br>+ $<br><br>WARNING: please, no space before tabs<br>#988: FILE: fs/bl=
ock_dev.c:988:<br>+^I^Ireturn false; ^I /* held by someone else */$<br><br>=
WARNING: please, no space before tabs<br>#990: FILE: fs/block_dev.c:990:<br=
>+^I^Ireturn true; =C2=A0^I /* is a whole device which isn&#39;t held */$<b=
r><br>WARNING: please, no space before tabs<br>#993: FILE: fs/block_dev.c:9=
93:<br>+^I^Ireturn true; ^I /* is a partition of a device that is being par=
titioned */$<br><br>ERROR: &quot;foo * bar&quot; should be &quot;foo *bar&q=
uot;<br>#1491: FILE: fs/block_dev.c:1491:<br>+static int blkdev_open(struct=
 inode * inode, struct file * filp)<br><br>ERROR: &quot;foo * bar&quot; sho=
uld be &quot;foo *bar&quot;<br>#1491: FILE: fs/block_dev.c:1491:<br>+static=
 int blkdev_open(struct inode * inode, struct file * filp)<br><br>ERROR: do=
 not use assignment in if condition<br>#1549: FILE: fs/block_dev.c:1549:<br=
>+		if ((bdev_free =3D !bdev-&gt;bd_holders))<br><br>ERROR: &quot;foo * bar=
&quot; should be &quot;foo *bar&quot;<br>#1583: FILE: fs/block_dev.c:1583:<=
br>+static int blkdev_close(struct inode * inode, struct file * filp)<br><b=
r>ERROR: &quot;foo * bar&quot; should be &quot;foo *bar&quot;<br>#1583: FIL=
E: fs/block_dev.c:1583:<br>+static int blkdev_close(struct inode * inode, s=
truct file * filp)<br><br>WARNING: Missing a blank line after declarations<=
br>#1586: FILE: fs/block_dev.c:1586:<br>+	struct block_device *bdev =3D I_B=
DEV(bdev_file_inode(filp));<br>+	blkdev_put(bdev, filp-&gt;f_mode);<br><br>=
WARNING: Prefer &#39;unsigned int&#39; to bare use of &#39;unsigned&#39;<br=
>#1590: FILE: fs/block_dev.c:1590:<br>+static long block_ioctl(struct file =
*file, unsigned cmd, unsigned long arg)<br><br>total: 11 errors, 23 warning=
s, 1878 lines checked<br><br>include/trace/events/iocost.h:163: WARNING:ONE=
_SEMICOLON: Statements<br>terminations use 1 semicolon<br><br>removed the e=
xtra semicolon that caused the warning.<br>no functional change.<br>true po=
sitive.<br>showed no errors on &quot;make -j8 all&quot;.<br><br><a href=3D"=
http://checkpatch.pl">checkpatch.pl</a> after changes :<br><br>WARNING: spa=
ce prohibited between function name and open parenthesis &#39;(&#39;<br>#21=
: FILE: include/trace/events/iocost.h:21:<br>+	TP_STRUCT__entry (<br><br>WA=
RNING: quoted string split across lines<br>#52: FILE: include/trace/events/=
iocost.h:52:<br>+	TP_printk(&quot;[%s:%s] now=3D%llu:%llu vrate=3D%llu &quo=
t;<br>+		 =C2=A0&quot;period=3D%llu-&gt;%llu vtime=3D%llu &quot;<br><br>WAR=
NING: quoted string split across lines<br>#53: FILE: include/trace/events/i=
ocost.h:53:<br>+		 =C2=A0&quot;period=3D%llu-&gt;%llu vtime=3D%llu &quot;<b=
r>+		 =C2=A0&quot;weight=3D%u/%u hweight=3D%llu/%llu&quot;,<br><br>WARNING:=
 space prohibited between function name and open parenthesis &#39;(&#39;<br=
>#85: FILE: include/trace/events/iocost.h:85:<br>+	TP_STRUCT__entry (<br><b=
r>WARNING: space prohibited between function name and open parenthesis &#39=
;(&#39;<br>#149: FILE: include/trace/events/iocost.h:149:<br>+	TP_STRUCT__e=
ntry (<br><br>WARNING: space prohibited between function name and open pare=
nthesis &#39;(&#39;<br>#190: FILE: include/trace/events/iocost.h:190:<br>+	=
TP_STRUCT__entry (<br><br>total: 0 errors, 6 warnings, 225 lines checked<br=
><br>net/sched/cls_rsvp.h:231: WARNING:ONE_SEMICOLON: Statements<br>termina=
tions use 1 semicolon<br><br>false positive.<br>no changes made.<br>a for l=
oop will require 2 semicolons as per the rules of C.<br>we can maybe have a=
 check for this rule where it can be ignored when<br>it is in a for loop ? =
or have a check for the number of consecutive semicolons be less than 2.<br=
><br>net/sched/cls_u32.c:782: WARNING:ONE_SEMICOLON: Statements<br>terminat=
ions use 1 semicolon<br><br>false positive.<br>no changes made.<br>a for lo=
op will require 2 semicolons as per the rules of C.<br><br>drivers/net/ethe=
rnet/mediatek/mtk_star_emac.c:1089:<br>WARNING:ONE_SEMICOLON: Statements te=
rminations use 1 semicolon<br><br>false positive.<br>no changes made.<br>a =
for loop will require 2 semicolons as per the rules of C.<br><br>arch/ia64/=
include/asm/mca_asm.h:139: WARNING:ONE_SEMICOLON: Statements<br>termination=
s use 1 semicolon<br><br>arch/ia64/include/asm/mca_asm.h:213: WARNING:ONE_S=
EMICOLON: Statements<br>terminations use 1 semicolon<br><br>arch/ia64/inclu=
de/asm/native/inst.h:79: WARNING:ONE_SEMICOLON:<br>Statements terminations =
use 1 semicolon<br><br>arch/ia64/kernel/minstate.h:14: WARNING:ONE_SEMICOLO=
N: Statements<br>terminations use 1 semicolon<br><br>arch/ia64/kernel/minst=
ate.h:151: WARNING:ONE_SEMICOLON: Statements<br>terminations use 1 semicolo=
n<br><br>arch/ia64/kernel/minstate.h:213: WARNING:ONE_SEMICOLON: Statements=
<br>terminations use 1 semicolon<br><br>false positive.<br>i am not entirel=
y sure of this rule,<br>but what i noticed is that the place where &quot;;;=
&quot;<br>is used is all under #define. I am not entirely sure of it&#39;s<=
br>function in c under .h files. Can you help me out on that one ?<br>but o=
ther than that, i am positive it shouldn&#39;t be removed,<br>or else the f=
unction might get altered or it might result in an error.<br></div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, =
Aug 3, 2021 at 6:11 PM Rahul Balaji &lt;<a href=3D"mailto:rahulbalaji78@gma=
il.com">rahulbalaji78@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Signed-off-by: Rahul Balaji &lt;<a href=3D=
"mailto:rahulbalaji78@gmail.com" target=3D"_blank">rahulbalaji78@gmail.com<=
/a>&gt;<br>
<br>
no functional changes.=C2=A0 <br>
---<br>
=C2=A0drivers/gpu/drm/nouveau/nouveau_gem.c | 2 +-<br>
=C2=A0drivers/mtd/ubi/block.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
=C2=A0fs/block_dev.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A0include/trace/events/iocost.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-=
<br>
=C2=A04 files changed, 4 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouvea=
u/nouveau_gem.c<br>
index 5b27845075a1..d476940ee97c 100644<br>
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c<br>
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c<br>
@@ -339,7 +339,7 @@ nouveau_gem_set_domain(struct drm_gem_object *gem, uint=
32_t read_domains,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct ttm_buffer_object *bo =3D &amp;nvbo-&gt;=
bo;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t domains =3D valid_domains &amp; nvbo-&=
gt;valid_domains &amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (write_domains ? wr=
ite_domains : read_domains);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t pref_domains =3D 0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t pref_domains =3D 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!domains)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c<br>
index e003b4b44ffa..e0402c2f8959 100644<br>
--- a/drivers/mtd/ubi/block.c<br>
+++ b/drivers/mtd/ubi/block.c<br>
@@ -405,7 +405,7 @@ int ubiblock_create(struct ubi_volume_info *vi)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D blk_mq_alloc_tag_set(&amp;dev-&gt;tag_s=
et);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(disk_to_dev=
(dev-&gt;gd), &quot;blk_mq_alloc_tag_set failed&quot;);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_free_dev;;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out_free_dev;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
<br>
diff --git a/fs/block_dev.c b/fs/block_dev.c<br>
index 9ef4f1fc2cb0..61b938fa5d5b 100644<br>
--- a/fs/block_dev.c<br>
+++ b/fs/block_dev.c<br>
@@ -1268,7 +1268,7 @@ static int blkdev_get_whole(struct block_device *bdev=
, fmode_t mode)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (test_bit(GD_NEED_PART_SCAN, &amp;disk-&gt;s=
tate))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bdev_disk_changed(d=
isk, false);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bdev-&gt;bd_openers++;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0}<br>
<br>
=C2=A0static void blkdev_put_whole(struct block_device *bdev, fmode_t mode)=
<br>
diff --git a/include/trace/events/iocost.h b/include/trace/events/iocost.h<=
br>
index e282ce02fa2d..6d1626e7a4ce 100644<br>
--- a/include/trace/events/iocost.h<br>
+++ b/include/trace/events/iocost.h<br>
@@ -160,7 +160,7 @@ TRACE_EVENT(iocost_ioc_vrate_adj,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 TP_fast_assign(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __assign_str(devnam=
e, ioc_name(ioc));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__entry-&gt;old_vra=
te =3D atomic64_read(&amp;ioc-&gt;vtime_rate);;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__entry-&gt;old_vra=
te =3D atomic64_read(&amp;ioc-&gt;vtime_rate);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __entry-&gt;new_vra=
te =3D new_vrate;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __entry-&gt;busy_le=
vel =3D ioc-&gt;busy_level;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __entry-&gt;read_mi=
ssed_ppm =3D missed_ppm[READ];<br>
-- <br>
2.25.1<br>
</blockquote></div>

--000000000000ac1a0205c8a84b45--

--===============8275663204704280651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============8275663204704280651==--

