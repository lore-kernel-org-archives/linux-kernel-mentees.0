Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9166EB64DA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  7 Jul 2023 13:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E254B415C8;
	Fri,  7 Jul 2023 13:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E254B415C8
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CJj7MGkX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6g2_kP77F1b; Fri,  7 Jul 2023 13:48:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 5F4F2415CB;
	Fri,  7 Jul 2023 13:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F4F2415CB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2CB3AC0072;
	Fri,  7 Jul 2023 13:48:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3AA40C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 13:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15EE6405D4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 13:48:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15EE6405D4
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=CJj7MGkX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rgScFo7CO2y2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 13:48:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21E33400B8
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 21E33400B8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  7 Jul 2023 13:48:33 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1b8b318c5cfso12827805ad.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 07 Jul 2023 06:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688737713; x=1691329713;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vp6gF/HK/ZF4U48X8WAh1ib4ToX+UsDFi8qnoETrDog=;
 b=CJj7MGkXzuhgioMNW4z/nNdJpC9pDAF3kpofJATdyrV+NuXO/WQZU9CPxK+opRkruc
 d/G63UzLmgLtMLJY1TN9LJyckg/iJ7rD39TAK2P/1LF/6zxJe0JwWEw0R5Iem+2IbV/p
 eiSTNHTgE2n+Uoy5Vs+ReExwodCfqWXa2TmBhdKpxwsc754avEOcNNfjGRj2EzdrjrIM
 I1iSbrdXjD3aTVpMMk+ptYfuYh73zv9pSocT0zG2O41abOE2MGuioOIjDDcNqEQQQDDI
 x636Q+cU+Y0JdybImTeU70nmzdkFk83jPP7hd5eKtdPVdTeUHBSdHFTRQvVTqk7/CtP1
 W0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688737713; x=1691329713;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vp6gF/HK/ZF4U48X8WAh1ib4ToX+UsDFi8qnoETrDog=;
 b=GmBn4V337T1Xq4yUAJNj4tV6BZ3dqUBZlU5/+icLyhXJpsE5tK2PHKOF5F7BRLH4Ee
 58jMZ4FHd2+KqkMcB0gptxQNDMahmKaR7ySaunOIc3et5rbSIt/w+g7DYoXWN3OjZokx
 xPxj2EVz+k2OjEoCGrQB2BDwsvwYtGVAhz1MwIPsEoA65QWw5OXbDtTIdjkcCCsIqkVy
 n0F6rY1qbb0a1ZJUsFO3TxvroTzDyPvLVexs5aDCUgWDiPzjpa2W3SWLYGYuQatMB/c6
 S/UEtyGnEBEzVIuxE3nu3FliOXilpu6Oox00M9MKHIQqb/PwslfHKqPNh9KvBQO2Tqh0
 b6rA==
X-Gm-Message-State: ABy/qLYBjQreayMhicN3kkmBf5gMUFdZcyUJYtl03xGbxH5Qpbh6dCfD
 PoxMA+dpKc/3yVfTPuSFoQI=
X-Google-Smtp-Source: APBJJlHs3U3pwKv+I8Tzrpq9dGdzS4GEp5yCbDTlNhRXPsbKMmQ1ALqcaDVv/F1Jxraa81AJj5GZog==
X-Received: by 2002:a17:902:b942:b0:1b6:797d:33fb with SMTP id
 h2-20020a170902b94200b001b6797d33fbmr4583633pls.64.1688737713329; 
 Fri, 07 Jul 2023 06:48:33 -0700 (PDT)
Received: from [192.168.1.9] ([14.238.228.104])
 by smtp.gmail.com with ESMTPSA id
 iz5-20020a170902ef8500b001b8649e52f8sm3275865plb.254.2023.07.07.06.48.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jul 2023 06:48:33 -0700 (PDT)
Message-ID: <32d67707-b831-9a98-4cb9-fcb27c8806ef@gmail.com>
Date: Fri, 7 Jul 2023 20:48:29 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] samples/bpf: Add more instructions to build
 dependencies and, configuration in README.rst
To: Stanislav Fomichev <sdf@google.com>
References: <bd1477f2-a51e-a795-4f25-a32d6ab46530@gmail.com>
 <ZKcE+wMWGdVFSBX2@google.com>
Content-Language: en-US
From: Anh Tuan Phan <tuananhlfc@gmail.com>
In-Reply-To: <ZKcE+wMWGdVFSBX2@google.com>
Cc: daniel@iogearbox.net, martin.lau@linux.dev, ast@kernel.org,
 andrii@kernel.org, bpf@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
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



On 7/7/23 01:16, Stanislav Fomichev wrote:
> On 07/06, Anh Tuan Phan wrote:
>> Update the Documentation to mention that some samples require pahole
>> v1.16 and kernel built with CONFIG_DEBUG_INFO_BTF=y
>>
>> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
>> ---
>>  samples/bpf/README.rst | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/samples/bpf/README.rst b/samples/bpf/README.rst
>> index 57f93edd1957..631592b83d60 100644
>> --- a/samples/bpf/README.rst
>> +++ b/samples/bpf/README.rst
>> @@ -14,6 +14,9 @@ Compiling requires having installed:
>>  Note that LLVM's tool 'llc' must support target 'bpf', list version
>>  and supported targets with command: ``llc --version``
>>
>> +Some samples require pahole version 1.16 as a dependency. See
>> +https://docs.kernel.org/bpf/bpf_devel_QA.html for reference.
>> +
> 
> Any reason no to add pahole 1.16 to this section above?
>> Compiling requires having installed:
>  * clang >= version 3.4.0
>  * llvm >= version 3.7.1
>  * pahole >= version 1.16
> 
> Although clang 3.4 probably won't get you anywhere these days. The
> whole README seems a bit outdated :-)
>

Put pahole requirement as your idea is better, thanks for suggestion.
Will update it and clang version as well. For clang version, I think I
can update min version as 11.0.0 (reference from
https://www.kernel.org/doc/html/next/process/changes.html). Do you see
any other potential outdated things in this document? I follow the above
steps and it help me compile the sample code successfully.

>>  Clean and configuration
>>  -----------------------
>>
>> @@ -28,6 +31,10 @@ Configure kernel, defconfig for instance::
>>
>>   make defconfig
>>
>> +Some samples require support for BPF Type Format (BTF). To enable it,
>> open the
>> +generated config file, or use menuconfig (by "make menuconfig") to
>> enable the
>> +following configs: CONFIG_BPF_SYSCALL and CONFIG_DEBUG_INFO_BTF.
>> +
> 
> This is usually enabled by default, so why special case it here?
> Maybe, if you want some hints about the config, we should add
> a reference to tools/testing/selftests/bpf/config ?
> 

The config CONFIG_DEBUG_INFO_BTF is disabled for some distros at least
for mine. I ran "make defconfig" and it's not enabled by default so I
think it worth to mention it here to help novice get started. I'll
update it to reference to tools/testing/selftests/bpf/config .

>>  Kernel headers
>>  --------------
>>
>> -- 
>> 2.34.1
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
