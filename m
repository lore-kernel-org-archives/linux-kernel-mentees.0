Return-Path: <SRS0=QfBv=DD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24D6DC2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 05:54:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7195620809
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 05:54:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rK3KK5MF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7195620809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 02414204B7;
	Sat, 26 Sep 2020 05:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IxAqAKWQcaDn; Sat, 26 Sep 2020 05:54:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C861F204A2;
	Sat, 26 Sep 2020 05:54:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B1390C0890;
	Sat, 26 Sep 2020 05:54:35 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DBD7DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 05:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C62B686778
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 05:54:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eYCnQtIymMeX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 05:54:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6A7AC86726
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 05:54:32 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id nw23so1481064ejb.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Sep 2020 22:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=mxYB7WHO2UMBNPR52GuSRo2nL+fUtl6zEaklX+aYC8Y=;
 b=rK3KK5MFqI+a8ylD3uE/sx+hEtVGXKBgALdlvNsK00HloRaeU87cTRMJD4WLh4Ln4y
 /E1vJD10nf090QPnpvmi2zIplATwOULkdZHtHqtjfUj39CUIaGeEkbacdEy2bYy58oYk
 tnaXIWQTB1rMUt1T31gNUW6LdJl5kvWBT6K3tKOHh+tYQjS2YuKSXz9k2xFv70nmBPPc
 jLSplAL4RGIcy7n3gOQRnV5SNrUJsdRMPwo4ndG81sDZQPoeTubT5Or1I/A6fZuKderY
 tAeUBVS9qQtbmj7uzujDKa7r+CJnPvSfsK3YtnnWCnOGzLT8rQ+lsrzOeqecVqvY0VFy
 JXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=mxYB7WHO2UMBNPR52GuSRo2nL+fUtl6zEaklX+aYC8Y=;
 b=eOGlBytDmG++oaZ/KUPGW6EzzKZmhHQ2BOuMiuX3Xtua5KD0xUa9tllaHk1rFWiVlD
 B4J/kASNNy9DkFjFSbnoy8nOVHsuYoLbe8IsIfsn244nNLxLiNYVMQP1iip9MVNjyW8i
 RQKnOzEOAuuXc0z0PedKMTLr4bHb1C1KXjDfdiAPiU0UheD24Z8UdZCLHt6DTnyfHIMy
 bjmSWmK6V4Hzv+Qa4Gl+JTTtadUXJ17vEpiDvNaetZWopzTft5jxYwkNNAN0tXy3ckJJ
 LSIQfRZhFdMQd+OKsuGfoO1DSTYCQiRJ/jQ+cS4YrFfqr9OWFGsBOP9Nug3rI9y1WjjJ
 Za9g==
X-Gm-Message-State: AOAM530cuZSQ7gptAPUMe6cAf/qg7gNI3CSk4/KKSovJEMOxV6liSd4Y
 IRB00FkDpluwifwlKbrPblY=
X-Google-Smtp-Source: ABdhPJzXr3p+TPG8O/+5CYcTOrzjsICXKtsW441Ve62CqQYnH1k6E5AIDllxP0NqgMQqvi3HWG97Ig==
X-Received: by 2002:a17:906:f1d5:: with SMTP id
 gx21mr5750359ejb.165.1601099670633; 
 Fri, 25 Sep 2020 22:54:30 -0700 (PDT)
Received: from felia ([2001:16b8:2daa:2000:7099:7490:f83d:38e7])
 by smtp.gmail.com with ESMTPSA id w19sm3472302edt.22.2020.09.25.22.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 22:54:29 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Sat, 26 Sep 2020 07:54:23 +0200 (CEST)
X-X-Sender: lukas@felia
To: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
In-Reply-To: <cabeb5d7-f9c3-7e6d-fa43-03e6ef0dc476@gmail.com>
Message-ID: <alpine.DEB.2.21.2009260727250.4734@felia>
References: <20200925212008.694018-1-ujjwalkumar0501@gmail.com>
 <cabeb5d7-f9c3-7e6d-fa43-03e6ef0dc476@gmail.com>
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
> 
> To unset the executable bit I ran following command:
> for i in $(find -executable -type f); do chmod -x $i; done
> 
> One thing that I noticed is, once we initiate a kernel build some 
> programs are compiled and removing their executable bit is not desirable.
> Even after performing "make clean" some of those programs still persist and 
> removing their executable bit fails any further attempt to build the kernel.
> 
> For instance, tools/objtool/objtool file. In my case I had a total of 19 
> files remaining after performing make clean.
> 

Good observation.

You can properly clean your build with make mrproper, but maybe that is 
not even enough... all generated files might not mean _all generated 
tools_, such as objtool, etc.

$ make help

Cleaning targets:
  clean		  - Remove most generated files but keep the config and
                    enough build support to build external modules
  mrproper	  - Remove all generated files + config + various backup files
  distclean	  - mrproper + remove editor backup and patch files

[...]

After for i in $(find -executable -type f); do chmod -x $i; done:
I saw those failures (probably as you did as well):

*** Default configuration is based on 'x86_64_defconfig'
sh: 1: ./scripts/gcc-version.sh: Permission denied
init/Kconfig:34: syntax error
init/Kconfig:33: invalid statement
init/Kconfig:34: invalid statement
sh: 1: ./scripts/ld-version.sh: Permission denied
init/Kconfig:39: syntax error
init/Kconfig:38: invalid statement
sh: 1: ./scripts/clang-version.sh: Permission denied
init/Kconfig:49: syntax error
init/Kconfig:48: invalid statement
scripts/kconfig/Makefile:80: recipe for target 'defconfig' failed
make[1]: *** [defconfig] Error 1
Makefile:606: recipe for target 'defconfig' failed
make: *** [defconfig] Error 2


After your patch was applied, they disappear. So, it does the job.
More comments on the patch itself later.

make defconfig works.

make then fails:

HOSTCC   /home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool/fixdep.o
/bin/sh: 1: /home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool//fixdep: Permission denied
/home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/build/Makefile.build:96: recipe for target 
'/home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool/fixdep.o' failed
make[4]: *** [/home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool/fixdep.o] Error 126
Makefile:43: recipe for target '/home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool/fixdep-in.o' failed
make[3]: *** [/home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool/fixdep-in.o] Error 2
/home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/build/Makefile.include:5: recipe for target 'fixdep' failed
make[2]: *** [fixdep] Error 2
Makefile:68: recipe for target 'objtool' failed
make[1]: *** [objtool] Error 2
Makefile:1885: recipe for target 'tools/objtool' failed
make: *** [tools/objtool] Error 2
make: *** Waiting for unfinished jobs....

The make target also goes into tools/build/ and requires some targets 
there and then uses those tools during the further build.

So, we need some more patches here as well.

Can you share the list of 19 files that remained even with make clean?

Then, we go through them and check if they disappear with make mrproper or 
with a different make target to clean them. Potentially, we also hook 
those identified targets up into make mrproper then.

Lukas
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
