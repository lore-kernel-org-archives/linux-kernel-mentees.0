Return-Path: <SRS0=QfBv=DD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A719EC2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 11:01:33 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D1BE238E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 11:01:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBssTQfS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D1BE238E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id CA04F86A6F;
	Sat, 26 Sep 2020 11:01:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vfobpFEyyVDq; Sat, 26 Sep 2020 11:01:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F07E586A60;
	Sat, 26 Sep 2020 11:01:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB458C0891;
	Sat, 26 Sep 2020 11:01:31 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5ECB5C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 11:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 4D1E7871A5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 11:01:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ic9HAqEuNMqo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 11:01:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 2D21E87004
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 11:01:29 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id w1so5116682edr.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=90EH4U0UDxXj3GQhM+grOgaP1d6FS5jLJsjo7jB6K2k=;
 b=nBssTQfSo9FTv7LWU1ivvOkTFl2WHyM/wTHW6dEhtU5/VbPQF1+BCpdg1dwKlqFUuw
 /Dt6AeQe3twRkQYTxYCABquJcW9ynffBG/d3E+qHqijC6PN7zRFSIrLE9pJz8V96sfAH
 Y/+0ygOywuBMKCAQCSL3qyiup22Ygl3svYYCpi2LlU9jFCqx4l5Pa44k5HEqpjDU1UlO
 osrZuygNGEZYEEKC3nsxWbiqLouvNpWnTHAnrwDxn0ee4pV5HTgdyzML/uPLvfpqgvgm
 4jeOgNrKKhZSf3foiWzdo49NOPpbCBz0rA+b9Jb0pkxIRps9mCKNS/A1lGcAhwYyD+ac
 nqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=90EH4U0UDxXj3GQhM+grOgaP1d6FS5jLJsjo7jB6K2k=;
 b=qsYRUZ8gxSkTUnWHevhFV3ukkT6gpmnlf9ax4sIbW/A5hsy3A6Dc2aqmn9UdTXGnJw
 KTlBwUGe2UDhYQ+KIIvUewYapqNt4oygJ86qqirxV3rNHDcnlsENn4K3PVs3g9hc3/r4
 sm5nXNN50Ih1fGgsqskG9v99+T4YYcYvfia6C0ffIvSfqDemyi30Xh7EtV33iXlcuR4r
 2TiQDhfIdv4/FYEja6Ol6pSMr1Z+KLrjjIb+FkW38HXmncF54pxbVCeVnnvTgI76/2+s
 k43IznN1vd+LR066j0pMl9P5koUQRz54Psvhj44FQrtSjj2Qo/LcazL2l3rFCBylAKPo
 ATCQ==
X-Gm-Message-State: AOAM530+DUCBktcsedL3PRfHs7qta7Qes+I/5SPKHnyfn/lOC3ovj4v2
 /Y17Bn/ftmvYGH1PxZInuCg=
X-Google-Smtp-Source: ABdhPJxUIKkNhoBQ2TTOgAB6oSCIhNB1nGeBqEPp3hrBHlA+CRl9xyKlQ0PfHHOj6iMs8B5RX0c+0Q==
X-Received: by 2002:aa7:c648:: with SMTP id z8mr6064036edr.239.1601118087406; 
 Sat, 26 Sep 2020 04:01:27 -0700 (PDT)
Received: from felia ([2001:16b8:2daa:2000:b570:fac0:c53f:b103])
 by smtp.gmail.com with ESMTPSA id bz5sm3874629ejc.83.2020.09.26.04.01.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 04:01:26 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 26 Sep 2020 13:01:20 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <b3d49d82-1990-0359-c3d2-2eaeae71d8a6@gmail.com>
Message-ID: <alpine.DEB.2.21.2009261245310.3611@felia>
References: <20200925212008.694018-1-ujjwalkumar0501@gmail.com>
 <alpine.DEB.2.21.2009260754430.4734@felia>
 <b3d49d82-1990-0359-c3d2-2eaeae71d8a6@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] kconfig: Prepend interpeters
	when calling scripts
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



On Sat, 26 Sep 2020, Ujjwal Kumar wrote:

> On 26/09/20 11:42 am, Lukas Bulwahn wrote:
> > 
> > Basically the diff is okay; already start writing the commit message.
> > 
> > On Sat, 26 Sep 2020, Ujjwal Kumar wrote:
> > 
> >> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
> >> ---
> >>  init/Kconfig | 16 ++++++++--------
> >>  1 file changed, 8 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/init/Kconfig b/init/Kconfig
> >> index 91456ac0ef20..9f6ec575e3d1 100644
> >> --- a/init/Kconfig
> >> +++ b/init/Kconfig
> >> @@ -30,12 +30,12 @@ config CC_IS_GCC
> >>  
> >>  config GCC_VERSION
> >>  	int
> >> -	default $(shell,$(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
> >> +	default $(shell,sh $(srctree)/scripts/gcc-version.sh $(CC)) if CC_IS_GCC
> > 
> > in the top-level Makefile, (./Makefile), you will find a section:
> > 
> > # SHELL used by kbuild
> > CONFIG_SHELL := sh
> > 
> > I think that is what is supposed to be used here.
> > 
> >>  	default 0
> >>  
> >>  config LD_VERSION
> >>  	int
> >> -	default $(shell,$(LD) --version | $(srctree)/scripts/ld-version.sh)
> >> +	default $(shell,$(LD) --version | awk -f $(srctree)/scripts/ld-version.sh)
> >>
> > 
> > Further you find:
> > 
> > # Make variables (CC, etc...)
> > 
> > This section defines variables for each interpreter, in case someone wants
> > to modify/override the default interpreters.
> > 
> > You can find there:
> > 
> > AWK             = awk
> > 
> > Use that.
> > 
> >>  config CC_IS_CLANG
> >>  	def_bool $(success,echo "$(CC_VERSION_TEXT)" | grep -q clang)
> >> @@ -45,20 +45,20 @@ config LD_IS_LLD
> >>  
> >>  config CLANG_VERSION
> >>  	int
> >> -	default $(shell,$(srctree)/scripts/clang-version.sh $(CC))
> >> +	default $(shell,sh $(srctree)/scripts/clang-version.sh $(CC))
> >>
> > 
> > I think CONFIG_SHELL is right here.
> >   
> >>  config CC_CAN_LINK
> >>  	bool
> >> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> >> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
> >> +	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag)) if 64BIT
> >> +	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag))
> >>
> > 
> > Same here.
> >   
> >>  config CC_CAN_LINK_STATIC
> >>  	bool
> >> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
> >> -	default $(success,$(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
> >> +	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m64-flag) -static) if 64BIT
> >> +	default $(success,sh $(srctree)/scripts/cc-can-link.sh $(CC) $(CLANG_FLAGS) $(m32-flag) -static)
> >>
> > 
> > Same here.
> >   
> >>  config CC_HAS_ASM_GOTO
> >> -	def_bool $(success,$(srctree)/scripts/gcc-goto.sh $(CC))
> >> +	def_bool $(success,sh $(srctree)/scripts/gcc-goto.sh $(CC))
> >>
> > 
> > Same here.
> > 
> > I think this is already a good size for the patch, it solves one problem 
> > to have the basic Configuration targets in kbuild work without the need 
> > for any executable flag on repository files.
> > 
> > Fix it up, write an appropriate commit message, we will review here on the 
> 
> How is the following for a commit message?
> kconfig: use interpreters and not rely on x-bit to invoke scripts
>

kconfig: use interpreters to invoke scripts

> Having the execute bits set wasn't something that we could depend on.

We cannot rely on execute bits to be set on files in the repository.

> Any portion of the kernel that invokes such files provides the interpreter 
> explicitly.
>
The build script should use the explicit interpreter when invoking any 
script from the repository.
 
> Additionally, relying on x-bit is not recommended for following reasons:
> 
>   - An official guidance is currently unavailable to decide whether 
>     it is mandatory to have the x-bit set.
>

Well, I think it is better to prepare an "official guidance" as commit in 
the kernel documentation and then simply refer to that. That will be a 
separate patch in this series.

>   - It is possible that the x-bit will be erased/ignored when handling 
>     patches (for example, using patch(1)).
> 
> I am wondering who should I include for 'Suggested-by:' tag?
>

I think there is nothing wrong with having everyone that suggested the 
work mentioned, so Andrew, Kees and me.

Also add a Link: to the discussion on lore.kernel.org as reference.

> > linux-kernel-mentees list and then it can go out into the wild wild west 
> > of the kernel mailing list.
> > 
> 
> Yes I will make the changes.
> 
> Also, some Makefile(s) do not use '$(CONFIG_SHELL)' and instead use 'sh'.
> For instance,
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/scripts/Makefile.lib?h=next-20200925#n422
> AND
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/s390/boot/Makefile?h=next-20200925#n74
> 
> I wonder if they should be improved to maintain the consistency or left 
> at their current state.
>

Again, another good catch. Make that yet another patch.
 
> > 
> > Lukas
> > 
> >>  config CC_HAS_ASM_GOTO_OUTPUT
> >>  	depends on CC_HAS_ASM_GOTO
> >> -- 
> >> 2.26.2
> >>
> >>
> 
> On looking at Makefile(s), I found some places where we miss specifying the 
> interpreter and so we are relying on executable bit again.
> here:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/nds32/kernel/vdso/Makefile?h=next-20200925#n42
> 
> I wonder if it should go as a separate patch, simply because its Makefile now.

Yes, another good catch and patch.

Collect all those patches and then send them out as patch series.

So something like:

- Documentation patch: describe in the kbuild documentation not to rely on 
the x-bit.
- patch on kconfig (this one)
- patch on Makefile.lib
- patch on s390
- ... and more if we found some more issues

The kernel community can handle many small patches, don't worry. Also, 
there is no need to rush with some first patch now, we can collect all 
patches and then send them out as one series. These are not showstopper 
problems, but some real nice small cleanups nobody noticed so far.

If I find some time, I can write a quick patch for the Documentation and 
we can review that together.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
