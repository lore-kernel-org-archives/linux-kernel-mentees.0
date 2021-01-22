Return-Path: <SRS0=cwSI=GZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78428C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Jan 2021 13:19:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F86623428
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 22 Jan 2021 13:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F86623428
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A08EA85BD8;
	Fri, 22 Jan 2021 13:18:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2NeSuQWdV8d; Fri, 22 Jan 2021 13:18:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 70CC681BA0;
	Fri, 22 Jan 2021 13:18:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58F66C08A1;
	Fri, 22 Jan 2021 13:18:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76B8DC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 13:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 5AB882DE22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 13:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VM2-dXp3Wk+K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 13:18:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by silver.osuosl.org (Postfix) with ESMTPS id 1F9BD2049D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 13:18:52 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id p15so3705784pjv.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Jan 2021 05:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2IuYY7Ptttp60mCGRmohDF14eaicEWNySULlVw9pTIE=;
 b=qex1eud/YCF92qwJywdZihwqDlX3vnjuAP2CB4UurkPrU4eO32mUAdJIy6GM2biaVd
 0Ia2yHwucoOxWBzwJLITKb/6ktswnxKEeoUobJB6SVLU4/YBy6PJUGmQeDxQjoqr+C3G
 IPTArAJSgh8uUuv2ml8Ei6uwMKzAGiqiO89FuEWLM7teCgu2ZhTgGYAAol82uiiQmomw
 jUYzm95zyjwrLOxZg7yVcbUW0N6tzcsrLY2gNWE++HtQTfZ+HzqK2miS5wZGzADL1lem
 HcbHGr9HmZPSHE14M+vmGwI3lhYD7pPShrAbpsToGs3I6DIVYeftFy6vEwu8deGNslbP
 6v8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2IuYY7Ptttp60mCGRmohDF14eaicEWNySULlVw9pTIE=;
 b=DLdCF+wnZTafF4CCqKjrBStL9PI5W3Hxc0y1TlYU0XTIiut//jgIo6D+10szGeXdnm
 V/wuQuAM2HMB8swQMGPD9SAWMH4lyx1juZdgIB/Aj1U4BrBcWmB71fxGfkH+mYJMabbm
 lF73sJ+kK1VvFwmZk6dy/9A/cCGd1CxqUIbfZD3ZevIuVXP7+YRysPN7iszrBqgkOGsZ
 HU+o28JF4SsDf39Mj3DhyCvYkny/7w9elVkxOC0luB3/bTabuoR5qf+GyNyy5XcFozaX
 27/ftWw1B8HP8ByVmXjcmSOIpFsZ6TpdnGE7N03HQMdHf+b9kDeeJFJxkCD0FngKqb7H
 FETQ==
X-Gm-Message-State: AOAM532FKgQyyrD/lkoGTGcywHFMz+Hi3xEg6k+KWgU2Fu4UNL2ANrgg
 r4XBE7xLuMs8dd8ly4Om2uk=
X-Google-Smtp-Source: ABdhPJxoEW6GFoFDxwtzzlLOAR4hkWxhUM/CRwSMZqHFI3qj4GMAJcLqLhtFhl13ljtuLoMyQAZALA==
X-Received: by 2002:a17:902:e54e:b029:de:8c70:2ed0 with SMTP id
 n14-20020a170902e54eb02900de8c702ed0mr4946054plf.3.1611321531356; 
 Fri, 22 Jan 2021 05:18:51 -0800 (PST)
Received: from ?IPv6:2405:201:600d:a089:5548:7837:8dcd:a8?
 ([2405:201:600d:a089:5548:7837:8dcd:a8])
 by smtp.gmail.com with ESMTPSA id b206sm8608751pfb.73.2021.01.22.05.18.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 05:18:50 -0800 (PST)
To: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org
References: <20210120072547.10221-1-yashsri421@gmail.com>
 <e5c5f8495fbdd063f4272f02a259bbf28b199bdd.camel@perches.com>
 <14707ab9-1872-4f8c-3ed8-e77b663c3adb@gmail.com>
 <fb1b511d71761c99a9bece803f508b674fce9962.camel@perches.com>
From: Aditya <yashsri421@gmail.com>
Message-ID: <98d40817-1f80-c772-eb9e-a6c3c04625b3@gmail.com>
Date: Fri, 22 Jan 2021 18:48:43 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fb1b511d71761c99a9bece803f508b674fce9962.camel@perches.com>
Content-Language: en-US
Cc: broonie@kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 clang-built-linux@googlegroups.com, dwaipayanray1@gmail.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 21/1/21 12:13 am, Joe Perches wrote:
> On Wed, 2021-01-20 at 18:23 +0530, Aditya wrote:
>> On 20/1/21 2:51 pm, Joe Perches wrote:
>>> On Wed, 2021-01-20 at 12:55 +0530, Aditya Srivastava wrote:
>>>> Local symbols prefixed with '.L' do not emit symbol table entries, as
>>>> they have special meaning for the assembler.
>>>>
>>>> '.L' prefixed symbols can be used within a code region, but should be
>>>> avoided for denoting a range of code via 'SYM_*_START/END' annotations.
>>>>
>>>> Add a new check to emit a warning on finding the usage of '.L' symbols
>>>> in '.S' files, if it lies within SYM_*_START/END annotation pair.
>>>
>>> I believe this needs a test for $file as it won't work well on
>>> patches as the SYM_*_START/END may not be in the patch context.
>>>
>> Okay.
>>
>>> Also, is this supposed to work for local labels like '.L<foo>:'?
>>> I don't think a warning should be generated for those.
>>>
>> Yes, currently it will generate warning for all symbols which start
>> with .L and have non- white character symbol following it, if it is
>> lying within SYM_*_START/END annotation pair.
>>
>> Should I reduce the check to \.L_\S+ instead? (please note "_"
>> following ".L")
> 
> Use grep first.  That would still match several existing labels.
> 
>> Pardon me, I'm not good with assembly :/
> 
> Spending time reading docs can help with that.
> 
> Mark?  Can you please comment about the below?
> 
> I believe the test should be:
> 
> 	if ($realfile =~ /\.S$/ &&
> 	    $line =~ /^\+\s*SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {

Joe, with this regex, we won't be able to match
"jmp  .L_restore
SYM_FUNC_END(\name)"

which was replaced in this patch in the discussion:
https://groups.google.com/g/clang-built-linux/c/-drkmLgu-cU/m/phKe-Tb6CgAJ

Here, "jmp  .L_restore" was also replaced to fix the error.

However, if this
regex(/^\+\s*SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) is
correct, maybe we don't need to check for $file as we are now checking
for just one line.

What do you think?

Thanks
Aditya

> 		WARN(...);
> 	}
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
> 
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
