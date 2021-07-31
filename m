Return-Path: <SRS0=pOiW=MX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E55C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Jul 2021 20:38:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B084260F70
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 31 Jul 2021 20:38:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B084260F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C5C3400F5;
	Sat, 31 Jul 2021 20:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2IDfOXYnRrkt; Sat, 31 Jul 2021 20:38:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 55EB1400C3;
	Sat, 31 Jul 2021 20:38:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1B038C0010;
	Sat, 31 Jul 2021 20:38:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3A61C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 20:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8F87605E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 20:38:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id geI7fkpd3acR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 20:38:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92D93605CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 20:38:06 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id g76so22080051ybf.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 31 Jul 2021 13:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=jlMTQ+ajK3y/LlgZL9ezJY1HBVhH8ZwmO6bT32JS0xA=;
 b=ZfqM/XOCnELlo4LKWy4zf0/kixFSvkE22S9aE7MT057kFTY9+YhH7cK98/c/TRPRVF
 SjyDgQaxBgGWku43v497fxtNnjKGuGllelI03dk4cm06V5LDNart4MPJMvpsYrWmnltO
 KBL8qizYD+TgclQnHIf0ctHmK7nCV6Js/eYJbp5NRJXnoFJbNmKsUCGYChflDSWHxUfg
 Ok1JHqYSGbxz1jGA5HNcECDuCJ50AV5JwwJlqTM9mQ1a0HCWOa44BngPo6yizcKItTdg
 QU+JM4NKUGjWZTQUe03fM7fnuyD2g2bmge+70DQg/ahfoFHozDdNyYQaIhEu1sdu9MmS
 tENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=jlMTQ+ajK3y/LlgZL9ezJY1HBVhH8ZwmO6bT32JS0xA=;
 b=Li7Cx7L517/InwwPf/3YDDpH2hu+Z+oKxs2UHI5F3/Nskx8uXKwZEfdfDEsYfhpHkK
 Kz+u/4Cn3M2BUrN3Tt7fTe+WjyL03rTSifhOoIZgGl6t/uGRENUODWm5aZu1IlLyZxes
 XeEZ1qapZUjkM4wyCHOcHzJo8G4QypaoJrrQsfVMvkaHVCAS+5VEx3VVXjt2mbx9K9Vh
 X6usNd4vTsKWq0pd4UbNb90XR4j572K4uf9Ucw2TiljuKLuLB4dqoFcoXq1Q12IRQVTa
 BT5aJaoV6z5nPHKl4cBt5Z+I8D6Uavxi+gHWzf5gfASvuPiAU2A+Xrc8JmOCA5p5DRC3
 6wEA==
X-Gm-Message-State: AOAM533IesnC06c9H/Kq2o64G9Zdr7f2AaWKLGIfgAixjpc7mVb5ODfn
 T7cgVRhTxgi2IidduQ9J+o41KbwyBhvpwiUbNMw=
X-Google-Smtp-Source: ABdhPJw/LYODj2vAfuMKNbieFM3h+Ud47YnSwIcIDjgIP8dHLwUPhgczfkRHwLTHgXXRgblZjP2FwzXq1LMVgPXu848=
X-Received: by 2002:a05:6902:134c:: with SMTP id
 g12mr10748475ybu.251.1627763885388; 
 Sat, 31 Jul 2021 13:38:05 -0700 (PDT)
MIME-Version: 1.0
From: Rahul Balaji <rahulbalaji78@gmail.com>
Date: Sun, 1 Aug 2021 00:37:54 +0400
Message-ID: <CADywMdo5PQQv563Ziir_uTaDFEqQDkjkEERfsSVN23AFvV7m-w@mail.gmail.com>
Subject: Submission of task 1 for checkpatch documentation mentorship program
To: lukas.bulwahn@gmail.com, Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Type: multipart/mixed; boundary="===============0457818462790052410=="
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

--===============0457818462790052410==
Content-Type: multipart/alternative; boundary="0000000000002ab7f005c871501f"

--0000000000002ab7f005c871501f
Content-Type: text/plain; charset="UTF-8"

Respected mentor,

Thank you for giving me the first task.

The results after running checkpatch.pl on each of the files given is as
below.
I will do my best to explain each of the information presented in the
result.

https://www.kernel.org/doc/html/latest/dev-tools/checkpatch.html -- link to
documentation used.

As per my understanding, there are 3 different levels for the information
generated.
They are explained below from highest to lowest level of strictness.

ERROR : requires immediate attention. They are most likely wrong.
WARNING : requires careful review, but not as serious issue compared to
ERROR.
CHECK : requires a look, but it is of the mildest level.
-----------------------------------------------------------------------------
RESULT (1):

./scripts/checkpatch.pl drivers/mtd/ubi/block.c

WARNING: quoted string split across lines
#354: FILE: drivers/mtd/ubi/block.c:354:
+ pr_warn("UBI: block: volume size is not a multiple of 512, "
+ "last %llu bytes are ignored!\n",

> message not present in documentation.
> this warning, as stated, is generated because of the quoted strings being
split across lines.
> we can solve this by just keeping them in a single line.
> if the last line ends with a quote and the next line also begins with a
quote, then this issue will arise.

WARNING: braces {} are not necessary for single statement blocks
#374: FILE: drivers/mtd/ubi/block.c:374:
+ if (ret) {
+ return ret;
+ }

> proper way to use braces is explained in the documentation, which is
related to the message here.
> single statement blocks don't require brackets, removing them will solve
the issue.
> proper way to use braces is explained in the documentation.
> I believe it checks whether there is only one statement written between
the braces. if condition is true, then warn the user.

WARNING: Statements terminations use 1 semicolon
#408: FILE: drivers/mtd/ubi/block.c:408:
+ goto out_free_dev;;

> message not present in documentation.
> using two semicolons resulted in this warning, can be solved by [ goto
out_free_dev; ].
> it checks if there is another semicolon (;) immediately after one, so if
there is a ";;" anywhere, then it issues a warning.

total: 0 errors, 3 warnings, 697 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or
--fix-inplace.

drivers/mtd/ubi/block.c has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.

-----------------------------------------------------------------

RESULT (2):

./scripts/checkpatch.pl drivers/net/ethernet/amazon/ena/ena_netdev.c

CHECK: multiple assignments should be avoided
#282: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:282:
+ ena_tx_ctx->num_bufs = tx_info->num_of_bufs = 1;

> message not in documentation.
> this warning was triggered because it devtected the assigning of values
to multiple variables in same statement using "=".
> this can be solved by changing it to this instead,
>
> ena_tx_ctx->num_bufs = 1;
> tx_info->num_of_bufs = 1;

WARNING: nested (un)?likely() calls, IS_ERR already uses unlikely()
internally
#1025: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1025:
+ if (unlikely(IS_ERR(page)))

> message not in documentation.
> the error could have been caused because the "IS_ERR" function already
> calls the "unlikely" function internally, and we pass the "IS_ERR"
function through
> "unlikely" function again, resulting in nested calls of the "unlikely"
function.
> this warning can be removed if the nested calls can be avoided.

CHECK: Alignment should match open parenthesis
#1533: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1533:
+static void ena_rx_checksum(struct ena_ring *rx_ring,
+   struct ena_com_rx_ctx *ena_rx_ctx,

> message not in documentation.
> this was caused because the 2nd line "struct ena_com_rx_ctx *ena_rx_ctx,"
> was not aligned with the opening parenthesis of the first line "(".
> aligning it should remove the message.

CHECK: Unnecessary parentheses around 'ena_rx_ctx->l3_proto ==
ENA_ETH_IO_L3_PROTO_IPV4'
#1549: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1549:
+ if (unlikely((ena_rx_ctx->l3_proto == ENA_ETH_IO_L3_PROTO_IPV4) &&
+     (ena_rx_ctx->l3_csum_err))) {

CHECK: Unnecessary parentheses around 'ena_rx_ctx->l3_csum_err'
#1549: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1549:
+ if (unlikely((ena_rx_ctx->l3_proto == ENA_ETH_IO_L3_PROTO_IPV4) &&
+     (ena_rx_ctx->l3_csum_err))) {

> message explained in documentation.
> caused by unnecessary parentheses.
> message can be removed by changing to,
>
>if (unlikely(ena_rx_ctx->l3_proto == ENA_ETH_IO_L3_PROTO_IPV4 &&
>     ena_rx_ctx->l3_csum_err)) {

CHECK: Unnecessary parentheses around 'ena_rx_ctx->l4_proto ==
ENA_ETH_IO_L4_PROTO_TCP'
#1561: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1561:
+ if (likely((ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_TCP) ||
+   (ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_UDP))) {

CHECK: Unnecessary parentheses around 'ena_rx_ctx->l4_proto ==
ENA_ETH_IO_L4_PROTO_UDP'
#1561: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1561:
+ if (likely((ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_TCP) ||
+   (ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_UDP))) {

> unnecessary parentheses, as explained in the previous example.

CHECK: Blank lines aren't necessary before a close brace '}'
#1587: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1587:
+
+}

> proper usage of braces is explained in the documentation, which is
related to this message.
> as stated, it is caused due to the blank line before the closing brace.
> removing the blank line should close the message.

CHECK: Unnecessary parentheses around 'ena_rx_ctx->l4_proto ==
ENA_ETH_IO_L4_PROTO_TCP'
#1596: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1596:
+ if (likely((ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_TCP) ||
+   (ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_UDP)))

> unnecessary parentheses, as explained in the previous example.

CHECK: Unnecessary parentheses around 'ena_rx_ctx->l4_proto ==
ENA_ETH_IO_L4_PROTO_UDP'
#1596: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1596:
+ if (likely((ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_TCP) ||
+   (ena_rx_ctx->l4_proto == ENA_ETH_IO_L4_PROTO_UDP)))

> unnecessary parentheses, as explained in the previous example.

CHECK: Please use a blank line after function/struct/union/enum declarations
#1636: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1636:
+}
+/* ena_clean_rx_irq - Cleanup RX irq

> message not present in docs for checkpatch.
> we should use a blank line after declaring a function/struct/enum.
> adding a blank line after the closing brace should remove the message.

CHECK: Alignment should match open parenthesis
#1820: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1820:
+static void ena_unmask_interrupt(struct ena_ring *tx_ring,
+ struct ena_ring *rx_ring)

> the 2nd line not aligned properly with the opening parenthesis of the
first.
> explained in a previous example.

CHECK: Alignment should match open parenthesis
#1852: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1852:
+static void ena_update_ring_numa_node(struct ena_ring *tx_ring,
+     struct ena_ring *rx_ring)

> the 2nd line not aligned properly with the opening parenthesis of the
first.
> explained in a previous example.

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
#2621: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:2621:
+ netif_dbg(adapter, ifup, adapter->netdev, "%s\n", __func__);

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
#2683: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:2683:
+ netif_info(adapter, ifdown, adapter->netdev, "%s\n", __func__);

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
#2771: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:2771:
+ netif_dbg(adapter, ifdown, netdev, "%s\n", __func__);

> no explanation for this message was available in the documentation for
checkpatch.
> To my understanding, ftrace is a function that is used in development of
> linux kernel to understand and analyse any function that takes place out
of user-space.
> so here, i believe that netif_dbg, netif_info, and netif_dbg are
functions that
> carry out a task that can also be done by ftrace, which could be even
more efficient.
> so usage of ftrace is preferred so that we get better information of that
function which is analysed.

CHECK: Unnecessary parentheses around 'skb->ip_summed == CHECKSUM_PARTIAL'
#2855: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:2855:
+ if ((skb->ip_summed == CHECKSUM_PARTIAL) || mss) {

> unnecessary parentheses, as explained in the previous example.

CHECK: Unnecessary parentheses around 'num_frags == tx_ring->sgl_size'
#2912: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:2912:
+ if ((num_frags == tx_ring->sgl_size) &&
+    (header_len < tx_ring->tx_max_header_size))

> unnecessary parentheses, as explained in the previous example.

CHECK: Unnecessary parentheses around 'header_len <
tx_ring->tx_max_header_size'
#2912: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:2912:
+ if ((num_frags == tx_ring->sgl_size) &&
+    (header_len < tx_ring->tx_max_header_size))

> unnecessary parentheses, as explained in the previous example.

WARNING: LINUX_VERSION_CODE should be avoided, code should be for the
version to which it is merged
#3168: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3168:
+ host_info->kernel_ver = LINUX_VERSION_CODE;

> an exact number of the kernel version to which it will be merged
> should be assigned to host_info->kernel_ver rather than another variable.

WARNING: Prefer strscpy over strlcpy - see:
https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/
#3169: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3169:
+ strlcpy(host_info->kernel_ver_str, utsname()->version,

> strlcpy() function limits the destination size, and is depreciated.
> using strscpy() should remove the warning.

CHECK: line length of 101 exceeds 100 columns
#3365: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3365:
+   struct ena_llq_configurations *llq_default_configurations)

> line length exceeds 100 columns. message will be removed if it is split
to multiple lines.
> explained in the docs.

CHECK: Alignment should match open parenthesis
#3373: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3373:
+ dev_warn(&pdev->dev,
+ "LLQ is not supported Fallback to host mode policy.\n");

> the 2nd line not aligned properly with the opening parenthesis of the
first.
> explained in a previous example.

WARNING: memory barrier without comment
#3698: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3698:
+ smp_mb__before_atomic();

WARNING: memory barrier without comment
#3737: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3737:
+ smp_mb__before_atomic();

> no documentation is given for this message in checkpatch.
> to my understanding, this is caused because there is no
> proper comment to this function call giving the context on why it is
called in that line.
> adding a comment that gives proper context should remove the message.

CHECK: line length of 119 exceeds 100 columns
#3747: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3747:
+ time_since_last_napi = jiffies_to_usecs(jiffies -
tx_ring->tx_stats.last_napi_jiffies);

CHECK: line length of 105 exceeds 100 columns
#3748: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3748:
+ missing_tx_comp_to = jiffies_to_msecs(adapter->missing_tx_completion_to);

CHECK: line length of 104 exceeds 100 columns
#3751: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3751:
+     tx_ring->qid, i, time_since_last_napi, missing_tx_comp_to);

> line length exceeds 100 columns. message will be removed if it is split
to multiple lines.

CHECK: Please don't use multiple blank lines
#4139: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:4139:
+
+

> multiple blank lines caused the message. removing them should do it.

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
#4228: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:4228:
+ dev_dbg(&pdev->dev, "%s\n", __func__);

> using ftrace is encouraged instead of the above fn. explained in an
example before.

CHECK: Unnecessary parentheses around 'adapter->msix_vecs >= 1'
#4464: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:4464:
+ if ((adapter->msix_vecs >= 1) && (netdev->rx_cpu_rmap)) {

CHECK: Unnecessary parentheses around 'netdev->rx_cpu_rmap'
#4464: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:4464:
+ if ((adapter->msix_vecs >= 1) && (netdev->rx_cpu_rmap)) {

> discussed in a previous example.

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
#4612: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:4612:
+ netif_dbg(adapter, ifup, adapter->netdev, "%s\n", __func__);

> discussed in a previous example.

total: 0 errors, 10 warnings, 23 checks, 4689 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or
--fix-inplace.

drivers/net/ethernet/amazon/ena/ena_netdev.c has style problems, please
review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS

--------------------------------------------------------------------------------------------------------------

I hope I have answered all the questions asked as per the first task. If
there is any clarification or further explanation required,
please do let me know so that i can expand further on this answer. Thank
you for this opportunity. I eagerly await my second task.

sincerely,
Rahul.

--0000000000002ab7f005c871501f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Respected mentor,</div><div><br></div>Thank you for g=
iving me the first task.<br><br>The results after running <a href=3D"http:/=
/checkpatch.pl">checkpatch.pl</a> on each of the files given is as below.<b=
r>I will do my best to explain each of the information presented in the res=
ult.<br><br><a href=3D"https://www.kernel.org/doc/html/latest/dev-tools/che=
ckpatch.html">https://www.kernel.org/doc/html/latest/dev-tools/checkpatch.h=
tml</a> -- link to documentation used. <br><br>As per my understanding, the=
re are 3 different levels for the information generated.<br>They are explai=
ned below from highest to lowest level of strictness.<br><br>ERROR : requir=
es immediate attention. They are most likely wrong.<br>WARNING : requires c=
areful review, but not as serious issue compared to ERROR.<br>CHECK : requi=
res a look, but it is of the mildest level.<br>----------------------------=
-------------------------------------------------<br>RESULT (1):<br><br>./s=
cripts/<a href=3D"http://checkpatch.pl">checkpatch.pl</a> drivers/mtd/ubi/b=
lock.c<br><br>WARNING: quoted string split across lines<br>#354: FILE: driv=
ers/mtd/ubi/block.c:354:<br>+		pr_warn(&quot;UBI: block: volume size is not=
 a multiple of 512, &quot;<br>+			&quot;last %llu bytes are ignored!\n&quot=
;,<br><br>&gt; message not present in documentation.<br>&gt; this warning, =
as stated, is generated because of the quoted strings being split across li=
nes.<br>&gt; we can solve this by just keeping them in a single line.<br>&g=
t; if the last line ends with a quote and the next line also begins with a =
quote, then this issue will arise.<br><br>WARNING: braces {} are not necess=
ary for single statement blocks<br>#374: FILE: drivers/mtd/ubi/block.c:374:=
<br>+	if (ret) {<br>+		return ret;<br>+	}<br><br>&gt; proper way to use bra=
ces is explained in the documentation, which is related to the message here=
.<br>&gt; single statement blocks don&#39;t require brackets, removing them=
 will solve the issue.<br>&gt; proper way to use braces is explained in the=
 documentation.<br>&gt; I believe it checks whether there is only one state=
ment written between the braces. if condition is true, then warn the user. =
<br><br>WARNING: Statements terminations use 1 semicolon<br>#408: FILE: dri=
vers/mtd/ubi/block.c:408:<br>+		goto out_free_dev;;<br><br>&gt; message not=
 present in documentation.<br>&gt; using two semicolons resulted in this wa=
rning, can be solved by [ goto out_free_dev; ].<br>&gt; it checks if there =
is another semicolon (;) immediately after one, so if there is a &quot;;;&q=
uot; anywhere, then it issues a warning.<br><br>total: 0 errors, 3 warnings=
, 697 lines checked<br><br>NOTE: For some of the reported defects, checkpat=
ch may be able to<br>=C2=A0 =C2=A0 =C2=A0 mechanically convert to the typic=
al style using --fix or --fix-inplace.<br><br>drivers/mtd/ubi/block.c has s=
tyle problems, please review.<br><br>NOTE: If any of the errors are false p=
ositives, please report<br>=C2=A0 =C2=A0 =C2=A0 them to the maintainer, see=
 CHECKPATCH in MAINTAINERS.<br><br>----------------------------------------=
-------------------------<br><br>RESULT (2):<br><br>./scripts/<a href=3D"ht=
tp://checkpatch.pl">checkpatch.pl</a> drivers/net/ethernet/amazon/ena/ena_n=
etdev.c<br><br>CHECK: multiple assignments should be avoided<br>#282: FILE:=
 drivers/net/ethernet/amazon/ena/ena_netdev.c:282:<br>+		ena_tx_ctx-&gt;num=
_bufs =3D tx_info-&gt;num_of_bufs =3D 1;<br><br>&gt; message not in documen=
tation.<br>&gt; this warning was triggered because it devtected the assigni=
ng of values to multiple variables in same statement using &quot;=3D&quot;.=
<br>&gt; this can be solved by changing it to this instead,<br>&gt;<br>&gt;=
 ena_tx_ctx-&gt;num_bufs =3D 1;<br>&gt; tx_info-&gt;num_of_bufs =3D 1;<br><=
br>WARNING: nested (un)?likely() calls, IS_ERR already uses unlikely() inte=
rnally<br>#1025: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1025:<b=
r>+	if (unlikely(IS_ERR(page)))<br><br>&gt; message not in documentation.<b=
r>&gt; the error could have been caused because the &quot;IS_ERR&quot; func=
tion already<br>&gt; calls the &quot;unlikely&quot; function internally, an=
d we pass the &quot;IS_ERR&quot; function through<br>&gt; &quot;unlikely&qu=
ot; function again, resulting in nested calls of the &quot;unlikely&quot; f=
unction.<br>&gt; this warning can be removed if the nested calls can be avo=
ided. <br><br>CHECK: Alignment should match open parenthesis<br>#1533: FILE=
: drivers/net/ethernet/amazon/ena/ena_netdev.c:1533:<br>+static void ena_rx=
_checksum(struct ena_ring *rx_ring,<br>+				 =C2=A0 struct ena_com_rx_ctx *=
ena_rx_ctx,<br><br>&gt; message not in documentation.<br>&gt; this was caus=
ed because the 2nd line &quot;struct ena_com_rx_ctx *ena_rx_ctx,&quot;<br>&=
gt; was not aligned with the opening parenthesis of the first line &quot;(&=
quot;.<br>&gt; aligning it should remove the message.<br><br>CHECK: Unneces=
sary parentheses around &#39;ena_rx_ctx-&gt;l3_proto =3D=3D ENA_ETH_IO_L3_P=
ROTO_IPV4&#39;<br>#1549: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c=
:1549:<br>+	if (unlikely((ena_rx_ctx-&gt;l3_proto =3D=3D ENA_ETH_IO_L3_PROT=
O_IPV4) &amp;&amp;<br>+		 =C2=A0 =C2=A0 (ena_rx_ctx-&gt;l3_csum_err))) {<br=
><br>CHECK: Unnecessary parentheses around &#39;ena_rx_ctx-&gt;l3_csum_err&=
#39;<br>#1549: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:1549:<br>=
+	if (unlikely((ena_rx_ctx-&gt;l3_proto =3D=3D ENA_ETH_IO_L3_PROTO_IPV4) &a=
mp;&amp;<br>+		 =C2=A0 =C2=A0 (ena_rx_ctx-&gt;l3_csum_err))) {<br><br>&gt; =
message explained in documentation.=C2=A0<br>&gt; caused by unnecessary par=
entheses.<br>&gt; message can be removed by changing to,<br>&gt;<br>&gt;if =
(unlikely(ena_rx_ctx-&gt;l3_proto =3D=3D ENA_ETH_IO_L3_PROTO_IPV4 &amp;&amp=
;<br>&gt;		 =C2=A0 =C2=A0 ena_rx_ctx-&gt;l3_csum_err)) {<br><br>CHECK: Unne=
cessary parentheses around &#39;ena_rx_ctx-&gt;l4_proto =3D=3D ENA_ETH_IO_L=
4_PROTO_TCP&#39;<br>#1561: FILE: drivers/net/ethernet/amazon/ena/ena_netdev=
.c:1561:<br>+	if (likely((ena_rx_ctx-&gt;l4_proto =3D=3D ENA_ETH_IO_L4_PROT=
O_TCP) ||<br>+		 =C2=A0 (ena_rx_ctx-&gt;l4_proto =3D=3D ENA_ETH_IO_L4_PROTO=
_UDP))) {<br><br>CHECK: Unnecessary parentheses around &#39;ena_rx_ctx-&gt;=
l4_proto =3D=3D ENA_ETH_IO_L4_PROTO_UDP&#39;<br>#1561: FILE: drivers/net/et=
hernet/amazon/ena/ena_netdev.c:1561:<br>+	if (likely((ena_rx_ctx-&gt;l4_pro=
to =3D=3D ENA_ETH_IO_L4_PROTO_TCP) ||<br>+		 =C2=A0 (ena_rx_ctx-&gt;l4_prot=
o =3D=3D ENA_ETH_IO_L4_PROTO_UDP))) {<br><br>&gt; unnecessary parentheses, =
as explained in the previous example.<br><br>CHECK: Blank lines aren&#39;t =
necessary before a close brace &#39;}&#39;<br>#1587: FILE: drivers/net/ethe=
rnet/amazon/ena/ena_netdev.c:1587:<br>+<br>+}<br><br>&gt; proper usage of b=
races is explained in the documentation, which is related to this message.<=
br>&gt; as stated, it is caused due to the blank line before the closing br=
ace.<br>&gt; removing the blank line should close the message.<br><br>CHECK=
: Unnecessary parentheses around &#39;ena_rx_ctx-&gt;l4_proto =3D=3D ENA_ET=
H_IO_L4_PROTO_TCP&#39;<br>#1596: FILE: drivers/net/ethernet/amazon/ena/ena_=
netdev.c:1596:<br>+		if (likely((ena_rx_ctx-&gt;l4_proto =3D=3D ENA_ETH_IO_=
L4_PROTO_TCP) ||<br>+			 =C2=A0 (ena_rx_ctx-&gt;l4_proto =3D=3D ENA_ETH_IO_=
L4_PROTO_UDP)))<br><br>&gt; unnecessary parentheses, as explained in the pr=
evious example.<br><br>CHECK: Unnecessary parentheses around &#39;ena_rx_ct=
x-&gt;l4_proto =3D=3D ENA_ETH_IO_L4_PROTO_UDP&#39;<br>#1596: FILE: drivers/=
net/ethernet/amazon/ena/ena_netdev.c:1596:<br>+		if (likely((ena_rx_ctx-&gt=
;l4_proto =3D=3D ENA_ETH_IO_L4_PROTO_TCP) ||<br>+			 =C2=A0 (ena_rx_ctx-&gt=
;l4_proto =3D=3D ENA_ETH_IO_L4_PROTO_UDP)))<br><br>&gt; unnecessary parenth=
eses, as explained in the previous example.<br><br>CHECK: Please use a blan=
k line after function/struct/union/enum declarations<br>#1636: FILE: driver=
s/net/ethernet/amazon/ena/ena_netdev.c:1636:<br>+}<br>+/* ena_clean_rx_irq =
- Cleanup RX irq<br><br>&gt; message not present in docs for checkpatch.<br=
>&gt; we should use a blank line after declaring a function/struct/enum.<br=
>&gt; adding a blank line after the closing brace should remove the message=
.<br><br>CHECK: Alignment should match open parenthesis<br>#1820: FILE: dri=
vers/net/ethernet/amazon/ena/ena_netdev.c:1820:<br>+static void ena_unmask_=
interrupt(struct ena_ring *tx_ring,<br>+					struct ena_ring *rx_ring)<br><=
br>&gt; the 2nd line not aligned properly with the opening parenthesis of t=
he first.<br>&gt; explained in a previous example.<br><br>CHECK: Alignment =
should match open parenthesis<br>#1852: FILE: drivers/net/ethernet/amazon/e=
na/ena_netdev.c:1852:<br>+static void ena_update_ring_numa_node(struct ena_=
ring *tx_ring,<br>+					 =C2=A0 =C2=A0 struct ena_ring *rx_ring)<br><br>&gt=
; the 2nd line not aligned properly with the opening parenthesis of the fir=
st.<br>&gt; explained in a previous example.<br><br>WARNING: Unnecessary ft=
race-like logging - prefer using ftrace<br>#2621: FILE: drivers/net/etherne=
t/amazon/ena/ena_netdev.c:2621:<br>+	netif_dbg(adapter, ifup, adapter-&gt;n=
etdev, &quot;%s\n&quot;, __func__);<br><br>WARNING: Unnecessary ftrace-like=
 logging - prefer using ftrace<br>#2683: FILE: drivers/net/ethernet/amazon/=
ena/ena_netdev.c:2683:<br>+	netif_info(adapter, ifdown, adapter-&gt;netdev,=
 &quot;%s\n&quot;, __func__);<br><br>WARNING: Unnecessary ftrace-like loggi=
ng - prefer using ftrace<br>#2771: FILE: drivers/net/ethernet/amazon/ena/en=
a_netdev.c:2771:<br>+	netif_dbg(adapter, ifdown, netdev, &quot;%s\n&quot;, =
__func__);<br><br>&gt; no explanation for this message was available in the=
 documentation for checkpatch.<br>&gt; To my understanding, ftrace is a fun=
ction that is used in development of<br>&gt; linux kernel to understand and=
 analyse any function that takes place out of user-space.<br>&gt; so here, =
i believe that netif_dbg, netif_info, and netif_dbg are functions that<br>&=
gt; carry out a task that can also be done by ftrace, which could be even m=
ore efficient.<br>&gt; so usage of ftrace is preferred so that we get bette=
r information of that function which is analysed. =C2=A0<br><br>CHECK: Unne=
cessary parentheses around &#39;skb-&gt;ip_summed =3D=3D CHECKSUM_PARTIAL&#=
39;<br>#2855: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:2855:<br>+=
	if ((skb-&gt;ip_summed =3D=3D CHECKSUM_PARTIAL) || mss) {<br><br>&gt; unne=
cessary parentheses, as explained in the previous example.<br><br>CHECK: Un=
necessary parentheses around &#39;num_frags =3D=3D tx_ring-&gt;sgl_size&#39=
;<br>#2912: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:2912:<br>+	i=
f ((num_frags =3D=3D tx_ring-&gt;sgl_size) &amp;&amp;<br>+	 =C2=A0 =C2=A0(h=
eader_len &lt; tx_ring-&gt;tx_max_header_size))<br><br>&gt; unnecessary par=
entheses, as explained in the previous example.<br><br>CHECK: Unnecessary p=
arentheses around &#39;header_len &lt; tx_ring-&gt;tx_max_header_size&#39;<=
br>#2912: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:2912:<br>+	if =
((num_frags =3D=3D tx_ring-&gt;sgl_size) &amp;&amp;<br>+	 =C2=A0 =C2=A0(hea=
der_len &lt; tx_ring-&gt;tx_max_header_size))<br><br>&gt; unnecessary paren=
theses, as explained in the previous example.<br><br>WARNING: LINUX_VERSION=
_CODE should be avoided, code should be for the version to which it is merg=
ed<br>#3168: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3168:<br>+	=
host_info-&gt;kernel_ver =3D LINUX_VERSION_CODE;<br><br>&gt; an exact numbe=
r of the kernel version to which it will be merged <br>&gt; should be assig=
ned to host_info-&gt;kernel_ver rather than another variable. <br><br>WARNI=
NG: Prefer strscpy over strlcpy - see: <a href=3D"https://lore.kernel.org/r=
/CAHk-=3DwgfRnXz0W3D37d01q3JFkr_i_uTL=3DV6A6G1oUZcprmknw@mail.gmail.com/">h=
ttps://lore.kernel.org/r/CAHk-=3DwgfRnXz0W3D37d01q3JFkr_i_uTL=3DV6A6G1oUZcp=
rmknw@mail.gmail.com/</a><br>#3169: FILE: drivers/net/ethernet/amazon/ena/e=
na_netdev.c:3169:<br>+	strlcpy(host_info-&gt;kernel_ver_str, utsname()-&gt;=
version,<br><br>&gt; strlcpy() function limits the destination size, and is=
 depreciated.<br>&gt; using strscpy() should remove the warning. <br><br>CH=
ECK: line length of 101 exceeds 100 columns<br>#3365: FILE: drivers/net/eth=
ernet/amazon/ena/ena_netdev.c:3365:<br>+					 =C2=A0 struct ena_llq_configu=
rations *llq_default_configurations)<br><br>&gt; line length exceeds 100 co=
lumns. message will be removed if it is split to multiple lines.<div>&gt; e=
xplained in the docs.<br><br>CHECK: Alignment should match open parenthesis=
<br>#3373: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:3373:<br>+		d=
ev_warn(&amp;pdev-&gt;dev,<br>+			&quot;LLQ is not supported Fallback to ho=
st mode policy.\n&quot;);<br><br>&gt; the 2nd line not aligned properly wit=
h the opening parenthesis of the first.<br>&gt; explained in a previous exa=
mple.<br><br>WARNING: memory barrier without comment<br>#3698: FILE: driver=
s/net/ethernet/amazon/ena/ena_netdev.c:3698:<br>+		smp_mb__before_atomic();=
<br><br>WARNING: memory barrier without comment<br>#3737: FILE: drivers/net=
/ethernet/amazon/ena/ena_netdev.c:3737:<br>+			smp_mb__before_atomic();<br>=
<br>&gt; no documentation is given for this message in checkpatch.<br>&gt; =
to my understanding, this is caused because there is no<br>&gt; proper comm=
ent to this function call giving the context on why it is called in that li=
ne.<br>&gt; adding a comment that gives proper context should remove the me=
ssage.<br><br>CHECK: line length of 119 exceeds 100 columns<br>#3747: FILE:=
 drivers/net/ethernet/amazon/ena/ena_netdev.c:3747:<br>+				time_since_last=
_napi =3D jiffies_to_usecs(jiffies - tx_ring-&gt;tx_stats.last_napi_jiffies=
);<br><br>CHECK: line length of 105 exceeds 100 columns<br>#3748: FILE: dri=
vers/net/ethernet/amazon/ena/ena_netdev.c:3748:<br>+				missing_tx_comp_to =
=3D jiffies_to_msecs(adapter-&gt;missing_tx_completion_to);<br><br>CHECK: l=
ine length of 104 exceeds 100 columns<br>#3751: FILE: drivers/net/ethernet/=
amazon/ena/ena_netdev.c:3751:<br>+					 =C2=A0 =C2=A0 tx_ring-&gt;qid, i, t=
ime_since_last_napi, missing_tx_comp_to);<br><br>&gt; line length exceeds 1=
00 columns. message will be removed if it is split to multiple lines.<br><b=
r>CHECK: Please don&#39;t use multiple blank lines<br>#4139: FILE: drivers/=
net/ethernet/amazon/ena/ena_netdev.c:4139:<br>+<br>+<br><br>&gt; multiple b=
lank lines caused the message. removing them should do it.<br><br>WARNING: =
Unnecessary ftrace-like logging - prefer using ftrace<br>#4228: FILE: drive=
rs/net/ethernet/amazon/ena/ena_netdev.c:4228:<br>+	dev_dbg(&amp;pdev-&gt;de=
v, &quot;%s\n&quot;, __func__);<br><br>&gt; using ftrace is encouraged inst=
ead of the above fn. explained in an example before.<br><br>CHECK: Unnecess=
ary parentheses around &#39;adapter-&gt;msix_vecs &gt;=3D 1&#39;<br>#4464: =
FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:4464:<br>+	if ((adapter-=
&gt;msix_vecs &gt;=3D 1) &amp;&amp; (netdev-&gt;rx_cpu_rmap)) {<br><br>CHEC=
K: Unnecessary parentheses around &#39;netdev-&gt;rx_cpu_rmap&#39;<br>#4464=
: FILE: drivers/net/ethernet/amazon/ena/ena_netdev.c:4464:<br>+	if ((adapte=
r-&gt;msix_vecs &gt;=3D 1) &amp;&amp; (netdev-&gt;rx_cpu_rmap)) {<br><br>&g=
t; discussed in a previous example.<br><br>WARNING: Unnecessary ftrace-like=
 logging - prefer using ftrace<br>#4612: FILE: drivers/net/ethernet/amazon/=
ena/ena_netdev.c:4612:<br>+		netif_dbg(adapter, ifup, adapter-&gt;netdev, &=
quot;%s\n&quot;, __func__);<br><br>&gt; discussed in a previous example.<br=
><br>total: 0 errors, 10 warnings, 23 checks, 4689 lines checked<br><br>NOT=
E: For some of the reported defects, checkpatch may be able to<br>=C2=A0 =
=C2=A0 =C2=A0 mechanically convert to the typical style using --fix or --fi=
x-inplace.<br><br>drivers/net/ethernet/amazon/ena/ena_netdev.c has style pr=
oblems, please review.<br><br>NOTE: If any of the errors are false positive=
s, please report<br>=C2=A0 =C2=A0 =C2=A0 them to the maintainer, see CHECKP=
ATCH in MAINTAINERS<br></div><div><br></div><div>--------------------------=
---------------------------------------------------------------------------=
---------</div><div><br></div><div>I hope I have answered all the questions=
 asked as per the first task. If there is any clarification or further expl=
anation required,</div><div>please do let me know so that i can expand furt=
her on this answer. Thank you for this opportunity. I eagerly await my seco=
nd task.</div><div><br></div><div>sincerely,</div><div>Rahul.</div><div><br=
></div></div>

--0000000000002ab7f005c871501f--

--===============0457818462790052410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees

--===============0457818462790052410==--
