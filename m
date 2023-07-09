Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD3EEB64DC
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  9 Jul 2023 14:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ABEB981C56;
	Sun,  9 Jul 2023 14:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABEB981C56
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TToCebSV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6AQ0Dl5jaLpx; Sun,  9 Jul 2023 14:38:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 7BCC781C21;
	Sun,  9 Jul 2023 14:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BCC781C21
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4AF9BC0071;
	Sun,  9 Jul 2023 14:38:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 248FAC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 14:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEE3A404A6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 14:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEE3A404A6
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=TToCebSV
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yBpW9FJz0URP
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 14:38:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D594840017
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D594840017
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  9 Jul 2023 14:38:02 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-553a1f13d9fso2859875a12.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 09 Jul 2023 07:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688913482; x=1691505482;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+6zPSyF1+6E2Wjz3CS7EukTNOIkm3ZHJEPN7gEbtToo=;
 b=TToCebSVTvycnIUkfg46DjbuMDJz02IW6q6jKS6wGcX/KyKDYQf22orpQsQLeL3FuX
 Sytkk/6OPw3OpUaQJTJtlwOKvAVS2bAi6vhKODn0H2xFBkemHu1vYLIiAiWh2+B8eyfT
 hvdmy/beMi+9R6uWtY988ObtxHj1r28nFV6QCPL5me66TaDG7HY++YX+oeRh3dT5tUB0
 xZbE52fAfrNDRdydX3DUil1Ik+8iZvDWmATJT3X51mtl+T9VVcYLSDI39AovbIu3zLus
 FU40l6qd6Yh9Dna8ksW5OQ8hA/onXGkxYehW6fv1Rkx48+CyeT0oMIX1bQDvUFn7RRzR
 i9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688913482; x=1691505482;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+6zPSyF1+6E2Wjz3CS7EukTNOIkm3ZHJEPN7gEbtToo=;
 b=VYntc2Zxro3QxhkdJknUN4PkzhdSjUQRC81iZf3jonyM36HUstbK9sNrWT95Jsw/gQ
 PLvM61ctUird6+Oj4BbAmiKqHlcYvk4qtauiHV2C6S0Z/6Fya8KIjmwS12ukSMSj6GL7
 CehTa6+Hr+XxfOAArrjAuMbcvSk/s37Je3meKFGGO865cfxYG5qWIArQ4tG0vMeK4nim
 u0Ka1zhdrEXeFCDxaDkn1FERaFXyxgFl0ZesSP0ZTSaZ6nz6Cr8zjx4mj2eedLqqDsxB
 4jTUjM4aCHxYXHQNdttzddC12lrwvj+811Ilg9C8Al1upP44f7BfY3yKCQWxDmNx+R9i
 kEIQ==
X-Gm-Message-State: ABy/qLbgnD3pzRdF+REV8chlrRSJTOg+7I8rlz6jqzl13KX01Y11wbKz
 GpRl+d71lp2PagTla0h+2qM=
X-Google-Smtp-Source: APBJJlGf/CVqklZ7ImwM/1O4eKhjI6NJ5FyAxBf4+Rkyc2MSEwfMsv9qHVuVJ1a8Y3jPnBbUQrOpEA==
X-Received: by 2002:a17:90a:bb84:b0:25b:e07f:4c43 with SMTP id
 v4-20020a17090abb8400b0025be07f4c43mr10465169pjr.10.1688913481835; 
 Sun, 09 Jul 2023 07:38:01 -0700 (PDT)
Received: from [192.168.1.9] ([14.238.228.104])
 by smtp.gmail.com with ESMTPSA id
 11-20020a17090a004b00b00265892de629sm4524728pjb.29.2023.07.09.07.37.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Jul 2023 07:38:01 -0700 (PDT)
Message-ID: <5d336a9a-8ae5-2b1f-7af3-a94818867b40@gmail.com>
Date: Sun, 9 Jul 2023 21:37:58 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] samples/bpf: Add more instructions to build
 dependencies and, configuration in README.rst
Content-Language: en-US
To: Stanislav Fomichev <sdf@google.com>
References: <bd1477f2-a51e-a795-4f25-a32d6ab46530@gmail.com>
 <ZKcE+wMWGdVFSBX2@google.com>
 <32d67707-b831-9a98-4cb9-fcb27c8806ef@gmail.com>
 <ZKhEEJfzCyYI7BfH@google.com>
From: Anh Tuan Phan <tuananhlfc@gmail.com>
In-Reply-To: <ZKhEEJfzCyYI7BfH@google.com>
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

Hi Stanislav,

I have updated the Documentation according to your suggestion. Please
see it in the below patch. Thanks!

On 7/7/23 23:57, Stanislav Fomichev wrote:
> On 07/07, Anh Tuan Phan wrote:
>>
>>
>> On 7/7/23 01:16, Stanislav Fomichev wrote:
>>> On 07/06, Anh Tuan Phan wrote:
>>>> Update the Documentation to mention that some samples require pahole
>>>> v1.16 and kernel built with CONFIG_DEBUG_INFO_BTF=y
>>>>
>>>> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
>>>> ---
>>>>  samples/bpf/README.rst | 7 +++++++
>>>>  1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/samples/bpf/README.rst b/samples/bpf/README.rst
>>>> index 57f93edd1957..631592b83d60 100644
>>>> --- a/samples/bpf/README.rst
>>>> +++ b/samples/bpf/README.rst
>>>> @@ -14,6 +14,9 @@ Compiling requires having installed:
>>>>  Note that LLVM's tool 'llc' must support target 'bpf', list version
>>>>  and supported targets with command: ``llc --version``
>>>>
>>>> +Some samples require pahole version 1.16 as a dependency. See
>>>> +https://docs.kernel.org/bpf/bpf_devel_QA.html for reference.
>>>> +
>>>
>>> Any reason no to add pahole 1.16 to this section above?
>>>> Compiling requires having installed:
>>>  * clang >= version 3.4.0
>>>  * llvm >= version 3.7.1
>>>  * pahole >= version 1.16
>>>
>>> Although clang 3.4 probably won't get you anywhere these days. The
>>> whole README seems a bit outdated :-)
>>>
>>
>> Put pahole requirement as your idea is better, thanks for suggestion.
>> Will update it and clang version as well. For clang version, I think I
>> can update min version as 11.0.0 (reference from
>> https://www.kernel.org/doc/html/next/process/changes.html). Do you see
>> any other potential outdated things in this document? I follow the above
>> steps and it help me compile the sample code successfully.
> 
> Maybe we can reference that doc instead here? Otherwise that copy-pasted
> 11.0.0 will also get old. Just mention here that we need
> clang/llvm/pahole to compile the samples and for specific versions
> put a link to process/changes.rst
>  
>>>>  Clean and configuration
>>>>  -----------------------
>>>>
>>>> @@ -28,6 +31,10 @@ Configure kernel, defconfig for instance::
>>>>
>>>>   make defconfig
>>>>
>>>> +Some samples require support for BPF Type Format (BTF). To enable it,
>>>> open the
>>>> +generated config file, or use menuconfig (by "make menuconfig") to
>>>> enable the
>>>> +following configs: CONFIG_BPF_SYSCALL and CONFIG_DEBUG_INFO_BTF.
>>>> +
>>>
>>> This is usually enabled by default, so why special case it here?
>>> Maybe, if you want some hints about the config, we should add
>>> a reference to tools/testing/selftests/bpf/config ?
>>>
>>
>> The config CONFIG_DEBUG_INFO_BTF is disabled for some distros at least
>> for mine. I ran "make defconfig" and it's not enabled by default so I
>> think it worth to mention it here to help novice get started. I'll
>> update it to reference to tools/testing/selftests/bpf/config .
>>
>>>>  Kernel headers
>>>>  --------------
>>>>
>>>> -- 
>>>> 2.34.1

Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
---

Change from the original patch:

- Move pahole to the list installed requirements
- Remove minimal version and link the related doc
- Add a reference of kernel configuration

 samples/bpf/README.rst | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/samples/bpf/README.rst b/samples/bpf/README.rst
index 57f93edd1957..e18500753ba5 100644
--- a/samples/bpf/README.rst
+++ b/samples/bpf/README.rst
@@ -8,9 +8,12 @@ Build dependencies
 ==================

 Compiling requires having installed:
- * clang >= version 3.4.0
- * llvm >= version 3.7.1
+ * clang
+ * llvm
+ * pahole

+The minimal version of the above software is referenced in
+https://www.kernel.org/doc/html/next/process/changes.html.
 Note that LLVM's tool 'llc' must support target 'bpf', list version
 and supported targets with command: ``llc --version``

@@ -24,7 +27,8 @@ after some changes (on demand)::
  make -C samples/bpf clean
  make clean

-Configure kernel, defconfig for instance::
+Configure kernel, defconfig for instance
+(see "tools/testing/selftests/bpf/config" for a reference config)::

  make defconfig

-- 
2.34.1


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
