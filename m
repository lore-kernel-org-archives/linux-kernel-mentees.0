Return-Path: <SRS0=w3Lu=NB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26124C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Aug 2021 14:11:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3E2C60F94
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Aug 2021 14:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C3E2C60F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8377B831D6;
	Tue, 10 Aug 2021 14:11:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oCsJO1IC8oer; Tue, 10 Aug 2021 14:11:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id BC55D82AF5;
	Tue, 10 Aug 2021 14:11:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8EDB5C001A;
	Tue, 10 Aug 2021 14:11:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 82373C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 14:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61CF340330
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 14:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8GX-PA0YG_Ne
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 14:10:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DC64402A2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 14:10:56 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id a201so36368214ybg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Aug 2021 07:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y5kLohLaFyAI2NQesJX3vh/1VKGo2aB4w6pzDXXyjjk=;
 b=dPMuWdFWGSytpycbqcm+7QbznfGmrnCU5f29MPu76zMYc7KVkp8lzpGsMpyYjikE95
 UKQI+1UenEf8AYw6aaf3VBMuULTB6C69QJC/6OWN0Xn1XmyCQXuNBiFGWjv0OQxpqEnB
 u1UeWl+W62A4O7+5VpV0htbDR9GTDpcHXlab7vfQPoNpqi1xe8Izk+fr6YpbUtojlYc/
 MGKCX+aUEYrzyg/2gRLz2nDnPjhfOlDAnpBVkF42LKPkKSWAH8lV207n6qCNbNtIR9dW
 bd278ybyqRSdXi/TSnveDHV2dc+9/y9wnFuPinVjkkSLnclH3kyE0Nyc/Fi8Rdk/jDpS
 NbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y5kLohLaFyAI2NQesJX3vh/1VKGo2aB4w6pzDXXyjjk=;
 b=k3ZYQA2gwGfuQY60hMPLzo/rL3GfAdt9flwLspg+cbnjQAyzMkqG566AGBxUlwvSwz
 tqgqXdu9Jj7wctAdhqSXI4sBESNQWbeYYgEAbz6FhEbrBMRNyvKG5oVPR1rP/dPlmw2K
 fm/2ypDTzMdx00Q0nY9FFU0ViLQeD8h2a9kDwV6EJ/AIREY6kcWN/8QA1+lMjFHV1Ru8
 S832CFwAYs1OBw5vxfCL+C7gaaD2Hxqv/VOAMs/Ip2EIry+iUoxgvKWOcd8r9q1AEJQk
 TCB7qEXlLoVTgwShVJyhrXN8zHMFQ4/i7gPoSuNdeaz9Nbr8eRvDU/acKNN9grql9Dpz
 xOLg==
X-Gm-Message-State: AOAM531au70xdyf+U8ZfEdl5dy0QZS/DwnmNl8dyACFQDeqtqu6dOGY/
 6rE1HxQETYpVToRBkhPrr59glUCfHzlFISpRapM=
X-Google-Smtp-Source: ABdhPJzfl7t/IKMswCazbZ/K1vx2XUJeaOo/TaMCty5wscbuhlns5GIq3xyb40LMBSmE4sypjhBx8HRBsUr1Z00Un1c=
X-Received: by 2002:a25:d290:: with SMTP id
 j138mr40808662ybg.151.1628604655101; 
 Tue, 10 Aug 2021 07:10:55 -0700 (PDT)
MIME-Version: 1.0
References: <CADywMdo_SOg8qZWWjkK3mp45X580mHD=NzVfQBowKNugGFYMOw@mail.gmail.com>
In-Reply-To: <CADywMdo_SOg8qZWWjkK3mp45X580mHD=NzVfQBowKNugGFYMOw@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Tue, 10 Aug 2021 16:10:43 +0200
Message-ID: <CAKXUXMy6Bg9WVbtob0gMELQwt1kcRL9t0Rs6SV2bpWMOmCa8yQ@mail.gmail.com>
Subject: Re: [PATCH v3] Task2: checkpatch.pl documentation mentorship: Remove
 semicolon warnings
To: Rahul Balaji <rahulbalaji78@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Tue, Aug 10, 2021 at 3:44 PM Rahul Balaji <rahulbalaji78@gmail.com> wrote:
>
> Signed-off-by: Rahul Balaji <rahulbalaji78@gmail.com>
>
> no functional changes.
>
> Here are explanations for the changes I made.
> The changelog is presented down below after the explanation.
>
> drivers/mtd/ubi/block.c:408: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
>
> removed the extra semicolon that caused the warning.
> No functional change.
> true positive.
> file showed no errors on make.
>
> checkpatch.pl on this file after change :
>
> WARNING: quoted string split across lines
> #354: FILE: drivers/mtd/ubi/block.c:354:
> + pr_warn("UBI: block: volume size is not a multiple of 512, "
> + "last %llu bytes are ignored!\n",
>
> WARNING: braces {} are not necessary for single statement blocks
> #374: FILE: drivers/mtd/ubi/block.c:374:
> + if (ret) {
> + return ret;
> + }
>
> total: 0 errors, 2 warnings, 697 lines checked
>
> drivers/gpu/drm/nouveau/nouveau_gem.c:342: WARNING:ONE_SEMICOLON:
> Statements terminations use 1 semicolon
>
> removed the extra semicolon that caused the warning.
> no functional change.
> true positive.
> file showed no errors on make.
>
> checkpatch.pl on this file after change :
>
> WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
> #1: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:1:
> +/*
>
> ERROR: do not use assignment in if condition
> #165: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:165:
> + if (!(work = kmalloc(sizeof(*work), GFP_KERNEL))) {
>
> ERROR: space prohibited after that '&' (ctx:WxW)
> #183: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:183:
> + struct nouveau_vmm *vmm = cli->svm.cli ? &cli->svm : & cli->vmm;
>                                                       ^
>
> WARNING: Block comments use a trailing */ on a separate line
> #241: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:241:
> + * to the caller, instead of a normal nouveau_bo ttm reference. */
>
> WARNING: suspect code indent for conditional statements (8, 8)
> #298: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:298:
> + else
> + if (cli->device.info.family >= NV_DEVICE_INFO_V0_TESLA)
>
> WARNING: quoted string split across lines
> #458: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:458:
> + NV_PRINTK(err, cli, "multiple instances of buffer %d on "
> +      "validation list\n", b->handle);
>
> WARNING: Missing a blank line after declarations
> #486: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:486:
> + struct nouveau_vma *vma = nouveau_vma_find(nvbo, vmm);
> + if (!vma) {
>
> WARNING: suspect code indent for conditional statements (16, 16)
> #502: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:502:
> + else
> + if (b->valid_domains & NOUVEAU_GEM_DOMAIN_VRAM)
>
> WARNING: suspect code indent for conditional statements (16, 16)
> #505: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:505:
> + else
> + if (b->valid_domains & NOUVEAU_GEM_DOMAIN_GART)
>
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> #625: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:625:
> +u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
>
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> #625: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:625:
> +u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
>
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> #651: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:651:
> + unsigned i;
>
> WARNING: suspect code indent for conditional statements (16, 16)
> #695: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:695:
> + else
> + if (r->flags & NOUVEAU_GEM_RELOC_HIGH)
>
> WARNING: suspect code indent for conditional statements (8, 8)
> #841: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:841:
> + } else
> + if (drm->client.device.info.chipset >= 0x25) {
>
> WARNING: Avoid multiple line dereference - prefer 'nvbo->bo.resource->num_pages'
> #874: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:874:
> +  nvbo->bo.resource->
> +  num_pages,
>
> ERROR: do not use assignment in if condition
> #902: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:902:
> + if (!(ret = nouveau_fence_wait(fence, false, false))) {
>
> ERROR: do not use assignment in if condition
> #903: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:903:
> + if ((ret = dma_fence_get_status(&fence->base)) == 1)
>
> WARNING: suspect code indent for conditional statements (8, 8)
> #937: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:937:
> + } else
> + if (drm->client.device.info.chipset >= 0x25) {
>
> total: 4 errors, 14 warnings, 1016 lines checked
>
> fs/block_dev.c:1271: WARNING:ONE_SEMICOLON: Statements terminations
> use 1 semicolon
>
> removed the semicolon that caused the warning.
> no functional changes.
> true positive.
> file showed no errors on make.
>
> checkpatch.pl on this file after change:
>
> WARNING: Missing a blank line after declarations
> #68: FILE: fs/block_dev.c:68:
> + char name[BDEVNAME_SIZE];
> + pr_warn_ratelimited("VFS: Dirty inode writeback failed "
>
> WARNING: quoted string split across lines
> #69: FILE: fs/block_dev.c:69:
> + pr_warn_ratelimited("VFS: Dirty inode writeback failed "
> +    "for block device %s (err=%d).\n",
>
> WARNING: Missing a blank line after declarations
> #120: FILE: fs/block_dev.c:120:
> + int err = bd_prepare_to_claim(bdev, truncate_bdev_range);
> + if (err)
>
> WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
> #171: FILE: fs/block_dev.c:171:
> +EXPORT_SYMBOL(set_blocksize);
>
> WARNING: Block comments use a trailing */ on a separate line
> #178: FILE: fs/block_dev.c:178:
> + * and it's value is between 512 and PAGE_SIZE */
>
> WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
> #184: FILE: fs/block_dev.c:184:
> +EXPORT_SYMBOL(sb_set_blocksize);
>
> WARNING: Missing a blank line after declarations
> #189: FILE: fs/block_dev.c:189:
> + int minsize = bdev_logical_block_size(sb->s_bdev);
> + if (size < minsize)
>
> WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/variable
> #194: FILE: fs/block_dev.c:194:
> +EXPORT_SYMBOL(sb_min_blocksize);
>
> WARNING: Missing a blank line after declarations
> #547: FILE: fs/block_dev.c:547:
> + struct super_block *sb = get_super(bdev);
> + if (sb) {
>
> WARNING: Missing a blank line after declarations
> #549: FILE: fs/block_dev.c:549:
> + int res = sync_filesystem(sb);
> + drop_super(sb);
>
> ERROR: "foo * bar" should be "foo *bar"
> #642: FILE: fs/block_dev.c:642:
> +static int blkdev_readpage(struct file * file, struct page * page)
>
> ERROR: "foo * bar" should be "foo *bar"
> #642: FILE: fs/block_dev.c:642:
> +static int blkdev_readpage(struct file * file, struct page * page)
>
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> #653: FILE: fs/block_dev.c:653:
> + loff_t pos, unsigned len, unsigned flags,
>
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> #653: FILE: fs/block_dev.c:653:
> + loff_t pos, unsigned len, unsigned flags,
>
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> #661: FILE: fs/block_dev.c:661:
> + loff_t pos, unsigned len, unsigned copied,
>
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> #661: FILE: fs/block_dev.c:661:
> + loff_t pos, unsigned len, unsigned copied,
>
> WARNING: Missing a blank line after declarations
> #665: FILE: fs/block_dev.c:665:
> + int ret;
> + ret = block_write_end(file, mapping, pos, len, copied, page, fsdata);
>
> ERROR: trailing whitespace
> #688: FILE: fs/block_dev.c:688:
> +^I$
>
> ERROR: trailing whitespace
> #694: FILE: fs/block_dev.c:694:
> +^I$
>
> ERROR: "foo * bar" should be "foo *bar"
> #795: FILE: fs/block_dev.c:795:
> +static struct kmem_cache * bdev_cachep __read_mostly;
>
> WARNING: Missing a blank line after declarations
> #830: FILE: fs/block_dev.c:830:
> + struct block_device *bdev = &BDEV_I(inode)->bdev;
> + truncate_inode_pages_final(&inode->i_data);
>
> WARNING: Missing a blank line after declarations
> #852: FILE: fs/block_dev.c:852:
> + struct pseudo_fs_context *ctx = init_pseudo(fc, BDEVFS_MAGIC);
> + if (!ctx)
>
> ERROR: trailing whitespace
> #967: FILE: fs/block_dev.c:967:
> + $
>
> WARNING: please, no spaces at the start of a line
> #967: FILE: fs/block_dev.c:967:
> + $
>
> WARNING: please, no space before tabs
> #988: FILE: fs/block_dev.c:988:
> +^I^Ireturn false; ^I /* held by someone else */$
>
> WARNING: please, no space before tabs
> #990: FILE: fs/block_dev.c:990:
> +^I^Ireturn true;  ^I /* is a whole device which isn't held */$
>
> WARNING: please, no space before tabs
> #993: FILE: fs/block_dev.c:993:
> +^I^Ireturn true; ^I /* is a partition of a device that is being partitioned */$
>
> ERROR: "foo * bar" should be "foo *bar"
> #1491: FILE: fs/block_dev.c:1491:
> +static int blkdev_open(struct inode * inode, struct file * filp)
>
> ERROR: "foo * bar" should be "foo *bar"
> #1491: FILE: fs/block_dev.c:1491:
> +static int blkdev_open(struct inode * inode, struct file * filp)
>
> ERROR: do not use assignment in if condition
> #1549: FILE: fs/block_dev.c:1549:
> + if ((bdev_free = !bdev->bd_holders))
>
> ERROR: "foo * bar" should be "foo *bar"
> #1583: FILE: fs/block_dev.c:1583:
> +static int blkdev_close(struct inode * inode, struct file * filp)
>
> ERROR: "foo * bar" should be "foo *bar"
> #1583: FILE: fs/block_dev.c:1583:
> +static int blkdev_close(struct inode * inode, struct file * filp)
>
> WARNING: Missing a blank line after declarations
> #1586: FILE: fs/block_dev.c:1586:
> + struct block_device *bdev = I_BDEV(bdev_file_inode(filp));
> + blkdev_put(bdev, filp->f_mode);
>
> WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> #1590: FILE: fs/block_dev.c:1590:
> +static long block_ioctl(struct file *file, unsigned cmd, unsigned long arg)
>
> total: 11 errors, 23 warnings, 1878 lines checked
>
> include/trace/events/iocost.h:163: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
>
> removed the extra semicolon that caused the warning.
> no functional change.
> true positive.
> showed no errors on "make -j8 all".
>
> checkpatch.pl after changes :
>
> WARNING: space prohibited between function name and open parenthesis '('
> #21: FILE: include/trace/events/iocost.h:21:
> + TP_STRUCT__entry (
>
> WARNING: quoted string split across lines
> #52: FILE: include/trace/events/iocost.h:52:
> + TP_printk("[%s:%s] now=%llu:%llu vrate=%llu "
> +  "period=%llu->%llu vtime=%llu "
>
> WARNING: quoted string split across lines
> #53: FILE: include/trace/events/iocost.h:53:
> +  "period=%llu->%llu vtime=%llu "
> +  "weight=%u/%u hweight=%llu/%llu",
>
> WARNING: space prohibited between function name and open parenthesis '('
> #85: FILE: include/trace/events/iocost.h:85:
> + TP_STRUCT__entry (
>
> WARNING: space prohibited between function name and open parenthesis '('
> #149: FILE: include/trace/events/iocost.h:149:
> + TP_STRUCT__entry (
>
> WARNING: space prohibited between function name and open parenthesis '('
> #190: FILE: include/trace/events/iocost.h:190:
> + TP_STRUCT__entry (
>
> total: 0 errors, 6 warnings, 225 lines checked
>
> net/sched/cls_rsvp.h:231: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
>
> false positive.
> no changes made.
> a for loop will require 2 semicolons as per the rules of C.
> we can maybe have a check for this rule where it can be ignored when
> it is in a for loop ? or have a check for the number of consecutive semicolons be less than 2.
>
> net/sched/cls_u32.c:782: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
>
> false positive.
> no changes made.
> a for loop will require 2 semicolons as per the rules of C.
>
> drivers/net/ethernet/mediatek/mtk_star_emac.c:1089:
> WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
>
> false positive.
> no changes made.
> a for loop will require 2 semicolons as per the rules of C.
>
> arch/ia64/include/asm/mca_asm.h:139: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
>
> arch/ia64/include/asm/mca_asm.h:213: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
>
> arch/ia64/include/asm/native/inst.h:79: WARNING:ONE_SEMICOLON:
> Statements terminations use 1 semicolon
>
> arch/ia64/kernel/minstate.h:14: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
>
> arch/ia64/kernel/minstate.h:151: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
>
> arch/ia64/kernel/minstate.h:213: WARNING:ONE_SEMICOLON: Statements
> terminations use 1 semicolon
>
> false positive.
> i am not entirely sure of this rule,
> but what i noticed is that the place where ";;"
> is used is all under #define. I am not entirely sure of it's
> function in c under .h files. Can you help me out on that one ?
> but other than that, i am positive it shouldn't be removed,
> or else the function might get altered or it might result in an error.
>
> change log :
>
>  drivers/gpu/drm/nouveau/nouveau_gem.c | 2 +-
>  drivers/mtd/ubi/block.c               | 2 +-
>  fs/block_dev.c                        | 2 +-
>  include/trace/events/iocost.h         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>

Okay, now you at least provide a commit message.

Your commit message still looks like an unstructured set of notes with
various personal comments, but not a properly summarizing technical
description of the motivation of your changes and an argument why it
improves the code (fixes an issue the kernel community should care
about to pick this patch).

Further, I suggest you identify which person you would need to send a
change for each file.

If the group of people to send the change to is different, split the
change into separate patches and only mention the relevant information
for each separate patch.

Good luck.

Lukas

> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 5b27845075a1..d476940ee97c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -339,7 +339,7 @@ nouveau_gem_set_domain(struct drm_gem_object *gem, uint32_t read_domains,
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
>                 dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");
> -               goto out_free_dev;;
> +               goto out_free_dev;
>         }
>
>
> diff --git a/fs/block_dev.c b/fs/block_dev.c
> index 9ef4f1fc2cb0..61b938fa5d5b 100644
> --- a/fs/block_dev.c
> +++ b/fs/block_dev.c
> @@ -1268,7 +1268,7 @@ static int blkdev_get_whole(struct block_device *bdev, fmode_t mode)
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
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
