Return-Path: <SRS0=GHoo=EM=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315ECC388F2
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 19:00:48 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81D8D20882
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  6 Nov 2020 19:00:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iI/eDGrT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81D8D20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E42EF2E0E9;
	Fri,  6 Nov 2020 19:00:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vb2ke0l+5v1e; Fri,  6 Nov 2020 19:00:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5B5B72044E;
	Fri,  6 Nov 2020 19:00:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31B08C0893;
	Fri,  6 Nov 2020 19:00:46 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07E64C0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 19:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E177886C99
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 19:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tWAs0b48Skk6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 19:00:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 2018D86C7B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  6 Nov 2020 19:00:44 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id b12so1083474plr.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 06 Nov 2020 11:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=osiQ0zXJkLm7Z32q6Iqh9lbvOM7+fovpv2pnsk5vfMg=;
 b=iI/eDGrT2XC8TgtHtAWlztgLJgDeKb76vx0VWayTT1g5AKYGr5uxuDJBa1tJWfA4mv
 aHSrAhLV6tIBhAytZkdVsrUL1Gru7aRdqyfmekLNoeK6Jb3Cyv+dB/VG7Q6IJXOHxbxl
 pyF7BkhN0H56eIAS7kb1cpPqV1HMP3C56JwgQlAWcV07VmibKhy5oVbGxREILfjYmTcb
 ZlQoWHEo8SA/PytiL9A/w2n1VQMXsBig8akLIKmg/Y2Ni47aPbdImuXl0EOW9cVDxI4e
 hNeiCOzeWexSut7IGLESbAJwXBXCFTkJQLyP3Jnj0gypfe04AaNS7u+eLHahdyn11s4w
 3G+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=osiQ0zXJkLm7Z32q6Iqh9lbvOM7+fovpv2pnsk5vfMg=;
 b=gA5A138YCManxIM5E8FZKhTMN7WoRD0W5JDXlnlhj0yONWNZi9MGNhVy83V4TyNXaR
 slAeNnrXl4ixq05pUfr6NABvcbo93Uf0Tj4awlQvZgoWapyENuuTDfZomHJR2xItvAT/
 MnWFqygx4Ka+3r7xtNCkvSdspKNKSmCU3+xO0M/emlRrVx/Wrcp1XICa1CQp+L7P6aJd
 ruKIkRDvs0s/ueFzZ33Djc7IQ3SInZi6vi42iIQnkgwRJLNHpnSB0DEmIcnTRdvUH0iA
 U+s7w8IX/HpGQZhMX5SWmYpM8tn8uP7H6Fm+FUdtOWWd6jzAX9LtcZge3zICfUH+uG1u
 AXjA==
X-Gm-Message-State: AOAM533RFYZYbZWK9FEW5g6ulZEyK/1913LN/UXG5+tMRWQaOjrTEh01
 VonNCHyLn/+xWIIE6paEq14=
X-Google-Smtp-Source: ABdhPJyiD52Js51zG00CmqL8dXXB0Am4So47ChyOtV6k9BS5eO9IoJr2nkMeqF7Mr79LSZDeprq9ag==
X-Received: by 2002:a17:902:ed0d:b029:d6:ebe0:7cc2 with SMTP id
 b13-20020a170902ed0db02900d6ebe07cc2mr2936997pld.53.1604689243708; 
 Fri, 06 Nov 2020 11:00:43 -0800 (PST)
Received: from [192.168.86.81] ([106.51.243.217])
 by smtp.gmail.com with ESMTPSA id 30sm2648759pgl.45.2020.11.06.11.00.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Nov 2020 11:00:43 -0800 (PST)
To: Marco Elver <elver@google.com>
References: <20201106182657.30492-1-98.arpi@gmail.com>
 <CANpmjNPsACW1mZmkWiCSeXfvAGaxAS5sHtYMu0-DfE7ec2pFMA@mail.gmail.com>
From: Arpitha Raghunandan <98.arpi@gmail.com>
Message-ID: <11549107-7247-03a7-2469-f5aa793a0d19@gmail.com>
Date: Sat, 7 Nov 2020 00:30:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANpmjNPsACW1mZmkWiCSeXfvAGaxAS5sHtYMu0-DfE7ec2pFMA@mail.gmail.com>
Content-Language: en-US
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v5 1/2] kunit: Support for
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

On 07/11/20 12:15 am, Marco Elver wrote:
> On Fri, 6 Nov 2020 at 19:28, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>>
>> Implementation of support for parameterized testing in KUnit.
>> This approach requires the creation of a test case using the
>> KUNIT_CASE_PARAM macro that accepts a generator function as input.
>> This generator function should return the next parameter given the
>> previous parameter in parameterized tests. It also provides
>> a macro to generate common-case generators.
>>
>> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
>> Co-developed-by: Marco Elver <elver@google.com>
>> Signed-off-by: Marco Elver <elver@google.com>
> [...]
>> -       kunit_suite_for_each_test_case(suite, test_case)
>> -               kunit_run_case_catch_errors(suite, test_case);
>> +       kunit_suite_for_each_test_case(suite, test_case) {
>> +               struct kunit test = { .param_value = NULL, .param_index = 0 };
>> +               bool test_success = true;
>> +
>> +               if (test_case->generate_params)
>> +                       test.param_value = test_case->generate_params(NULL);
>> +
>> +               do {
>> +                       kunit_run_case_catch_errors(suite, test_case, &test);
>> +                       test_success &= test_case->success;
>> +
>> +                       if (test_case->generate_params) {
>> +                               kunit_log(KERN_INFO, &test,
>> +                                       KUNIT_SUBTEST_INDENT
>> +                                       "# %s: param-%d %s",
>> +                                       test_case->name, test.param_index,
>> +                                       kunit_status_to_string(test.success));
> 
> Sorry, I still found something. The patch I sent had this aligned with
> the '(', whereas when I apply this patch it no longer is aligned. Why?
> 
> I see the rest of the file also aligns arguments with opening '(', so
> I think your change is inconsistent.
> 

Ah those lines had spaces instead of tab and I think I messed up the alignment
fixing that. I will send another version fixing this.
Thanks!

> Thanks,
> -- Marco
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
