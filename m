Return-Path: <SRS0=NLmV=EC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF5D4C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 17:42:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06C722054F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 17:42:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="rElie7nC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 06C722054F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 90911204E9;
	Tue, 27 Oct 2020 17:42:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ey99985vIWCZ; Tue, 27 Oct 2020 17:42:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5311020471;
	Tue, 27 Oct 2020 17:42:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33A8FC0859;
	Tue, 27 Oct 2020 17:42:37 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id ECE0CC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 17:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id D1D8020490
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 17:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g8Lq1FGhkKOf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 17:42:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 621FE20471
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 17:42:33 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id k9so1988374qki.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 10:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DJdrHkP5GhFWBxOBTxYJLlq85LF0Y8rsT83lHf4BoXA=;
 b=rElie7nCB2CSbeT6c/CaRa3JHjFQyZbh0vMF7smW6sS0e7lP2rguaapbfqKZlnXJMt
 H/al2Ps4yGge5TkCv7RwrkHawwOXy7AJkP6a/iHLDnTJvdGRLGrXBrr8QHt4+yioaM7L
 jm5b8mvRFwige6iwO7e8ADEX+VDoGG6tk9ObciKNvJ/nDOLSqFj9Bih4li5/oehtBTtQ
 HTj5kT4vsEwtH4CacmE/gNkfyvQUZep5AoMjgt2VbxMKwj/AeKBpLHynlUJJOdSdLoKM
 ZHyiJ1lH32gzTeEwyueSWFnkIQ8aVPKVnxVB0hEwI3ylp/eOUfkYi538tWiNR0Gj79Ui
 cp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DJdrHkP5GhFWBxOBTxYJLlq85LF0Y8rsT83lHf4BoXA=;
 b=gS7z7IG7u3vnPo17exi8WZINCqtJbDOqXq2XoTzwPir0j4dfaiLYQj0Qt+3n9TNp1T
 OSs7it82Htoswb4GM0IBah2FqYlEkOB88QWm5TjG8AD1TD02J1MfzWS86zusWoLPYA6m
 qAi0CE4sFu1fxfpEzlWxGNLEB16g6HGPlEvl1Fk8XRrjFindwKiJ9bUF4xuVL0tTfFba
 ve4/JCoEKuJWASmyqAqUdaWRpuAa8McRzOzlXa59lmVuOPqdecmvhRYJ2+FgquUBtXY0
 gIERpzquFXkffo9lyzOSYLheQVGMpNFqECcQqRZTdkg7BA+c/cxV8tWzwjqBTCWFi2QZ
 HEAA==
X-Gm-Message-State: AOAM530/LG1eqQ/rxztJAzYWmmt6Z8FX2Y9LNBD9LkSDJ0BpM+n+zVcz
 jMWobR7AqA3W2kWYv8keqQZw06/Ef91FSxP+apH0cvxDmAxj
X-Google-Smtp-Source: ABdhPJz/W/bHvKVWc1klsC77yaMfEuw1Y1K6JU//5irH2wtAr3GVuUgYh1g/Klv2dAUfqxNmvqxd3qxjKjau5y/TcQQ=
X-Received: by 2002:ac8:4e49:: with SMTP id e9mr3216124qtw.114.1603820051180; 
 Tue, 27 Oct 2020 10:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201026183523.82749-1-98.arpi@gmail.com>
 <20201026183639.82883-1-98.arpi@gmail.com>
In-Reply-To: <20201026183639.82883-1-98.arpi@gmail.com>
Date: Tue, 27 Oct 2020 10:33:34 -0700
Message-ID: <CAAXuY3o9Xe-atK0Mja6qXLncUhmmVf4pR7hsANsqaoUX71RXVg@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: Marco Elver <elver@google.com>, Theodore Ts'o <tytso@mit.edu>,
 Brendan Higgins <brendanhiggins@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3 2/2] fs: ext4: Modify
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
From: Iurii Zaikin via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Iurii Zaikin <yzaikin@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

>
> Modify fs/ext4/inode-test.c to use the parameterized testing
> feature of KUnit.
>
> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> ---
> Changes v2->v3:
> - Marked hardcoded test data const
> - Modification based on latest implementation of KUnit parameterized testing
> Changes v1->v2:
> - Modification based on latest implementation of KUnit parameterized testing
>
>  fs/ext4/inode-test.c | 314 ++++++++++++++++++++++---------------------
>  1 file changed, 158 insertions(+), 156 deletions(-)
>
> diff --git a/fs/ext4/inode-test.c b/fs/ext4/inode-test.c
> index d62d802c9c12..3a449623b775 100644
> --- a/fs/ext4/inode-test.c
> +++ b/fs/ext4/inode-test.c
> @@ -80,6 +80,139 @@ struct timestamp_expectation {
>         bool lower_bound;
>  };
>
> +static const struct timestamp_expectation test_data[] = {
> +       {
> +               .test_case_name = LOWER_BOUND_NEG_NO_EXTRA_BITS_CASE,
> +               .msb_set = true,
> +               .lower_bound = true,
> +               .extra_bits = 0,
> +               .expected = {.tv_sec = -0x80000000LL, .tv_nsec = 0L},
> +       },
> +
> +       {
> +               .test_case_name = UPPER_BOUND_NEG_NO_EXTRA_BITS_CASE,
> +               .msb_set = true,
> +               .lower_bound = false,
> +               .extra_bits = 0,
> +               .expected = {.tv_sec = -1LL, .tv_nsec = 0L},
> +       },
> +
> +       {
> +               .test_case_name = LOWER_BOUND_NONNEG_NO_EXTRA_BITS_CASE,
> +               .msb_set = false,
> +               .lower_bound = true,
> +               .extra_bits = 0,
> +               .expected = {0LL, 0L},
> +       },
> +
> +       {
> +               .test_case_name = UPPER_BOUND_NONNEG_NO_EXTRA_BITS_CASE,
> +               .msb_set = false,
> +               .lower_bound = false,
> +               .extra_bits = 0,
> +               .expected = {.tv_sec = 0x7fffffffLL, .tv_nsec = 0L},
> +       },
> +
> +       {
> +               .test_case_name = LOWER_BOUND_NEG_LO_1_CASE,
> +               .msb_set = true,
> +               .lower_bound = true,
> +               .extra_bits = 1,
> +               .expected = {.tv_sec = 0x80000000LL, .tv_nsec = 0L},
> +       },
> +
> +       {
> +               .test_case_name = UPPER_BOUND_NEG_LO_1_CASE,
> +               .msb_set = true,
> +               .lower_bound = false,
> +               .extra_bits = 1,
> +               .expected = {.tv_sec = 0xffffffffLL, .tv_nsec = 0L},
> +       },
> +
> +       {
> +               .test_case_name = LOWER_BOUND_NONNEG_LO_1_CASE,
> +               .msb_set = false,
> +               .lower_bound = true,
> +               .extra_bits = 1,
> +               .expected = {.tv_sec = 0x100000000LL, .tv_nsec = 0L},
> +       },
> +
> +       {
> +               .test_case_name = UPPER_BOUND_NONNEG_LO_1_CASE,
> +               .msb_set = false,
> +               .lower_bound = false,
> +               .extra_bits = 1,
> +               .expected = {.tv_sec = 0x17fffffffLL, .tv_nsec = 0L},
> +       },
> +
> +       {
> +               .test_case_name = LOWER_BOUND_NEG_HI_1_CASE,
> +               .msb_set = true,
> +               .lower_bound = true,
> +               .extra_bits =  2,
> +               .expected = {.tv_sec = 0x180000000LL, .tv_nsec = 0L},
> +       },
> +
> +       {
> +               .test_case_name = UPPER_BOUND_NEG_HI_1_CASE,
> +               .msb_set = true,
> +               .lower_bound = false,
> +               .extra_bits = 2,
> +               .expected = {.tv_sec = 0x1ffffffffLL, .tv_nsec = 0L},
> +       },
> +
> +       {
> +               .test_case_name = LOWER_BOUND_NONNEG_HI_1_CASE,
> +               .msb_set = false,
> +               .lower_bound = true,
> +               .extra_bits = 2,
> +               .expected = {.tv_sec = 0x200000000LL, .tv_nsec = 0L},
> +       },
> +
> +       {
> +               .test_case_name = UPPER_BOUND_NONNEG_HI_1_CASE,
> +               .msb_set = false,
> +               .lower_bound = false,
> +               .extra_bits = 2,
> +               .expected = {.tv_sec = 0x27fffffffLL, .tv_nsec = 0L},
> +       },
> +
> +       {
> +               .test_case_name = UPPER_BOUND_NONNEG_HI_1_NS_1_CASE,
> +               .msb_set = false,
> +               .lower_bound = false,
> +               .extra_bits = 6,
> +               .expected = {.tv_sec = 0x27fffffffLL, .tv_nsec = 1L},
> +       },
> +
> +       {
> +               .test_case_name = LOWER_BOUND_NONNEG_HI_1_NS_MAX_CASE,
> +               .msb_set = false,
> +               .lower_bound = true,
> +               .extra_bits = 0xFFFFFFFF,
> +               .expected = {.tv_sec = 0x300000000LL,
> +                            .tv_nsec = MAX_NANOSECONDS},
> +       },
> +
> +       {
> +               .test_case_name = LOWER_BOUND_NONNEG_EXTRA_BITS_1_CASE,
> +               .msb_set = false,
> +               .lower_bound = true,
> +               .extra_bits = 3,
> +               .expected = {.tv_sec = 0x300000000LL, .tv_nsec = 0L},
> +       },
> +
> +       {
> +               .test_case_name = UPPER_BOUND_NONNEG_EXTRA_BITS_1_CASE,
> +               .msb_set = false,
> +               .lower_bound = false,
> +               .extra_bits = 3,
> +               .expected = {.tv_sec = 0x37fffffffLL, .tv_nsec = 0L},
> +       }
> +};
> +
> +KUNIT_PARAM_GENERATOR(ext4_inode, test_data);
> +
>  static time64_t get_32bit_time(const struct timestamp_expectation * const test)
>  {
>         if (test->msb_set) {
> @@ -101,166 +234,35 @@ static time64_t get_32bit_time(const struct timestamp_expectation * const test)
>   */
>  static void inode_test_xtimestamp_decoding(struct kunit *test)
>  {
> -       const struct timestamp_expectation test_data[] = {
> -               {
> -                       .test_case_name = LOWER_BOUND_NEG_NO_EXTRA_BITS_CASE,
> -                       .msb_set = true,
> -                       .lower_bound = true,
> -                       .extra_bits = 0,
> -                       .expected = {.tv_sec = -0x80000000LL, .tv_nsec = 0L},
> -               },
> -
> -               {
> -                       .test_case_name = UPPER_BOUND_NEG_NO_EXTRA_BITS_CASE,
> -                       .msb_set = true,
> -                       .lower_bound = false,
> -                       .extra_bits = 0,
> -                       .expected = {.tv_sec = -1LL, .tv_nsec = 0L},
> -               },
> -
> -               {
> -                       .test_case_name = LOWER_BOUND_NONNEG_NO_EXTRA_BITS_CASE,
> -                       .msb_set = false,
> -                       .lower_bound = true,
> -                       .extra_bits = 0,
> -                       .expected = {0LL, 0L},
> -               },
> -
> -               {
> -                       .test_case_name = UPPER_BOUND_NONNEG_NO_EXTRA_BITS_CASE,
> -                       .msb_set = false,
> -                       .lower_bound = false,
> -                       .extra_bits = 0,
> -                       .expected = {.tv_sec = 0x7fffffffLL, .tv_nsec = 0L},
> -               },
> -
> -               {
> -                       .test_case_name = LOWER_BOUND_NEG_LO_1_CASE,
> -                       .msb_set = true,
> -                       .lower_bound = true,
> -                       .extra_bits = 1,
> -                       .expected = {.tv_sec = 0x80000000LL, .tv_nsec = 0L},
> -               },
> -
> -               {
> -                       .test_case_name = UPPER_BOUND_NEG_LO_1_CASE,
> -                       .msb_set = true,
> -                       .lower_bound = false,
> -                       .extra_bits = 1,
> -                       .expected = {.tv_sec = 0xffffffffLL, .tv_nsec = 0L},
> -               },
> -
> -               {
> -                       .test_case_name = LOWER_BOUND_NONNEG_LO_1_CASE,
> -                       .msb_set = false,
> -                       .lower_bound = true,
> -                       .extra_bits = 1,
> -                       .expected = {.tv_sec = 0x100000000LL, .tv_nsec = 0L},
> -               },
> -
> -               {
> -                       .test_case_name = UPPER_BOUND_NONNEG_LO_1_CASE,
> -                       .msb_set = false,
> -                       .lower_bound = false,
> -                       .extra_bits = 1,
> -                       .expected = {.tv_sec = 0x17fffffffLL, .tv_nsec = 0L},
> -               },
> -
> -               {
> -                       .test_case_name = LOWER_BOUND_NEG_HI_1_CASE,
> -                       .msb_set = true,
> -                       .lower_bound = true,
> -                       .extra_bits =  2,
> -                       .expected = {.tv_sec = 0x180000000LL, .tv_nsec = 0L},
> -               },
> -
> -               {
> -                       .test_case_name = UPPER_BOUND_NEG_HI_1_CASE,
> -                       .msb_set = true,
> -                       .lower_bound = false,
> -                       .extra_bits = 2,
> -                       .expected = {.tv_sec = 0x1ffffffffLL, .tv_nsec = 0L},
> -               },
> -
> -               {
> -                       .test_case_name = LOWER_BOUND_NONNEG_HI_1_CASE,
> -                       .msb_set = false,
> -                       .lower_bound = true,
> -                       .extra_bits = 2,
> -                       .expected = {.tv_sec = 0x200000000LL, .tv_nsec = 0L},
> -               },
> -
> -               {
> -                       .test_case_name = UPPER_BOUND_NONNEG_HI_1_CASE,
> -                       .msb_set = false,
> -                       .lower_bound = false,
> -                       .extra_bits = 2,
> -                       .expected = {.tv_sec = 0x27fffffffLL, .tv_nsec = 0L},
> -               },
> -
> -               {
> -                       .test_case_name = UPPER_BOUND_NONNEG_HI_1_NS_1_CASE,
> -                       .msb_set = false,
> -                       .lower_bound = false,
> -                       .extra_bits = 6,
> -                       .expected = {.tv_sec = 0x27fffffffLL, .tv_nsec = 1L},
> -               },
> -
> -               {
> -                       .test_case_name = LOWER_BOUND_NONNEG_HI_1_NS_MAX_CASE,
> -                       .msb_set = false,
> -                       .lower_bound = true,
> -                       .extra_bits = 0xFFFFFFFF,
> -                       .expected = {.tv_sec = 0x300000000LL,
> -                                    .tv_nsec = MAX_NANOSECONDS},
> -               },
> -
> -               {
> -                       .test_case_name = LOWER_BOUND_NONNEG_EXTRA_BITS_1_CASE,
> -                       .msb_set = false,
> -                       .lower_bound = true,
> -                       .extra_bits = 3,
> -                       .expected = {.tv_sec = 0x300000000LL, .tv_nsec = 0L},
> -               },
> -
> -               {
> -                       .test_case_name = UPPER_BOUND_NONNEG_EXTRA_BITS_1_CASE,
> -                       .msb_set = false,
> -                       .lower_bound = false,
> -                       .extra_bits = 3,
> -                       .expected = {.tv_sec = 0x37fffffffLL, .tv_nsec = 0L},
> -               }
> -       };
> -
>         struct timespec64 timestamp;
> -       int i;
> -
> -       for (i = 0; i < ARRAY_SIZE(test_data); ++i) {
> -               timestamp.tv_sec = get_32bit_time(&test_data[i]);
> -               ext4_decode_extra_time(&timestamp,
> -                                      cpu_to_le32(test_data[i].extra_bits));
> -
> -               KUNIT_EXPECT_EQ_MSG(test,
> -                                   test_data[i].expected.tv_sec,
> -                                   timestamp.tv_sec,
> -                                   CASE_NAME_FORMAT,
> -                                   test_data[i].test_case_name,
> -                                   test_data[i].msb_set,
> -                                   test_data[i].lower_bound,
> -                                   test_data[i].extra_bits);
> -               KUNIT_EXPECT_EQ_MSG(test,
> -                                   test_data[i].expected.tv_nsec,
> -                                   timestamp.tv_nsec,
> -                                   CASE_NAME_FORMAT,
> -                                   test_data[i].test_case_name,
> -                                   test_data[i].msb_set,
> -                                   test_data[i].lower_bound,
> -                                   test_data[i].extra_bits);
> -       }
> +
> +       struct timestamp_expectation *test_param =
> +                       (struct timestamp_expectation *)(test->param_values);
> +
> +       timestamp.tv_sec = get_32bit_time(test_param);
> +       ext4_decode_extra_time(&timestamp,
> +                              cpu_to_le32(test_param->extra_bits));
> +
> +       KUNIT_EXPECT_EQ_MSG(test,
> +                           test_param->expected.tv_sec,
> +                           timestamp.tv_sec,
> +                           CASE_NAME_FORMAT,
> +                           test_param->test_case_name,
> +                           test_param->msb_set,
> +                           test_param->lower_bound,
> +                           test_param->extra_bits);
> +       KUNIT_EXPECT_EQ_MSG(test,
> +                           test_param->expected.tv_nsec,
> +                           timestamp.tv_nsec,
> +                           CASE_NAME_FORMAT,
> +                           test_param->test_case_name,
> +                           test_param->msb_set,
> +                           test_param->lower_bound,
> +                           test_param->extra_bits);
>  }
>
>  static struct kunit_case ext4_inode_test_cases[] = {
> -       KUNIT_CASE(inode_test_xtimestamp_decoding),
> +       KUNIT_CASE_PARAM(inode_test_xtimestamp_decoding, ext4_inode_gen_params),
>         {}
>  };
>
> --
> 2.25.1
>

Reviewed-by: Iurii Zaikin <yzaikin@google.com>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
