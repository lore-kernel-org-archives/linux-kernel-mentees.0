Return-Path: <SRS0=cFAU=NV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60696C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Aug 2021 08:39:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E750260FF2
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 30 Aug 2021 08:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E750260FF2
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3FE06076F;
	Mon, 30 Aug 2021 08:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xOTTmFPJa07a; Mon, 30 Aug 2021 08:39:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 590676063F;
	Mon, 30 Aug 2021 08:39:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38EB5C001A;
	Mon, 30 Aug 2021 08:39:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D5A23C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Aug 2021 08:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B778A40443
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Aug 2021 08:39:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KgMoG9IF1pNg
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Aug 2021 08:39:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C296403E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Aug 2021 08:39:31 +0000 (UTC)
Received: by mail-oo1-xc31.google.com with SMTP id
 y16-20020a4ad6500000b0290258a7ff4058so4323836oos.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Aug 2021 01:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J/hEM3tcQmv5h0aNBtAnL55U1gjZ76bS+5hiezChL/c=;
 b=pHxOO3OtuhjHfPdiacDEiq974c4w7Vh0NHRop798z7zGNHDfuF1sR08sANF9BP1KDz
 RJvEBhsc/I0/7mffxPctm5EiB2CtfnHf9wLJP5pA0hyTIN6/veZ22aB1PIomG9i5xY2w
 dUF8Cvjtbdt6Ya07ORcnNNlsvcBJ7BelF7kRI+L9CC8hgG9b+pPWtdSmQJR2/p7j751q
 41nhL7VkjW41HWWxB8F6vnfLbkBWHzMGVejHkACWRapSu7UbOqFcISZKBzXtjRxaHV36
 S4OuBK3n5+at21KBRC2SrQjGlnL8sy+hX+h+A8iBMKb2NtuxhDdgeXcQigzaBAFaOg8r
 V59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J/hEM3tcQmv5h0aNBtAnL55U1gjZ76bS+5hiezChL/c=;
 b=jwerrNJhiLH5KFvrIRC595Kh+YLckYeJ5S0MJqSvp0PoBaJkF5vL5JOSWkZOohCQTf
 AonNsbrzzX1J0La25U+MRLrKl1HUvpnq5J3bnUAZ57FS2zVzlzHCNIES5sU3HxxJ0mY3
 8oJdFg8TFN5mMx9n2WrBpqYQd6inVaxNNU2xns4fQiLJrYWGEnoiNvt4Tbp7mCjpl3dC
 NKcVIfH0IOa0+MPtVlo5qBjAJQRxAFUOJe5djy/nETfOa2EgfxkmOY8ynXGPBH2LhofX
 q7EfSks8BhjkdXu/dFlt4r6xqBxStAdtJok6rWo7Fy5aaAnXR9xYKph2r4vxbLc/q1aA
 Ma1g==
X-Gm-Message-State: AOAM532HvK3842E41ynNBBPLfH6IXMukbU1YQKvpqp5DVuGO6eXRbITF
 SNM8YfnCyegojvzF4H5o7cAF0VxAYehJRDF0exAWYg==
X-Google-Smtp-Source: ABdhPJx3lro/NLWpABSvjIvK+fiTNntJeWbovYfVkE68ffqFkYVdlWs5TT/jlT2VXeU+rZtIPm7MpbkCFo3UD4S+9jc=
X-Received: by 2002:a4a:de90:: with SMTP id v16mr9192504oou.42.1630312770009; 
 Mon, 30 Aug 2021 01:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000b575ab05aebfc192@google.com>
 <00000000000069bb3e05caa2d1f8@google.com>
In-Reply-To: <00000000000069bb3e05caa2d1f8@google.com>
Date: Mon, 30 Aug 2021 10:39:18 +0200
Message-ID: <CACT4Y+Z1OG0bPB-bfMRS6vN4Ogx8n3_8v+e+WCshLwz7apvnHg@mail.gmail.com>
Subject: Re: [syzbot] WARNING: refcount bug in qrtr_node_lookup
To: syzbot <syzbot+c613e88b3093ebf3686e@syzkaller.appspotmail.com>
Cc: anant.thazhemadam@gmail.com, mani@kernel.org, butterflyhuangxx@gmail.com,
 linux-arm-msm@vger.kernel.org, manivannan.sadhasivam@linaro.org,
 syzkaller-bugs@googlegroups.com, hdanton@sina.com, bjorn.andersson@linaro.org,
 netdev@vger.kernel.org, dragonjetli@gmail.com, kuba@kernel.org,
 masahiroy@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net, linux-kernel@vger.kernel.org
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
From: Dmitry Vyukov via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, 28 Aug 2021 at 20:32, syzbot
<syzbot+c613e88b3093ebf3686e@syzkaller.appspotmail.com> wrote:
>
> syzbot suspects this issue was fixed by commit:
>
> commit 7e78c597c3ebfd0cb329aa09a838734147e4f117
> Author: Xiaolong Huang <butterflyhuangxx@gmail.com>
> Date:   Thu Aug 19 19:50:34 2021 +0000
>
>     net: qrtr: fix another OOB Read in qrtr_endpoint_post
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11279a4d300000
> start commit:   ba4f184e126b Linux 5.9-rc6
> git tree:       upstream
> kernel config:  https://syzkaller.appspot.com/x/.config?x=af502ec9a451c9fc
> dashboard link: https://syzkaller.appspot.com/bug?extid=c613e88b3093ebf3686e
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12263dd9900000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13d77603900000
>
> If the result looks correct, please mark the issue as fixed by replying with:
>
> #syz fix: net: qrtr: fix another OOB Read in qrtr_endpoint_post
>
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection

Hi Hillf,

You posted some patch related to refcounts. Do you think "net: qrtr:
fix another OOB Read in qrtr_endpoint_post" is a plausible fix? Or is
there still something wrong with refcounts?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
