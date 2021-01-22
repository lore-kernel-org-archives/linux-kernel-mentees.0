Return-Path: <SRS0=cwSI=GZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 134B5C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Jan 2021 20:44:29 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91CA223B06
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Jan 2021 20:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91CA223B06
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 146338714A;
	Fri, 22 Jan 2021 20:44:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u9r8sHY6o5gN; Fri, 22 Jan 2021 20:44:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8382287135;
	Fri, 22 Jan 2021 20:44:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 44B52C088B;
	Fri, 22 Jan 2021 20:44:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A83FDC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 20:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 81F3D2E10E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 20:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VJVNZQ8riRCS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 20:44:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 by silver.osuosl.org (Postfix) with ESMTPS id 0623B22BCC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 20:44:18 +0000 (UTC)
Received: by mail-oi1-f182.google.com with SMTP id q205so7403356oig.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 12:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VF9PXgscDiw2bV9roOwBYj7Ni8JoEIUlUfg2Tt6aYLc=;
 b=gDKtSV/suEqKn7sT9M/+wWzqISKA8yoOH+qUgrgZFOWGZDatinsFN4XtuaAGoYiP2I
 Z7l9r42B/xHwLcz1XJcoB/uKOC0yUZNQIqVfiOAud7z5XHI25JVhPelyyNYNdn3eRfHv
 mTW28itU4GgA86hghIIW6EioJp/lRvQYq9I5zdcWqzgtTBXPczEG3NTL3zCwtMnltb4N
 M0nACGd2DdAeTPkL2+48t/f4O0xmJ++ijN+jmSOhzV35UYxN4IQwB4F6irk8vfal0rvo
 1KaAYYnms5x+Y1+aGAX2dnYhf+kHmiOpYmfuVMQFgbpzVPg1UW78aKjXCe6Zt1q4Z1Bl
 MiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VF9PXgscDiw2bV9roOwBYj7Ni8JoEIUlUfg2Tt6aYLc=;
 b=NoG9JXF9MLmtOWXHSx3FvoNfLDpdGx3xb0G5YjAfiVCME+Ng4/HDv9H0RRptXYREXC
 CZM2wE0KpvRnPewA/F9aIMDmYNox7eJY5MydG/AHxejXLbbU4GIT0oHCM3VEXOWIBCb9
 B+SNvB0aB/QDhLsa6mBECVou8i12SUexogNBRSSBBmvXHvtG50Ypa+gPwe0t6LAYyLYn
 lvisRbqA+vRsxjEZqyBsCBG+jnK3EzXchuIVtJzeiYjeuHmyLsKmRaVX5qyJAFJ5zK+7
 Fkv7Q+2oIxrub8RSMnadej08ro+4suoHj+RT5KuacFQ4VrPfWvIL0KTyOI9E0h/odNKj
 trjQ==
X-Gm-Message-State: AOAM531bnIF+MbNPxEJZ54lRSn2KExVpoTLK2Y8WxmgkOHp08IfbiYY0
 1ViTRd9dFIkT4rxxIOtGDgywVC/cet89WzyNf1W7n6aKIjXVJQ==
X-Google-Smtp-Source: ABdhPJxNXMRujBi/GKsKIEpiTCjXZZ6aaNJYDXAD2jhkVZe6+VRkES8E3a+dPtVj1D1v4M91sHrvun0IHmGezsKR744=
X-Received: by 2002:a17:90a:da02:: with SMTP id
 e2mr7335587pjv.173.1611347775078; 
 Fri, 22 Jan 2021 12:36:15 -0800 (PST)
MIME-Version: 1.0
References: <20210120072547.10221-1-yashsri421@gmail.com>
 <e5c5f8495fbdd063f4272f02a259bbf28b199bdd.camel@perches.com>
 <14707ab9-1872-4f8c-3ed8-e77b663c3adb@gmail.com>
 <fb1b511d71761c99a9bece803f508b674fce9962.camel@perches.com>
 <98d40817-1f80-c772-eb9e-a6c3c04625b3@gmail.com>
 <27366417ad75e0300d4647f776ca61bb1b132507.camel@perches.com>
 <bd560a8e-7949-933a-e4a9-508cb42c2570@gmail.com>
In-Reply-To: <bd560a8e-7949-933a-e4a9-508cb42c2570@gmail.com>
Date: Fri, 22 Jan 2021 12:36:03 -0800
Message-ID: <CAFP8O3+g3KDe1eepGiCXqwMU6K2ve_2ai69WRBCORrr5UAJT+A@mail.gmail.com>
To: Aditya <yashsri421@gmail.com>
Cc: dwaipayanray1@gmail.com, LKML <linux-kernel@vger.kernel.org>,
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
From: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Jan 22, 2021 at 12:13 PM Aditya <yashsri421@gmail.com> wrote:
>
> On 23/1/21 12:40 am, Joe Perches wrote:
> > On Fri, 2021-01-22 at 18:48 +0530, Aditya wrote:
> >> On 21/1/21 12:13 am, Joe Perches wrote:
> >>> I believe the test should be:
> >>>
> >>>     if ($realfile =~ /\.S$/ &&
> >>>         $line =~ /^\+\s*SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {
> >>
> >> Joe, with this regex, we won't be able to match
> >> "jmp  .L_restore
> >> SYM_FUNC_END(\name)"
> >
> > I think that's not an issue.
> >
> >> which was replaced in this patch in the discussion:
> >> https://groups.google.com/g/clang-built-linux/c/-drkmLgu-cU/m/phKe-Tb6CgAJ
> >>
> >> Here, "jmp  .L_restore" was also replaced to fix the error.
> >
> > Notice that this line was also replaced in the same patch:
> >
> >  #ifdef CONFIG_PREEMPTION
> > -SYM_CODE_START_LOCAL_NOALIGN(.L_restore)
> > +SYM_CODE_START_LOCAL_NOALIGN(__thunk_restore)
> >
> >
> >> However, if this
> >> regex(/^\+\s*SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) is
> >> correct, maybe we don't need to check for $file as we are now checking
> >> for just one line.
> >>
> >> What do you think?
> >
> > The test I wrote was complete, did not use $file and emits a
> > warning on the use of CODE_SYM_START_LOCAL_NOALIGN(.L_restore)
> >
> > I think it's sufficient.
> >
>
> Okay, Thanks.. I will send the modified patch :)
>
> Thanks
> Aditya

I am slightly concerned with the direction here.   jmp .Lsym is fine
and is probably preferable in cases where you absolutely want to emit
a local symbol.
(there is a related -z unique-symbol GNU ld+FGKASLR thing I shall
analyze in my spare time)

If the problem is just that STT_SECTION symbols are missing, can
objtool do something to conceptually synthesize them?
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
