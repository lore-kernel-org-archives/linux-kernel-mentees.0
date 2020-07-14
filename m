Return-Path: <SRS0=uvNB=AZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9E2C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 17:28:02 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C348E22518
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 14 Jul 2020 17:28:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mrk8nP8Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C348E22518
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9D49187DCC;
	Tue, 14 Jul 2020 17:28:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5ONDaFh_peRl; Tue, 14 Jul 2020 17:28:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3C7AB87DBC;
	Tue, 14 Jul 2020 17:28:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13B6FC0891;
	Tue, 14 Jul 2020 17:28:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE84CC0733
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 17:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id DB6678958E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 17:27:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l4GrYtlRcKJr
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 17:27:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
 [209.85.208.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A6D108956F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 17:27:55 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id r19so24057446ljn.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 14 Jul 2020 10:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rJflZjiXOdQ2b9X0uINcJ4Ucju/qSppPTgvRYeR307M=;
 b=mrk8nP8ZaXDxwoSsyA8k3vVqLdKjX86zxjouhivf+G7iTeVFciVWjDwblY2qlwRa9V
 9emGm1OFwkHsv0RNh6k8KhURGH1D+FwH8FkT9vHm1WjxGSwkBcc7aO9Y48XsU2c2Ndfp
 ncNp8CUw5jw3N9JSVvpdTbpMguEDLfXGvNBMVwFLUb+lT15MUcBJEF7DDDa2ApoKe2px
 /yca6v25q5b+Ew54GU19aO3kaPD9/jBteoDRN5SWUr1u5ykP8GzprDDHxTAHJoLMATxH
 L2Itbr80hoTwWdfBBNrcSmyBVo7l9b1xeyICzyCQG5N5jUV/3HnVVjmUfM6PWg6pxsNZ
 6wcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rJflZjiXOdQ2b9X0uINcJ4Ucju/qSppPTgvRYeR307M=;
 b=Aml8tVeAX3SjllxL/an3gYXLMLQzoJ7KlHl4Poyut92PEOG1JrdD09t4n9RHS4qJl9
 OxTaIBUZo+PJw5IWMatOlqt72Qw2QkrKOl7T8G6V4X/uu7I2PF59goVaEkZYOI8jxu5t
 kRgYW7yzXUyYb4p6yYtd720JZDr5ROpE9SUbOIjeo5GFPSNHQc/TMScXIhK4T5dxyzc+
 7+Fu0KxSahFUZbjBxdi6qZ5bPG4nK86tveVz2r0OdjoJK5jc0ydDWCBb9gSyuKAeDjhM
 BHK+HJUf0YWRTEccK/H3UEjzQIZcpNBxt8Osql6MX2JFOiHvqsTZzot2HLCeIzVmY8H7
 nXJQ==
X-Gm-Message-State: AOAM530wzTHGg1YsUseU5V+Zx9q5vQ6f/qlVtQxYaHdSV/CpvFy4s+V7
 yu4HdjKVvPJd6MMXTBi5HaWAzkv20Vvky24uV+g=
X-Google-Smtp-Source: ABdhPJwXkCPdv8pEQTPBzV1xLgwG/Fk/yXhNz7NQyeZbo2FvwLmIalitSURyFPmgQdvxw6/FjTtTVnFu1TFItk7wtV8=
X-Received: by 2002:a2e:9a4d:: with SMTP id k13mr2946227ljj.283.1594747673686; 
 Tue, 14 Jul 2020 10:27:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAEf4BzZRGOsTiW3uFWd1aY6K5Yi+QBrTeC5FNOo6uVXviXuX4g@mail.gmail.com>
 <20200714012732.195466-1-yepeilin.cs@gmail.com>
 <CAEf4Bzas-C7hKX=AutcV1fz-F_q2P8+OCnrA37h-nCytLHPn1g@mail.gmail.com>
In-Reply-To: <CAEf4Bzas-C7hKX=AutcV1fz-F_q2P8+OCnrA37h-nCytLHPn1g@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 14 Jul 2020 10:27:42 -0700
Message-ID: <CAADnVQ+jUPGJapkvKW=AfXESD6Vz2iuONvJm8eJm5Yd+u9mJ+w@mail.gmail.com>
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Networking <netdev@vger.kernel.org>, KP Singh <kpsingh@chromium.org>,
 Yonghong Song <yhs@fb.com>, bpf <bpf@vger.kernel.org>,
 Andrii Nakryiko <andriin@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 open list <linux-kernel@vger.kernel.org>,
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

On Mon, Jul 13, 2020 at 9:38 PM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Mon, Jul 13, 2020 at 6:29 PM Peilin Ye <yepeilin.cs@gmail.com> wrote:
> >
> > Prevent __btf_resolve_helper_id() from dereferencing `btf_vmlinux`
> > as NULL. This patch fixes the following syzbot bug:
> >
> >     https://syzkaller.appspot.com/bug?id=5edd146856fd513747c1992442732e5a0e9ba355

The link looks wrong?
Nothing in the stack trace indicates this issue.

> > Reported-by: syzbot+ee09bda7017345f1fbe6@syzkaller.appspotmail.com
> > Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> > ---
> > Thank you for reviewing my patch! I am new to Linux kernel development; would
> > the log message and errno be appropriate for this case?
>
> I think it's good enough, thanks for the fix.
>
> Acked-by: Andrii Nakryiko <andriin@fb.com>
>
> >
> > Change in v2:
> >     - Split NULL and IS_ERR cases.
> >
> >  kernel/bpf/btf.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
>
> [...]
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
