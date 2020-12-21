Return-Path: <SRS0=69VX=FZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B27C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Dec 2020 05:28:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3984422CB8
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 21 Dec 2020 05:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3984422CB8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 22A372079C;
	Mon, 21 Dec 2020 05:28:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ujAhWUBidDIi; Mon, 21 Dec 2020 05:28:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1E15620789;
	Mon, 21 Dec 2020 05:28:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 19F9FC1787;
	Mon, 21 Dec 2020 05:28:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31430C0893
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 05:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1EF7587ABA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 05:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id weaQQvwE1Ybz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 05:28:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5904E87672
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 21 Dec 2020 05:28:07 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id n4so7758447iow.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 20 Dec 2020 21:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MvyDQV/3mjmMwspTdKm1KbjrHmLsLrf+to0c6o/B9sU=;
 b=bZg9J+0ufZFf8yVHJbMTL6kY86ZPDb605tK7D9YSRYrvCydduBxcl3I85XNQXlhzYt
 +n7mGDUIC3Dyv3ZQSQQ2wkETqguBCBFDRbgoPRDytm5L/mWB4RLOjFze4fJLK8HrNNGZ
 zQ1eDMaxvwzUoSENkyxN76F0wBDDH7ePk0dM4ojJdvV8Q7jBUxqzd6TUsFJO9obHQ8ED
 Jj6hIeWIEVnKRYlJX5oghfaEi5/Q4QQbHXG7wEJnUBxudegG+rud68Jeh7wj3Ga09e2w
 5RQdp6uTsQ733LPFqnyqXM0XM5xYagFaSXpGZV2PeDrYfBBjKFsE1+vBKxOannLLBLPH
 zBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MvyDQV/3mjmMwspTdKm1KbjrHmLsLrf+to0c6o/B9sU=;
 b=XRO4kbJ4UIBC0Fx7pb94YmvYEdfwwToByvnH5eLug2lFWz+GpKj8fqXyM55Q2IYGwC
 D3ybROqwHlP0Mpwe+LGCV62tEWziGn/Y6x9JXgfnil2Jdny1/5tC5TZstTqbSzN9zPwW
 X5xoym6cUXVvbgWwT9rAI9jJx5DgbodeDV0VP8Jf33XDHuY3GXjGyiA5TnEU5Br9TuNI
 HMarMmZcSadp25A+jxR1wQv8jtBmbHHOIoua/1xNES8FV0LFldqKNjTB7ZFELQVF+5Bi
 f5XwbXvAONRcyKqH8kqc2/kpaejE7T4QB4A/mruVfGUPnygNns+QIveRxQV/xdDYx8i7
 4JYA==
X-Gm-Message-State: AOAM531JBEVQb7babaodcNz5zBs/NZf37VNbHoE6DFhZRCWpskneVwmO
 40Tg1LSHvQPLNYMDRUyj3HJ9vqHwG4DELL928V4=
X-Google-Smtp-Source: ABdhPJzR2G69hf75puy5sldKSpLNKgUnwNMVF2+DqnXcTCw1PHNVJsf+1TgDnDQahuZh0OxJeGv0I2O3nq8r2Pzm1/U=
X-Received: by 2002:a5e:9906:: with SMTP id t6mr12949050ioj.183.1608528486675; 
 Sun, 20 Dec 2020 21:28:06 -0800 (PST)
MIME-Version: 1.0
References: <CAKXUXMz6TuYZkZJbgDBPiH4MmecUUbLjPct9XnZZu12VP+w4mw@mail.gmail.com>
 <20201220183307.8744-1-yashsri421@gmail.com>
In-Reply-To: <20201220183307.8744-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 21 Dec 2020 06:27:55 +0100
Message-ID: <CAKXUXMw-AtthCG9y4_wYBKaF36BbxFmdHfzPi7FS+fSJqaK+3Q@mail.gmail.com>
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: ignore files not
	following NETWORKING_BLOCK_COMMENT_STYLE
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

On Sun, Dec 20, 2020 at 7:33 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> Currently checkpatch.pl gives warning for NETWORKING_BLOCK_COMMENT_STYLE
> for files in net/ and drivers/net which do not follow the networking
> comment style.
> But some of these files seem to follow the generic comment style instead
> of networking style and some rather mixed style of comment.
>
> For e.g., drivers/net/wireless/ralink/rt2x00 largely follows generic
> kernel comment style in spite of being inside drivers/net.
>
> Provide an ignore file(".networking_block_comment_styles.ignore"), where
> users can add the files they want to ignore this warning.
>

I believe that is a really bad design decision here.

Imagine that in one directory, the maintainer wants to adjust ten
rules for checkpatch.

Are we going to implement this logic for those ten rules individually?
Is the maintainer going to add

None of that is obviously acceptable: 1. because there are better
design decisions; 2. because tailoring checkpatch would simply not be
worth the cost of having all those individual files laying around in
the repository and the complication throughout the whole script.

Also, you already recognized that there is already a feature to ignore
or select rules through command-line parameters.

So, how about coming up with a proper .checkpatch config file format
and then use the already available feature to configure the checkpatch
run?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
