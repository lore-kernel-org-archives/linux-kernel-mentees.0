Return-Path: <SRS0=yWZE=DQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCD3C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Oct 2020 19:00:02 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE4DD222BA
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Oct 2020 19:00:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAW5+ztm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE4DD222BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 4E9D32E2A0;
	Fri,  9 Oct 2020 19:00:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7jwfyVbQjGjS; Fri,  9 Oct 2020 18:59:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id A3F472E0F1;
	Fri,  9 Oct 2020 18:59:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 893CEC016F;
	Fri,  9 Oct 2020 18:59:59 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA46EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 18:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B1A64876F9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 18:59:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ShsZrtOuFnjz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 18:59:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 243DB87561
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 18:59:58 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id x13so5014156pfa.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 09 Oct 2020 11:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ta9udojfHoLCYeiIbNttTRKcgPwSUQzWydgoMRCHqq8=;
 b=PAW5+ztmgO9ZZMgJedOXP0w9JYmm/E/OaeGHoMHeKujvE1P3/f/1ktyvNtQr+UdZbF
 tf1HaMRYR1fiVTkrkR+3h0uc8cNNPSG/czyfp3s15DSnNSqKZ3ph0JGBEkPe13h4YVWi
 xQmOaOTQbPcrNkC6m5bA55jppeMRSQOiaeXyD0zRl8+0yUi2ru5D1YHp3eviiTpyT7ee
 0jMJtx6dZLcq193olkc9wMFufnokHiTRg7nfnJzGUrG9pfKo67wcchQMPBovUOciSlXa
 K+UcB11SqZtUA3T5ZsFszbbeDeFDSn2Zjz7ndXSRDKdFj8yvL+IUCHl0kdnZ7FWmZ4Bs
 c5sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ta9udojfHoLCYeiIbNttTRKcgPwSUQzWydgoMRCHqq8=;
 b=B0KJrcc+TDdS/7Q4OFiHl1eaBIq3VVwDK63Hfx4zEeP6YGhU1c/rzLc5Ng2YecVxzU
 oJjaOs7aiMWmIWVIf2cfd1iZPk2GVGzSOmaaLtwbcmJDhKtHoUNY/hrvaz5+Gs39E/ur
 cCPTUSvrdri3sTeG7lw27hMtVgmMBXuIq/stY2KvZK60axxrnZCaduknfsBovkjSRMNM
 TzQWXoww3rWytEXssLDFXDRoqWGCxWpX12uY7I6rKYybJXGuTmO/kyhShjUDqIW/xh32
 ofn7KOl43X5IrEM6H2jP6J0eh8g+kFSxDpcWtQVeJ6laB57PAzJLymmOZyDiRYvyVyW6
 ElzQ==
X-Gm-Message-State: AOAM531lN/f35ymy/mRK9kue7w8kNi3NcEDDSyCTymkFKKeDNwjSQxO3
 Rm8U8a3PFNh+OqV8+TBKZcE9vaC3SePwHWFH
X-Google-Smtp-Source: ABdhPJwy9Lv2OFJR2FR3Gqv+OtrisRk+mGd4SzxjOB8NCiAA/Au3DjNUGWGkzV6v7nivA0tFIScp7A==
X-Received: by 2002:a62:c1c5:0:b029:155:2a10:504f with SMTP id
 i188-20020a62c1c50000b02901552a10504fmr11743822pfg.13.1602269997451; 
 Fri, 09 Oct 2020 11:59:57 -0700 (PDT)
Received: from [192.168.86.81] ([106.51.240.187])
 by smtp.gmail.com with ESMTPSA id i126sm12156570pfc.48.2020.10.09.11.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 11:59:56 -0700 (PDT)
To: Brendan Higgins <brendanhiggins@google.com>,
 Marco Elver <elver@google.com>, Iurii Zaikin <yzaikin@google.com>
References: <20201003144807.13036-1-98.arpi@gmail.com>
 <20201003145115.13145-1-98.arpi@gmail.com>
 <CAFd5g46FTHwRJ6SCOexk+Mp8H+fPR42XND_WFHp02acXbwe0xQ@mail.gmail.com>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <1028a9d3-4be1-077b-b7dc-1818ba06c528@gmail.com>
Date: Sat, 10 Oct 2020 00:29:53 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAFd5g46FTHwRJ6SCOexk+Mp8H+fPR42XND_WFHp02acXbwe0xQ@mail.gmail.com>
Content-Language: en-US
Cc: Andreas Dilger <adilger.kernel@dilger.ca>,
 KUnit Development <kunit-dev@googlegroups.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [RFC v3 2/2] fs: ext4: Modify
 inode-test.c to use KUnit parameterized testing
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

On 09/10/20 11:50 pm, Brendan Higgins wrote:
> Arpitha, please add Iurii on future revisions. He authored this test.
> Okay!

> On Sat, Oct 3, 2020 at 7:51 AM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>>
>> Modifies fs/ext4/inode-test.c to use the parameterized testing
>> feature of KUnit.
>>
>> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
>> ---
>>  fs/ext4/inode-test.c | 69 +++++++++++++++++++++++++++-----------------
>>  1 file changed, 42 insertions(+), 27 deletions(-)
>>
>> diff --git a/fs/ext4/inode-test.c b/fs/ext4/inode-test.c
>> index d62d802c9c12..e262fef505b3 100644
>> --- a/fs/ext4/inode-test.c
>> +++ b/fs/ext4/inode-test.c
>> @@ -72,6 +72,8 @@
>>  #define UPPER_BOUND_NONNEG_EXTRA_BITS_1_CASE\
>>         "2446-05-10 Upper bound of 32bit >=0 timestamp. All extra sec bits on"
>>
>> +#define NUMBER_OF_TESTCASES 16
>> +
>>  struct timestamp_expectation {
>>         const char *test_case_name;
>>         struct timespec64 expected;
>> @@ -101,7 +103,39 @@ static time64_t get_32bit_time(const struct timestamp_expectation * const test)
>>   */
>>  static void inode_test_xtimestamp_decoding(struct kunit *test)
>>  {
>> -       const struct timestamp_expectation test_data[] = {
>> +       struct timespec64 timestamp;
>> +
>> +       struct timestamp_expectation *test_case =
> 
> I think test_data or test_parameters makes more sense.
> 
>> +               (struct timestamp_expectation *)get_test_case_parameters(test);
>> +
>> +       timestamp.tv_sec = get_32bit_time(test_case);
>> +       ext4_decode_extra_time(&timestamp,
>> +                              cpu_to_le32(test_case->extra_bits));
>> +
>> +       KUNIT_EXPECT_EQ_MSG(test,
>> +                           test_case->expected.tv_sec,
>> +                           timestamp.tv_sec,
>> +                           CASE_NAME_FORMAT,
>> +                           test_case->test_case_name,
>> +                           test_case->msb_set,
>> +                           test_case->lower_bound,
>> +                           test_case->extra_bits);
>> +       KUNIT_EXPECT_EQ_MSG(test,
>> +                           test_case->expected.tv_nsec,
>> +                           timestamp.tv_nsec,
>> +                           CASE_NAME_FORMAT,
>> +                           test_case->test_case_name,
>> +                           test_case->msb_set,
>> +                           test_case->lower_bound,
>> +                           test_case->extra_bits);
>> +}
>> +
>> +struct timestamp_expectation *get_test_parameters(void)
>> +{
>> +       struct timestamp_expectation *test_data = (struct timestamp_expectation *)
>> +               kmalloc(sizeof(struct timestamp_expectation) * NUMBER_OF_TESTCASES, GFP_KERNEL);
> 
> I don't see this get freed anywhere; you can get around it with
> kunit_kmalloc. However, I suspect you won't need this at all given my
> next comment...
> 
>> +
>> +       const struct timestamp_expectation test_data_init[] = {
> 
> Can't you just make the scope of this array global or static and then
> just return a pointer to an element in the array?
> 
Yes, this is better. I will make this change.

>>                 {
>>                         .test_case_name = LOWER_BOUND_NEG_NO_EXTRA_BITS_CASE,
>>                         .msb_set = true,
>> @@ -232,35 +266,16 @@ static void inode_test_xtimestamp_decoding(struct kunit *test)
>>                 }
>>         };
>>
>> -       struct timespec64 timestamp;
>> -       int i;
>> -
>> -       for (i = 0; i < ARRAY_SIZE(test_data); ++i) {
>> -               timestamp.tv_sec = get_32bit_time(&test_data[i]);
>> -               ext4_decode_extra_time(&timestamp,
>> -                                      cpu_to_le32(test_data[i].extra_bits));
>> -
>> -               KUNIT_EXPECT_EQ_MSG(test,
>> -                                   test_data[i].expected.tv_sec,
>> -                                   timestamp.tv_sec,
>> -                                   CASE_NAME_FORMAT,
>> -                                   test_data[i].test_case_name,
>> -                                   test_data[i].msb_set,
>> -                                   test_data[i].lower_bound,
>> -                                   test_data[i].extra_bits);
>> -               KUNIT_EXPECT_EQ_MSG(test,
>> -                                   test_data[i].expected.tv_nsec,
>> -                                   timestamp.tv_nsec,
>> -                                   CASE_NAME_FORMAT,
>> -                                   test_data[i].test_case_name,
>> -                                   test_data[i].msb_set,
>> -                                   test_data[i].lower_bound,
>> -                                   test_data[i].extra_bits);
>> -       }
>> +       memcpy(test_data, test_data_init,
>> +               sizeof(struct timestamp_expectation) * ARRAY_SIZE(test_data_init));
>> +
>> +       return test_data;
>>  }
>>
>>  static struct kunit_case ext4_inode_test_cases[] = {
>> -       KUNIT_CASE(inode_test_xtimestamp_decoding),
>> +       KUNIT_CASE_PARAM(inode_test_xtimestamp_decoding,
>> +                       get_test_parameters, NUMBER_OF_TESTCASES,
>> +                       sizeof(struct timestamp_expectation)),
>>         {}
>>  };
>>
>> --
>> 2.25.1
>>

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
