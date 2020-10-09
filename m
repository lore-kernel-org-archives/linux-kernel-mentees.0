Return-Path: <SRS0=yWZE=DQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1803C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Oct 2020 18:20:25 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14D1B22284
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  9 Oct 2020 18:20:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="NByWorv7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14D1B22284
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 8673F203C9;
	Fri,  9 Oct 2020 18:20:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g8mAq7-LlBVP; Fri,  9 Oct 2020 18:20:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0010820364;
	Fri,  9 Oct 2020 18:20:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DBADEC016F;
	Fri,  9 Oct 2020 18:20:22 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5FCB7C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 18:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 50C3A8767D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 18:20:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mrFuPARbxuET
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 18:20:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 8557487660
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  9 Oct 2020 18:20:20 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id o25so7864852pgm.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 09 Oct 2020 11:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e87frDrF3Id8KcxWMJ3H2Un/B5oSMJa16kIjWrieUbY=;
 b=NByWorv7JFTx4CrjLCNBwcLsPfLZaLlfcN8oDrve4Xu0xGlAklaift2zljg5EA4pE5
 R4pufHv3joP6U6B01dnZJBYTctLaXhf0DZiPaZibqrKlko1iEXRKP6uP0i52cmT94Dx3
 4ak4ZcsFO3ixXXJagezmg0Mv1KW/1lNkxGpReyHRQmuZ8cOspPkGiLw/9QsRev4b/WYU
 RXYj5abr9XHEPq6iEt7MwPQGz4tgfW/VSL5IOLRtHtC1fufRrKyCYmkoEhKHFfJmrBs9
 QXulRcmq+Ecdy71+Gv7F6ofsPpdGlZKsAkth/fYLFB9VOiFLDyczxcanOmQEuSt+76cm
 oK5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e87frDrF3Id8KcxWMJ3H2Un/B5oSMJa16kIjWrieUbY=;
 b=pViAu5uzpEfxB/XFvPASR0Vj4eibunAi8ZA49DL342mH/ru7U5OmE3CwsAiSrxSV6W
 OMb0TCpH4SOwQBLpz10maCGHxVhXE8PuMQ7XkCnAIYDtXTB2/qjpTKxIYWTP80XmCC1i
 49a/8hmNUT5R/3xmgO6+WeiZ/07FOkKVmccWCK2HNevf432rWtrTdU4Z63gR2WBoJWae
 8zN8rxobEyupGzhIoz3jjtjauyC02VQe6UL1UHmBVEMMtffJbXRG+Pqfu+Hd2i76smCe
 55KSXUFWu4l+PxIlG22P9RaSFQf8G5epjufw46UdCglCxepdP3cFQT5e9JvhS2mOltYK
 wicA==
X-Gm-Message-State: AOAM531jT7u96TIZfd47tpAUwXUHB2EXP+aDwUGIqeuCQIGT7zK4/zSA
 NOpUjfBIq8y3QYnPC0zWYtCj4D9HeK49JfV4Ogi/vA==
X-Google-Smtp-Source: ABdhPJxZhOEZqHYamNpDErmkIRwsx/uRRzcmidXiwW4tQxAQm+RbCvaOdFHygNv4aGPGd0KEvEckPQ1kGlcb+yp/ccs=
X-Received: by 2002:a63:fd03:: with SMTP id d3mr4289195pgh.201.1602267619822; 
 Fri, 09 Oct 2020 11:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201003144807.13036-1-98.arpi@gmail.com>
 <20201003145115.13145-1-98.arpi@gmail.com>
In-Reply-To: <20201003145115.13145-1-98.arpi@gmail.com>
Date: Fri, 9 Oct 2020 11:20:09 -0700
Message-ID: <CAFd5g46FTHwRJ6SCOexk+Mp8H+fPR42XND_WFHp02acXbwe0xQ@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>, Marco Elver <elver@google.com>, 
 Iurii Zaikin <yzaikin@google.com>
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
From: Brendan Higgins via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Arpitha, please add Iurii on future revisions. He authored this test.

On Sat, Oct 3, 2020 at 7:51 AM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>
> Modifies fs/ext4/inode-test.c to use the parameterized testing
> feature of KUnit.
>
> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> ---
>  fs/ext4/inode-test.c | 69 +++++++++++++++++++++++++++-----------------
>  1 file changed, 42 insertions(+), 27 deletions(-)
>
> diff --git a/fs/ext4/inode-test.c b/fs/ext4/inode-test.c
> index d62d802c9c12..e262fef505b3 100644
> --- a/fs/ext4/inode-test.c
> +++ b/fs/ext4/inode-test.c
> @@ -72,6 +72,8 @@
>  #define UPPER_BOUND_NONNEG_EXTRA_BITS_1_CASE\
>         "2446-05-10 Upper bound of 32bit >=0 timestamp. All extra sec bits on"
>
> +#define NUMBER_OF_TESTCASES 16
> +
>  struct timestamp_expectation {
>         const char *test_case_name;
>         struct timespec64 expected;
> @@ -101,7 +103,39 @@ static time64_t get_32bit_time(const struct timestamp_expectation * const test)
>   */
>  static void inode_test_xtimestamp_decoding(struct kunit *test)
>  {
> -       const struct timestamp_expectation test_data[] = {
> +       struct timespec64 timestamp;
> +
> +       struct timestamp_expectation *test_case =

I think test_data or test_parameters makes more sense.

> +               (struct timestamp_expectation *)get_test_case_parameters(test);
> +
> +       timestamp.tv_sec = get_32bit_time(test_case);
> +       ext4_decode_extra_time(&timestamp,
> +                              cpu_to_le32(test_case->extra_bits));
> +
> +       KUNIT_EXPECT_EQ_MSG(test,
> +                           test_case->expected.tv_sec,
> +                           timestamp.tv_sec,
> +                           CASE_NAME_FORMAT,
> +                           test_case->test_case_name,
> +                           test_case->msb_set,
> +                           test_case->lower_bound,
> +                           test_case->extra_bits);
> +       KUNIT_EXPECT_EQ_MSG(test,
> +                           test_case->expected.tv_nsec,
> +                           timestamp.tv_nsec,
> +                           CASE_NAME_FORMAT,
> +                           test_case->test_case_name,
> +                           test_case->msb_set,
> +                           test_case->lower_bound,
> +                           test_case->extra_bits);
> +}
> +
> +struct timestamp_expectation *get_test_parameters(void)
> +{
> +       struct timestamp_expectation *test_data = (struct timestamp_expectation *)
> +               kmalloc(sizeof(struct timestamp_expectation) * NUMBER_OF_TESTCASES, GFP_KERNEL);

I don't see this get freed anywhere; you can get around it with
kunit_kmalloc. However, I suspect you won't need this at all given my
next comment...

> +
> +       const struct timestamp_expectation test_data_init[] = {

Can't you just make the scope of this array global or static and then
just return a pointer to an element in the array?

>                 {
>                         .test_case_name = LOWER_BOUND_NEG_NO_EXTRA_BITS_CASE,
>                         .msb_set = true,
> @@ -232,35 +266,16 @@ static void inode_test_xtimestamp_decoding(struct kunit *test)
>                 }
>         };
>
> -       struct timespec64 timestamp;
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
> +       memcpy(test_data, test_data_init,
> +               sizeof(struct timestamp_expectation) * ARRAY_SIZE(test_data_init));
> +
> +       return test_data;
>  }
>
>  static struct kunit_case ext4_inode_test_cases[] = {
> -       KUNIT_CASE(inode_test_xtimestamp_decoding),
> +       KUNIT_CASE_PARAM(inode_test_xtimestamp_decoding,
> +                       get_test_parameters, NUMBER_OF_TESTCASES,
> +                       sizeof(struct timestamp_expectation)),
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
