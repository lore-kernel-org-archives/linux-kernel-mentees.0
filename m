Return-Path: <SRS0=OT4g=IT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF1FC433C1
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Mar 2021 17:28:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52F3D6192D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 21 Mar 2021 17:28:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 52F3D6192D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06460605E1;
	Sun, 21 Mar 2021 17:28:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ry3VOl3HLBYJ; Sun, 21 Mar 2021 17:28:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB8F4605D1;
	Sun, 21 Mar 2021 17:28:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CCA72C000A;
	Sun, 21 Mar 2021 17:28:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70EDCC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 17:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6622F8354D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 17:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id doKEj9fTQwxz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 17:27:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 390828354B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 17:27:58 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id n198so11526972iod.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 21 Mar 2021 10:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6zm0aiiO73U4b8eE9BfMLdrO9fYZI85feI/kWWq6N+0=;
 b=ODKt5GlH0QYUbBjSA0VzWTIrTFU7hNZx4Trf723HnKNdyxS7hrEYsCUB5+uKs7tX5E
 QE1i5iGdkIOJfxBdXIg1C1i6ZeWpSMYwZn1dHRYh5OytXv30xGhxU/Z+VW75q1NpznpI
 8mvur6kDTaWexnhsYokgiRWkbdVDRf9pvz6XkvP8RIzoJUXR+maNsnlHrbh8uJiStFej
 Q6nrhgNJqM9YY9fK8AGn3JbRNiYHqY0DqRvnCxtXqYqbZ9FhPf48uWJgM1auugstu0mc
 n272BTDpxEGQu80J8vl+j8+7N2DvZ9Nsa/UXBUQnVIo0prREbCQyoUTVVougJl6+qKod
 WnwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6zm0aiiO73U4b8eE9BfMLdrO9fYZI85feI/kWWq6N+0=;
 b=ZZn/jfbH61X3KQKdq5yNkg8CwBmYRg7ZHff+uiWYrQuewYAQ9EhJzlNIW6NdSBrX4v
 4jgXPT/wYNJbHG5AfhS95ABkQThOBi+zYRrovHg6vrKB0WIdpDk2Hdqg5EB3KKJIE78k
 HJ8nEFWUbCiWTbiBNImgMrrScKpCeZwHBOoZy8agerFGB7V+fnIqI4VGvOuDsqVwgZ8L
 DsluiAH97y39uINJOq1bWFzeAB+GNdsPYqr2Ha72YOwzWx07ejlBAHYGmmT8nNJWsLyg
 7g3khkbUzmzGDbvYqBPRUViFCnTRFyEh8hokri7Ks1SW5/GLeDDfLK/qFDPpI4OwEqtC
 6hiw==
X-Gm-Message-State: AOAM530wkOX55jiezJFedyfCHfpXkOydILAz3WJiTVbQrOT3nCJOsFQ+
 SloMy/eYgdlv37Dx2VhM/j81DCwc0xYinHVUJ4A=
X-Google-Smtp-Source: ABdhPJw8hFlwEyVE+neX6S01GcwG0x51SBVyZUZnXE+zOIURumHfftQt2i5MNfVCK7WrZCXNUioDdwMMiy6RYRI6yWg=
X-Received: by 2002:a05:6638:2bb:: with SMTP id
 d27mr8072342jaq.98.1616347677213; 
 Sun, 21 Mar 2021 10:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210320162939.32707-1-yashsri421@gmail.com>
In-Reply-To: <20210320162939.32707-1-yashsri421@gmail.com>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sun, 21 Mar 2021 18:27:46 +0100
Message-ID: <CAKXUXMxU_7YBqyEeip5kpN5LpYmtR0MFF4QbdtOebxJHC1pkTA@mail.gmail.com>
Subject: Re: [PATCH] ntfs: fix incorrect kernel-doc comment syntax in files
To: Aditya Srivastava <yashsri421@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-ntfs-dev@lists.sourceforge.net,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org, anton@tuxera.com
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

On Sat, Mar 20, 2021 at 5:29 PM Aditya Srivastava <yashsri421@gmail.com> wrote:
>
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> There are certain files in fs/ntfs which follow this syntax, but the
> content inside does not comply with kernel-doc.
> Such lines were probably not meant for kernel-doc parsing, but are parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warnings from kernel-doc.
>
> E.g., presence of kernel-doc like comment in the header for
> fs/ntfs/attrib.c, causes these unexpected warnings by kernel-doc:
> "warning: Incorrect use of kernel-doc format:  * ntfs_map_runlist_nolock - map (a part of) a runlist of an ntfs inode"
> "warning: Function parameter or member 'ni' not described in 'ntfs_map_runlist_nolock'"
> "warning: Function parameter or member 'vcn' not described in 'ntfs_map_runlist_nolock'"
> "warning: Function parameter or member 'ctx' not described in 'ntfs_map_runlist_nolock'"
> "warning: expecting prototype for c(). Prototype was for ntfs_map_runlist_nolock() instead"
>
> Similarly for other files too.
>
> Provide a simple fix by replacing such occurrences with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> * Applies perfectly on next-20210319
>
>  fs/ntfs/aops.c     | 2 +-
>  fs/ntfs/aops.h     | 2 +-
>  fs/ntfs/attrib.c   | 2 +-
>  fs/ntfs/compress.c | 8 ++++----
>  fs/ntfs/dir.c      | 4 ++--
>  fs/ntfs/inode.c    | 2 +-
>  fs/ntfs/mft.c      | 2 +-
>  fs/ntfs/runlist.c  | 2 +-
>  8 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/fs/ntfs/aops.c b/fs/ntfs/aops.c
> index bb0a43860ad2..1024cdec136a 100644
> --- a/fs/ntfs/aops.c
> +++ b/fs/ntfs/aops.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * aops.c - NTFS kernel address space operations and page cache handling.
>   *
>   * Copyright (c) 2001-2014 Anton Altaparmakov and Tuxera Inc.
> diff --git a/fs/ntfs/aops.h b/fs/ntfs/aops.h
> index f0962d46bd67..2dcd46befdff 100644
> --- a/fs/ntfs/aops.h
> +++ b/fs/ntfs/aops.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
> -/**
> +/*
>   * aops.h - Defines for NTFS kernel address space operations and page cache
>   *         handling.  Part of the Linux-NTFS project.
>   *
> diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
> index d563abc3e136..2911c04a33e0 100644
> --- a/fs/ntfs/attrib.c
> +++ b/fs/ntfs/attrib.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * attrib.c - NTFS attribute operations.  Part of the Linux-NTFS project.
>   *
>   * Copyright (c) 2001-2012 Anton Altaparmakov and Tuxera Inc.
> diff --git a/fs/ntfs/compress.c b/fs/ntfs/compress.c
> index d2f9d6a0ee32..014dbd079ad5 100644
> --- a/fs/ntfs/compress.c
> +++ b/fs/ntfs/compress.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * compress.c - NTFS kernel compressed attributes handling.
>   *             Part of the Linux-NTFS project.
>   *
> @@ -18,7 +18,7 @@
>  #include "debug.h"
>  #include "ntfs.h"
>
> -/**
> +/*
>   * ntfs_compression_constants - enum of constants used in the compression code

here this one should probably be prefixed with enum; then, it should
be valid kernel-doc.

>   */
>  typedef enum {
> @@ -41,12 +41,12 @@ typedef enum {
>         NTFS_MAX_CB_SIZE        = 64 * 1024,
>  } ntfs_compression_constants;
>
> -/**
> +/*
>   * ntfs_compression_buffer - one buffer for the decompression engine
>   */
>  static u8 *ntfs_compression_buffer;
>
> -/**
> +/*
>   * ntfs_cb_lock - spinlock which protects ntfs_compression_buffer
>   */
>  static DEFINE_SPINLOCK(ntfs_cb_lock);
> diff --git a/fs/ntfs/dir.c b/fs/ntfs/dir.c
> index cd96083a12c8..518c3a21a556 100644
> --- a/fs/ntfs/dir.c
> +++ b/fs/ntfs/dir.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * dir.c - NTFS kernel directory operations. Part of the Linux-NTFS project.
>   *
>   * Copyright (c) 2001-2007 Anton Altaparmakov
> @@ -17,7 +17,7 @@
>  #include "debug.h"
>  #include "ntfs.h"
>
> -/**
> +/*
>   * The little endian Unicode string $I30 as a global constant.
>   */
>  ntfschar I30[5] = { cpu_to_le16('$'), cpu_to_le16('I'),
> diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
> index f5c058b3192c..4277d0fd7d88 100644
> --- a/fs/ntfs/inode.c
> +++ b/fs/ntfs/inode.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * inode.c - NTFS kernel inode handling.
>   *
>   * Copyright (c) 2001-2014 Anton Altaparmakov and Tuxera Inc.
> diff --git a/fs/ntfs/mft.c b/fs/ntfs/mft.c
> index 0d62cd5bb7f8..d197d402933a 100644
> --- a/fs/ntfs/mft.c
> +++ b/fs/ntfs/mft.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * mft.c - NTFS kernel mft record operations. Part of the Linux-NTFS project.
>   *
>   * Copyright (c) 2001-2012 Anton Altaparmakov and Tuxera Inc.
> diff --git a/fs/ntfs/runlist.c b/fs/ntfs/runlist.c
> index 97932fb5179c..0d448e9881f7 100644
> --- a/fs/ntfs/runlist.c
> +++ b/fs/ntfs/runlist.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/**
> +/*
>   * runlist.c - NTFS runlist handling code.  Part of the Linux-NTFS project.
>   *
>   * Copyright (c) 2001-2007 Anton Altaparmakov
> --
> 2.17.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
