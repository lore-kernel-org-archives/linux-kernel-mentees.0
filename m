Return-Path: <SRS0=42xI=DH=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AE2C4727C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 19:53:53 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8743B20709
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 30 Sep 2020 19:53:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIT4w/vY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8743B20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 164B320337;
	Wed, 30 Sep 2020 19:53:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wCFFxz82q52S; Wed, 30 Sep 2020 19:53:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 195BC2035D;
	Wed, 30 Sep 2020 19:53:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id F1D53C0889;
	Wed, 30 Sep 2020 19:53:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 93B5BC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 19:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 55C242035D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 19:53:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1wmnxXX11m-h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 19:53:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by silver.osuosl.org (Postfix) with ESMTPS id 1227F20337
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 19:53:43 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id e16so3132685wrm.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 30 Sep 2020 12:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=hix6X6Q9ptDsQZ7Pj95Z3krWRHJxPNOzAakph51e8E8=;
 b=HIT4w/vYnZ6oZZkPz1hi37Ko4dv8iMS1+KpGLftIt+QqFKB7es6QVnTgdOxREqmECi
 croUWXvQyEXJXBJkfAwNwOJVq0G9CNNMQiRRFDJla8yYovJ6fxcRd5eD/gUmGoNUvq1S
 o9dONHiYccivHVC41/SNTdwYS8KqYbqd9tt80p9k8/RZQJiXq40UjgrTGxZjdPSCbi0k
 1gDldlZOvKMGpcIu62f6A1EeE1PXTmh1KJvRuJp8G1KRZkpovGLdrab8ecS/9XsGdgJx
 +p9a8fZ1qmRVhLmERsEFWoVN7Rz6Ona0PNXAj4MVWrHQsRBo+Rxm4YhgfkkrZmqmtbIh
 l1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=hix6X6Q9ptDsQZ7Pj95Z3krWRHJxPNOzAakph51e8E8=;
 b=lHuQm4AgvXpnDjSrcwTYPxu0ZpEKB5/cR/WHYH4zZ95kjIDFJI+k71h3XqGNCTPEtG
 1ay3T1bfQCvouNlqKerz5IBbzZR5vF8yB06yW3vacAzVEZFLq0DfUNP2OQG+Ck4hpZFY
 pSv1LvlBD6/6geiG/sAU6qaF4mmTH0Mlmt9VuaopdoUO9y8enjQgl9a/LXSz5KAYsiee
 BNX+ydlb8R00/sUb/eZVN4y+xeF04zq5YS5FjTRs3dOQqMLfmqiW9HbIFpRaShtbRcYX
 l4VaFb14tGbGOeSxHjeeIgc821NAlpZOVMKtY1O+aWJDUcuJkqgwo6yhULiRB4VVOOxh
 xFAA==
X-Gm-Message-State: AOAM533smMQysDBycA7jQIdbt8dFFbYSj6asYutId18YWgZn8YDQVHT1
 TCoPxJORDyczLlhKLqFPC6o=
X-Google-Smtp-Source: ABdhPJxlDSVlWbNdz7Ce6fZAXbxfdQRu0xrSPliSD9hQK7wflJT15ko3bRTW1KeMzlHo30Vf+b9B5g==
X-Received: by 2002:a5d:67d0:: with SMTP id n16mr5235358wrw.198.1601495621278; 
 Wed, 30 Sep 2020 12:53:41 -0700 (PDT)
Received: from felia ([2001:16b8:2d6f:5600:7072:b735:b671:fb4f])
 by smtp.gmail.com with ESMTPSA id r21sm5573674wrc.70.2020.09.30.12.53.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2020 12:53:40 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Wed, 30 Sep 2020 21:53:39 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <ea21b166-70b4-a03f-4258-6c2015189db7@gmail.com>
Message-ID: <alpine.DEB.2.21.2009302149380.8279@felia>
References: <20200925212008.694018-1-ujjwalkumar0501@gmail.com>
 <cabeb5d7-f9c3-7e6d-fa43-03e6ef0dc476@gmail.com>
 <alpine.DEB.2.21.2009260727250.4734@felia>
 <a24ccaf7-a96f-0ca1-cc36-135f88497ac4@gmail.com>
 <ea21b166-70b4-a03f-4258-6c2015189db7@gmail.com>
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



On Tue, 29 Sep 2020, Ujjwal Kumar wrote:

> On 26/09/20 2:53 pm, Ujjwal Kumar wrote:
> > On 26/09/20 11:24 am, Lukas Bulwahn wrote:
> >>
> >>
> >> On Sat, 26 Sep 2020, Ujjwal Kumar wrote:
> >>>
> >>> To unset the executable bit I ran following command:
> >>> for i in $(find -executable -type f); do chmod -x $i; done
> >>>
> >>> One thing that I noticed is, once we initiate a kernel build some 
> >>> programs are compiled and removing their executable bit is not desirable.
> >>> Even after performing "make clean" some of those programs still persist and 
> >>> removing their executable bit fails any further attempt to build the kernel.
> >>>
> >>> For instance, tools/objtool/objtool file. In my case I had a total of 19 
> >>> files remaining after performing make clean.
> >>>
> >>
> >> Good observation.
> >>
> >> You can properly clean your build with make mrproper, but maybe that is 
> >> not even enough... all generated files might not mean _all generated 
> >> tools_, such as objtool, etc.
> >>
> >> $ make help
> >>
> >> Cleaning targets:
> >>   clean		  - Remove most generated files but keep the config and
> >>                     enough build support to build external modules
> >>   mrproper	  - Remove all generated files + config + various backup files
> >>   distclean	  - mrproper + remove editor backup and patch files
> >>
> >> [...]
> >>
> >> After for i in $(find -executable -type f); do chmod -x $i; done:
> >> I saw those failures (probably as you did as well):
> > 
> > Yes these are the same errors that I received.
> > 
> >>
> >> *** Default configuration is based on 'x86_64_defconfig'
> >> sh: 1: ./scripts/gcc-version.sh: Permission denied
> >> init/Kconfig:34: syntax error
> >> init/Kconfig:33: invalid statement
> >> init/Kconfig:34: invalid statement
> >> sh: 1: ./scripts/ld-version.sh: Permission denied
> >> init/Kconfig:39: syntax error
> >> init/Kconfig:38: invalid statement
> >> sh: 1: ./scripts/clang-version.sh: Permission denied
> >> init/Kconfig:49: syntax error
> >> init/Kconfig:48: invalid statement
> >> scripts/kconfig/Makefile:80: recipe for target 'defconfig' failed
> >> make[1]: *** [defconfig] Error 1
> >> Makefile:606: recipe for target 'defconfig' failed
> >> make: *** [defconfig] Error 2
> >>
> >>
> >> After your patch was applied, they disappear. So, it does the job.
> >> More comments on the patch itself later.
> >>
> >> make defconfig works.
> >>
> > 
> > Yes, these errors appeared when we unset executable bits on files after 
> > performing 'make clean' and then perform a kernel build.
> > 
> >> make then fails:
> >>
> >> HOSTCC   /home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool/fixdep.o
> >> /bin/sh: 1: /home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool//fixdep: Permission denied
> >> /home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/build/Makefile.build:96: recipe for target 
> >> '/home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool/fixdep.o' failed
> >> make[4]: *** [/home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool/fixdep.o] Error 126
> >> Makefile:43: recipe for target '/home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool/fixdep-in.o' failed
> >> make[3]: *** [/home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool/fixdep-in.o] Error 2
> >> /home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/build/Makefile.include:5: recipe for target 'fixdep' failed
> >> make[2]: *** [fixdep] Error 2
> >> Makefile:68: recipe for target 'objtool' failed
> >> make[1]: *** [objtool] Error 2
> >> Makefile:1885: recipe for target 'tools/objtool' failed
> >> make: *** [tools/objtool] Error 2
> >> make: *** Waiting for unfinished jobs....
> >>
> >> The make target also goes into tools/build/ and requires some targets 
> >> there and then uses those tools during the further build.
> >>
> >> So, we need some more patches here as well.
> >>
> >> Can you share the list of 19 files that remained even with make clean?
> >>
> > 
> > After performing a make clean, the files that persist are:
> > ./tools/objtool/objtool
> > ./tools/objtool/fixdep
> > ./scripts/sorttable
> > ./scripts/mod/mk_elfconfig
> > ./scripts/mod/modpost
> > ./scripts/unifdef
> > ./scripts/basic/fixdep
> > ./scripts/bin2c
> > ./scripts/extract-cert
> > ./scripts/kconfig/conf
> > ./scripts/selinux/mdp/mdp
> > ./scripts/selinux/genheaders/genheaders
> > ./scripts/asn1_compiler
> > ./scripts/kallsyms
> > ./scripts/sign-file
> > ./scripts/genksyms/genksyms
> > ./scripts/recordmcount
> > ./scripts/insert-sys-cert
> > ./scripts/dtc/dtc
> > 
> > After performing 'make mrproper'/'make distclean' the files that persist 
> > are:
> > ./tools/objtool/objtool
> > ./tools/objtool/fixdep
> 
> These files can be removed using following command from srctree:
> make tools/objtool_clean
> 
> So after performing 'make mrproper' and 'make tools/objtool_clean', we get 
> rid of all the compiled programs.
> 
> Instead of 'make tools/objtool_clean' we can perform following commands:
> From the srctree directory, make tools/clean
> From the tools directory, make clean
> From the tools directory, make objtool_clean
> to remove the 2 files.
> 
> > 
> >> Then, we go through them and check if they disappear with make mrproper or 
> >> with a different make target to clean them. Potentially, we also hook 
> >> those identified targets up into make mrproper then.
> 
> I tried hooking the clean task with 'make mrproper' in top-level Makefile 
> as follows:
> 
> $ git diff Makefile
> diff --git a/Makefile b/Makefile
> index 5f1399a576d4..43ab6ce98c64 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1498,6 +1498,7 @@ $(mrproper-dirs):
>         $(Q)$(MAKE) $(clean)=$(patsubst _mrproper_%,%,$@)
>  
>  mrproper: clean $(mrproper-dirs)
> +       $(Q)$(MAKE) tools/objtool_clean
>         $(call cmd,rmfiles)
>  
>  # distclean
> ---
> 
> Instead of '$(Q)$(MAKE) tools/objtool_clean' we can perform following 
> command:
> '$(Q)$(MAKE) tools/clean' to clean the entire tools/ directory.
>


I guess that change above might need further discussion later. Let us 
focus on the clear patches you already identified using appropriate 
interpreters in all build scripts.

What is the state there? Could you already identify all places that should 
be touched? If so, feel free to send out your patch series as RFC patch 
series on this mailing list here.


Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
