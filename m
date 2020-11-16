Return-Path: <SRS0=dWhK=EW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77913C4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 04:55:09 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D36D8222B9
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 04:55:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JgXdNauN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D36D8222B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 519A385C19;
	Mon, 16 Nov 2020 04:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iJUuxd6CBDoD; Mon, 16 Nov 2020 04:55:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6A8CE84AAD;
	Mon, 16 Nov 2020 04:55:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4276BC0891;
	Mon, 16 Nov 2020 04:55:07 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 219EDC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 04:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BA50987155
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 04:55:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uJ4FQuHX6wxv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 04:55:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8987187158
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 04:55:02 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 62so12132455pgg.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 20:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8y8EzNwAbA7Mk6zHCNBMz+8QqO4AkN7jfQ83GAtzKaw=;
 b=JgXdNauNUS4omz7BJcV5u4oNPci5St150RSWKlbzPC67rcAoTFCDpyCPfn969zHHKq
 br3c0R9j32AZyLzt/737eYU6x9YfHFlR4C/0Hf19aKKHDDJ4o1Uqvkv0+WiKWG4GYtvI
 MHmLQkUq7GCOCzzsnPFxph29nTB3vG4RMXlp5XTU+H5f/Zy9+f3h/qZQyCJOB76l8J3G
 4ZUDHNdIa+0Czki/65jxn1BxBuIDFLi9gEI8NqtPGc1hsAqlRp1k5b3ogLBKCcot2hM7
 aXLLEBeN0WGLYrz/+rgENN2HpWaJBb+Sfb7dj1ZbfSZmqk9TDSxGGQLRylMrtznOcRUk
 ckKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8y8EzNwAbA7Mk6zHCNBMz+8QqO4AkN7jfQ83GAtzKaw=;
 b=cum2ddwnOtSven8zr8lsFTv8ugZWV5FB3lv/aUF1VNq4cbTMnNx3Mj93g5s3+cL25q
 dFqKAwgHYeiuumxxjatx2aZedMdoEH26ID3dGCNUyXKWLPycJqZsS8GnRy//Sp/lmGuH
 qPKRIv0GUUja67jmEnQPAcBi59+ZY08acedOOds8H6xQr9pSQ2m+hSD590MtsbuSsBc+
 CRrIHtQpjUl/pOblaTN2zKIPzwDYCB0+2szfC0RJXoEfLobQGMC/jlGt0xvI7AmQmHN1
 qSnesQqvfkc0Flpg4E3wPsnMogs/l5cFqCUrYZPqLHvmtpm+YQIGYMbgEdvtk0OGIKMh
 gv3A==
X-Gm-Message-State: AOAM530uyjh3SMNnSnNQZ9OUKnOVlTaMEdR5nGCrleglq85Eo6ii4jYG
 7kBAYGzvORoBMWOE8VDb8VE=
X-Google-Smtp-Source: ABdhPJzm9+O7++vo06zq3bbBabM8q2zCStmcQUezajR8hzGM3/m3V9f5M5CiE9CGkndjZ3OhwgL7ww==
X-Received: by 2002:a05:6a00:80e:b029:196:1cad:b64 with SMTP id
 m14-20020a056a00080eb02901961cad0b64mr10545502pfk.5.1605502502059; 
 Sun, 15 Nov 2020 20:55:02 -0800 (PST)
Received: from [192.168.86.81] ([106.51.140.48])
 by smtp.gmail.com with ESMTPSA id x12sm15818385pjr.51.2020.11.15.20.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Nov 2020 20:55:01 -0800 (PST)
To: Marco Elver <elver@google.com>
References: <20201115185759.169279-1-98.arpi@gmail.com>
 <20201115185905.169349-1-98.arpi@gmail.com>
 <CANpmjNPKfPeiXUUPwz1aU6iKwOXpSZNV5ZJq22NkZZWEhE9r1w@mail.gmail.com>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <989852ba-2fb3-7570-ce79-a0db6cc7e99e@gmail.com>
Date: Mon, 16 Nov 2020 10:24:53 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANpmjNPKfPeiXUUPwz1aU6iKwOXpSZNV5ZJq22NkZZWEhE9r1w@mail.gmail.com>
Content-Language: en-US
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Tim Bird <Tim.Bird@sony.com>, Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 David Gow <davidgow@google.com>, Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v8 2/2] fs: ext4: Modify
 inode-test.c to use KUnit parameterized testing feature
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

On 16/11/20 1:14 am, Marco Elver wrote:
> On Sun, 15 Nov 2020 at 19:59, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>>
>> Modify fs/ext4/inode-test.c to use the parameterized testing
>> feature of KUnit.
>>
>> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
>> Signed-off-by: Marco Elver <elver@google.com>
>> ---
>> Changes v7->v8:
>> - Replace strcpy() with strncpy() in timestamp_expectation_to_desc()
>> Changes v6->v7:
>> - Introduce timestamp_expectation_to_desc() to convert param to
>>   description.
>> Changes v5->v6:
>> - No change to this patch of the patch series
>> Changes v4->v5:
>> - No change to this patch of the patch series
>> Changes v3->v4:
>> - Modification based on latest implementation of KUnit parameterized testing
>> Changes v2->v3:
>> - Marked hardcoded test data const
>> - Modification based on latest implementation of KUnit parameterized testing
>> Changes v1->v2:
>> - Modification based on latest implementation of KUnit parameterized testing
>>
>>  fs/ext4/inode-test.c | 323 ++++++++++++++++++++++---------------------
>>  1 file changed, 167 insertions(+), 156 deletions(-)
>>
>> diff --git a/fs/ext4/inode-test.c b/fs/ext4/inode-test.c
>> index d62d802c9c12..2c0c00c45c6b 100644
>> --- a/fs/ext4/inode-test.c
>> +++ b/fs/ext4/inode-test.c
>> @@ -80,6 +80,148 @@ struct timestamp_expectation {
>>         bool lower_bound;
>>  };
>>
>> +static const struct timestamp_expectation test_data[] = {
>> +       {
>> +               .test_case_name = LOWER_BOUND_NEG_NO_EXTRA_BITS_CASE,
>> +               .msb_set = true,
>> +               .lower_bound = true,
>> +               .extra_bits = 0,
>> +               .expected = {.tv_sec = -0x80000000LL, .tv_nsec = 0L},
>> +       },
>> +
>> +       {
>> +               .test_case_name = UPPER_BOUND_NEG_NO_EXTRA_BITS_CASE,
>> +               .msb_set = true,
>> +               .lower_bound = false,
>> +               .extra_bits = 0,
>> +               .expected = {.tv_sec = -1LL, .tv_nsec = 0L},
>> +       },
>> +
>> +       {
>> +               .test_case_name = LOWER_BOUND_NONNEG_NO_EXTRA_BITS_CASE,
>> +               .msb_set = false,
>> +               .lower_bound = true,
>> +               .extra_bits = 0,
>> +               .expected = {0LL, 0L},
>> +       },
>> +
>> +       {
>> +               .test_case_name = UPPER_BOUND_NONNEG_NO_EXTRA_BITS_CASE,
>> +               .msb_set = false,
>> +               .lower_bound = false,
>> +               .extra_bits = 0,
>> +               .expected = {.tv_sec = 0x7fffffffLL, .tv_nsec = 0L},
>> +       },
>> +
>> +       {
>> +               .test_case_name = LOWER_BOUND_NEG_LO_1_CASE,
>> +               .msb_set = true,
>> +               .lower_bound = true,
>> +               .extra_bits = 1,
>> +               .expected = {.tv_sec = 0x80000000LL, .tv_nsec = 0L},
>> +       },
>> +
>> +       {
>> +               .test_case_name = UPPER_BOUND_NEG_LO_1_CASE,
>> +               .msb_set = true,
>> +               .lower_bound = false,
>> +               .extra_bits = 1,
>> +               .expected = {.tv_sec = 0xffffffffLL, .tv_nsec = 0L},
>> +       },
>> +
>> +       {
>> +               .test_case_name = LOWER_BOUND_NONNEG_LO_1_CASE,
>> +               .msb_set = false,
>> +               .lower_bound = true,
>> +               .extra_bits = 1,
>> +               .expected = {.tv_sec = 0x100000000LL, .tv_nsec = 0L},
>> +       },
>> +
>> +       {
>> +               .test_case_name = UPPER_BOUND_NONNEG_LO_1_CASE,
>> +               .msb_set = false,
>> +               .lower_bound = false,
>> +               .extra_bits = 1,
>> +               .expected = {.tv_sec = 0x17fffffffLL, .tv_nsec = 0L},
>> +       },
>> +
>> +       {
>> +               .test_case_name = LOWER_BOUND_NEG_HI_1_CASE,
>> +               .msb_set = true,
>> +               .lower_bound = true,
>> +               .extra_bits =  2,
>> +               .expected = {.tv_sec = 0x180000000LL, .tv_nsec = 0L},
>> +       },
>> +
>> +       {
>> +               .test_case_name = UPPER_BOUND_NEG_HI_1_CASE,
>> +               .msb_set = true,
>> +               .lower_bound = false,
>> +               .extra_bits = 2,
>> +               .expected = {.tv_sec = 0x1ffffffffLL, .tv_nsec = 0L},
>> +       },
>> +
>> +       {
>> +               .test_case_name = LOWER_BOUND_NONNEG_HI_1_CASE,
>> +               .msb_set = false,
>> +               .lower_bound = true,
>> +               .extra_bits = 2,
>> +               .expected = {.tv_sec = 0x200000000LL, .tv_nsec = 0L},
>> +       },
>> +
>> +       {
>> +               .test_case_name = UPPER_BOUND_NONNEG_HI_1_CASE,
>> +               .msb_set = false,
>> +               .lower_bound = false,
>> +               .extra_bits = 2,
>> +               .expected = {.tv_sec = 0x27fffffffLL, .tv_nsec = 0L},
>> +       },
>> +
>> +       {
>> +               .test_case_name = UPPER_BOUND_NONNEG_HI_1_NS_1_CASE,
>> +               .msb_set = false,
>> +               .lower_bound = false,
>> +               .extra_bits = 6,
>> +               .expected = {.tv_sec = 0x27fffffffLL, .tv_nsec = 1L},
>> +       },
>> +
>> +       {
>> +               .test_case_name = LOWER_BOUND_NONNEG_HI_1_NS_MAX_CASE,
>> +               .msb_set = false,
>> +               .lower_bound = true,
>> +               .extra_bits = 0xFFFFFFFF,
>> +               .expected = {.tv_sec = 0x300000000LL,
>> +                            .tv_nsec = MAX_NANOSECONDS},
>> +       },
>> +
>> +       {
>> +               .test_case_name = LOWER_BOUND_NONNEG_EXTRA_BITS_1_CASE,
>> +               .msb_set = false,
>> +               .lower_bound = true,
>> +               .extra_bits = 3,
>> +               .expected = {.tv_sec = 0x300000000LL, .tv_nsec = 0L},
>> +       },
>> +
>> +       {
>> +               .test_case_name = UPPER_BOUND_NONNEG_EXTRA_BITS_1_CASE,
>> +               .msb_set = false,
>> +               .lower_bound = false,
>> +               .extra_bits = 3,
>> +               .expected = {.tv_sec = 0x37fffffffLL, .tv_nsec = 0L},
>> +       }
>> +};
>> +
>> +static void timestamp_expectation_to_desc(const struct timestamp_expectation *t,
>> +                                         char *desc)
>> +{
>> +       int desc_length = strlen(t->test_case_name);
>> +
>> +       strncpy(desc, t->test_case_name, desc_length);
>> +       desc[desc_length] = '\0';
>> +}
> 
> This unfortunately won't prevent out-of-bounds accesses if the
> description is longer than KUNIT_PARAM_DESC_SIZE.
> 
> With strncpy() we want to avoid copying more bytes than the
> destination buffer can hold. This can be done by simply a
> strncpy(desc, t->test_case_name, KUNIT_PARAM_DESC_SIZE). But,
> strncpy() is unsafe in certain cases, too, so the kernel introduced
> strscpy() -- see the note about strncpy() in
> Documentation/process/deprecated.rst. Also have a look at the
> documentation about str{n,l,s}cpy() in lib/string.c.
> 
> So, finally, what we want here is just 1 line:
> 
>     strscpy(desc, t->test_case_name, KUNIT_PARAM_DESC_SIZE);
> 

Okay, I'll look this up and make this change for v9.

> Patch 1/2 looks fine though, so hopefully v9 will be final. :-)
> 
> Thanks,
> -- Marco
> 

Thanks!

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
