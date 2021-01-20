Return-Path: <SRS0=Fejl=GX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F4BC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Jan 2021 19:05:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39859233F6
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Jan 2021 19:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39859233F6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 991DC85C04;
	Wed, 20 Jan 2021 19:05:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kri2jprsz7ry; Wed, 20 Jan 2021 19:05:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CEAAE855D3;
	Wed, 20 Jan 2021 19:05:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AC190C088B;
	Wed, 20 Jan 2021 19:05:26 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 81AFCC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 19:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 274018712F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 19:05:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yflL9sTe8g6W
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 19:05:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4578D8712B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 19:05:23 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id x71so10365877oia.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 11:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2IjT5vM0wwpC9kpod4C2W/rvy6n2du1gFGDH7SeVYpA=;
 b=FnEQe4NdFtLMCzMpWBm01f0nkqCIXmpGnyv1Isu2e3YosASvuZSZMrYjbK4n8SXMKA
 11bXc0VkJx6niIVERe7ZEenE3e3K51Vv3ClAmmpkWCIHiy5yqtGOEHMojs46e1tudcx4
 +KIkD1vhoSe630IfWDZSi2/JMI5WF+PLk6lbpa61juWxsWRAprfL7r48gLTGHQakJ7YD
 GpY7BfvBRZOrAG4SP79XUJjH/qy1fxHu/YqL/qQLu+kUC2UJ8z64e5jwz8JI222O5pAf
 5k8r0BQXnUgeTXrba1KWIDUD6WLARPQD57kBKzC5P3LoMyPDpd4Tn0qooee6liLjXLjl
 GwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2IjT5vM0wwpC9kpod4C2W/rvy6n2du1gFGDH7SeVYpA=;
 b=pdybyfj3tKbj4NwMs5s8IZRFLmjMzs3kAy0N+NNPrYZTktJaIkTpPcZ6iWkAoBkIb8
 HBRjLEbt9szDuEgSA5c1UHloLdw4cPf3juvLokelI/44mzTuhUBHe3cjqLw/wglIcizD
 mEWyYAQmL5j9wIgl3Rk666sQaIGjaCYSuBEocu9taLGr0u5gnmY5kMCYPheersMnoL95
 O3aCWtSnjb/bSNFJ9y1wcFpHXHymXa2/kKniR6pWpb7vNaemmoav2nMoj9salIrjeWj/
 ym0NVQ8VzDNAVvYATw9dy0GxNTr9jp08AUKaSYGxTTn7UtlUYJTfGQDYscWltdvZrmD5
 Lspg==
X-Gm-Message-State: AOAM531sYiJXy382v/n/sXQnhUvdn8O4B0lcQf+tGzrfsTZWGzqkLzfN
 sYEpIHgDFnxK+Yg8w2BD2QyT/hBGcCBCgIMd2emUt8MFTYI=
X-Google-Smtp-Source: ABdhPJwVH5hPIt+TGvLTxRBBzGs/IugUmzu+q+OXrVRQdS4VsRDDJ4BtXntxOzCvUMCUXt5VtXebFAiD2WbdPyv7dOM=
X-Received: by 2002:a17:90b:228f:: with SMTP id
 kx15mr733291pjb.32.1611169033913; 
 Wed, 20 Jan 2021 10:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20210120072547.10221-1-yashsri421@gmail.com>
 <e5c5f8495fbdd063f4272f02a259bbf28b199bdd.camel@perches.com>
 <14707ab9-1872-4f8c-3ed8-e77b663c3adb@gmail.com>
 <fb1b511d71761c99a9bece803f508b674fce9962.camel@perches.com>
In-Reply-To: <fb1b511d71761c99a9bece803f508b674fce9962.camel@perches.com>
Date: Wed, 20 Jan 2021 10:57:03 -0800
Message-ID: <CAKwvOd=HNuB8bqJvXEjvYWorika99QX=jKSfHy2hf0NOKrrc8w@mail.gmail.com>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Aditya <yashsri421@gmail.com>, dwaipayanray1@gmail.com,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Mark Brown <broonie@kernel.org>, Joe Perches <joe@perches.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] checkpatch: add warning for
 avoiding .L prefix symbols in assembly files
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
From: Nick Desaulniers via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Wed, Jan 20, 2021 at 10:43 AM Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2021-01-20 at 18:23 +0530, Aditya wrote:
> > On 20/1/21 2:51 pm, Joe Perches wrote:
> > > On Wed, 2021-01-20 at 12:55 +0530, Aditya Srivastava wrote:
> > > > Local symbols prefixed with '.L' do not emit symbol table entries, as
> > > > they have special meaning for the assembler.
> > > >
> > > > '.L' prefixed symbols can be used within a code region, but should be
> > > > avoided for denoting a range of code via 'SYM_*_START/END' annotations.
> > > >
> > > > Add a new check to emit a warning on finding the usage of '.L' symbols
> > > > in '.S' files, if it lies within SYM_*_START/END annotation pair.
> > >
> > > I believe this needs a test for $file as it won't work well on
> > > patches as the SYM_*_START/END may not be in the patch context.
> > >
> > Okay.
> >
> > > Also, is this supposed to work for local labels like '.L<foo>:'?
> > > I don't think a warning should be generated for those.
> > >
> > Yes, currently it will generate warning for all symbols which start
> > with .L and have non- white character symbol following it, if it is
> > lying within SYM_*_START/END annotation pair.
> >
> > Should I reduce the check to \.L_\S+ instead? (please note "_"
> > following ".L")
>
> Use grep first.  That would still match several existing labels.
>
> > Pardon me, I'm not good with assembly :/
>
> Spending time reading docs can help with that.
>
> Mark?  Can you please comment about the below?
>
> I believe the test should be:
>
>         if ($realfile =~ /\.S$/ &&
>             $line =~ /^\+\s*SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {
>                 WARN(...);
>         }
>
> so that only this code currently matches:
>
> $ git grep -P '^\s*SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L' -- '*.S'
> arch/x86/boot/compressed/head_32.S:SYM_FUNC_START_LOCAL_NOALIGN(.Lrelocated)
> arch/x86/boot/compressed/head_32.S:SYM_FUNC_END(.Lrelocated)
> arch/x86/boot/compressed/head_64.S:SYM_FUNC_START_LOCAL_NOALIGN(.Lrelocated)
> arch/x86/boot/compressed/head_64.S:SYM_FUNC_END(.Lrelocated)
> arch/x86/boot/compressed/head_64.S:SYM_FUNC_START_LOCAL_NOALIGN(.Lpaging_enabled)
> arch/x86/boot/compressed/head_64.S:SYM_FUNC_END(.Lpaging_enabled)
> arch/x86/boot/compressed/head_64.S:SYM_FUNC_START_LOCAL_NOALIGN(.Lno_longmode)
> arch/x86/boot/compressed/head_64.S:SYM_FUNC_END(.Lno_longmode)
> arch/x86/boot/pmjump.S:SYM_FUNC_START_LOCAL_NOALIGN(.Lin_pm32)
> arch/x86/boot/pmjump.S:SYM_FUNC_END(.Lin_pm32)
> arch/x86/entry/entry_64.S:SYM_CODE_START_LOCAL_NOALIGN(.Lbad_gs)
> arch/x86/entry/entry_64.S:SYM_CODE_END(.Lbad_gs)
> arch/x86/lib/copy_user_64.S:SYM_CODE_START_LOCAL(.Lcopy_user_handle_tail)
> arch/x86/lib/copy_user_64.S:SYM_CODE_END(.Lcopy_user_handle_tail)
> arch/x86/lib/getuser.S:SYM_CODE_START_LOCAL(.Lbad_get_user_clac)
> arch/x86/lib/getuser.S:SYM_CODE_END(.Lbad_get_user_clac)
> arch/x86/lib/getuser.S:SYM_CODE_START_LOCAL(.Lbad_get_user_8_clac)
> arch/x86/lib/getuser.S:SYM_CODE_END(.Lbad_get_user_8_clac)
> arch/x86/lib/putuser.S:SYM_CODE_START_LOCAL(.Lbad_put_user_clac)
> arch/x86/lib/putuser.S:SYM_CODE_END(.Lbad_put_user_clac)
> arch/x86/realmode/rm/wakeup_asm.S:SYM_DATA_START_LOCAL(.Lwakeup_idt)
> arch/x86/realmode/rm/wakeup_asm.S:SYM_DATA_END(.Lwakeup_idt)

Josh, I assume objtool does not annotate code under:
arch/x86/boot/
arch/x86/entry/
arch/x86/realmode/
?

The rest, ie
arch/x86/lib/
seem potentially relevant?
-- 
Thanks,
~Nick Desaulniers
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
