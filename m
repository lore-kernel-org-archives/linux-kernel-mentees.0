Return-Path: <SRS0=f0b9=DB=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD69C2D0A8
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 03:02:17 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7DB723119
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 24 Sep 2020 03:02:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="buUuNuwq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7DB723119
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DD9552DE24;
	Thu, 24 Sep 2020 03:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ls-kTmr1yPmW; Thu, 24 Sep 2020 03:02:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0036D274D1;
	Thu, 24 Sep 2020 03:02:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DB91FC0859;
	Thu, 24 Sep 2020 03:02:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 63668C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 03:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 486D82DD40
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 03:02:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G4-OkvvUkrNL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 03:01:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by silver.osuosl.org (Postfix) with ESMTPS id 5192A291FC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 24 Sep 2020 03:01:52 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d9so994327pfd.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 23 Sep 2020 20:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AMsbTpCmYT301jHmgdEfKb5ggb3Y3diq/FSJ0uToNmU=;
 b=buUuNuwqW3rmEBsIvrzfmyyZs1GMv/5hGEZUM0zGe0RdVr9hW4oGoIz3UC67aj+bwW
 SbuMX5+NGLks7BOjgvCoSG8iYnB541M8+ydiaj6bE82L7QXtuJR5da/DG187MZf4Ozgt
 at2hnuM3SLUaP04pAfrOvJMKiRaK/cH6cHafol0MtC4kngMcISupZ7xnNqF1Q0svRbA/
 SounnPAhBHdlcjk9RP2nmBrhtzHZrxFjRAR/UeI9vHoLNVnHV9wRGAu0A9f5MvB4j2we
 zO6jsedfHI6dL8/CudctgwltYuid0vWgxQ3rGRXU2i45JBJK5wGCFvYTMSLcg59Hu3mr
 JVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AMsbTpCmYT301jHmgdEfKb5ggb3Y3diq/FSJ0uToNmU=;
 b=DYhes6K0sfdZQIqbHgpZlTdrDCPMNF2yu2ObjMCSDJmhIrdIqou3iAPW3F3+ixsN+z
 k/B1UtdH6KQM+9aHI5fQrs4LQrbPCnCbG7Slt2/kTgcxKb3o/XvsvnjxqoM7ilOQpoNI
 DC8jqDVtRbg2wGMc6h7pZXafzm0U50rtbae0w6DwDbndREejvQZQNDQYUiSX4TSn38Ah
 tYgxIHm88rDpquO37XUXJc5JklmBimkDNDqN5phYHQIieG6AMJpKZ77ZrwPozKUNJb5C
 u8U7wLpcUnzzmIsXWPxKFL0212aLbrSumLbW5UsQEOMY8qL1NKmbZxe28SrpQweIyO/X
 umYg==
X-Gm-Message-State: AOAM531/I3YF5HbYc1Kuw95UC3kiOSbWZWwDJEc8V+H3Sc6nJWOL/tcU
 KKdYf9Qg4q3brVXEFH/zxtTnoPSSTo8FW1El2fRyrA==
X-Google-Smtp-Source: ABdhPJyYRLCzrtMVz9NBHETMQClctwCYtpj53onOOIqLTuY7+ObWE8sMQpW8LmCgRAUrg+NuCZSTxGjNB29/wfoMa54=
X-Received: by 2002:a05:6a00:22d4:b029:150:bd5d:ce11 with SMTP id
 f20-20020a056a0022d4b0290150bd5dce11mr2543042pfj.38.1600916511311; Wed, 23
 Sep 2020 20:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200920064001.83359-1-98.arpi@gmail.com>
In-Reply-To: <20200920064001.83359-1-98.arpi@gmail.com>
Date: Wed, 23 Sep 2020 20:01:39 -0700
Message-ID: <CAFd5g44Ba4aZaudgEO-0g5PBWm5_wz39f25qHrszqNVJTOxy6w@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [RFC] kunit: Support for Parameterized
	Testing
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

On Sat, Sep 19, 2020 at 11:40 PM Arpitha Raghunandan <98.arpi@gmail.com> wrote:
>
> This patch has a basic implementation for adding support for parameterized
> testing in KUnit. It is not complete. Currently there is only support
> for integer parameters for test cases. I will generalize this to support
> other data types as well. I have tested this by making some small changes
> to the ext4/inode-test.c test. The main logic of this test hasn't been
> changed. However, I have created an integer array of inputs. The test only
> shows that these values can be accessed through the kunit struct as shown
> by the dmesg output:
>
>     # inode_test_xtimestamp_decoding:
> Parameterized = 1
>     # inode_test_xtimestamp_decoding:
> a[0][0] = 1 and a[0][1] = 2 and a[1][0] = 3 and a[1][1] = 4
>
> While this does not affect the test, it shows that this initial approach
> for parameterized testing works.
> Please let me know any suggestions for this approach and how it can be improved.
>
> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>

All in all, looks like a good start, but I think we might need a
slightly more concrete example.

> ---
>  fs/ext4/inode-test.c   | 22 +++++++++++++++++++++-
>  include/kunit/test.h   | 11 ++++++++++-
>  lib/kunit/kunit-test.c |  4 ++--
>  lib/kunit/test.c       | 15 +++++++++++++--
>  4 files changed, 46 insertions(+), 6 deletions(-)
>
> diff --git a/fs/ext4/inode-test.c b/fs/ext4/inode-test.c

This is maintained by non-KUnit people; this should probably be in
another commit.

> index d62d802c9c12..5ef242f2fef3 100644
> --- a/fs/ext4/inode-test.c
> +++ b/fs/ext4/inode-test.c
> @@ -235,6 +235,11 @@ static void inode_test_xtimestamp_decoding(struct kunit *test)
>         struct timespec64 timestamp;
>         int i;
>
> +       kunit_info(test, "\nParameterized = %d\n", test->parameterized);
> +       kunit_info(test, "\na[0][0] = %d and a[0][1] = %d and a[1][0] = %d and a[1][1] = %d\n",
> +                                               test->param_values[0][0], test->param_values[0][1],
> +                                               test->param_values[1][0], test->param_values[1][1]);
> +

These look like debug statements. Did you forget to remove them?

>         for (i = 0; i < ARRAY_SIZE(test_data); ++i) {
>                 timestamp.tv_sec = get_32bit_time(&test_data[i]);
>                 ext4_decode_extra_time(&timestamp,
> @@ -259,8 +264,23 @@ static void inode_test_xtimestamp_decoding(struct kunit *test)
>         }
>  }
>
> +int **getParams(void)
> +{
> +       int *x = (int *)kmalloc(sizeof(int) * 2, GFP_KERNEL);
> +       int *y = (int *)kmalloc(sizeof(int) * 2, GFP_KERNEL);
> +       int **a = (int **)kmalloc(sizeof(x) * 2, GFP_KERNEL);
> +
> +       x[0] = 1;
> +       x[1] = 2;
> +       y[0] = 3;
> +       y[1] = 4;
> +       a[0] = x;
> +       a[1] = y;
> +       return a;
> +}
> +
>  static struct kunit_case ext4_inode_test_cases[] = {
> -       KUNIT_CASE(inode_test_xtimestamp_decoding),
> +       KUNIT_CASE_PARAM(inode_test_xtimestamp_decoding, getParams),
>         {}
>  };
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index 59f3144f009a..23e4ff68c4b5 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -140,6 +140,8 @@ struct kunit;
>  struct kunit_case {
>         void (*run_case)(struct kunit *test);
>         const char *name;
> +       bool parameterized;
> +       int** (*get_params)(void);
>
>         /* private: internal use only. */
>         bool success;
> @@ -162,6 +164,10 @@ static inline char *kunit_status_to_string(bool status)
>   */
>  #define KUNIT_CASE(test_name) { .run_case = test_name, .name = #test_name }
>
> +#define KUNIT_CASE_PARAM(test_name, getparams) { .run_case = test_name,                \
> +                                                               .name = #test_name, .parameterized = true,      \
> +                                                               .get_params = getparams }
> +
>  /**
>   * struct kunit_suite - describes a related collection of &struct kunit_case
>   *
> @@ -206,6 +212,8 @@ struct kunit {
>         /* private: internal use only. */
>         const char *name; /* Read only after initialization! */
>         char *log; /* Points at case log after initialization */
> +       bool parameterized;
> +       int **param_values;
>         struct kunit_try_catch try_catch;
>         /*
>          * success starts as true, and may only be set to false during a
> @@ -224,7 +232,8 @@ struct kunit {
>         struct list_head resources; /* Protected by lock. */
>  };
>
> -void kunit_init_test(struct kunit *test, const char *name, char *log);
> +void kunit_init_test(struct kunit *test, const char *name, char *log, bool parameterized);
> +void kunit_init_param_test(struct kunit *test, struct kunit_case *test_case);
>
>  int kunit_run_tests(struct kunit_suite *suite);
>
> diff --git a/lib/kunit/kunit-test.c b/lib/kunit/kunit-test.c
> index 69f902440a0e..b79e287ca19b 100644
> --- a/lib/kunit/kunit-test.c
> +++ b/lib/kunit/kunit-test.c
> @@ -134,7 +134,7 @@ static void kunit_resource_test_init_resources(struct kunit *test)
>  {
>         struct kunit_test_resource_context *ctx = test->priv;
>
> -       kunit_init_test(&ctx->test, "testing_test_init_test", NULL);
> +       kunit_init_test(&ctx->test, "testing_test_init_test", NULL, false);
>
>         KUNIT_EXPECT_TRUE(test, list_empty(&ctx->test.resources));
>  }
> @@ -370,7 +370,7 @@ static int kunit_resource_test_init(struct kunit *test)
>
>         test->priv = ctx;
>
> -       kunit_init_test(&ctx->test, "test_test_context", NULL);
> +       kunit_init_test(&ctx->test, "test_test_context", NULL, false);
>
>         return 0;
>  }
> diff --git a/lib/kunit/test.c b/lib/kunit/test.c
> index c36037200310..2e061bfe154d 100644
> --- a/lib/kunit/test.c
> +++ b/lib/kunit/test.c
> @@ -224,7 +224,7 @@ void kunit_do_assertion(struct kunit *test,
>  }
>  EXPORT_SYMBOL_GPL(kunit_do_assertion);
>
> -void kunit_init_test(struct kunit *test, const char *name, char *log)
> +void kunit_init_test(struct kunit *test, const char *name, char *log, bool parameterized)
>  {
>         spin_lock_init(&test->lock);
>         INIT_LIST_HEAD(&test->resources);
> @@ -232,10 +232,19 @@ void kunit_init_test(struct kunit *test, const char *name, char *log)
>         test->log = log;
>         if (test->log)
>                 test->log[0] = '\0';
> +       test->parameterized = parameterized;
>         test->success = true;
>  }
>  EXPORT_SYMBOL_GPL(kunit_init_test);
>
> +void kunit_init_param_test(struct kunit *test, struct kunit_case *test_case)
> +{
> +       spin_lock_init(&test->lock);
> +       INIT_LIST_HEAD(&test->resources);
> +       test->param_values = test_case->get_params();

I don't see where you are using this other than in those debug
statements; can we see something more concrete?

> +}
> +EXPORT_SYMBOL_GPL(kunit_init_param_test);
> +
>  /*
>   * Initializes and runs test case. Does not clean up or do post validations.
>   */
> @@ -342,7 +351,9 @@ static void kunit_run_case_catch_errors(struct kunit_suite *suite,
>         struct kunit_try_catch *try_catch;
>         struct kunit test;
>
> -       kunit_init_test(&test, test_case->name, test_case->log);
> +       kunit_init_test(&test, test_case->name, test_case->log, test_case->parameterized);
> +       if (test_case->parameterized)
> +               kunit_init_param_test(&test, test_case);
>         try_catch = &test.try_catch;
>
>         kunit_try_catch_init(try_catch,
> --
> 2.25.1
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
