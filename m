Return-Path: <SRS0=wdXo=FG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D443CC64E7C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 22:58:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A2B9221FD
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 22:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A2B9221FD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8A07A2E1F0;
	Wed,  2 Dec 2020 22:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CkaSOcFU0bL9; Wed,  2 Dec 2020 22:58:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A3B7D2E17D;
	Wed,  2 Dec 2020 22:58:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8617EC163C;
	Wed,  2 Dec 2020 22:58:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CCF8BC0FA7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 22:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B7ABB87376
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 22:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dU8Ia3NXhoEO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 22:58:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8276286EDD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 22:58:43 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id t8so62062iov.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Dec 2020 14:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=5cB+/vzqNyGLlY6gjXLdgcPyiXRJ9zfEjY/dw9Idssc=;
 b=X8557/AaDSnc9UMi9+sP+NzMIycm4dY1OUc43TJwqCyubHtdOXlntePdg7MSqERib7
 2MHzSJXG1VwTGZwJ7AAfpgYiHYKhdFqqbt54Q++1yolC8XAg97L4/l6bPtqFRKYwZHMc
 Aw1BX3BTAcOw807GmPNnGGsHLfghlU/C8d3+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5cB+/vzqNyGLlY6gjXLdgcPyiXRJ9zfEjY/dw9Idssc=;
 b=eJrrpRQxjEmp4GvD51NXNGEJqHjEaTN9hj63hWjtIerX2U5ab4XgC+f3JL16BbC6nd
 OOufNTxONAgRSd5e11jNLF/8s1cR9z9B9LpKNyrGNZQo+sKgHuh3N6aG0Ve7RzoKmv2s
 HEyLCTIru9f7c1cdr3KWNYwGrlYF1QOVYhl85oaTB4LNb09TbPQrRZNPuSh61R5KrfCE
 fN/kNB42WwwBU+GU6kX9hnXrf0Yqaq6XoAh7Uqt8UyTUk4VXdhas1iGn6wZ6eiTWXUVd
 RpblsijPre1Uey4uCWVHFDYR+sInULtUoyIaWpAKbdjsGo2+22OXpmxiWdtEc3YxYhjz
 9tFw==
X-Gm-Message-State: AOAM533bY9z74m6EPBzmu5YBn0dIV8a8tq3S0sQhes2K/oZzh5uMemKh
 oDqLDqWStJR/NXejVWM1G0kMP3J7
X-Google-Smtp-Source: ABdhPJzw3Rv1enCYSm9+2gzSPLTdHJBQW7KQ7rpvW60Gn0Ix2oysMP10GIdQH+AH3ho7nq+g1z7Y2Q==
X-Received: by 2002:a6b:600a:: with SMTP id r10mr533063iog.143.1606949922814; 
 Wed, 02 Dec 2020 14:58:42 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id a3sm118730ilp.5.2020.12.02.14.58.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Dec 2020 14:58:42 -0800 (PST)
To: Marco Elver <elver@google.com>
References: <20201116054035.211498-1-98.arpi@gmail.com>
 <CABVgOSkoQahYqMJ3dD1_X2+rF3OgwT658+8HRM2EZ5e0-94jmw@mail.gmail.com>
 <CANpmjNOhb13YthVHmXxMjpD2JZUO4H2Z1KZSKqHeFUv-RbM5+Q@mail.gmail.com>
 <CABVgOSnGnkCnAyAqVoLhMGb6XV_irtYB7pyOTon5Scab8GxKtg@mail.gmail.com>
 <CAFd5g4768o7UtOmM3X0X5upD0uF3j-=g3txi0_Ue3z8oM_Ghow@mail.gmail.com>
 <505b8cd0-a61e-5ec3-7e0b-239d0ff55d56@linuxfoundation.org>
 <CANpmjNMOMD+2OhBWNh5XuFufbm1bhXTUm4Y3_YiNNdfC=G2xdQ@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <baa3bec1-224e-43c6-1e63-982e5eeb217f@linuxfoundation.org>
Date: Wed, 2 Dec 2020 15:58:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CANpmjNMOMD+2OhBWNh5XuFufbm1bhXTUm4Y3_YiNNdfC=G2xdQ@mail.gmail.com>
Content-Language: en-US
Cc: Arpitha Raghunandan <98.arpi@gmail.com>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, "Bird,
 Tim" <Tim.Bird@sony.com>, Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>, David Gow <davidgow@google.com>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v9 1/2] kunit: Support for
	Parameterized Testing
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 12/1/20 4:31 PM, Marco Elver wrote:
> On Tue, 1 Dec 2020 at 23:28, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 11/30/20 3:22 PM, Brendan Higgins wrote:
>>> On Mon, Nov 23, 2020 at 11:25 PM David Gow <davidgow@google.com> wrote:
>>>>
>>>> On Mon, Nov 23, 2020 at 9:08 PM Marco Elver <elver@google.com> wrote:
>>>>>
>>>>> On Tue, 17 Nov 2020 at 08:21, David Gow <davidgow@google.com> wrote:
>>>>>> On Mon, Nov 16, 2020 at 1:41 PM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>>>>>>>
>>>>>>> Implementation of support for parameterized testing in KUnit. This
>>>>>>> approach requires the creation of a test case using the
>>>>>>> KUNIT_CASE_PARAM() macro that accepts a generator function as input.
>>>>>>>
>>>>>>> This generator function should return the next parameter given the
>>>>>>> previous parameter in parameterized tests. It also provides a macro to
>>>>>>> generate common-case generators based on arrays. Generators may also
>>>>>>> optionally provide a human-readable description of parameters, which is
>>>>>>> displayed where available.
>>>>>>>
>>>>>>> Note, currently the result of each parameter run is displayed in
>>>>>>> diagnostic lines, and only the overall test case output summarizes
>>>>>>> TAP-compliant success or failure of all parameter runs. In future, when
>>>>>>> supported by kunit-tool, these can be turned into subsubtest outputs.
>>>>>>>
>>>>>>> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
>>>>>>> Co-developed-by: Marco Elver <elver@google.com>
>>>>>>> Signed-off-by: Marco Elver <elver@google.com>
>>>>>>> ---
>>>>>> [Resending this because my email client re-defaulted to HTML! Aarrgh!]
>>>>>>
>>>>>> This looks good to me! I tested it in UML and x86-64 w/ KASAN, and
>>>>>> both worked fine.
>>>>>>
>>>>>> Reviewed-by: David Gow <davidgow@google.com>
>>>>>> Tested-by: David Gow <davidgow@google.com>
>>>>>
>>>>> Thank you!
>>>>>
>>>>>> Thanks for sticking with this!
>>>>>
>>>>> Will these patches be landing in 5.11 or 5.12?
>>>>>
>>>>
>>>> I can't think of any reason not to have these in 5.11. We haven't
>>>> started staging things in the kselftest/kunit branch for 5.11 yet,
>>>> though.
>>>>
>>>> Patch 2 will probably need to be acked by Ted for ext4 first.
>>>>
>>>> Brendan, Shuah: can you make sure this doesn't get lost in patchwork?
>>>
>>> Looks good to me. I would definitely like to pick this up. But yeah,
>>> in order to pick up 2/2 we will need an ack from either Ted or Iurii.
>>>
>>> Ted seems to be busy right now, so I think I will just ask Shuah to go
>>> ahead and pick this patch up by itself and we or Ted can pick up patch
>>> 2/2 later.
>>>
>>> Cheers
>>>
>>
>> I am seeing
>>
>> ERROR: need consistent spacing around '*' (ctx:WxV)
>> #272: FILE: include/kunit/test.h:1786:
>> +               typeof((array)[0]) *__next = prev ? ((typeof(__next)) prev) + 1 :
>> (array);        \
>>                                     ^
>>
>> Can you look into this and send v10?
> 
> This is a false positive. I pointed this out here before:
> https://lkml.kernel.org/r/CANpmjNNhpe6TYt0KmBCCR-Wfz1Bxd8qnhiwegwnDQsxRAWmUMg@mail.gmail.com
> 
> checkpatch.pl thinks this is a multiplication, but this is a pointer,
> so the spacing here is correct.
> 

Thank you for confirming. I will apply this.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
