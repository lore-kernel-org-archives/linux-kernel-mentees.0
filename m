Return-Path: <SRS0=dWhK=EW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2271DC55ABD
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 08:51:28 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AFA4206E0
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 08:51:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="JuvqGj0C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AFA4206E0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F397F8672F;
	Mon, 16 Nov 2020 08:51:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OewlwdvgoQcC; Mon, 16 Nov 2020 08:51:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 123578613C;
	Mon, 16 Nov 2020 08:51:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0702FC0800;
	Mon, 16 Nov 2020 08:51:26 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A0AEDC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 08:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 91E1D20428
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 08:51:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2vxtI9kyfDT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 08:51:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 1981A2041F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 08:51:23 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id 79so15228283otc.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 00:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zy986Vg7ccKVkvtXBhD6NQzZqFrJZe4eCvqprIanDG0=;
 b=JuvqGj0Cq1pYlbEVb8edLk08OVHo7+rEVlDBsptQd/hn5A8VD/z31ibnpUBhIXBNyL
 HNn5+9FdCObQmigZ8uLvav50NVbvNFRC9O19XcnaaQqx1+IsxlVooo0JWWdicnHqYRPd
 O60q+ykj3LZ1M/DUSjYmpfDTQr+ajOpoW9PNSgIeVpJv48KSMcsCiCzBVI9kawoz/XGV
 efmNAyL8UwvR80V6O7jmT5CSBeE1faIXkrdFvIzk/976avizYp9YzCKo2ZC8pZHhejST
 98BPsM/MmUhowaR9HpLQR3CnEiQsneuUs5uVHinz9LXv77QUPRbvQ8iXfL590xZxITDa
 QMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zy986Vg7ccKVkvtXBhD6NQzZqFrJZe4eCvqprIanDG0=;
 b=tJUZ/ENqKDCXdEIiWeYdnk2AZvS+hpBPD7lSdGVtuTWclX3wS6eboWl2sHjhdal9sH
 pZ7HlMPoHsTnA+X9hPzCSCQPRmkVGA8CP/8T7DsW7ommdMBA69ndDGVUXJmfG5kLr2e9
 mb9MWCZSNKC8BT5LbW1LfCtWCUrMaFxSPj1GpYQNrq80TUHdoOSduKE/Tcp9jVYQ4CDi
 s8/KisusoYrhs1xIAuUlO8YpmnausOm3BJU5aluwCtSWxo6BnI4sbPUJE7BIQZXh25QP
 8wndUOoH4LRyNYUN1Su96e1IZ3exQ32ZfVWmcfA2HxAhtKOjoG3JlVmsNy3VvqP6AZey
 RJOA==
X-Gm-Message-State: AOAM533URwUrqk0ZsUcEPMrznpyugB8OhrbQ5WVPsXtiDSADQDYf84Ok
 7k2ai7y68OGUtBGWzJhhKFWOLZYw2NPajX1M60f7zQ==
X-Google-Smtp-Source: ABdhPJxWqcHBPYeajFVaGU7tSqABIWYXYXCXbbVxcowZAb2uCyBxqne0TTXqMUeS+JM5WohSWNy5mOuTmBdCG4wf8os=
X-Received: by 2002:a9d:65d5:: with SMTP id z21mr9315212oth.251.1605516682127; 
 Mon, 16 Nov 2020 00:51:22 -0800 (PST)
MIME-Version: 1.0
References: <20201116054035.211498-1-98.arpi@gmail.com>
 <20201116054150.211562-1-98.arpi@gmail.com>
In-Reply-To: <20201116054150.211562-1-98.arpi@gmail.com>
Date: Mon, 16 Nov 2020 09:51:10 +0100
Message-ID: <CANpmjNP+4ckx+ZgkQkicA5GDDQ=NzSGiSj6_bv13g6biz-kDcQ@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Tim Bird <Tim.Bird@sony.com>, Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 David Gow <davidgow@google.com>, Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v9 2/2] fs: ext4: Modify
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
From: Marco Elver via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Marco Elver <elver@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Mon, 16 Nov 2020 at 06:42, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>
> Modify fs/ext4/inode-test.c to use the parameterized testing
> feature of KUnit.
>
> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> Signed-off-by: Marco Elver <elver@google.com>

Reviewed-by: Marco Elver <elver@google.com>

Thank you!

> ---
> Changes v8->v9:
> - Replace strncpy() with strscpy() in timestamp_expectation_to_desc()
> Changes v7->v8:
> - Replace strcpy() with strncpy() in timestamp_expectation_to_desc()
> Changes v6->v7:
> - Introduce timestamp_expectation_to_desc() to convert param to
>   description.
> Changes v5->v6:
> - No change to this patch of the patch series
> Changes v4->v5:
> - No change to this patch of the patch series
> Changes v3->v4:
> - Modification based on latest implementation of KUnit parameterized testing
> Changes v2->v3:
> - Marked hardcoded test data const
> - Modification based on latest implementation of KUnit parameterized testing
> Changes v1->v2:
> - Modification based on latest implementation of KUnit parameterized testing
>
>  fs/ext4/inode-test.c | 320 ++++++++++++++++++++++---------------------
>  1 file changed, 164 insertions(+), 156 deletions(-)
>
> diff --git a/fs/ext4/inode-test.c b/fs/ext4/inode-test.c
> index d62d802c9c12..7935ea6cf92c 100644
> --- a/fs/ext4/inode-test.c
> +++ b/fs/ext4/inode-test.c
> @@ -80,6 +80,145 @@ struct timestamp_expectation {
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
> +static void timestamp_expectation_to_desc(const struct timestamp_expectation *t,
> +                                         char *desc)
> +{
> +       strscpy(desc, t->test_case_name, KUNIT_PARAM_DESC_SIZE);
> +}
> +
> +KUNIT_ARRAY_PARAM(ext4_inode, test_data, timestamp_expectation_to_desc);
> +
>  static time64_t get_32bit_time(const struct timestamp_expectation * const test)
>  {
>         if (test->msb_set) {
> @@ -101,166 +240,35 @@ static time64_t get_32bit_time(const struct timestamp_expectation * const test)
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
> +                       (struct timestamp_expectation *)(test->param_value);
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
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
