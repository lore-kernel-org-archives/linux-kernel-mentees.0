Return-Path: <SRS0=IXLA=LY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57C3CC11F65
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 16:49:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E368161469
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Jun 2021 16:49:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E368161469
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A338D605D7;
	Wed, 30 Jun 2021 16:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0O0c-p5a5eK; Wed, 30 Jun 2021 16:49:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D371060590;
	Wed, 30 Jun 2021 16:49:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1192C001A;
	Wed, 30 Jun 2021 16:49:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6DEF0C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 16:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EF6E40640
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 16:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dubeyko-com.20150623.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ao2HTu3HVRcD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 16:49:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 589DE405F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 16:49:29 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id b2so3780050oiy.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Jun 2021 09:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dubeyko-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rrCOm25/wEcGs4N+ignfWeXZ6vUmh9jcEMLQbvJ5br4=;
 b=eeQo4foSw6TAL6FybAfTFXaZWU/NCyKYkJO4+IOMa4MbGuIZpeRjBq3Qm0T552EbpO
 wTBJ2SukQsb0mP4tJ93zV3BYWnc9E7eqTqld7VYYhhw3nonsoA+Zqz9zyT1s6GhK9E7G
 0dSoemF1Zm3Q3U6Fym+KRbHg0yu/Sk5dyzkrfr/3Lmh1xYQpFkFVx40LroJ0tO0paIcP
 5hjTunf7Q7KwPNPmx7Tubjo0sUdQxInBItfmm//y2ISs+CvVl5wAoCuJiTZSDGv+pwc0
 Kmo4oyuwT+0vC0T5yf7mzVMwO+D8r9RgXBarR72UO8D2F1RPczkORPEA7qUdAuDmBe4c
 Jukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=rrCOm25/wEcGs4N+ignfWeXZ6vUmh9jcEMLQbvJ5br4=;
 b=Mvx6d/RYob7Q9hPqBLei3MMy//k3XGP2nSSRMOym7WuJgjvIyL9s60DMgkayg2QO0Z
 v3FquSh18PI106ZWQo3yYseC5VOl2xmi4bagkSDI1BwKmuWhV7vxETtLXxDxzs/2Ns/f
 HEg/0nna8KysTLy9dt/oxdS1rfAuL0fXoIIkIeqfA/tu7j0H6aqDh7+EICVDfGGtsoBv
 iudEKS0bWIvARpbZu5PIJTAn4GJEvowkeCbrUnSuKjW02WsfSFoUo+G/GvwRnisYLHgB
 VnQTiDbYctSAqLYiiF6fDZc3PT5yFrhJMVlL/yPrntUCAo2mXdc0scK0v/MajjKU8uQp
 fpMw==
X-Gm-Message-State: AOAM531ZsKp1xMM/FHoFeQsxyurH/H8r7vE6tYaSdjN0TmuL8ulrAU/u
 cFrL1rJidECGhx2x3mgvJWArLg==
X-Google-Smtp-Source: ABdhPJxzKp7MPSvpUosyPw5bxagc2IEryBNpRdMq/F2UACoqPB/rE/kwSb4EjaFzgOBjtcGJoNJJIQ==
X-Received: by 2002:a54:408b:: with SMTP id i11mr3666320oii.67.1625071768326; 
 Wed, 30 Jun 2021 09:49:28 -0700 (PDT)
Received: from smtpclient.apple ([2600:1700:42f0:6600:f8e3:a853:8646:6bc8])
 by smtp.gmail.com with ESMTPSA id o25sm4650028ood.20.2021.06.30.09.49.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Jun 2021 09:49:27 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH 1/3] hfs: add missing clean-up in hfs_fill_super
From: Viacheslav Dubeyko <slava@dubeyko.com>
In-Reply-To: <6c6d6cd8-b8b3-54a9-f0bd-b36220caba26@gmail.com>
Date: Wed, 30 Jun 2021 09:49:26 -0700
Message-Id: <19A0D984-2817-44C5-87AE-6C2BF2310671@dubeyko.com>
References: <20210629144803.62541-1-desmondcheongzx@gmail.com>
 <20210629144803.62541-2-desmondcheongzx@gmail.com>
 <28CCF4E3-51D1-43BE-A2BA-4708175A59C0@dubeyko.com>
 <6c6d6cd8-b8b3-54a9-f0bd-b36220caba26@gmail.com>
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
Cc: LKML <linux-kernel@vger.kernel.org>, gustavoars@kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
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



> On Jun 29, 2021, at 9:50 PM, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com> wrote:

<skipped>

> Thanks for the suggestion. Since the bail and bail_no_root error paths are used before hfs_find_init and after hfs_find_exit are called in the normal execution case, moving hfs_find_exit under the bail label wouldn't work.
> 
> Perhaps this can be done by introducing another goto label. Any thoughts on the following?
> 
> diff --git a/fs/hfs/super.c b/fs/hfs/super.c
> index 44d07c9e3a7f..12d9bae39363 100644
> --- a/fs/hfs/super.c
> +++ b/fs/hfs/super.c
> @@ -420,14 +420,12 @@ static int hfs_fill_super(struct super_block *sb, void *data, int silent)
>        if (!res) {
>                if (fd.entrylength > sizeof(rec) || fd.entrylength < 0) {
>                        res =  -EIO;
> -                       goto bail;
> +                       goto bail_hfs_find;
>                }
>                hfs_bnode_read(fd.bnode, &rec, fd.entryoffset, fd.entrylength);
>        }
> -       if (res) {
> -               hfs_find_exit(&fd);
> -               goto bail_no_root;
> -       }
> +       if (res)
> +               goto bail_hfs_find;
>        res = -EINVAL;
>        root_inode = hfs_iget(sb, &fd.search_key->cat, &rec);
>        hfs_find_exit(&fd);
> @@ -443,6 +441,8 @@ static int hfs_fill_super(struct super_block *sb, void *data, int silent)
>        /* everything's okay */
>        return 0;
> 
> +bail_hfs_find:
> +       hfs_find_exit(&fd);
> bail_no_root:
>        pr_err("get root inode failed\n");
> bail:

Makes sense. Looks good.

Thanks,
Slava.

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
