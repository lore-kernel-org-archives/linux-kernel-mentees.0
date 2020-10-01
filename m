Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1856BC4727E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 19:21:27 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D6BE20759
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 19:21:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CwYf+T4U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D6BE20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EE303868E8;
	Thu,  1 Oct 2020 19:21:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PpkZTojXZrC9; Thu,  1 Oct 2020 19:21:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CEDA4868EF;
	Thu,  1 Oct 2020 19:21:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B7D67C016F;
	Thu,  1 Oct 2020 19:21:20 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 13951C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E20D223039
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fIYyG+iPYvTo
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:21:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by silver.osuosl.org (Postfix) with ESMTPS id B80EE203D7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:21:13 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id gm14so2543180pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 12:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=leypJjrF8t+ANsUVQ9Gf/5KTt91DXduC41N7PrMxzNA=;
 b=CwYf+T4UjJBvSu8C4v8Te+aJk4IibqhVyC/D4Pv5ecDPo6lu/F2DTI/jWx8paZCV+/
 yK0X4GoGc3nY9wJMG38aliu+S10nGMm1X6kO0MvALzrlgfSE9ecCDlw9Fc+LJCuSqsBx
 FKdxXYU2RwZNERKbjVkfeRDQepdmQrZzuL8JnWj/xI6gKeycZDJ36pgoPckGI8uN5Kkp
 7ouq5gw69N9GU9zEskjO0+xFZW1zH7fVm0cC52STXU/NdCUREmZc8ZVHLVfbhU2DK45l
 1PHsGtVNXlQSImCa2l0nwgf8qhMyUxIGfgYZPqfKKGs6LDlZsq2+3Qr0L3Ny9mkZmKGH
 dksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=leypJjrF8t+ANsUVQ9Gf/5KTt91DXduC41N7PrMxzNA=;
 b=gmZ5V91xnuEVHCDEqP3jEqgZ/WJAm5F0JPxxabVED9JUuPlmu+9yEn60Zb+osaJU9L
 HPg1xPDl8gETkCknFHzcfLaVBwOpe9kFOcY3jZfmkMvNXDLfNdXMIJyGpwzAA4mY0qB7
 XGMt17zmGFdZhXtAxsBwAxc4zBIhTB+nqSeiMPgwHLH5nNWaLT3YDxhne8A594x0pK/D
 Ik1bb4pZm+aV50KIZWSHOFFlQ2CQzV7Hf1sUnvRcqX2NNY77O6X4VVO8KNwTWzUei2t1
 Dd3L7rk7hhJgQUU55nLTq7bE7iTUDqAkVHztZIIXmgBTtNVZ5gqHAcXTDhcD4qBFaOSv
 ZpLA==
X-Gm-Message-State: AOAM532RgSPGtK/Qp/vg/XODZ8dp07P0wAlFrfa1H9v5BiiJfsvcSzLc
 52TO4zf/Z+/37Q1RzA8XCZmzDM7vdQ1qeQ==
X-Google-Smtp-Source: ABdhPJylXLzrm46KeufK1CV1TB0jX58gQiTqHT3AvK7G547Ohe/eSfOO1wqB/ApJLgoeTVsV0DbRiA==
X-Received: by 2002:a17:90a:e815:: with SMTP id
 i21mr1370464pjy.97.1601580072634; 
 Thu, 01 Oct 2020 12:21:12 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id p6sm7514792pfn.63.2020.10.01.12.21.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 12:21:11 -0700 (PDT)
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
References: <61d45592-20be-7fe1-8168-5ccacca655a3@gmail.com>
 <alpine.DEB.2.21.2010011245490.24571@felia>
 <80f188d8-b0c2-ecf1-d0b9-faad146d2cec@gmail.com>
 <alpine.DEB.2.21.2010011554160.24571@felia>
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Message-ID: <24932c9f-395d-38de-4bc9-152547abeba1@gmail.com>
Date: Fri, 2 Oct 2020 00:51:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2010011554160.24571@felia>
Content-Language: en-US
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

On 01/10/20 7:39 pm, Lukas Bulwahn wrote:
> 
> 
> On Thu, 1 Oct 2020, Ujjwal Kumar wrote:
> 
>> On 01/10/20 4:38 pm, Lukas Bulwahn wrote:
>>>
>>>
>>> On Thu, 1 Oct 2020, Ujjwal Kumar wrote:
>>>
>>>> We cannot rely on execute bits to be set on files in the repository.
>>>> The build script should use the explicit interpreter when invoking any
>>>> script from the repository.
>>>>
>>>> Link: https://lore.kernel.org/lkml/20200830174409.c24c3f67addcce0cea9a9d4c@linux-foundation.org/
>>>> Link: https://lore.kernel.org/lkml/202008271102.FEB906C88@keescook/
>>>>
>>>> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
>>>> Suggested-by: Kees Cook <keescook@chromium.org>
>>>> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
>>>> Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
>>>> ---
>>>>  Documentation/Makefile                           | 16 ++++++++--------
>>>>  Documentation/userspace-api/media/Makefile       |  6 +++---
>>>>  Makefile                                         |  4 ++--
>>>>  arch/arm64/kernel/vdso/Makefile                  |  2 +-
>>>>  arch/arm64/kernel/vdso32/Makefile                |  2 +-
>>>>  arch/ia64/Makefile                               |  4 ++--
>>>>  arch/nds32/kernel/vdso/Makefile                  |  2 +-
>>>>  .../comedi/drivers/ni_routing/tools/Makefile     |  6 +++---
>>>>  scripts/Makefile.build                           |  2 +-
>>>>  scripts/Makefile.package                         |  4 ++--
>>>>  tools/bootconfig/Makefile                        |  2 +-
>>>>  tools/bpf/Makefile.helpers                       |  2 +-
>>>>  tools/lib/bpf/Makefile                           |  2 +-
>>>>  tools/perf/Makefile.perf                         |  2 +-
>>>>  tools/power/cpupower/Makefile                    |  2 +-
>>>>  tools/testing/selftests/rcutorture/Makefile      |  2 +-
>>>>  tools/testing/selftests/rseq/Makefile            |  2 +-
>>>>  tools/testing/selftests/vm/Makefile              |  6 +++---
>>>>  tools/testing/selftests/wireguard/qemu/Makefile  |  4 ++--
>>>>  tools/testing/selftests/x86/Makefile             |  6 +++---
>>>>  20 files changed, 39 insertions(+), 39 deletions(-)
>>>>
>>>
>>> You will probably need to split this patch into multiple patches, but the 
>>> discussion will show how to split it best.
>>>
>>> Probably:
>>>
>>>  - one for Documentation
>>>  - one for general kbuild, maybe including arch
>>>  - one for selftests
>>>  - one for the other tools
>>>  - one for the comedi driver
>>>
>>> So, what did you do for testing your change?
>>
>> First, I had to unset the execute bits on all files.
>> for i in $(find -executable -type f); do chmod -x $i; done
>>
>> To test the changes, I invoked the make rule under which my current 
>> changes lie. And I could see a permission-denied whenever a script 
>> was invoked. After the patch, the make rule progressed without 
>> any permissions error.
>> I couldn't test each and every change, because some rules failed 
>> before invoking the script and others could not be invoked by me.
>>
> 
> Which could you not test? Please share that.

arch/arm64/kernel/vdso/Makefile
arch/arm64/kernel/vdso32/Makefile
arch/ia64/Makefile
arch/nds32/kernel/vdso/Makefile
drivers/staging/comedi/drivers/ni_routing/tools/Makefile
scripts/Makefile.build
scripts/Makefile.package
tools/bootconfig/Makefile
tools/bpf/Makefile.helpers
tools/lib/bpf/Makefile
tools/testing/selftests/rcutorture/Makefile
tools/testing/selftests/rseq/Makefile
tools/testing/selftests/vm/Makefile
tools/testing/selftests/wireguard/qemu/Makefile
tools/testing/selftests/x86/Makefile

> 
>> I successfully tested the changes under Documentation/ (and some others).
>>
>> $ make htmldocs
>> make[1]: execvp: ./scripts/sphinx-pre-install: Permission denied
>> make[1]: *** [Documentation/Makefile:81: htmldocs] Error 127
>> make: *** [Makefile:1661: htmldocs] Error 2
>>
>> Files that I tested my changes on:
>> Documentation/Makefile                           | 16 ++++++++--------
>> Documentation/userspace-api/media/Makefile       |  6 +++---
>> Makefile                                         |  4 ++--
>> tools/perf/Makefile.perf                         |  2 +-
>> tools/power/cpupower/Makefile                    |  2 +-
>>
>>
>>>
>>> Did you check if CONFIG_SHELL is actually available in tools?
>>
>> Yes, I did check.
>> To verify, I echo(ed) the variables under a make task. And invoked 
>> the task from srctree.
>>
> 
> That sounds good.
>  
>>>> --- a/arch/nds32/kernel/vdso/Makefile
>>>> +++ b/arch/nds32/kernel/vdso/Makefile
>>>> @@ -39,7 +39,7 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
>>>>  # Generate VDSO offsets using helper script
>>>>  gen-vdsosym := $(srctree)/$(src)/gen_vdso_offsets.sh
>>>>  quiet_cmd_vdsosym = VDSOSYM $@
>>>> -      cmd_vdsosym = $(NM) $< | $(gen-vdsosym) | LC_ALL=C sort > $@
>>>> +      cmd_vdsosym = $(NM) $< | $(CONFIG_SHELL) $(gen-vdsosym) | LC_ALL=C sort > $@
>>>>
>>>
>>> I guess it is better to modify gen-vdsosym.
>>
>> Do you mean something as follows:
>> gen-vdsosym := $(CONFIG_SHELL) $(srctree)/$(src)/gen_vdso_offsets.sh
>>
>> If so, I have never seen that style in the build files. Infact, the current
>> style is followed at many places.
>> For instance,
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/scripts/Makefile.lib?h=next-20201001#n398
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm/tools/Makefile?h=next-20201001#n50
>>
> 
> I searched around as well. I think your proposal is fine.
> 
> How about splitting out a first patch on the generic kbuild files and send 
> that out as RFC, first send the RFC patch to linux-kernel-mentees list, 
> then if that looks good, we go for Masahiro and the linux-kbuild list?
> 
> Lukas
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
