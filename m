Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD31FC71155
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 22:28:48 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C5F120671
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 22:28:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P1DviP74"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C5F120671
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8B29A8707F;
	Tue,  1 Dec 2020 22:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wr0IdoWd-odi; Tue,  1 Dec 2020 22:28:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5C3B986E6F;
	Tue,  1 Dec 2020 22:28:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46F43C0859;
	Tue,  1 Dec 2020 22:28:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14F0CC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 22:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EC48887687
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 22:28:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Go4hiUYVpnD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 22:28:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9E9F987685
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 22:28:43 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id p5so3296109iln.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Dec 2020 14:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zEVORstsrTaSUgGGMeR0Tq7V6fCGhtA2/JQrS+CPcPM=;
 b=P1DviP74adgMmlwWKQrywJMta3DKhYPt7EEAf7M9nSMiOTTKSo2CvaGYxrVV4kEnl/
 B42RELckfkTh6KC+dDfnenfHzx2WM5MoeqWh6UmsCv0d+EE93QvFCF2kaHKBX/lpIOZb
 KrmZNE56Y3CIOeQaCnp6rLdZhw2c0pi3aiHHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zEVORstsrTaSUgGGMeR0Tq7V6fCGhtA2/JQrS+CPcPM=;
 b=cvb+ZjGmiQvs5adsyO478FTLu6eYXOFBZf4CtCYrGbGWoD+Ntvz+wm4Md8lnHmlzX5
 apKai2bm0EEKBMIPSgzIiRRIupRe+tUkQbBOtu5rhETQs5M+JFSdRz0QfMxVEUPqP3ab
 U00ua+uZOVf2FiGdcw0RHBjcF+j7tQfVRPlUEF0ojMpghSM4wc7znXc34Zp2G5Nus9J9
 HK9TbdLIYVtjwkdVvGI5OFJooytFDTj13LTgYyKDkHlyuzyZbVS+wtQue3B2wnxeyzk8
 O/B7FZkfdFXgT1gEW32XIf/BtsSadKq8Qs/xNMZeW9kystnpAZm3sOy5+leJqSmwcYZS
 nyBg==
X-Gm-Message-State: AOAM531jMhRQaoKl6tKdeoAu+T+hEfvqHQ7lJOgoxWS8cT5UuIvdCtZ1
 ukeWOkac4MJPiEtTpJHpOD6J/paL
X-Google-Smtp-Source: ABdhPJyoyG9ADgJ6dsBiNM1XKs7dyiBINsra2s2Ul2TQ/NhNuX+TnwTAu5r8ljVvYPPBgzF65GRHfw==
X-Received: by 2002:a92:512:: with SMTP id q18mr4738719ile.147.1606861722917; 
 Tue, 01 Dec 2020 14:28:42 -0800 (PST)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id r21sm462090ioa.20.2020.12.01.14.28.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 14:28:42 -0800 (PST)
To: Brendan Higgins <brendanhiggins@google.com>,
 David Gow <davidgow@google.com>, Arpitha Raghunandan <98.arpi@gmail.com>
References: <20201116054035.211498-1-98.arpi@gmail.com>
 <CABVgOSkoQahYqMJ3dD1_X2+rF3OgwT658+8HRM2EZ5e0-94jmw@mail.gmail.com>
 <CANpmjNOhb13YthVHmXxMjpD2JZUO4H2Z1KZSKqHeFUv-RbM5+Q@mail.gmail.com>
 <CABVgOSnGnkCnAyAqVoLhMGb6XV_irtYB7pyOTon5Scab8GxKtg@mail.gmail.com>
 <CAFd5g4768o7UtOmM3X0X5upD0uF3j-=g3txi0_Ue3z8oM_Ghow@mail.gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <505b8cd0-a61e-5ec3-7e0b-239d0ff55d56@linuxfoundation.org>
Date: Tue, 1 Dec 2020 15:28:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g4768o7UtOmM3X0X5upD0uF3j-=g3txi0_Ue3z8oM_Ghow@mail.gmail.com>
Content-Language: en-US
Cc: Marco Elver <elver@google.com>, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, "Bird, Tim" <Tim.Bird@sony.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
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

On 11/30/20 3:22 PM, Brendan Higgins wrote:
> On Mon, Nov 23, 2020 at 11:25 PM David Gow <davidgow@google.com> wrote:
>>
>> On Mon, Nov 23, 2020 at 9:08 PM Marco Elver <elver@google.com> wrote:
>>>
>>> On Tue, 17 Nov 2020 at 08:21, David Gow <davidgow@google.com> wrote:
>>>> On Mon, Nov 16, 2020 at 1:41 PM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>>>>>
>>>>> Implementation of support for parameterized testing in KUnit. This
>>>>> approach requires the creation of a test case using the
>>>>> KUNIT_CASE_PARAM() macro that accepts a generator function as input.
>>>>>
>>>>> This generator function should return the next parameter given the
>>>>> previous parameter in parameterized tests. It also provides a macro to
>>>>> generate common-case generators based on arrays. Generators may also
>>>>> optionally provide a human-readable description of parameters, which is
>>>>> displayed where available.
>>>>>
>>>>> Note, currently the result of each parameter run is displayed in
>>>>> diagnostic lines, and only the overall test case output summarizes
>>>>> TAP-compliant success or failure of all parameter runs. In future, when
>>>>> supported by kunit-tool, these can be turned into subsubtest outputs.
>>>>>
>>>>> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
>>>>> Co-developed-by: Marco Elver <elver@google.com>
>>>>> Signed-off-by: Marco Elver <elver@google.com>
>>>>> ---
>>>> [Resending this because my email client re-defaulted to HTML! Aarrgh!]
>>>>
>>>> This looks good to me! I tested it in UML and x86-64 w/ KASAN, and
>>>> both worked fine.
>>>>
>>>> Reviewed-by: David Gow <davidgow@google.com>
>>>> Tested-by: David Gow <davidgow@google.com>
>>>
>>> Thank you!
>>>
>>>> Thanks for sticking with this!
>>>
>>> Will these patches be landing in 5.11 or 5.12?
>>>
>>
>> I can't think of any reason not to have these in 5.11. We haven't
>> started staging things in the kselftest/kunit branch for 5.11 yet,
>> though.
>>
>> Patch 2 will probably need to be acked by Ted for ext4 first.
>>
>> Brendan, Shuah: can you make sure this doesn't get lost in patchwork?
> 
> Looks good to me. I would definitely like to pick this up. But yeah,
> in order to pick up 2/2 we will need an ack from either Ted or Iurii.
> 
> Ted seems to be busy right now, so I think I will just ask Shuah to go
> ahead and pick this patch up by itself and we or Ted can pick up patch
> 2/2 later.
> 
> Cheers
> 

I am seeing

ERROR: need consistent spacing around '*' (ctx:WxV)
#272: FILE: include/kunit/test.h:1786:
+		typeof((array)[0]) *__next = prev ? ((typeof(__next)) prev) + 1 : 
(array);	\
  		                   ^

Can you look into this and send v10?

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
