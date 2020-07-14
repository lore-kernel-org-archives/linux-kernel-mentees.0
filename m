Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59222C433EC
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 00:53:46 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 242E3217BA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 00:53:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rMiR71v/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 242E3217BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DA00529DD8;
	Tue, 14 Jul 2020 00:53:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id siZ+96ApfzvU; Tue, 14 Jul 2020 00:53:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id CDC8429434;
	Tue, 14 Jul 2020 00:53:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B87A7C088E;
	Tue, 14 Jul 2020 00:53:43 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7760FC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 00:53:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 73C468A76D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 00:53:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HSIDgzqXRipv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 00:53:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AB8488A763
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 00:53:41 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id q198so14164174qka.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 13 Jul 2020 17:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bpaDsBvlz9opHaHnQGrx2N2C4SwE84lnQr92+oDq3LY=;
 b=rMiR71v/yR8fu0eB1iPdEzuhUbc3Mny0j9rhKZSyWfs+1MHiJRYvhF82OKFiwcI3X9
 XeiFgk1K/dR0TL1vVCF/lQSSqa/gD4mrnxOYM7tt+DvJ2oPoGd95uW8w15LKE8GzZOTn
 uJnZET35qb/G0NspQbaiwdvxGR7/QENEyDYKFWc5nkbymOswflogUc1UIV7n0pZFuspi
 A5ouCCNm08KU7a96OiZ/WsFZN9Szb1Teoup51io8Dt4X1WWmakOZN4IA2+3gFZ32JTVN
 /35A7tqKPg6tE0rU+Q8HBN4pXEmq040XQusOlSB/q1e9mKPGYVxJBMQwlkjhSrz+QdxU
 NvUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bpaDsBvlz9opHaHnQGrx2N2C4SwE84lnQr92+oDq3LY=;
 b=ZkjTj8rtcuZkRYeH2UwcOVZnmG6iDb+KRESUhravoalVz2JNHx/yiC5P3h5PfaY55e
 y6Mdh+e+KTLNZS4YIQkyhHOmuER+GoXb84jryaSOccW0KXcap6bJcpShwXQu13uCkJgv
 To3bCaF8CXr7SiZuiRv8q6MtdJq82GSwuPuMPPuLA4F9oPx3w24EaMQmHh25paE6e1Ak
 1oQ7BVhGPIRsb+VJRKKeBHFhWr5gUWucIUi2Q3g6cLVAo52YeGsOEZw2K2O3jjhpZxHP
 Iu8Vr7hZKrf9BjRzT8TdQGvrLhXhIYlmX5VvWSSyZ/MW+Ai5Bc5mIYkLu50eWGyBHZyq
 UxHg==
X-Gm-Message-State: AOAM530IJZV42saVCGyCVeLcmcnhFRJP1fEaIGDTF9cVAoK8Pdtcs+3R
 +rXwOux2Si4rUEfwm9P2LixWuqTPVcYxArgBdFI=
X-Google-Smtp-Source: ABdhPJznFhGSinelKiS7+HI+X4/sqgLA5sTa9+gPEz/8nzGxBgAA+YLhuelXQUf40NcKOvz88GZRILG2qCFPv1ILg6w=
X-Received: by 2002:a37:7683:: with SMTP id r125mr2256135qkc.39.1594688020649; 
 Mon, 13 Jul 2020 17:53:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200714003856.194768-1-yepeilin.cs@gmail.com>
In-Reply-To: <20200714003856.194768-1-yepeilin.cs@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 13 Jul 2020 17:53:28 -0700
Message-ID: <CAEf4BzZRGOsTiW3uFWd1aY6K5Yi+QBrTeC5FNOo6uVXviXuX4g@mail.gmail.com>
To: Peilin Ye <yepeilin.cs@gmail.com>
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, syzkaller-bugs@googlegroups.com,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Networking <netdev@vger.kernel.org>, KP Singh <kpsingh@chromium.org>,
 Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
 Andrii Nakryiko <andriin@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] bpf: Fix NULL pointer
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

On Mon, Jul 13, 2020 at 5:43 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
>
> Prevent __btf_resolve_helper_id() from dereferencing `btf_vmlinux`
> as NULL. This patch fixes the following syzbot bug:
>
>     https://syzkaller.appspot.com/bug?id=5edd146856fd513747c1992442732e5a0e9ba355
>
> Reported-by: syzbot+ee09bda7017345f1fbe6@syzkaller.appspotmail.com
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
>  kernel/bpf/btf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
> index 30721f2c2d10..3e981b183fa4 100644
> --- a/kernel/bpf/btf.c
> +++ b/kernel/bpf/btf.c
> @@ -4088,7 +4088,7 @@ static int __btf_resolve_helper_id(struct bpf_verifier_log *log, void *fn,
>         const char *tname, *sym;
>         u32 btf_id, i;
>
> -       if (IS_ERR(btf_vmlinux)) {
> +       if (IS_ERR_OR_NULL(btf_vmlinux)) {
>                 bpf_log(log, "btf_vmlinux is malformed\n");

Can you please split IS_ERR and NULL cases and emit different messages
to log? If the kernel is not built with btf_vmlinux, saying that it's
"malformed" will confuse people. Thanks.

>                 return -EINVAL;
>         }
> --
> 2.25.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
