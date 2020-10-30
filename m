Return-Path: <SRS0=/L4e=EF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB79C55179
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 08:48:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C21C920704
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 08:48:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NtqOKBMw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C21C920704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 19CCA8612E;
	Fri, 30 Oct 2020 08:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m4cMaSzbgLmb; Fri, 30 Oct 2020 08:48:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1278285FA4;
	Fri, 30 Oct 2020 08:48:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F37DFC0893;
	Fri, 30 Oct 2020 08:48:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9D3CDC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 08:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 93E51871CF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 08:48:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nEW0x2iRPvdr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 08:47:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
 [209.85.208.196])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8FA6087190
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 08:47:58 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id p15so6026449ljj.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=i0fEMvDETJI1R70/B9LyHflKov+sElCOIw/uyiyyG8U=;
 b=NtqOKBMw1uEv4vXEWzKmi5t7Xh0TjUyMk4i1zpv6Vmp/iWTjZXhTKNxJY7GnnF/WfS
 GSMa3o5/ZsdwVebpyX1XFu/iGJfVH0oVFgdxn50rzNaavP0s4+YJqxB2vQeQTReEc65U
 NGIu8U6DPQq+Vge+bcMdHe8/iHuOh/F8zobgxeqjaygKwMjKRYG3xbSAHGfGDekV83xK
 CHZ8zmVx+3dZQw0nbFRynb1UvLMQMe9CHJq+zyPxjnBklftAToOvAQCCmz9KRKsyuXWG
 v5sluqSy3Jytz2WMtkm3i0UQK6U+r6IJGN9s2UvgHsDSlNHMRZL8wRV/rGLFs5QLPbUr
 CfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i0fEMvDETJI1R70/B9LyHflKov+sElCOIw/uyiyyG8U=;
 b=eQGaZMX2/ROMvLqLMoHv9RvlMhYMFZaHYbD/IDjLnbfVK2nqf6eDlEpi1wjdclc2EL
 feLqLom0xghSBLn6FcB4E6WuFXM4KMMR2b9PdOJ8QbGh4E90EyhzyKJplsw37YmDvnvj
 oq73bji20941NEM3S9ORmeSfz0i3EeLTurhPy8GcM3XgH6u7Bok5sFwe1HpxE6JQoLqK
 X2Q289/lcYFTtTXQNJ88qGNZwXV3IQ9imeBqmFyoSFkvElGL3OQDwVFaLaqc/CZFFabJ
 5QOkN1v3fZSEJ1UXrHVwMZfL/yX0laJhTYLtiVnXZm/Wcw0qABGwgESHEyM3/uz+r0OE
 vofA==
X-Gm-Message-State: AOAM533o55Aat6et15+xXSbLTxZjYwhQoGqYVaXgdCaS58p+3VbEq4uK
 0RcovZA7wgsmd8tWnk6JccxMPEZrs/MZqCfvZXw=
X-Google-Smtp-Source: ABdhPJyoCpr4HDUANaUr/Yl0pcHojWoveE6ijGbb4ne61sZjeb9EMwY/mcke62UYuePl646JGbkh58L43HHtSb7ao8o=
X-Received: by 2002:a2e:584e:: with SMTP id x14mr514610ljd.335.1604047676651; 
 Fri, 30 Oct 2020 01:47:56 -0700 (PDT)
MIME-Version: 1.0
References: <20201028152501.106117-1-dwaipayanray1@gmail.com>
 <CABJPP5CkzaQ8x+b8UYZCLwXC1WaZL6+rpkespV684zkPAeJXrA@mail.gmail.com>
 <alpine.DEB.2.21.2010281659160.13040@felia>
 <b66e212e-ce43-3284-e3c1-8882412a3961@gmail.com>
 <CABJPP5Ai3aEH9YLGdEujq_XDeGDFHNv3pxUvtdS83i=YcNJJKQ@mail.gmail.com>
 <752a8d52-e597-5dc6-4848-e6a0640030b8@gmail.com>
 <CABJPP5CWehE68jJVo5MUha0VxMVvV86pNCOB2w5-gsyWA9g8MA@mail.gmail.com>
 <CABJPP5AmE1QVMonmvz7TZrEmEqXvd+LUmKzV7Wd5X-2rz8jOHg@mail.gmail.com>
 <CAKXUXMxE6e6NpkYBwB1UtBHvx=s2mANzGcTRr-MGW34HNjRQAQ@mail.gmail.com>
In-Reply-To: <CAKXUXMxE6e6NpkYBwB1UtBHvx=s2mANzGcTRr-MGW34HNjRQAQ@mail.gmail.com>
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
Date: Fri, 30 Oct 2020 14:17:26 +0530
Message-ID: <CABJPP5BCO-yXv-CjMsa4Qj0KpmPm3zoqPaQE47Wp_6oDF=Pk0Q@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya <yashsri421@gmail.com>
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] checkpatch: improve handling
	of email comments
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

>
> By the way, I guess it is a good time to share the checkpatch.pl
> evaluation scripts with each other, compare them and settle among us
> for one common script to use.
>
> (That gives away the mentee intro coding challenge but I am sure we
> can come up with a new one...)
>
>

Sure that sounds good to me. We could even combine the scripts to
create something more efficient probably.

Here is the one I use for generating the checkpatch output data over
the supplied commits:
https://gist.github.com/raydwaipayan/57cc003e74618fe8de8917bc343fd234

(Multithreaded and semaphores to eliminate races between threads
to write to file)

For generating summary:
https://gist.github.com/raydwaipayan/9e1f340e3e892bd48a2c972f0517698d

For comparisons and individual warnings I usually rely on diff and grep.

Thanks,
Dwaipayan.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
