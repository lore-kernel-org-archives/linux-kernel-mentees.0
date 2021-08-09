Return-Path: <SRS0=BNRj=NA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 415C9C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Aug 2021 20:57:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB15E60C41
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  9 Aug 2021 20:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CB15E60C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89A96403EA;
	Mon,  9 Aug 2021 20:57:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egSerB2n7FPo; Mon,  9 Aug 2021 20:57:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 2400540325;
	Mon,  9 Aug 2021 20:57:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F2660C0010;
	Mon,  9 Aug 2021 20:57:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1A4FFC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 20:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0F0B82560
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 20:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mX96rz_j8FGI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 20:57:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F35FB8246D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  9 Aug 2021 20:57:37 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id a201so31993959ybg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 09 Aug 2021 13:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o9mV91JkBLyHVtsPKTG6yaiVYdCGePD642dwHbklRYc=;
 b=nyyj3SPf5G6gU2oHnQ8i1LwUhXSBUKDs6MuCY4p3XgM/9pAWtb8EyA+A+POGCvvbnH
 vfHaWrvK8x44O7+ZH1GI3lS+itw7wE6vrvWgKwOzpOFZZrvD3WCE5nwITEgqjr2m2W4y
 035zlx/mGZTESORaKKYDu5Up8zkOGgL2Khy/cQJqdHhmD9TSfylyf76XIw6Cp4LH+F9U
 mwl/5LwBgnExw67vlLd2FZlLPU07Go5oFQHxq+9M3K5UDkpVkWkME+fy+2XhD42VtYbx
 wzq4xIhtVoqTg6cNX8dibZ3rDLmCLljPlBaqfwzo7UzbgtTTkAPmjiHrt8EjnoJsOxk0
 aCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o9mV91JkBLyHVtsPKTG6yaiVYdCGePD642dwHbklRYc=;
 b=cxNktu8ph36eMhtpqlcmXJ00IoHLnqLCYs1Rfou0o5HOxa3+6mI+mTyC0Vo0yV8uwk
 6rdYpTfGRHWh1sU18lBxLPAPtNaQbONUAgzzXr8aLCqjVawvJYnqMVuNlQ2TpFLrp1+K
 fs8IfA8nAHqOeLIjk/UEFvTpnl0P8wpDuBBzK9g7O4QzATOiY86u2m4DnC/pEIs5kJ8e
 d7mW3mWjnoF6sa0lILVsfDPoRCPJhBRg4lYolzaNsTyQ7hezUJZE22BVwGeinmuPSpHG
 8BYfwmhXMEpdkx9aqO/790DaUFUsrC7k7wRW26mOvwaRhniP9WSf0dcH6xoXdcI3/G5g
 cN0g==
X-Gm-Message-State: AOAM531P2Kx5AITM/D/3IM9lpPtUXthy4h1EBVkQt/mQZB5h25oci6E9
 WsLsYsDIsIZRU2DAgkaiF5YJ50hyfvblgo36Y+o=
X-Google-Smtp-Source: ABdhPJy8jcsGlOPGWAhxCrI1GrVNIW7JlFxkM0C4gEn/y+5yE4GzijeUZaorcPZ2diSY6fVAs+km1A5brdn8ke7BG4Y=
X-Received: by 2002:a25:ea52:: with SMTP id o18mr35703178ybe.150.1628542656876; 
 Mon, 09 Aug 2021 13:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210803141049.80422-1-rahulbalaji78@gmail.com>
 <CADywMdrQshHBoVCZ8t9Z6GM0Qib8TA17DtnG9BctCPOO19O=jQ@mail.gmail.com>
In-Reply-To: <CADywMdrQshHBoVCZ8t9Z6GM0Qib8TA17DtnG9BctCPOO19O=jQ@mail.gmail.com>
From: Rahul Balaji <rahulbalaji78@gmail.com>
Date: Tue, 10 Aug 2021 00:57:25 +0400
Message-ID: <CADywMdr1pjT++ndzBOtaN8oS3c7MGaydg9X02Dwc0eWRiMLdWw@mail.gmail.com>
Subject: Re: [PATCH v2] Task2: checkpatch.pl documentation mentorship: Remove
 semicolon warnings
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>
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
Content-Type: multipart/mixed; boundary="===============3619470922840500189=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============3619470922840500189==
Content-Type: multipart/alternative; boundary="0000000000009091c505c926a2c6"

--0000000000009091c505c926a2c6
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Aug 2021, 6:13 pm Rahul Balaji, <rahulbalaji78@gmail.com> wrote:

> Respected mentor,
>
> Here are explanations for the changes I made.
>
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
> WARNING: Avoid multiple line dereference - prefer
> 'nvbo->bo.resource->num_pages'
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
> WARNING: EXPORT_SYMBOL(foo); should immediately follow its
> function/variable
> #171: FILE: fs/block_dev.c:171:
> +EXPORT_SYMBOL(set_blocksize);
>
> WARNING: Block comments use a trailing */ on a separate line
> #178: FILE: fs/block_dev.c:178:
> + * and it's value is between 512 and PAGE_SIZE */
>
> WARNING: EXPORT_SYMBOL(foo); should immediately follow its
> function/variable
> #184: FILE: fs/block_dev.c:184:
> +EXPORT_SYMBOL(sb_set_blocksize);
>
> WARNING: Missing a blank line after declarations
> #189: FILE: fs/block_dev.c:189:
> + int minsize = bdev_logical_block_size(sb->s_bdev);
> + if (size < minsize)
>
> WARNING: EXPORT_SYMBOL(foo); should immediately follow its
> function/variable
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
> +^I^Ireturn true; ^I /* is a partition of a device that is being
> partitioned */$
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
> +static long block_ioctl(struct file *file, unsigned cmd, unsigned long
> arg)
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
> it is in a for loop ? or have a check for the number of consecutive
> semicolons be less than 2.
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

Respected mentors,

please do find the  explanations to my changes quoted above.
I had already explained them in my previous mail, maybe this was not
present in the previous mail due to some issue.

Regards,
Rahul.

--0000000000009091c505c926a2c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"auto"><div class=3D=
"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 3 Aug 2021, 6:1=
3 pm Rahul Balaji, &lt;<a href=3D"mailto:rahulbalaji78@gmail.com" target=3D=
"_blank">rahulbalaji78@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">Respected mentor,<div><br=
></div><div>Here are explanations for the changes I made.</div><div><br></d=
iv><div><br></div><div>drivers/mtd/ubi/block.c:408: WARNING:ONE_SEMICOLON: =
Statements<br>terminations use 1 semicolon<br><br>removed the extra semicol=
on that caused the warning.<br>No functional change.<br>true positive.<br>f=
ile showed no errors on make.<br><br><a href=3D"http://checkpatch.pl" rel=
=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> on this file after chan=
ge :<br><br>WARNING: quoted string split across lines<br>#354: FILE: driver=
s/mtd/ubi/block.c:354:<br>+		pr_warn(&quot;UBI: block: volume size is not a=
 multiple of 512, &quot;<br>+			&quot;last %llu bytes are ignored!\n&quot;,=
<br><br>WARNING: braces {} are not necessary for single statement blocks<br=
>#374: FILE: drivers/mtd/ubi/block.c:374:<br>+	if (ret) {<br>+		return ret;=
<br>+	}<br><br>total: 0 errors, 2 warnings, 697 lines checked<br><br>driver=
s/gpu/drm/nouveau/nouveau_gem.c:342: WARNING:ONE_SEMICOLON:<br>Statements t=
erminations use 1 semicolon<br><br>removed the extra semicolon that caused =
the warning.<br>no functional change.<br>true positive.<br>file showed no e=
rrors on make.<br><br><a href=3D"http://checkpatch.pl" rel=3D"noreferrer" t=
arget=3D"_blank">checkpatch.pl</a> on this file after change :<br><br>WARNI=
NG: Missing or malformed SPDX-License-Identifier tag in line 1<br>#1: FILE:=
 drivers/gpu/drm/nouveau/nouveau_gem.c:1:<br>+/*<br><br>ERROR: do not use a=
ssignment in if condition<br>#165: FILE: drivers/gpu/drm/nouveau/nouveau_ge=
m.c:165:<br>+	if (!(work =3D kmalloc(sizeof(*work), GFP_KERNEL))) {<br><br>=
ERROR: space prohibited after that &#39;&amp;&#39; (ctx:WxW)<br>#183: FILE:=
 drivers/gpu/drm/nouveau/nouveau_gem.c:183:<br>+	struct nouveau_vmm *vmm =
=3D cli-&gt;svm.cli ? &amp;cli-&gt;svm : &amp; cli-&gt;vmm;<br>=C2=A0	 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^<br><br>WARNING: Block comments use a trai=
ling */ on a separate line<br>#241: FILE: drivers/gpu/drm/nouveau/nouveau_g=
em.c:241:<br>+	 * to the caller, instead of a normal nouveau_bo ttm referen=
ce. */<br><br>WARNING: suspect code indent for conditional statements (8, 8=
)<br>#298: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:298:<br>+	else<br>+	=
if (cli-&gt;device.info.family &gt;=3D NV_DEVICE_INFO_V0_TESLA)<br><br>WARN=
ING: quoted string split across lines<br>#458: FILE: drivers/gpu/drm/nouvea=
u/nouveau_gem.c:458:<br>+			NV_PRINTK(err, cli, &quot;multiple instances of=
 buffer %d on &quot;<br>+				 =C2=A0 =C2=A0 =C2=A0&quot;validation list\n&q=
uot;, b-&gt;handle);<br><br>WARNING: Missing a blank line after declaration=
s<br>#486: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:486:<br>+			struct n=
ouveau_vma *vma =3D nouveau_vma_find(nvbo, vmm);<br>+			if (!vma) {<br><br>=
WARNING: suspect code indent for conditional statements (16, 16)<br>#502: F=
ILE: drivers/gpu/drm/nouveau/nouveau_gem.c:502:<br>+		else<br>+		if (b-&gt;=
valid_domains &amp; NOUVEAU_GEM_DOMAIN_VRAM)<br><br>WARNING: suspect code i=
ndent for conditional statements (16, 16)<br>#505: FILE: drivers/gpu/drm/no=
uveau/nouveau_gem.c:505:<br>+		else<br>+		if (b-&gt;valid_domains &amp; NOU=
VEAU_GEM_DOMAIN_GART)<br><br>WARNING: Prefer &#39;unsigned int&#39; to bare=
 use of &#39;unsigned&#39;<br>#625: FILE: drivers/gpu/drm/nouveau/nouveau_g=
em.c:625:<br>+u_memcpya(uint64_t user, unsigned nmemb, unsigned size)<br><b=
r>WARNING: Prefer &#39;unsigned int&#39; to bare use of &#39;unsigned&#39;<=
br>#625: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:625:<br>+u_memcpya(uin=
t64_t user, unsigned nmemb, unsigned size)<br><br>WARNING: Prefer &#39;unsi=
gned int&#39; to bare use of &#39;unsigned&#39;<br>#651: FILE: drivers/gpu/=
drm/nouveau/nouveau_gem.c:651:<br>+	unsigned i;<br><br>WARNING: suspect cod=
e indent for conditional statements (16, 16)<br>#695: FILE: drivers/gpu/drm=
/nouveau/nouveau_gem.c:695:<br>+		else<br>+		if (r-&gt;flags &amp; NOUVEAU_=
GEM_RELOC_HIGH)<br><br>WARNING: suspect code indent for conditional stateme=
nts (8, 8)<br>#841: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:841:<br>+	}=
 else<br>+	if (drm-&gt;client.device.info.chipset &gt;=3D 0x25) {<br><br>WA=
RNING: Avoid multiple line dereference - prefer &#39;nvbo-&gt;bo.resource-&=
gt;num_pages&#39;<br>#874: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:874:=
<br>+							 =C2=A0nvbo-&gt;bo.resource-&gt;<br>+							 =C2=A0num_pages,<b=
r><br>ERROR: do not use assignment in if condition<br>#902: FILE: drivers/g=
pu/drm/nouveau/nouveau_gem.c:902:<br>+		if (!(ret =3D nouveau_fence_wait(fe=
nce, false, false))) {<br><br>ERROR: do not use assignment in if condition<=
br>#903: FILE: drivers/gpu/drm/nouveau/nouveau_gem.c:903:<br>+			if ((ret =
=3D dma_fence_get_status(&amp;fence-&gt;base)) =3D=3D 1)<br><br>WARNING: su=
spect code indent for conditional statements (8, 8)<br>#937: FILE: drivers/=
gpu/drm/nouveau/nouveau_gem.c:937:<br>+	} else<br>+	if (drm-&gt;client.devi=
ce.info.chipset &gt;=3D 0x25) {<br><br>total: 4 errors, 14 warnings, 1016 l=
ines checked<br><br>fs/block_dev.c:1271: WARNING:ONE_SEMICOLON: Statements =
terminations<br>use 1 semicolon<br><br>removed the semicolon that caused th=
e warning.<br>no functional changes.<br>true positive.<br>file showed no er=
rors on make.<br><br><a href=3D"http://checkpatch.pl" rel=3D"noreferrer" ta=
rget=3D"_blank">checkpatch.pl</a> on this file after change:<br><br>WARNING=
: Missing a blank line after declarations<br>#68: FILE: fs/block_dev.c:68:<=
br>+			char name[BDEVNAME_SIZE];<br>+			pr_warn_ratelimited(&quot;VFS: Dirt=
y inode writeback failed &quot;<br><br>WARNING: quoted string split across =
lines<br>#69: FILE: fs/block_dev.c:69:<br>+			pr_warn_ratelimited(&quot;VFS=
: Dirty inode writeback failed &quot;<br>+					 =C2=A0 =C2=A0&quot;for bloc=
k device %s (err=3D%d).\n&quot;,<br><br>WARNING: Missing a blank line after=
 declarations<br>#120: FILE: fs/block_dev.c:120:<br>+		int err =3D bd_prepa=
re_to_claim(bdev, truncate_bdev_range);<br>+		if (err)<br><br>WARNING: EXPO=
RT_SYMBOL(foo); should immediately follow its function/variable<br>#171: FI=
LE: fs/block_dev.c:171:<br>+EXPORT_SYMBOL(set_blocksize);<br><br>WARNING: B=
lock comments use a trailing */ on a separate line<br>#178: FILE: fs/block_=
dev.c:178:<br>+	 * and it&#39;s value is between 512 and PAGE_SIZE */<br><b=
r>WARNING: EXPORT_SYMBOL(foo); should immediately follow its function/varia=
ble<br>#184: FILE: fs/block_dev.c:184:<br>+EXPORT_SYMBOL(sb_set_blocksize);=
<br><br>WARNING: Missing a blank line after declarations<br>#189: FILE: fs/=
block_dev.c:189:<br>+	int minsize =3D bdev_logical_block_size(sb-&gt;s_bdev=
);<br>+	if (size &lt; minsize)<br><br>WARNING: EXPORT_SYMBOL(foo); should i=
mmediately follow its function/variable<br>#194: FILE: fs/block_dev.c:194:<=
br>+EXPORT_SYMBOL(sb_min_blocksize);<br><br>WARNING: Missing a blank line a=
fter declarations<br>#547: FILE: fs/block_dev.c:547:<br>+	struct super_bloc=
k *sb =3D get_super(bdev);<br>+	if (sb) {<br><br>WARNING: Missing a blank l=
ine after declarations<br>#549: FILE: fs/block_dev.c:549:<br>+		int res =3D=
 sync_filesystem(sb);<br>+		drop_super(sb);<br><br>ERROR: &quot;foo * bar&q=
uot; should be &quot;foo *bar&quot;<br>#642: FILE: fs/block_dev.c:642:<br>+=
static int blkdev_readpage(struct file * file, struct page * page)<br><br>E=
RROR: &quot;foo * bar&quot; should be &quot;foo *bar&quot;<br>#642: FILE: f=
s/block_dev.c:642:<br>+static int blkdev_readpage(struct file * file, struc=
t page * page)<br><br>WARNING: Prefer &#39;unsigned int&#39; to bare use of=
 &#39;unsigned&#39;<br>#653: FILE: fs/block_dev.c:653:<br>+			loff_t pos, u=
nsigned len, unsigned flags,<br><br>WARNING: Prefer &#39;unsigned int&#39; =
to bare use of &#39;unsigned&#39;<br>#653: FILE: fs/block_dev.c:653:<br>+		=
	loff_t pos, unsigned len, unsigned flags,<br><br>WARNING: Prefer &#39;unsi=
gned int&#39; to bare use of &#39;unsigned&#39;<br>#661: FILE: fs/block_dev=
.c:661:<br>+			loff_t pos, unsigned len, unsigned copied,<br><br>WARNING: P=
refer &#39;unsigned int&#39; to bare use of &#39;unsigned&#39;<br>#661: FIL=
E: fs/block_dev.c:661:<br>+			loff_t pos, unsigned len, unsigned copied,<br=
><br>WARNING: Missing a blank line after declarations<br>#665: FILE: fs/blo=
ck_dev.c:665:<br>+	int ret;<br>+	ret =3D block_write_end(file, mapping, pos=
, len, copied, page, fsdata);<br><br>ERROR: trailing whitespace<br>#688: FI=
LE: fs/block_dev.c:688:<br>+^I$<br><br>ERROR: trailing whitespace<br>#694: =
FILE: fs/block_dev.c:694:<br>+^I$<br><br>ERROR: &quot;foo * bar&quot; shoul=
d be &quot;foo *bar&quot;<br>#795: FILE: fs/block_dev.c:795:<br>+static str=
uct kmem_cache * bdev_cachep __read_mostly;<br><br>WARNING: Missing a blank=
 line after declarations<br>#830: FILE: fs/block_dev.c:830:<br>+	struct blo=
ck_device *bdev =3D &amp;BDEV_I(inode)-&gt;bdev;<br>+	truncate_inode_pages_=
final(&amp;inode-&gt;i_data);<br><br>WARNING: Missing a blank line after de=
clarations<br>#852: FILE: fs/block_dev.c:852:<br>+	struct pseudo_fs_context=
 *ctx =3D init_pseudo(fc, BDEVFS_MAGIC);<br>+	if (!ctx)<br><br>ERROR: trail=
ing whitespace<br>#967: FILE: fs/block_dev.c:967:<br>+ $<br><br>WARNING: pl=
ease, no spaces at the start of a line<br>#967: FILE: fs/block_dev.c:967:<b=
r>+ $<br><br>WARNING: please, no space before tabs<br>#988: FILE: fs/block_=
dev.c:988:<br>+^I^Ireturn false; ^I /* held by someone else */$<br><br>WARN=
ING: please, no space before tabs<br>#990: FILE: fs/block_dev.c:990:<br>+^I=
^Ireturn true; =C2=A0^I /* is a whole device which isn&#39;t held */$<br><b=
r>WARNING: please, no space before tabs<br>#993: FILE: fs/block_dev.c:993:<=
br>+^I^Ireturn true; ^I /* is a partition of a device that is being partiti=
oned */$<br><br>ERROR: &quot;foo * bar&quot; should be &quot;foo *bar&quot;=
<br>#1491: FILE: fs/block_dev.c:1491:<br>+static int blkdev_open(struct ino=
de * inode, struct file * filp)<br><br>ERROR: &quot;foo * bar&quot; should =
be &quot;foo *bar&quot;<br>#1491: FILE: fs/block_dev.c:1491:<br>+static int=
 blkdev_open(struct inode * inode, struct file * filp)<br><br>ERROR: do not=
 use assignment in if condition<br>#1549: FILE: fs/block_dev.c:1549:<br>+		=
if ((bdev_free =3D !bdev-&gt;bd_holders))<br><br>ERROR: &quot;foo * bar&quo=
t; should be &quot;foo *bar&quot;<br>#1583: FILE: fs/block_dev.c:1583:<br>+=
static int blkdev_close(struct inode * inode, struct file * filp)<br><br>ER=
ROR: &quot;foo * bar&quot; should be &quot;foo *bar&quot;<br>#1583: FILE: f=
s/block_dev.c:1583:<br>+static int blkdev_close(struct inode * inode, struc=
t file * filp)<br><br>WARNING: Missing a blank line after declarations<br>#=
1586: FILE: fs/block_dev.c:1586:<br>+	struct block_device *bdev =3D I_BDEV(=
bdev_file_inode(filp));<br>+	blkdev_put(bdev, filp-&gt;f_mode);<br><br>WARN=
ING: Prefer &#39;unsigned int&#39; to bare use of &#39;unsigned&#39;<br>#15=
90: FILE: fs/block_dev.c:1590:<br>+static long block_ioctl(struct file *fil=
e, unsigned cmd, unsigned long arg)<br><br>total: 11 errors, 23 warnings, 1=
878 lines checked<br><br>include/trace/events/iocost.h:163: WARNING:ONE_SEM=
ICOLON: Statements<br>terminations use 1 semicolon<br><br>removed the extra=
 semicolon that caused the warning.<br>no functional change.<br>true positi=
ve.<br>showed no errors on &quot;make -j8 all&quot;.<br><br><a href=3D"http=
://checkpatch.pl" rel=3D"noreferrer" target=3D"_blank">checkpatch.pl</a> af=
ter changes :<br><br>WARNING: space prohibited between function name and op=
en parenthesis &#39;(&#39;<br>#21: FILE: include/trace/events/iocost.h:21:<=
br>+	TP_STRUCT__entry (<br><br>WARNING: quoted string split across lines<br=
>#52: FILE: include/trace/events/iocost.h:52:<br>+	TP_printk(&quot;[%s:%s] =
now=3D%llu:%llu vrate=3D%llu &quot;<br>+		 =C2=A0&quot;period=3D%llu-&gt;%l=
lu vtime=3D%llu &quot;<br><br>WARNING: quoted string split across lines<br>=
#53: FILE: include/trace/events/iocost.h:53:<br>+		 =C2=A0&quot;period=3D%l=
lu-&gt;%llu vtime=3D%llu &quot;<br>+		 =C2=A0&quot;weight=3D%u/%u hweight=
=3D%llu/%llu&quot;,<br><br>WARNING: space prohibited between function name =
and open parenthesis &#39;(&#39;<br>#85: FILE: include/trace/events/iocost.=
h:85:<br>+	TP_STRUCT__entry (<br><br>WARNING: space prohibited between func=
tion name and open parenthesis &#39;(&#39;<br>#149: FILE: include/trace/eve=
nts/iocost.h:149:<br>+	TP_STRUCT__entry (<br><br>WARNING: space prohibited =
between function name and open parenthesis &#39;(&#39;<br>#190: FILE: inclu=
de/trace/events/iocost.h:190:<br>+	TP_STRUCT__entry (<br><br>total: 0 error=
s, 6 warnings, 225 lines checked<br><br>net/sched/cls_rsvp.h:231: WARNING:O=
NE_SEMICOLON: Statements<br>terminations use 1 semicolon<br><br>false posit=
ive.<br>no changes made.<br>a for loop will require 2 semicolons as per the=
 rules of C.<br>we can maybe have a check for this rule where it can be ign=
ored when<br>it is in a for loop ? or have a check for the number of consec=
utive semicolons be less than 2.<br><br>net/sched/cls_u32.c:782: WARNING:ON=
E_SEMICOLON: Statements<br>terminations use 1 semicolon<br><br>false positi=
ve.<br>no changes made.<br>a for loop will require 2 semicolons as per the =
rules of C.<br><br>drivers/net/ethernet/mediatek/mtk_star_emac.c:1089:<br>W=
ARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon<br><br>false =
positive.<br>no changes made.<br>a for loop will require 2 semicolons as pe=
r the rules of C.<br><br>arch/ia64/include/asm/mca_asm.h:139: WARNING:ONE_S=
EMICOLON: Statements<br>terminations use 1 semicolon<br><br>arch/ia64/inclu=
de/asm/mca_asm.h:213: WARNING:ONE_SEMICOLON: Statements<br>terminations use=
 1 semicolon<br><br>arch/ia64/include/asm/native/inst.h:79: WARNING:ONE_SEM=
ICOLON:<br>Statements terminations use 1 semicolon<br><br>arch/ia64/kernel/=
minstate.h:14: WARNING:ONE_SEMICOLON: Statements<br>terminations use 1 semi=
colon<br><br>arch/ia64/kernel/minstate.h:151: WARNING:ONE_SEMICOLON: Statem=
ents<br>terminations use 1 semicolon<br><br>arch/ia64/kernel/minstate.h:213=
: WARNING:ONE_SEMICOLON: Statements<br>terminations use 1 semicolon<br><br>=
false positive.<br>i am not entirely sure of this rule,<br>but what i notic=
ed is that the place where &quot;;;&quot;<br>is used is all under #define. =
I am not entirely sure of it&#39;s<br>function in c under .h files. Can you=
 help me out on that one ?<br>but other than that, i am positive it shouldn=
&#39;t be removed,<br>or else the function might get altered or it might re=
sult in an error.</div></div></blockquote><div><br></div><div>Respected men=
tors,</div><div><br></div><div>please do find the=C2=A0 explanations to my =
changes quoted above.</div><div>I had already explained them in my previous=
 mail, maybe this was not present in the previous mail due to some issue.</=
div><div><br></div><div>Regards,=C2=A0</div><div>Rahul.</div></div></div>
</div>

--0000000000009091c505c926a2c6--

--===============3619470922840500189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============3619470922840500189==--
