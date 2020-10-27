Return-Path: <SRS0=NLmV=EC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 379BFC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 07:51:25 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9185D20738
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 07:51:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AiaQ/wVH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9185D20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2575A86FD7;
	Tue, 27 Oct 2020 07:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id urroOV2nullQ; Tue, 27 Oct 2020 07:51:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 81EC086F8F;
	Tue, 27 Oct 2020 07:51:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6A9E7C0859;
	Tue, 27 Oct 2020 07:51:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 311ABC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 07:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1660C85754
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 07:51:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r_Yaa-tCr1es
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 07:51:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EF107851A4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 07:51:20 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id o129so442149pfb.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 00:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0TgzwCQyLcbxOPAv7GqkDMwH11sjIKMqSi7RJONsgD8=;
 b=AiaQ/wVH6ACHqWJT1/4uquhvfhTdENyXnafs/oAn7KULi7K0oAv3ZQ2QXInF0zmM28
 vRwRO2J4z0uy6Alr374aC0SDoMwgFMXIvrPumw7DgJD+/keLRSmGVyJMNOYd03x5eMfZ
 4NGTanVC19vTN60IMHmMJuc5kzPY16PhCyf4VRLbDk3XUKFQzlnFGR0jMfapRx1JSnjC
 e3+kSfVtElLYCHlQ1eV5yWbBfliGwU5t4+NoMZi+gZr0vTJNziz1mXt1/RLvsAk+KJgY
 EB5PCkJjh1pPZEyZh4KEXNjbQqqAAITkbmJ/Z3/Z1YS8v3LCVAI75TtAbSlxv2SU+O4N
 fn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0TgzwCQyLcbxOPAv7GqkDMwH11sjIKMqSi7RJONsgD8=;
 b=infiqxFZ9LJYAS2kZxEuCSiqAPxJX+ibrV2/s/4WjZdt8NvQslHZXD9azLjaVqqGSf
 tlyCdiD/yjyf+oS+/1UlcWpDh/q5bYANVUNbmiFRpOu8bf64svtuEu2luNKNFqEckKV5
 mOUOpsovI+CiRyXO7/W9g0S8I5zc0ebq/gbGiWF/dkq+FjA1ls+k8adInHCs0VP/QBl9
 tPK9ZsY1SspRl9WyWDL5hOCu2QnTPepHhQOO6TImsztyEfS8xw2oNyrnda6PB1MBb+p3
 jNqLmpj5eYBrt0AHJY9Uh7Ay/UuSv80+cQIb1yP2E3S8mK6vflI3j1se6DCCkROPlyJy
 VeUQ==
X-Gm-Message-State: AOAM531ncCy5ac0IiLAXoIq7jkCOkdblTfVfZCXmmh2HQFnTqJkegsZJ
 E6ZA45cvDJbUTz+8ffR7dXE=
X-Google-Smtp-Source: ABdhPJwOATGhQrAIb0ZD9AMPEVSauH8/Iu+IQhqT1GFwVV8ySesu17fZp1dwPFZ6hyo2fJXgpYqKwg==
X-Received: by 2002:a62:7cd4:0:b029:152:b3e8:c59f with SMTP id
 x203-20020a627cd40000b0290152b3e8c59fmr1071350pfc.2.1603785080468; 
 Tue, 27 Oct 2020 00:51:20 -0700 (PDT)
Received: from [192.168.86.81] ([106.51.240.100])
 by smtp.gmail.com with ESMTPSA id q24sm1354823pfn.72.2020.10.27.00.51.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 00:51:19 -0700 (PDT)
To: Marco Elver <elver@google.com>
References: <20201026183523.82749-1-98.arpi@gmail.com>
 <CANpmjNNQtGC_jDp8TSHRHOMXi7aTQgwjtUiCWE+YqBgq-G2z5Q@mail.gmail.com>
 <f25c881d-03f9-e246-d8d4-e985d9662d04@gmail.com>
 <CANpmjNMVjuNOh-P6dENhyk_+=AHqkZYugQ3KQS9T3qXTrUSXGA@mail.gmail.com>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <1c1e0924-40b6-17e1-11c3-081970484340@gmail.com>
Date: Tue, 27 Oct 2020 13:21:13 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANpmjNMVjuNOh-P6dENhyk_+=AHqkZYugQ3KQS9T3qXTrUSXGA@mail.gmail.com>
Content-Language: en-US
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3 1/2] kunit: Support for
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 27/10/20 1:14 pm, Marco Elver wrote:
> On Tue, 27 Oct 2020 at 06:14, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
> [...]
>>>> diff --git a/include/kunit/test.h b/include/kunit/test.h
>>>> index a423fffefea0..16bf9f334e2c 100644
>>>> --- a/include/kunit/test.h
>>>> +++ b/include/kunit/test.h
>>>> @@ -142,6 +142,12 @@ struct kunit_case {
>>>>         void (*run_case)(struct kunit *test);
>>>>         const char *name;
>>>>
>>>> +       /*
>>>> +        * Pointer to test parameter generator function.
>>>> +        * Used only for parameterized tests.
>>>
>>> What I meant was to give a description of the protocol, so that if
>>> somebody wanted, they could (without reading the implementation)
>>> implement their own custom generator without the helper macro.
>>>
>>> E.g. something like: "The generator function is used to lazily
>>> generate a series of arbitrarily typed values that fit into a void*.
>>> The argument @prev is the previously returned value, which should be
>>> used to derive the next value; @prev is set to NULL on the initial
>>> generator call. When no more values are available, the generator must
>>> return NULL."
>>>
>>
>> Oh okay. I am not sure if this is the best place to add documentation for this.
> 
> I think it doesn't hurt to add, but have a look at the comment above
> this struct, which is already a kernel-doc comment. It probably makes
> sense to move the comment there to describe the new variable.
>

Alright, I will move the comment there.
 
> Thanks,
> -- Marco
> 

Thanks.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
