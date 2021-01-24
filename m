Return-Path: <SRS0=cPcG=G3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396AEC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 16:51:57 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4FED22CA2
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 24 Jan 2021 16:51:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4FED22CA2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7F72820465;
	Sun, 24 Jan 2021 16:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nQJZsf2UhiS5; Sun, 24 Jan 2021 16:51:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9D88820407;
	Sun, 24 Jan 2021 16:51:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D213C0FA7;
	Sun, 24 Jan 2021 16:51:53 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8D492C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7C5F4870AA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:51:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id miRxHELajd4h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:51:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 682258708C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 16:51:51 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id q1so21727860ion.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 24 Jan 2021 08:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SQ4aZ+k3kRQ7UZ5Mb09S8K0NfyOVyQRdelQPUkyNbcw=;
 b=o7uh6lY3gLksguSycFzwt+aQIi9Lx7vXV+Elhf7xOdNHk4hy4Hxr8/05GoIGLOe9Uv
 GqS8RR7pUDn4012eJyLs+mwhPCN97l5CpRKTYi5ra+ldlEU7NUIgIQGsHNBrkEM6Pwcy
 swZv8fjqb3g3NcN0H4Mi5uRUOm8qYfZzEnsshQS1Q3XY87Vn03NJR3gsFmt81Yp98fmj
 ErqVGE6kamk1jTbKsNMj8IBSZtH/WidCFVeknX65M/UvTrQj7aM1ZweIonTvw+jkJ1gB
 JFaRzxLAQDoc7loCSZIjspbe4CKIhXxHDqG0OmKS4+bl2rHqmqxOiecWpBNWNePxKaUl
 e3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SQ4aZ+k3kRQ7UZ5Mb09S8K0NfyOVyQRdelQPUkyNbcw=;
 b=NEINEyVsI+QJYTp70QmOnuVSDnkQNmOnyqeGWL/pqZGsA9HS+4G6vb0XC3lFlgzBL3
 qaO2ngLfc/jG9jxG2Qy6+ps3/XpamaqwerLinWpnrj+OHwjtKA1civgqKHkPE/6zuSF9
 /6AYUmI8rOiBmwL8vjPa28j8S9ARALT+CEawf2xzCi+6F6nj9SH7/92FNhkAZ5Uj67a0
 5alyaX5uINU4btH7RTIcvl68jKdcDILflGKpNxNFoWqrPNaNVOaP3nCAIflsb5xG3+o+
 PtvwRvr0kPuqP5kkRRWV9v880KdnPyNYW9acitIEoJomE2XHwwdXqUlMoI2JONnA5VBj
 47rw==
X-Gm-Message-State: AOAM530eQWgnYKned1hFjQYw61g51fVOYUcs/QE2KEBATnQgMug4tsW4
 uwMlkns1f5dgHNB7DdtvDfh27hcE8WlNHsBzgj4=
X-Google-Smtp-Source: ABdhPJwD8fQkaskbHhVnUiAM7CSnvyfVMeJ3SUndQu5ErAvjpro4swsA1lGDwQN0YJvShK47xEfCZOPodOQPsu8xgLI=
X-Received: by 2002:a6b:8b84:: with SMTP id n126mr438406iod.189.1611507110654; 
 Sun, 24 Jan 2021 08:51:50 -0800 (PST)
MIME-Version: 1.0
References: <20210124151933.19696-1-dwaipayanray1@gmail.com>
In-Reply-To: <20210124151933.19696-1-dwaipayanray1@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 24 Jan 2021 17:51:39 +0100
Message-ID: <CAKXUXMx5YZAfd7Qo+s3jHaXjGqw5OK0Ua_qhzJvMhdr+mvdH7Q@mail.gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC 0/3] docs: add documentation
	for checkpatch
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

On Sun, Jan 24, 2021 at 4:19 PM Dwaipayan Ray <dwaipayanray1@gmail.com> wrote:
>
> This patch series serves to introduce a documentation for kernel script
> checkpatch.pl (scripts/checkpatch.pl).
>
> A top level tools directory has been created in docs which shall contain
> the documentation related to the kernel tools and scripts.
>
> This documentation shall be progressively updated by future patches to
> document all the message types in checkpatch. Consecutively this
> documentation itself will be parsed by checkpatch to generate verbose
> messages.
>

Just a quick pointer:

I know there was once some documentation at:

https://folk.universitetetioslo.no/knuto/kernel/4.14/dev-tools/run-checkpatch.html

... but now I just checked and it is gone... Knut Omang (the author)
probably left the university.

I could not find it anywhere else;  Maybe you can reach out to him and
ask if he still has those Documentation files around?

It could be useful to reuse his documentation, although it was never merged.

Lukas

> Dwaipayan Ray (3):
>   docs: add documentation for checkpatch
>   docs: add documentation for checkpatch
>   docs: add documentation for checkpatch
>
>  Documentation/index.rst            |  11 ++
>  Documentation/tools/checkpatch.rst | 271 +++++++++++++++++++++++++++++
>  Documentation/tools/index.rst      |  10 ++
>  3 files changed, 292 insertions(+)
>  create mode 100644 Documentation/tools/checkpatch.rst
>  create mode 100644 Documentation/tools/index.rst
>
> --
> 2.30.0
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
