Return-Path: <SRS0=g7AB=56=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C56C2BB1D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Apr 2020 19:27:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45AEB2074D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Apr 2020 19:27:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="wxgN2j2p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45AEB2074D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 282AF85C7A;
	Tue, 14 Apr 2020 19:27:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6PtoFvJQzlGc; Tue, 14 Apr 2020 19:27:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8C77D85C28;
	Tue, 14 Apr 2020 19:27:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8043CC1D7D;
	Tue, 14 Apr 2020 19:27:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A6963C0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 19:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 93F02214F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 19:27:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lQkVShFIkirF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 19:27:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
 [209.85.219.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 998FF2045C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 19:27:17 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id n188so7271946ybc.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 12:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=liJTaPqBLUEFcRe9N1A8zRM5HSWs7o0PCEhm0b1f3gc=;
 b=wxgN2j2p6EaMXyAzSU997E06gylxThv/R7SidN4P1+l9zc+VA5FqfYE2jKH6iTTxN8
 eIPzfkgru7UpPgLF9dG1dXO9m+IwulKuHVlDuAQXRVn3NJej+FfZ3yiuBO+LJnCDfpbP
 cnzOlrOA994QBvoseVasPOJKMQwPigP8beN8LS4lKeYvV/0+jLIx0S8LmqyOaeXfQ+7G
 EaevnjyZQSXfHf7g4FOYbJ8nEh7p7+It/0CdP9AW29YeRn1rEe9mkV7eA5m44qo7eEGO
 lEHgv+KxK9FAXDk6TuwmuPBpx6p1U6M5kOH7Z/uo3NXmthbLLhPEAnoYg4WGyRlrCCfz
 BPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=liJTaPqBLUEFcRe9N1A8zRM5HSWs7o0PCEhm0b1f3gc=;
 b=Sywp8bHRHQ87abMRt8n7cHFW75Ours9/29orq4JNxNJapytqcwbwmGIthUV19Lq1hg
 CsDUSfgUqgb/R3L1LIgSdIi34OmNlIBFPPYvHywQ3IKBBvjjw8hjn+0PvOGb0YDU0sMl
 gp9jm0y+N0JHdigtl909IpDfi9UIR1axIT2thLeqip8t+wu69uR4msRVbxi6/7B6cbR1
 QMeTZvjJMT/oHMv/kHbKwMU/RrLoB/Ch5p4+kqvIwEX3S4o1BG0Zu3ve3lKa0MbRWPxW
 Y6bKzmkmnWL6dEBXeInOonPl+skUZK6J5JBPpTiBb/BHDzIjUgaCmboft6GnMAqIn46K
 p8OQ==
X-Gm-Message-State: AGi0PubQlx7+GmtWYRzFq7gRz7DCbTjfIYUeJLE7l/1nAEW4HZ+we0F9
 6BgXRqJ5tyIMrvlPC+EFaqFfBDIkdlW+cbrzEtLq/A==
X-Google-Smtp-Source: APiQypKzlwcgNmOnL/Q8YINWwYJceLJcSuKdggUvYamBPmZ0xmNr3yDXnfyO6eTBHG1fEWVs3lgau2qo4YjURlerSx4=
X-Received: by 2002:a05:6902:505:: with SMTP id
 x5mr2602845ybs.286.1586892436480; 
 Tue, 14 Apr 2020 12:27:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200414012132.32721-1-vitor@massaru.org>
 <CAFd5g44Bs4gfDh82pcwbN5_z7Cuy9SY8UdwftWLGoVCMZZjE3Q@mail.gmail.com>
In-Reply-To: <CAFd5g44Bs4gfDh82pcwbN5_z7Cuy9SY8UdwftWLGoVCMZZjE3Q@mail.gmail.com>
From: Vitor Massaru Iha <vitor@massaru.org>
Date: Tue, 14 Apr 2020 16:26:40 -0300
Message-ID: <CADQ6JjWsZ4-uEoo49uTBnRtxJvEXgqaSc24vxrrSon4XevM_EQ@mail.gmail.com>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] kbuild: ensure mrproper
	removes arch/$(SUBARCH)/include/generated/
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

On Tue, Apr 14, 2020 at 4:10 PM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> - Everyone except LKMP people
>
> On Mon, Apr 13, 2020 at 6:21 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
> >
> > In the following use case, when compiling the kernel for the UML
> > architecture, for example:
> >
> >  * `make ARCH=um defconfig && make ARCH=um -j8`,
> >
> > SUBARCH files are generated, however when we run the command:
> >
> >  * `mrproper ARCH=um`
> >
> > the files `arch/$(SUBARCH)/include/generated/ aren't cleaned up.
> >
> > This generates compilation errors by running the following command:
> >
> >  * `make ARCH=um defconfig O=./build_um && make ARCH=um -j8 O=./build_um`
> >
> > This PATCH fix that problem.
> >
> > This makes it possible to compile on different architectures that use the
> > SUBARCH variable, in different build directories and root directory of the
> > linux directory. This is important because we can compile without the object
> > files being overwritten. This reduces the re-compilation time in this use case.
> >
> > Besides that, in the workflow of developing unit tests, using kunit, and
> > compiling in different architectures to develop or test a PATCH, this use case
> > applies.
> >
> >  * This bug was introduced in this commit a788b2ed81abe
> >
> >  * Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219
> >
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> > Tested-by: Brendan Higgins <brendanhiggins@google.com>
>
> Looks great!

Thanks!

> Should linux-kernel-mentees@ be CC'ed on all of your patches? I
> thought Shuah said yes.

Sorry about that, I forgot to include the linux-kernel-mentees list.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
