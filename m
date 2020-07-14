Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C9BC433E5
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 04:38:15 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD0E2221E9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 04:38:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e9tDNzCI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD0E2221E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8DD1D204EB;
	Tue, 14 Jul 2020 04:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kkw9A3H1bVaj; Tue, 14 Jul 2020 04:38:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id ABD94204B3;
	Tue, 14 Jul 2020 04:38:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85DFDC088E;
	Tue, 14 Jul 2020 04:38:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5646FC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 04:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4473B8A78D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 04:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H4D67CQRa9fu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 04:38:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com
 [209.85.219.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 5AF458A19E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 04:38:11 +0000 (UTC)
Received: by mail-qv1-f65.google.com with SMTP id h17so6930371qvr.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 21:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y31BNb/eGqFyJBN9GqgydpHsgPuWi+UTnaYm/dyFLoI=;
 b=e9tDNzCI8y6XASca3rMyCwClFiMfEEI33PXc7benargRe/+17u5jsFnueV7HBXITtv
 HW7eiKWN9OyTktMyjHfLdSdu1lFnayYfED8Hc20dYOGvDztyJwrwHA1BZxD/ld+eD1bI
 Tvlzza0S1EufFf7AKFAu7ib8CAw1wrSaQIYgQff15LoL5h+yoAfC//rsneKxzDVEyS0e
 Az/2R3VhPPK3gjIcC4kZn8O6uRVJwUGKLhGFNynZU/09OIisazZUhZFDwZkosLjgvrUY
 z3uHf/da1SZLzfnI+bNcxuos69+KRIvdGNto+jcGoQ//ki3PNsKRUYBMFXPxKhkTjKss
 gATw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y31BNb/eGqFyJBN9GqgydpHsgPuWi+UTnaYm/dyFLoI=;
 b=igdcAaD7Nf41kxcFytpHDPZR5jPx8uQlO/gCwfMwW3zFJF24m44rDFAsmNoEXcyGDF
 D59Mam4F4DtsljoPxV1sIbCQAYA2p7jL7XkfGUGg7zdUnKjy0hB1yHGjk7kUT6fPUKxq
 R07KxHnR3PiZGbuZz4IGZF7aszUKYOXguJbBYLnmA0qOafio/06r1HuIBNRZ8XPdxLoV
 IYJs/CMcg9ZY54rp1emoukdrI6xCltZ+vHzzkB7l9+DnEefxmj7tdpZqivMwh2SwQ6B7
 kLmLUnNng3kwizrYZS6q/3xo5gfGSIakKz4ASr7Ly3ne/dVrNCBO7UiaknhHtlLVISKu
 pUFQ==
X-Gm-Message-State: AOAM533I76sN1+845ESXJFHfryowBJfg8nVaU8ehQZh+oyPB/2njsd1S
 FhJNfanZ4y3FXE6kCzUU2cYS8lNlRcrWbxVU4v8=
X-Google-Smtp-Source: ABdhPJwSrv5o8uceS08bCjMWdOKnZPRzCxY5GI1ylSLJd33CSHfFGyaUZTVFHyQzBvK3OsQU7+LYYigmmVcyHbVaA3A=
X-Received: by 2002:a05:6214:bce:: with SMTP id
 ff14mr2751110qvb.196.1594701489859; 
 Mon, 13 Jul 2020 21:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <CAEf4BzZRGOsTiW3uFWd1aY6K5Yi+QBrTeC5FNOo6uVXviXuX4g@mail.gmail.com>
 <20200714012732.195466-1-yepeilin.cs@gmail.com>
In-Reply-To: <20200714012732.195466-1-yepeilin.cs@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 13 Jul 2020 21:37:59 -0700
Message-ID: <CAEf4Bzas-C7hKX=AutcV1fz-F_q2P8+OCnrA37h-nCytLHPn1g@mail.gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, syzkaller-bugs@googlegroups.com,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Networking <netdev@vger.kernel.org>, KP Singh <kpsingh@chromium.org>,
 Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
 Andrii Nakryiko <andriin@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH v2] bpf: Fix NULL pointer
 dereference in __btf_resolve_helper_id()
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

On Mon, Jul 13, 2020 at 6:29 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> Prevent __btf_resolve_helper_id() from dereferencing `btf_vmlinux`
> as NULL. This patch fixes the following syzbot bug:
>
>     https://syzkaller.appspot.com/bug?id=5edd146856fd513747c1992442732e5a0e9ba355
>
> Reported-by: syzbot+ee09bda7017345f1fbe6@syzkaller.appspotmail.com
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> Thank you for reviewing my patch! I am new to Linux kernel development; would
> the log message and errno be appropriate for this case?

I think it's good enough, thanks for the fix.

Acked-by: Andrii Nakryiko <andriin@fb.com>

>
> Change in v2:
>     - Split NULL and IS_ERR cases.
>
>  kernel/bpf/btf.c | 5 +++++
>  1 file changed, 5 insertions(+)
>

[...]
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
