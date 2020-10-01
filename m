Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EAC9C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 14:10:01 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93C8420872
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 14:10:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7ArnX6C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93C8420872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2132B86AC1;
	Thu,  1 Oct 2020 14:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CprlFu6HdgFc; Thu,  1 Oct 2020 14:09:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 86B1D84E1A;
	Thu,  1 Oct 2020 14:09:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6D2AAC016F;
	Thu,  1 Oct 2020 14:09:59 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1392FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 14:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id F076384E34
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 14:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oknod8GyHHq4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 14:09:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0B82584E1A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 14:09:58 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id p9so8263013ejf.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 07:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=r4yKLSiPg//7zM1FCcuwz0Bod6JtRzjDOJcNSPA2Ag4=;
 b=R7ArnX6C3d2+GfBev5iF+TYfxXZaLDRk7OgMF9rYtSotltY+Mzh9AmB2uyyvlzGPyy
 YG01a+3usoK8eAkzlb0DGAdaUAZZ8yzAb6ud3qBGkDIRlGpKGTGisESgbbhS+AxKT6lF
 Bn2qUa+X72ynFFINNSML7A0Rxk1NaoxyOTg4Wl3OWmGjZJdJoLZNKLk2hT17IylAvoi3
 LlYaUxEG6oV9EvpkxM6c/VtskVmn0MVNkRtYzbXL301Kf7f1AFQy6ICdtkkJwmy0sFPH
 1B9LxgTevk9OMSMlxC7rzMW49xps8JuYrF2wNcrt1A4D3jvgA0kO9xiX+l+Pj1ZTI9cv
 emfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=r4yKLSiPg//7zM1FCcuwz0Bod6JtRzjDOJcNSPA2Ag4=;
 b=niBa1XQBJOShPtl0IXx/5I298Imr9/NsvnGFnoxE/qZQInEQRQMET9Oe2GDfeiEWHT
 Az8yR+nzLfEZNBmYsuM5irDHxTaKDWqii+MQP35m7zaRVspcD0RETfQa9FmZPEHEGrTc
 IoShv0Jxt5Gn3rtvATrFGRBI7wiNu9FZqZIEgoijXIuIgZJ28rAV+87l+/desVfs/Ciw
 ApF/5ssnBvBag+Lyh5Brf2IV6jct79xvBCkf8a8vOoBXtizWvNgjlY7UN3inoHL1ix7C
 Cr1uQ2MBNofY+d2qUV+Bn/I37GtivJ3Fct2pWCLH3ZksUZKgus3C4XkwPepiRdQSxhFS
 kKew==
X-Gm-Message-State: AOAM531g6EZDlfNuo+1qqa2nHz6MwPgBoATXaNyu0noPsCeLu8zDX7kp
 cUJaitysc/eS1PjpXEFWE4M=
X-Google-Smtp-Source: ABdhPJxhwokV/xn3+9j0E4ky/JMcw96kcHX2TlDnDutzmuY9LfJwbfipKjv9M4YD9opZDcyJT4GFHQ==
X-Received: by 2002:a17:906:fcae:: with SMTP id
 qw14mr1892953ejb.537.1601561396311; 
 Thu, 01 Oct 2020 07:09:56 -0700 (PDT)
Received: from felia ([2001:16b8:2d4d:ba00:2c39:a8cb:1b2a:4845])
 by smtp.gmail.com with ESMTPSA id k8sm4193760ejz.60.2020.10.01.07.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 07:09:55 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Thu, 1 Oct 2020 16:09:54 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <80f188d8-b0c2-ecf1-d0b9-faad146d2cec@gmail.com>
Message-ID: <alpine.DEB.2.21.2010011554160.24571@felia>
References: <61d45592-20be-7fe1-8168-5ccacca655a3@gmail.com>
 <alpine.DEB.2.21.2010011245490.24571@felia>
 <80f188d8-b0c2-ecf1-d0b9-faad146d2cec@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH RFC] kbuild: use interpreters to
	invoke scripts
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



On Thu, 1 Oct 2020, Ujjwal Kumar wrote:

> On 01/10/20 4:38 pm, Lukas Bulwahn wrote:
> > 
> > 
> > On Thu, 1 Oct 2020, Ujjwal Kumar wrote:
> > 
> >> We cannot rely on execute bits to be set on files in the repository.
> >> The build script should use the explicit interpreter when invoking any
> >> script from the repository.
> >>
> >> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
> >> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
> >>
> >> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> >> Suggested-by: Kees Cook <keescook@chromium.org>
> >> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> >> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> >> ---
> >>  Documentation/Makefile                           | 16 ++++++++--------
> >>  Documentation/userspace-api/media/Makefile       |  6 +++---
> >>  Makefile                                         |  4 ++--
> >>  arch/arm64/kernel/vdso/Makefile                  |  2 +-
> >>  arch/arm64/kernel/vdso32/Makefile                |  2 +-
> >>  arch/ia64/Makefile                               |  4 ++--
> >>  arch/nds32/kernel/vdso/Makefile                  |  2 +-
> >>  .../comedi/drivers/ni_routing/tools/Makefile     |  6 +++---
> >>  scripts/Makefile.build                           |  2 +-
> >>  scripts/Makefile.package                         |  4 ++--
> >>  tools/bootconfig/Makefile                        |  2 +-
> >>  tools/bpf/Makefile.helpers                       |  2 +-
> >>  tools/lib/bpf/Makefile                           |  2 +-
> >>  tools/perf/Makefile.perf                         |  2 +-
> >>  tools/power/cpupower/Makefile                    |  2 +-
> >>  tools/testing/selftests/rcutorture/Makefile      |  2 +-
> >>  tools/testing/selftests/rseq/Makefile            |  2 +-
> >>  tools/testing/selftests/vm/Makefile              |  6 +++---
> >>  tools/testing/selftests/wireguard/qemu/Makefile  |  4 ++--
> >>  tools/testing/selftests/x86/Makefile             |  6 +++---
> >>  20 files changed, 39 insertions(+), 39 deletions(-)
> >>
> > 
> > You will probably need to split this patch into multiple patches, but the 
> > discussion will show how to split it best.
> > 
> > Probably:
> > 
> >  - one for Documentation
> >  - one for general kbuild, maybe including arch
> >  - one for selftests
> >  - one for the other tools
> >  - one for the comedi driver
> > 
> > So, what did you do for testing your change?
> 
> First, I had to unset the execute bits on all files.
> for i in $(find -executable -type f); do chmod -x $i; done
> 
> To test the changes, I invoked the make rule under which my current 
> changes lie. And I could see a permission-denied whenever a script 
> was invoked. After the patch, the make rule progressed without 
> any permissions error.
> I couldn't test each and every change, because some rules failed 
> before invoking the script and others could not be invoked by me.
> 

Which could you not test? Please share that.

> I successfully tested the changes under Documentation/ (and some others).
> 
> $ make htmldocs
> make[1]: execvp: ./scripts/sphinx-pre-install: Permission denied
> make[1]: *** [Documentation/Makefile:81: htmldocs] Error 127
> make: *** [Makefile:1661: htmldocs] Error 2
> 
> Files that I tested my changes on:
> Documentation/Makefile                           | 16 ++++++++--------
> Documentation/userspace-api/media/Makefile       |  6 +++---
> Makefile                                         |  4 ++--
> tools/perf/Makefile.perf                         |  2 +-
> tools/power/cpupower/Makefile                    |  2 +-
> 
> 
> > 
> > Did you check if CONFIG_SHELL is actually available in tools?
> 
> Yes, I did check.
> To verify, I echo(ed) the variables under a make task. And invoked 
> the task from srctree.
>

That sounds good.
 
> >> --- a/arch/nds32/kernel/vdso/Makefile
> >> +++ b/arch/nds32/kernel/vdso/Makefile
> >> @@ -39,7 +39,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
> >>  # Generate VDSO offsets using helper script
> >>  gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
> >>  quiet_cmd_vdsosym = VDSOSYM $@
> >> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
> >> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
> >>
> > 
> > I guess it is better to modify gen-vdsosym.
> 
> Do you mean something as follows:
> gen-vdsosym := $(CONFIG_SHELL) $(srctree)/$(src)/gen_vdso_offsets.sh
> 
> If so, I have never seen that style in the build files. Infact, the current
> style is followed at many places.
> For instance,
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/scripts/Makefile.lib?h=next-20201001#n398
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm/tools/Makefile?h=next-20201001#n50
>

I searched around as well. I think your proposal is fine.

How about splitting out a first patch on the generic kbuild files and send 
that out as RFC, first send the RFC patch to linux-kernel-mentees list, 
then if that looks good, we go for Masahiro and the linux-kbuild list?

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
