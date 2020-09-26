Return-Path: <SRS0=QfBv=DD=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B26C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 09:23:46 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 883D42389E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Sep 2020 09:23:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/fzxWyW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 883D42389E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2CD668485A;
	Sat, 26 Sep 2020 09:23:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XTY6Pv0NsMJt; Sat, 26 Sep 2020 09:23:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0979E8484B;
	Sat, 26 Sep 2020 09:23:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E1AD0C0891;
	Sat, 26 Sep 2020 09:23:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5BC8C0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 09:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D475A8588C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 09:23:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rpYb6LBAv585
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 09:23:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id CE1ED8583C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 09:23:39 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id bw23so740720pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Sep 2020 02:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zhWkjsBj4otDq0eSnkddZxCOYpsakXKi5b6tPU5j+mo=;
 b=Y/fzxWyWBU0iiFicTTVrxMCDjrHk1evltIxlAQ/wvsj84tCOuQMAI9EOuS8vqYgwXK
 QeefI+G5eaYexZPjTR1o+471+V02uJRTZrB0UQRbg16WpgTkmS6vmwjn/GcZ9PAtCnIS
 qrZdyJxbPtsS+QtmOF1A3osfdhSFW1ZeZIZBnFPGQyyVgD04bLFAyFgTLAZPgnaTqiUn
 2I3jHNu6n14MeKzAg94sa04Ev84ApatcOQEWdSrFlrpB0Q1UeJ9lohw66fiBCgYjEVTy
 yh4eVc4oBvViHlEGmal8hLddOQPOPGgv+aF6My5v6teWqn9Jt0ecMCveLBXHQrNPpf9Y
 p+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zhWkjsBj4otDq0eSnkddZxCOYpsakXKi5b6tPU5j+mo=;
 b=AwJMpnQx2qN74jHCRjNfHWAqu/a8xpMGfc1YK1CFcR6XHpA3CofstfCIAMZu9Xk8QH
 RsYmX9tMHIBb5hr0Gx8EXaEmbkLhssAOI2Sky/Er/771V9jrTjxtw6+OK04HujvyulZc
 qF7zb3+/3+d+WByCR1Hb+s4lF/ARx2TCuNYxCbq8btfzTVh7r1UVCS19FNVw5c6whLzn
 LmUcqcrp6dzbfD57qjSiWwGpkb4Krh43jyyreSZ/iWqNZ+FnI22EF2lW7WICj3KPHapZ
 8NmWPW0nJw38/61Z44xI+O9ToGzdYwA0nUopXkH4JM7hnDOnsao55fU/33OR799+pjlF
 LAZA==
X-Gm-Message-State: AOAM533lZFozFMoJytUvVc9SEDG8E324FRxd0mjQ7vWflA3vV3vkG2iX
 2VpO7aAoNE9Yeayon0T4jgafzU8g5asxXw==
X-Google-Smtp-Source: ABdhPJzxnmKqISGox8iRHcAWNxfGmXmX0HnC9JZe+8Uoj1Ugrw2Um3Yibj+R3GoT/ZegspiYVXRwGg==
X-Received: by 2002:a17:90a:9a92:: with SMTP id
 e18mr1385150pjp.211.1601112218845; 
 Sat, 26 Sep 2020 02:23:38 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:2085:4633:7001:2dd8:81bf])
 by smtp.gmail.com with ESMTPSA id 25sm4034319pgo.34.2020.09.26.02.23.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Sep 2020 02:23:38 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <20200925212008.694018-1-ujjwalkumar0501@gmail.com>
 <cabeb5d7-f9c3-7e6d-fa43-03e6ef0dc476@gmail.com>
 <alpine.DEB.2.21.2009260727250.4734@felia>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <a24ccaf7-a96f-0ca1-cc36-135f88497ac4@gmail.com>
Date: Sat, 26 Sep 2020 14:53:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2009260727250.4734@felia>
Content-Language: en-US
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

On 26/09/20 11:24 am, Lukas Bulwahn wrote:
> 
> 
> On Sat, 26 Sep 2020, Ujjwal Kumar wrote:
>>
>> To unset the executable bit I ran following command:
>> for i in $(find -executable -type f); do chmod -x $i; done
>>
>> One thing that I noticed is, once we initiate a kernel build some 
>> programs are compiled and removing their executable bit is not desirable.
>> Even after performing "make clean" some of those programs still persist and 
>> removing their executable bit fails any further attempt to build the kernel.
>>
>> For instance, tools/objtool/objtool file. In my case I had a total of 19 
>> files remaining after performing make clean.
>>
> 
> Good observation.
> 
> You can properly clean your build with make mrproper, but maybe that is 
> not even enough... all generated files might not mean _all generated 
> tools_, such as objtool, etc.
> 
> $ make help
> 
> Cleaning targets:
>   clean		  - Remove most generated files but keep the config and
>                     enough build support to build external modules
>   mrproper	  - Remove all generated files + config + various backup files
>   distclean	  - mrproper + remove editor backup and patch files
> 
> [...]
> 
> After for i in $(find -executable -type f); do chmod -x $i; done:
> I saw those failures (probably as you did as well):

Yes these are the same errors that I received.

> 
> *** Default configuration is based on 'x86_64_defconfig'
> sh: 1: ./scripts/gcc-version.sh: Permission denied
> init/Kconfig:34: syntax error
> init/Kconfig:33: invalid statement
> init/Kconfig:34: invalid statement
> sh: 1: ./scripts/ld-version.sh: Permission denied
> init/Kconfig:39: syntax error
> init/Kconfig:38: invalid statement
> sh: 1: ./scripts/clang-version.sh: Permission denied
> init/Kconfig:49: syntax error
> init/Kconfig:48: invalid statement
> scripts/kconfig/Makefile:80: recipe for target 'defconfig' failed
> make[1]: *** [defconfig] Error 1
> Makefile:606: recipe for target 'defconfig' failed
> make: *** [defconfig] Error 2
> 
> 
> After your patch was applied, they disappear. So, it does the job.
> More comments on the patch itself later.
> 
> make defconfig works.
> 

Yes, these errors appeared when we unset executable bits on files after 
performing 'make clean' and then perform a kernel build.

> make then fails:
> 
> HOSTCC   /home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool/fixdep.o
> /bin/sh: 1: /home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool//fixdep: Permission denied
> /home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/build/Makefile.build:96: recipe for target 
> '/home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool/fixdep.o' failed
> make[4]: *** [/home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool/fixdep.o] Error 126
> Makefile:43: recipe for target '/home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool/fixdep-in.o' failed
> make[3]: *** [/home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/objtool/fixdep-in.o] Error 2
> /home/lukas/repositories/kernel.org/pub/scm/linux/kernel/git/torvalds/linux/tools/build/Makefile.include:5: recipe for target 'fixdep' failed
> make[2]: *** [fixdep] Error 2
> Makefile:68: recipe for target 'objtool' failed
> make[1]: *** [objtool] Error 2
> Makefile:1885: recipe for target 'tools/objtool' failed
> make: *** [tools/objtool] Error 2
> make: *** Waiting for unfinished jobs....
> 
> The make target also goes into tools/build/ and requires some targets 
> there and then uses those tools during the further build.
> 
> So, we need some more patches here as well.
> 
> Can you share the list of 19 files that remained even with make clean?
> 

After performing a make clean, the files that persist are:
./tools/objtool/objtool
./tools/objtool/fixdep
./scripts/sorttable
./scripts/mod/mk_elfconfig
./scripts/mod/modpost
./scripts/unifdef
./scripts/basic/fixdep
./scripts/bin2c
./scripts/extract-cert
./scripts/kconfig/conf
./scripts/selinux/mdp/mdp
./scripts/selinux/genheaders/genheaders
./scripts/asn1_compiler
./scripts/kallsyms
./scripts/sign-file
./scripts/genksyms/genksyms
./scripts/recordmcount
./scripts/insert-sys-cert
./scripts/dtc/dtc

After performing 'make mrproper'/'make distclean' the files that persist 
are:
./tools/objtool/objtool
./tools/objtool/fixdep

> Then, we go through them and check if they disappear with make mrproper or 
> with a different make target to clean them. Potentially, we also hook 
> those identified targets up into make mrproper then.

Is it appropriate to include the files here: 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Makefile?h=next-20200925#n1466
?
Or should it be included inside tools/objtool/Makefile here:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/tools/objtool/Makefile?h=next-20200925#n78
?
In the second link, it appears to me that the files are already included for 
clean task but still they are not cleaned.

>> Lukas
> 

Thanks
Ujjwal Kumar
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
