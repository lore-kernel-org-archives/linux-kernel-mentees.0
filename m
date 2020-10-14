Return-Path: <SRS0=TCtx=DV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ECD7C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 04:43:22 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CD442076D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 14 Oct 2020 04:43:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y91XoDmg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CD442076D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 29E3E87F09;
	Wed, 14 Oct 2020 04:43:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2SOQiOXga9qA; Wed, 14 Oct 2020 04:43:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 13B9D87DC3;
	Wed, 14 Oct 2020 04:43:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E000BC07FF;
	Wed, 14 Oct 2020 04:43:19 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9F74C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 04:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 91DCF87DC3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 04:43:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmISCR9nAD3k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 04:43:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A622A87D7F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 14 Oct 2020 04:43:15 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id d81so991326wmc.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 21:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=yAoSXHRwpGz7nBgURGl4h1iZHKvaWjYO9+dk8dtTzEM=;
 b=Y91XoDmgSV0T8y7s38jad1TN0OqdQ/W7/i8P2ncbuMKEZD2rOkSZiUQTJlsuYKHtPU
 EAZV7qv1rUsvdBWUoA886/Y95M9vZa/oxqlJFhM8q/1rrvT6J84jeJlhZi8NQCojqDrj
 Tes5NzvdJSB+DVYiNzB7Z+JvVuOHpaiNru8rAGagKUdC0j9MPOurw7mLoHNDCbFsPoZS
 n583hEDRzu2p7Kqe01AlohE9ec6ZDpWlycrOa7cs+BNDFjntEoiVKIrhkwJA/95FI/mV
 FSdQmGYWryAjzzPk7+g9a6lDfDynMecp9R4n0hxGRZiNmkM4V9grSiY5O0gZsORtJ/5Y
 3abg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=yAoSXHRwpGz7nBgURGl4h1iZHKvaWjYO9+dk8dtTzEM=;
 b=ZSJzdS+vnRdZjPuuaCGbcKW1Ta8DJTW6Qny4F/Oy56MKShE6XLPDI2P4cHajdpmVDw
 rzWBu6PPOwt7vla9YtCPqksT4NQeC60JC2BPASFGP5LM6VX5AU5X9/bTMNtZF0loakQ9
 CGYtrohQO5KsdfoOGCt/YhQmZI6MWcjsyH+0g5Ha21vemKguDy43EKZ9opkV1seFG+f5
 ChMn6GurYjhBvpd82QFOn1/DfunYoqoZJYWdoI4oYLP8tRgnV5E/qD2WK14c5BObJg/i
 JXq+DexiOgsQQCI4vb2a5Npr+dLr5lbnGwKxGb5QN206HLMAchtyg+xsZN0mx/iwBjeB
 vyyA==
X-Gm-Message-State: AOAM533KKa8cOB8kCme4aHtewg2qoEiN8x0G/1oAWZNrWgaD+AnNzeiO
 c8duf5pRXeiez58cLZ64q/0=
X-Google-Smtp-Source: ABdhPJxLj7cfYT+/1rNY1VWyuk/FeNLUT9YgTom+iIidb6iYPJvpU8+DuMBSQu3AZwhlP+GOUgdJYw==
X-Received: by 2002:a7b:c081:: with SMTP id r1mr1410127wmh.158.1602650594160; 
 Tue, 13 Oct 2020 21:43:14 -0700 (PDT)
Received: from felia ([2001:16b8:2da8:8200:4c70:9c82:f3bf:bebb])
 by smtp.gmail.com with ESMTPSA id h206sm1713989wmf.47.2020.10.13.21.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 21:43:13 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 14 Oct 2020 06:43:06 +0200 (CEST)
X-X-Sender: lukas@felia
To: Masahiro Yamada <masahiroy@kernel.org>
In-Reply-To: <CAK7LNAR+W9h95sUZFwRHiyiDbUxn9b7KN5P1zKOAdR2emxp7=g@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2010140636020.6186@felia>
References: <20201001075723.24246-1-lukas.bulwahn@gmail.com>
 <CAK7LNARXirw-DZg1-Dwq0NhWtqyS9PCpFhzjL7bfZjQt5-dL6A@mail.gmail.com>
 <CAK7LNAR+W9h95sUZFwRHiyiDbUxn9b7KN5P1zKOAdR2emxp7=g@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: Michal Marek <michal.lkml@markovi.net>, Kees Cook <keescook@chromium.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ujjwal Kumar <ujjwalkumar0501@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] kbuild: doc: describe proper
	script invocation
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



On Wed, 14 Oct 2020, Masahiro Yamada wrote:

> On Tue, Oct 13, 2020 at 11:31 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Thu, Oct 1, 2020 at 4:57 PM Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> > >
> > > During an investigation to fix up the execute bits of scripts in the kernel
> > > repository, Andrew Morton and Kees Cook pointed out that the execute bit
> > > should not matter, and that build scripts cannot rely on that. Kees could
> > > not point to any documentation, though.
> > >
> > > Masahiro Yamada explained the convention of setting execute bits to make it
> > > easier for manual script invocation.
> > >
> > > Provide some basic documentation how the build shall invoke scripts, such
> > > that the execute bits do not matter, and acknowledge that execute bits
> > > are useful nonetheless.
> > >
> > > This serves as reference for further clean-up patches in the future.
> > >
> > > Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> > > Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
> > > Link: https://lore.kernel.org/linux-kbuild/CAK7LNAQdrvMkDA6ApDJCGr+5db8SiPo=G+p8EiOvnnGvEN80gA@mail.gmail.com/
> > >
> > > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > > Suggested-by: Kees Cook <keescook@chromium.org>
> > > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> >
> >
> > Applied to linux-kbuild.
> > Thanks.
> >
> 
> No, not really.
> 
> I will re-think if this is the right thing to do.
> 
>

Masahiro-san, Andrew Morton has already picked this patch in his branch; 
so, if we do not shout loudly, it will be merged. And we can follow up 
with a solid improvement for rc2.

I am happy to rework the documentation and help guide and review the 
follow-up patches that have been sent by Ujjwal.

Please provide some specific feedback what is wrong and why; I think the 
basic request not to rely on the execute bit from Andrew and Kees is still 
valid. Maybe we just need to be more specific on the rules to follow in 
Makefiles and have multiple examples for the different cases to consider.

Thanks,

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
