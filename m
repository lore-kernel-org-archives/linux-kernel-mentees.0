Return-Path: <SRS0=g7AB=56=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C68C2BA19
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Apr 2020 19:11:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F02D22082E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Apr 2020 19:11:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="MfCucfte"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F02D22082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B67C820497;
	Tue, 14 Apr 2020 19:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kq5kJWQcSM52; Tue, 14 Apr 2020 19:10:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id E711F20494;
	Tue, 14 Apr 2020 19:10:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CAE73C089E;
	Tue, 14 Apr 2020 19:10:57 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4D27EC0172
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 19:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 36DB187DDB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 19:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DoqwVrmhKdPB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 19:10:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8513C87DCE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 19:10:55 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id x3so370317pfp.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Apr 2020 12:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rziznW5v53tSDNU0EJZMP1/ESlHZ3dRu2z7rqkyqpcQ=;
 b=MfCucfteiw1M2VaZUS5F6JmW6claNQ+xu9sUy6Mw7d7od8Mtoc0gMmvW94i1b4nYIV
 buIEWse5aysIBzYzVh9zS2IbYngaKVuki7XW43d5M8pwqJyBT+ych+pJmBkj1yCTl+kM
 3OFpHgiYm9Vef9kgiaupGJqBG7mWFNckKPAKe9c2NjBhxd0C+6oHvegE8CGiO/YvNyVf
 2vHmjbo69LwdUMd+CwGReb0Iz9B+zECE76/bvrMR+sTiYOwkGJwdSlNR72k71xzP2Mkx
 W+x8I2Ca8JF2SuhdwiNpMZO0RfwQWhFvloJzr6rG9UQU6DuK8xoA9QjoRsUkC1CWuXKm
 8qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rziznW5v53tSDNU0EJZMP1/ESlHZ3dRu2z7rqkyqpcQ=;
 b=WEZqgMTHFBgr0he0peBiIpuddKpBd03J2qXPoAaQyAPjhi72OGTize5DoEC9CFISbk
 YSA4OzF9TQGn54RAYu0xCcGxm9ChM14fSvAxSEqLp+N0CHr1nkZz4ZGwr4XRWOmNqlcO
 DOc2UoFPQw8vX9ZxxvHnfr6UNHUrzp5KcXu1ZIztL8h7ctQWSWDAABNBYDOH8VvwrKd1
 pmzYgtUs6qTUE3dLDGT4M6UMHvHjRJM0Dck16y9j8Iz8WKq9vOTmbzbMhcP4Ip8/SHpt
 KEkJGl4XOQxv7nT4PNy9zyNDNfZPKooxlBmZ8F+3snNPz2yQocrIjUmCPjqzHbX19xUO
 yfyw==
X-Gm-Message-State: AGi0PuZbMe3bI1AC0X6s/iioLxa08MP4IFE0mfaFPeu//yxlAUFN8gqD
 QXaRi8X5vcV873vv7PySa1wMd2UDcrqI4BkU5rLi1A==
X-Google-Smtp-Source: APiQypLYAyfR6Xx1N7Xks+DsAxmAxwfm8bNYFktT+pBPzgIaX8iyUsCtMpxjkbLtC7sejnEyixDaTgktDEyofWhsMHY=
X-Received: by 2002:aa7:8486:: with SMTP id u6mr21962734pfn.106.1586891454721; 
 Tue, 14 Apr 2020 12:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200414012132.32721-1-vitor@massaru.org>
In-Reply-To: <20200414012132.32721-1-vitor@massaru.org>
Date: Tue, 14 Apr 2020 12:10:43 -0700
Message-ID: <CAFd5g44Bs4gfDh82pcwbN5_z7Cuy9SY8UdwftWLGoVCMZZjE3Q@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

- Everyone except LKMP people

On Mon, Apr 13, 2020 at 6:21 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> In the following use case, when compiling the kernel for the UML
> architecture, for example:
>
>  * `make ARCH=um defconfig && make ARCH=um -j8`,
>
> SUBARCH files are generated, however when we run the command:
>
>  * `mrproper ARCH=um`
>
> the files `arch/$(SUBARCH)/include/generated/ aren't cleaned up.
>
> This generates compilation errors by running the following command:
>
>  * `make ARCH=um defconfig O=./build_um && make ARCH=um -j8 O=./build_um`
>
> This PATCH fix that problem.
>
> This makes it possible to compile on different architectures that use the
> SUBARCH variable, in different build directories and root directory of the
> linux directory. This is important because we can compile without the object
> files being overwritten. This reduces the re-compilation time in this use case.
>
> Besides that, in the workflow of developing unit tests, using kunit, and
> compiling in different architectures to develop or test a PATCH, this use case
> applies.
>
>  * This bug was introduced in this commit a788b2ed81abe
>
>  * Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219
>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> Tested-by: Brendan Higgins <brendanhiggins@google.com>

Looks great!

Should linux-kernel-mentees@ be CC'ed on all of your patches? I
thought Shuah said yes.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
