Return-Path: <SRS0=VNSv=6E=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A04D3C55181
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Apr 2020 21:39:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6206E2078C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 20 Apr 2020 21:39:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="fg7nmJ0/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6206E2078C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3ABEE869E4;
	Mon, 20 Apr 2020 21:39:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XvGKzwZNUt7C; Mon, 20 Apr 2020 21:39:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A37AE86999;
	Mon, 20 Apr 2020 21:39:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9771DC07FF;
	Mon, 20 Apr 2020 21:39:19 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A0C2C0177
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 21:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5FB48869E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 21:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9KQqn8MQSMyC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 21:39:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0AB9586999
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 21:39:17 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id t8so3594861qvw.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 20 Apr 2020 14:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=wzoQ8wJxvFhV344X9PJvX5TTrX/IwRx/mNK5Ox4iO9E=;
 b=fg7nmJ0/lCD3NAGktYNMgs1Taa5sCjIqBkT+XDP8OqF52oZYyhh4fJHSekyf8ZWT7j
 jiqI1kfyfgqRRJboQE6nxFxPLuG/ZgimOXLVIfAr/G7/kdMZog0rYRUb0hmDwSBKcewU
 W/iAK44r6kdXwcjrfWPUnpMEZZ/QTjaWBMkmn5WOIOjzBM76aCXti4TsIQOWjmlOjuAg
 G8777grL9z1RfqXD/A+Bf3LB7tXN4bAfv/6JLf0WI8Zyydaz0qqPKuPjg8SFp8XbixEk
 7E54YsoXyNkeXEA4382qJOTbVd98CsnJUqE64Z7W9d+uamI1HXccoqfl+ZPKIWGklBxO
 018Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=wzoQ8wJxvFhV344X9PJvX5TTrX/IwRx/mNK5Ox4iO9E=;
 b=OUZN6AUrEMU4o0ia1h3HGjSZdZKOYsmhDT3+YTTxSDIdvnIdD6HmsIolti5Xs6sCMg
 mjpEs/SrmRjzP9/x3oOAsvauMUnf1P4f/smRlmA15W/GWMcerE7lAhIR7xeGhDF0XzIg
 NhDTWu6yHs8bypIPqX5cAZuMwCxtPa9Buj8FlCSAEtrBUYsnoLZ3HFra9qbWE8RxjmGT
 KR6Ul3jjVEO4DZrFxO4SIJ+lSemr8LyR5x4aetnM063hEdQGaAhz7S78qipa9/E+l8zu
 goLkKiDdqq/l040ftSCORqUumJatf1AaZZUl19f++Bz/4DCzxRKPMWXy5rMWaPj6VbHT
 pRIw==
X-Gm-Message-State: AGi0PuYHcL3UdqNcOVeWVoAca+zNTe2rcVt5SLT4/YTrVrXwzt96AZCl
 O2V561u2ZEsUUQnL5PaEMF4sSA==
X-Google-Smtp-Source: APiQypJA+tqZbx4LxDeg1IuoG8wdPK9ozSfLBS1LcZNN3xzgp1bql+qusbdixOHygYNj9Vk/oYps0A==
X-Received: by 2002:a0c:a9c2:: with SMTP id c2mr4283111qvb.23.1587418755936;
 Mon, 20 Apr 2020 14:39:15 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id t75sm533471qke.127.2020.04.20.14.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 14:39:15 -0700 (PDT)
Message-ID: <f0f3a22042bdab2cffe12600f17f1485ca71caae.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 20 Apr 2020 18:39:12 -0300
In-Reply-To: <CAK7LNAQYxtcNinV7JR+c8Pn9Rp1g0TxJ7m_mOFNOJQsB=OiAoA@mail.gmail.com>
References: <20200414012132.32721-1-vitor@massaru.org>
 <CAK7LNAQYxtcNinV7JR+c8Pn9Rp1g0TxJ7m_mOFNOJQsB=OiAoA@mail.gmail.com>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Cc: Michal Marek <michal.lkml@markovi.net>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] kbuild: ensure mrproper
 removes arch/$(SUBARCH)/include/generated/
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

On Sat, 2020-04-18 at 03:12 +0900, Masahiro Yamada wrote:
> Hi.
> 
> On Tue, Apr 14, 2020 at 10:21 AM Vitor Massaru Iha <vitor@massaru.org
> > wrote:
> > In the following use case, when compiling the kernel for the UML
> > architecture, for example:
> > 
> >  * `make ARCH=um defconfig && make ARCH=um -j8`,
> > 
> > SUBARCH files are generated, however when we run the command:
> > 
> >  * `mrproper ARCH=um`
> 
>       make ARCH=um mrproper
> 
> 
> > the files `arch/$(SUBARCH)/include/generated/ aren't cleaned up.
> > 
> > This generates compilation errors by running the following command:
> > 
> >  * `make ARCH=um defconfig O=./build_um && make ARCH=um -j8
> > O=./build_um`
> > 
> > This PATCH fix that problem.
> 
>   This patch fixes ...
> 
> > This makes it possible to compile on different architectures that
> > use the
> > SUBARCH variable, in different build directories and root directory
> > of the
> > linux directory. This is important because we can compile without
> > the object
> > files being overwritten. This reduces the re-compilation time in
> > this use case.
> 
> Sorry, I do not understand this paragraph.
> 
> 
> Brendan Higgins just reported the build error
> in the out-of-tree build after in-tree build.
> 
> 
> [1] make ARCH=um defconfig all
> [2] make ARCH=um mrproper
> [3] make ARCH=um O=foo defconfig all
> 
>   -> build error
> 
> Ins't it?
> 
> 
> 
> > Besides that, in the workflow of developing unit tests, using
> > kunit, and
> > compiling in different architectures to develop or test a PATCH,
> > this use case
> > applies.
> > 
> >  * This bug was introduced in this commit a788b2ed81abe
> 
> Instead, adding Fixes tag is the convention.
> 
> Fixes: a788b2ed81ab ("kbuild: check arch/$(SRCARCH)/include/generated
> before out-of-tree build")
> 
> 
> >  * Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219
> 
> Maybe, this can be also a tag.
> 
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=205219
> 
> 
> 
> 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> 
> Reported-by: Brendan Higgins <brendanhiggins@google.com>
> 
> 
> 
> > Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> > Tested-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
> > v2:
> >  * Explains what this PATCH does and the importance as suggested
> >    by Brendan Higgins.
> > ---
> >  Makefile | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 70def4907036..e1a79796032e 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -532,7 +532,8 @@ outputmakefile:
> >  ifdef building_out_of_srctree
> >         $(Q)if [ -f $(srctree)/.config -o \
> >                  -d $(srctree)/include/config -o \
> > -                -d $(srctree)/arch/$(SRCARCH)/include/generated ];
> > then \
> > +                -d $(srctree)/arch/$(SRCARCH)/include/generated -o
> > \
> > +                -d $(srctree)/arch/$(SUBARCH)/include/generated ];
> > then \
> 
> This hunk is unneeded.
> 
> 
> 
> >                 echo >&2 "***"; \
> >                 echo >&2 "*** The source tree is not clean, please
> > run 'make$(if $(findstring command line, $(origin ARCH)),
> > ARCH=$(ARCH)) mrproper'"; \
> >                 echo >&2 "*** in $(abs_srctree)";\
> > @@ -1388,6 +1389,7 @@ CLEAN_FILES += modules.builtin
> > modules.builtin.modinfo modules.nsdeps
> >  # Directories & files removed with 'make mrproper'
> >  MRPROPER_DIRS  += include/config include/generated          \
> >                   arch/$(SRCARCH)/include/generated .tmp_objdiff \
> > +                 arch/$(SUBARCH)/include/generated \
> >                   debian/ snap/ tar-install/
> >  MRPROPER_FILES += .config .config.old .version \
> >                   Module.symvers \
> > --
> > 2.25.1
> > 
> 
> This problem is only related to ARCH=um builds.
> So, it should be fixed in arch/um/Makefile.
> 
> 
> 
> 
> diff --git a/arch/um/Makefile b/arch/um/Makefile
> index d2daa206872d..275f5ffdf6f0 100644
> --- a/arch/um/Makefile
> +++ b/arch/um/Makefile
> @@ -140,6 +140,7 @@ export CFLAGS_vmlinux := $(LINK-y) $(LINK_WRAPS)
> $(LD_FLAGS_CMDLINE)
>  # When cleaning we don't include .config, so we don't include
>  # TT or skas makefiles and don't clean skas_ptregs.h.
>  CLEAN_FILES += linux x.i gmon.out
> +MRPROPER_DIRS += arch/$(SUBARCH)/include/generated
> 
>  archclean:
>         @find . \( -name '*.bb' -o -name '*.bbg' -o -name '*.da' \
> 
> 
> 
> 
> 
> --
> Best Regards
> Masahiro Yamada

Thanks for review. I agree with the suggested changes.


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
