Return-Path: <SRS0=qNgb=MY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0F0C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Aug 2021 08:37:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ACDA60F59
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  1 Aug 2021 08:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1ACDA60F59
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E18DE4036A;
	Sun,  1 Aug 2021 08:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bhXEzuE_POQ0; Sun,  1 Aug 2021 08:37:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 06B174021C;
	Sun,  1 Aug 2021 08:37:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2094C0010;
	Sun,  1 Aug 2021 08:37:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21B30C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 08:37:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14BFB605F0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 08:37:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id glmp1flu0cq2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 08:37:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87744605EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  1 Aug 2021 08:37:15 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id a201so7195491ybg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 01 Aug 2021 01:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UBElcmpWAVNnFA5dSIhBmWTa4qt/dqfR6gMjnlfq4XY=;
 b=PwJ0oLwgwrOXgqr/TG0aftqv0PHqCjeiT1fkDcvmhn0zWOrVfwhYEe5y7rdlMhB3pE
 4JU4pfHrRTDnTGVW7rMclhuaah+1DUo96+Im9NTUXKDnQLFSEcM+FnD73dzKMPkE94wS
 q/PSfxL8al4CoG3tSPRskr4dpe+u/QRxhxDwfq3EmjG1KYTd7ZdbYAA/dpuzZudw1uCM
 BOIcz+BFTbxj2BgNha9HjQOAXivxN29JY0IFfriwFe7ETDbFlX+IpG3XlNgJx3wJq3eF
 aTNGp5AVb7hWPaqR8o2Www4xFewXIn1XWzig0Vo9Qsg7af5EO7YWlvXnZ/b/57liNmIB
 qjcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UBElcmpWAVNnFA5dSIhBmWTa4qt/dqfR6gMjnlfq4XY=;
 b=ORYJeZW4gO8EdKGKlz8Y02TD+/SsXByc0NejEJIEtRw53Z1UhusnvjlNiTC5o7Zn5D
 5l3FBj7xAH7ZF8ff88MhKLCi3of50JO5gP6f9isxtIgBpjIWusxQGdyAndYyhZSR4WWq
 DV8NdVDD+hMkACfdhdZ3QTVuipgVTwJdCDF7NSylDC+h0HN8n2L4p5zKr17qEvni9u0W
 r6tDbQf2/Ihb9clsiz7c+cvEBIWuaHY6wqPJI/R90yzFWFY4XfBhn8TKNn1JtHacXPgq
 1PDMkW8XFaEHuYoF+VxuYuYaCXZuUUvRJWrmKw4PqOuzMXEwj6ysW7pyRdaBEQACXA5O
 4spA==
X-Gm-Message-State: AOAM532rehXKfvc5GNg1FR/8gz5hwWGGqd05Me9D0i9BGbPX/fjAERnV
 axLHm+WvLH79FFFVpr+qI4k43TIQY1XgJiSfApM=
X-Google-Smtp-Source: ABdhPJybugE/gfwmrPD9DxlB9udMhPPwsxmnOoIfl6+HsYz+WEPQ7A0kCv0SxMTkYum+0rBnvYfFbdH+fJI2bM3N2Qo=
X-Received: by 2002:a25:8b86:: with SMTP id j6mr13154643ybl.470.1627807034265; 
 Sun, 01 Aug 2021 01:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <CADywMdo5PQQv563Ziir_uTaDFEqQDkjkEERfsSVN23AFvV7m-w@mail.gmail.com>
In-Reply-To: <CADywMdo5PQQv563Ziir_uTaDFEqQDkjkEERfsSVN23AFvV7m-w@mail.gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 1 Aug 2021 10:39:41 +0200
Message-ID: <CAKXUXMz9S2pL1RNHkPUX+jm__+qU2dYzgGMyHLRoW6Oav+MbDA@mail.gmail.com>
Subject: Re: Submission of task 1 for checkpatch documentation mentorship
 program
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

Rahul, please see below the further tasks to continue.

On Sat, Jul 31, 2021 at 10:38 PM Rahul Balaji <rahulbalaji78@gmail.com> wrote:
>
> Respected mentor,
>
> Thank you for giving me the first task.
>
> The results after running checkpatch.pl on each of the files given is as below.
> I will do my best to explain each of the information presented in the result.
>
> https://www.kernel.org/doc/html/latest/dev-tools/checkpatch.html -- link to documentation used.
>
> As per my understanding, there are 3 different levels for the information generated.
> They are explained below from highest to lowest level of strictness.
>
> ERROR : requires immediate attention. They are most likely wrong.
> WARNING : requires careful review, but not as serious issue compared to ERROR.
> CHECK : requires a look, but it is of the mildest level.
> -----------------------------------------------------------------------------
> RESULT (1):
>
> ./scripts/checkpatch.pl drivers/mtd/ubi/block.c
>
> WARNING: quoted string split across lines
> #354: FILE: drivers/mtd/ubi/block.c:354:
> + pr_warn("UBI: block: volume size is not a multiple of 512, "
> + "last %llu bytes are ignored!\n",
>
> > message not present in documentation.
> > this warning, as stated, is generated because of the quoted strings being split across lines.
> > we can solve this by just keeping them in a single line.
> > if the last line ends with a quote and the next line also begins with a quote, then this issue will arise.
>
> WARNING: braces {} are not necessary for single statement blocks
> #374: FILE: drivers/mtd/ubi/block.c:374:
> + if (ret) {
> + return ret;
> + }
>
> > proper way to use braces is explained in the documentation, which is related to the message here.
> > single statement blocks don't require brackets, removing them will solve the issue.
> > proper way to use braces is explained in the documentation.
> > I believe it checks whether there is only one statement written between the braces. if condition is true, then warn the user.
>
> WARNING: Statements terminations use 1 semicolon
> #408: FILE: drivers/mtd/ubi/block.c:408:
> + goto out_free_dev;;
>
> > message not present in documentation.
> > using two semicolons resulted in this warning, can be solved by [ goto out_free_dev; ].
> > it checks if there is another semicolon (;) immediately after one, so if there is a ";;" anywhere, then it issues a warning.
>

We identified 13 violations of this rule (ONE_SEMICOLON) in the kernel
source code:

drivers/mtd/ubi/block.c:408: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

drivers/gpu/drm/nouveau/nouveau_gem.c:342: WARNING:ONE_SEMICOLON:
Statements terminations use 1 semicolon

fs/block_dev.c:1269: WARNING:ONE_SEMICOLON: Statements terminations
use 1 semicolon

include/trace/events/iocost.h:163: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon

net/sched/cls_rsvp.h:231: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon
net/sched/cls_u32.c:782: WARNING:ONE_SEMICOLON: Statements
terminations use 1 semicolon
drivers/net/ethernet/mediatek/mtk_star_emac.c:1089:
WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon

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

Your task is:
  - to identify if these violations are true positives and can be
fixed as you suggested or not.
  - if they can be fixed as you suggested, provide a patch fixing this
issue to the corresponding maintainer.

You can find various hints on how to create your first kernel patches on
https://www.kernel.org/doc/html/latest/process/submitting-patches.html.

Please first only send your first patches only to the
linux-kernel-mentees list, Dwaipayan and me, NOT to the official linux
kernel mailing lists that get_maintainers.pl suggests.

I suggest you start with a patch to drivers/mtd/ubi/block.c, and then
we see how to continue with the next patch.


Lukas

> total: 0 errors, 3 warnings, 697 lines checked
>
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inplace.
>
> drivers/mtd/ubi/block.c has style problems, please review.
>
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.
>
> -----------------------------------------------------------------
>
> RESULT (2):
>
> ./scripts/checkpatch.pl drivers/net/ethernet/amazon/ena/ena_netdev.c
>
> CHECK: multiple assignments should be avoided
> #282: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:282:
> + ena_tx_ctx->num_bufs = tx_info->num_of_bufs = 1;
>
> > message not in documentation.
> > this warning was triggered because it devtected the assigning of values to multiple variables in same statement using "=".
> > this can be solved by changing it to this instead,
> >
> > ena_tx_ctx->num_bufs = 1;
> > tx_info->num_of_bufs = 1;
>
> WARNING: nested (un)?likely() calls, IS_ERR already uses unlikely() internally
> #1025: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1025:
> + if (unlikely(IS_ERR(page)))
>
> > message not in documentation.
> > the error could have been caused because the "IS_ERR" function already
> > calls the "unlikely" function internally, and we pass the "IS_ERR" function through
> > "unlikely" function again, resulting in nested calls of the "unlikely" function.
> > this warning can be removed if the nested calls can be avoided.
>
> CHECK: Alignment should match open parenthesis
> #1533: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1533:
> +static void ena_rx_checksum(struct ena_ring *rx_ring,
> +   struct ena_com_rx_ctx *ena_rx_ctx,
>
> > message not in documentation.
> > this was caused because the 2nd line "struct ena_com_rx_ctx *ena_rx_ctx,"
> > was not aligned with the opening parenthesis of the first line "(".
> > aligning it should remove the message.
>
> CHECK: Unnecessary parentheses around 'ena_rx_ctx->l3_proto == ENA_ETH_IO_L3_PROTO_IPV4'
> #1549: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1549:
> + if (unlikely((ena_rx_ctx->l3_proto == ENA_ETH_IO_L3_PROTO_IPV4) &&
> +     (ena_rx_ctx->l3_csum_err))) {
>
> CHECK: Unnecessary parentheses around 'ena_rx_ctx->l3_csum_err'
> #1549: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1549:
> + if (unlikely((ena_rx_ctx->l3_proto == ENA_ETH_IO_L3_PROTO_IPV4) &&
> +     (ena_rx_ctx->l3_csum_err))) {
>
> > message explained in documentation.
> > caused by unnecessary parentheses.
> > message can be removed by changing to,
> >
> >if (unlikely(ena_rx_ctx->l3_proto == ENA_ETH_IO_L3_PROTO_IPV4 &&
> >     ena_rx_ctx->l3_csum_err)) {
>
> CHECK: Unnecessary parentheses around 'ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_TCP'
> #1561: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1561:
> + if (likely((ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_TCP) ||
> +   (ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_UDP))) {
>
> CHECK: Unnecessary parentheses around 'ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_UDP'
> #1561: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1561:
> + if (likely((ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_TCP) ||
> +   (ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_UDP))) {
>
> > unnecessary parentheses, as explained in the previous example.
>
> CHECK: Blank lines aren't necessary before a close brace '}'
> #1587: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1587:
> +
> +}
>
> > proper usage of braces is explained in the documentation, which is related to this message.
> > as stated, it is caused due to the blank line before the closing brace.
> > removing the blank line should close the message.
>
> CHECK: Unnecessary parentheses around 'ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_TCP'
> #1596: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1596:
> + if (likely((ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_TCP) ||
> +   (ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_UDP)))
>
> > unnecessary parentheses, as explained in the previous example.
>
> CHECK: Unnecessary parentheses around 'ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_UDP'
> #1596: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1596:
> + if (likely((ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_TCP) ||
> +   (ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_UDP)))
>
> > unnecessary parentheses, as explained in the previous example.
>
> CHECK: Please use a blank line after function/struct/union/enum declarations
> #1636: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1636:
> +}
> +/* ena_clean_rx_irq - Cleanup RX irq
>
> > message not present in docs for checkpatch.
> > we should use a blank line after declaring a function/struct/enum.
> > adding a blank line after the closing brace should remove the message.
>
> CHECK: Alignment should match open parenthesis
> #1820: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1820:
> +static void ena_unmask_interrupt(struct ena_ring *tx_ring,
> + struct ena_ring *rx_ring)
>
> > the 2nd line not aligned properly with the opening parenthesis of the first.
> > explained in a previous example.
>
> CHECK: Alignment should match open parenthesis
> #1852: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1852:
> +static void ena_update_ring_numa_node(struct ena_ring *tx_ring,
> +     struct ena_ring *rx_ring)
>
> > the 2nd line not aligned properly with the opening parenthesis of the first.
> > explained in a previous example.
>
> WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> #2621: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:2621:
> + netif_dbg(adapter, ifup, adapter->netdev, "%s\n", __func__);
>
> WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> #2683: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:2683:
> + netif_info(adapter, ifdown, adapter->netdev, "%s\n", __func__);
>
> WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> #2771: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:2771:
> + netif_dbg(adapter, ifdown, netdev, "%s\n", __func__);
>
> > no explanation for this message was available in the documentation for checkpatch.
> > To my understanding, ftrace is a function that is used in development of
> > linux kernel to understand and analyse any function that takes place out of user-space.
> > so here, i believe that netif_dbg, netif_info, and netif_dbg are functions that
> > carry out a task that can also be done by ftrace, which could be even more efficient.
> > so usage of ftrace is preferred so that we get better information of that function which is analysed.
>
> CHECK: Unnecessary parentheses around 'skb->ip_summed == CHECKSUM_PARTIAL'
> #2855: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:2855:
> + if ((skb->ip_summed == CHECKSUM_PARTIAL) || mss) {
>
> > unnecessary parentheses, as explained in the previous example.
>
> CHECK: Unnecessary parentheses around 'num_frags == tx_ring->sgl_size'
> #2912: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:2912:
> + if ((num_frags == tx_ring->sgl_size) &&
> +    (header_len < tx_ring->tx_max_header_size))
>
> > unnecessary parentheses, as explained in the previous example.
>
> CHECK: Unnecessary parentheses around 'header_len < tx_ring->tx_max_header_size'
> #2912: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:2912:
> + if ((num_frags == tx_ring->sgl_size) &&
> +    (header_len < tx_ring->tx_max_header_size))
>
> > unnecessary parentheses, as explained in the previous example.
>
> WARNING: LINUX_VERSION_CODE should be avoided, code should be for the version to which it is merged
> #3168: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3168:
> + host_info->kernel_ver = LINUX_VERSION_CODE;
>
> > an exact number of the kernel version to which it will be merged
> > should be assigned to host_info->kernel_ver rather than another variable.
>
> WARNING: Prefer strscpy over strlcpy - see: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
> #3169: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3169:
> + strlcpy(host_info->kernel_ver_str, utsname()->version,
>
> > strlcpy() function limits the destination size, and is depreciated.
> > using strscpy() should remove the warning.
>
> CHECK: line length of 101 exceeds 100 columns
> #3365: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3365:
> +   struct ena_llq_configurations *llq_default_configurations)
>
> > line length exceeds 100 columns. message will be removed if it is split to multiple lines.
> > explained in the docs.
>
> CHECK: Alignment should match open parenthesis
> #3373: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3373:
> + dev_warn(&pdev->dev,
> + "LLQ is not supported Fallback to host mode policy.\n");
>
> > the 2nd line not aligned properly with the opening parenthesis of the first.
> > explained in a previous example.
>
> WARNING: memory barrier without comment
> #3698: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3698:
> + smp_mb__before_atomic();
>
> WARNING: memory barrier without comment
> #3737: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3737:
> + smp_mb__before_atomic();
>
> > no documentation is given for this message in checkpatch.
> > to my understanding, this is caused because there is no
> > proper comment to this function call giving the context on why it is called in that line.
> > adding a comment that gives proper context should remove the message.
>
> CHECK: line length of 119 exceeds 100 columns
> #3747: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3747:
> + time_since_last_napi = jiffies_to_usecs(jiffies - tx_ring->tx_stats.last_napi_jiffies);
>
> CHECK: line length of 105 exceeds 100 columns
> #3748: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3748:
> + missing_tx_comp_to = jiffies_to_msecs(adapter->missing_tx_completion_to);
>
> CHECK: line length of 104 exceeds 100 columns
> #3751: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3751:
> +     tx_ring->qid, i, time_since_last_napi, missing_tx_comp_to);
>
> > line length exceeds 100 columns. message will be removed if it is split to multiple lines.
>
> CHECK: Please don't use multiple blank lines
> #4139: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:4139:
> +
> +
>
> > multiple blank lines caused the message. removing them should do it.
>
> WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> #4228: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:4228:
> + dev_dbg(&pdev->dev, "%s\n", __func__);
>
> > using ftrace is encouraged instead of the above fn. explained in an example before.
>
> CHECK: Unnecessary parentheses around 'adapter->msix_vecs >= 1'
> #4464: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:4464:
> + if ((adapter->msix_vecs >= 1) && (netdev->rx_cpu_rmap)) {
>
> CHECK: Unnecessary parentheses around 'netdev->rx_cpu_rmap'
> #4464: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:4464:
> + if ((adapter->msix_vecs >= 1) && (netdev->rx_cpu_rmap)) {
>
> > discussed in a previous example.
>
> WARNING: Unnecessary ftrace-like logging - prefer using ftrace
> #4612: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:4612:
> + netif_dbg(adapter, ifup, adapter->netdev, "%s\n", __func__);
>
> > discussed in a previous example.
>
> total: 0 errors, 10 warnings, 23 checks, 4689 lines checked
>
> NOTE: For some of the reported defects, checkpatch may be able to
>       mechanically convert to the typical style using --fix or --fix-inplace.
>
> drivers/net/ethernet/amazon/ena/ena_netdev.c has style problems, please review.
>
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS
>
> --------------------------------------------------------------------------------------------------------------
>
> I hope I have answered all the questions asked as per the first task. If there is any clarification or further explanation required,
> please do let me know so that i can expand further on this answer. Thank you for this opportunity. I eagerly await my second task.
>
> sincerely,
> Rahul.
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
