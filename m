Return-Path: <SRS0=uYLy=EV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56085C55ABD
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 08:58:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE7762242E
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 08:58:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="wKSPTVfF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE7762242E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 932BA86D4E;
	Sun, 15 Nov 2020 08:58:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wuGXJk2mvGd5; Sun, 15 Nov 2020 08:58:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id D891D86D41;
	Sun, 15 Nov 2020 08:58:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C0ED6C0891;
	Sun, 15 Nov 2020 08:58:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FBC4C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 08:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 0C7CD20369
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 08:58:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exanIiP9Xkxx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 08:58:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by silver.osuosl.org (Postfix) with ESMTPS id 950BA2038D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 08:58:33 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id y22so12960110oti.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 00:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eOfon08D4Z8QqvBeUPGRpAKg2puT4+gjjSEjZd3iW9U=;
 b=wKSPTVfFPmI7y0+3EK74LC5ZHIYhP+UsyUVeT4mOjbN3rjOPwenhkD76d8kMEmEwTU
 fZ9IU5vPB0KFoFeB5wj8Kwb1ZgcDdj0IIMztyZkcDYdQJ6bGROofOV56xq3/Zf9U6kp9
 WFrdoQ05yQLtZcgF7N0+cn02+xpeEtjRitJCPap8GmhYRoJIJ/QBfIGxMQLpEMwsTu7e
 DGMUk1Qc1Q8WXsdtBli++0Z27BrxaduSAculqD4fx8QQRvN1Uw2zvzK6A/9qkiyMXRxo
 0axZhijITMHaydwtu9To8uf/nfQhFCmp/+DyEVZCkAGfC9xva7++5Z7zOY8NecyA+rxt
 M+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eOfon08D4Z8QqvBeUPGRpAKg2puT4+gjjSEjZd3iW9U=;
 b=EGaNCk8Y/j1w6xsKhks0DWDAnOlu/ad4sqMIsljB/1ySRVZVoQdb+1JwP9PlqldIF8
 e0lZgX3Ymke3nXk2MjGGA5lLWTc3iicv/dccqwyZAelF5QtI4IvLlsWE1XQderHyb33D
 cq2NvjuTk3D4etuVboTd4QswmvEFcf3xDzhphhKJW8ioIIBVHrQ6GFJ316Eu572vCFbu
 Ol83ocmH1yt0sg6SGkrXxXMJIVoNutv2e3Wv/Rgdf1P7s3Q5RHWq2+RFSrxpIU1uhnhx
 eENYvRSZq+BQN8K1xQ+TpvXfvORZpzixZ3yp9cyxLg1adDpX0TesP8+DocZPYTClLVl7
 azBA==
X-Gm-Message-State: AOAM533P4Dk3FYhl2vm5IA5ex0pxz1jPX0ea6rSLZpmJXiMoe5hBUvSX
 Wz6bMOx8RRzA35+eU2KmYMJMpqJc04jVZD+dxF+VVw==
X-Google-Smtp-Source: ABdhPJzeDiymHRksn52ZIlUX8jqRL3oxfopfmqdADwje3rGNKDhpfM9140ry6nmookbuB0Eot4/zWYcFlJqq0rK/ijs=
X-Received: by 2002:a9d:65d5:: with SMTP id z21mr6656603oth.251.1605430712516; 
 Sun, 15 Nov 2020 00:58:32 -0800 (PST)
MIME-Version: 1.0
References: <20201114123648.97857-1-98.arpi@gmail.com>
In-Reply-To: <20201114123648.97857-1-98.arpi@gmail.com>
Date: Sun, 15 Nov 2020 09:58:21 +0100
Message-ID: <CANpmjNNsVxGiGWeij-EsDUpc_fBBYg7iBynis1tQKwh8ks5jQw@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Tim Bird <Tim.Bird@sony.com>, Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 David Gow <davidgow@google.com>, Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v7 1/2] kunit: Support for
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
From: Marco Elver via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Marco Elver <elver@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Sat, 14 Nov 2020 at 13:38, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
> Implementation of support for parameterized testing in KUnit. This
> approach requires the creation of a test case using the
> KUNIT_CASE_PARAM() macro that accepts a generator function as input.
>
> This generator function should return the next parameter given the
> previous parameter in parameterized tests. It also provides a macro to
> generate common-case generators based on arrays. Generators may also
> optionally provide a human-readable description of parameters, which is
> displayed where available.
>
> Note, currently the result of each parameter run is displayed in
> diagnostic lines, and only the overall test case output summarizes
> TAP-compliant success or failure of all parameter runs. In future, when
> supported by kunit-tool, these can be turned into subsubtest outputs.
>
> Signed-off-by: Arpitha Raghunandan <98.arpi@gmail.com>
> Co-developed-by: Marco Elver <elver@google.com>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
> Changes v6->v7:
> - Clarify commit message.
> - Introduce ability to optionally generate descriptions for parameters;
>   if no description is provided, we'll still print 'param-N'.
> - Change diagnostic line format to:
>         # <test-case-name>: <ok|not ok> N - [<param description>]
>
> Changes v5->v6:
> - Fix alignment to maintain consistency
>
> Changes v4->v5:
> - Update kernel-doc comments.
> - Use const void* for generator return and prev value types.
> - Add kernel-doc comment for KUNIT_ARRAY_PARAM.
> - Rework parameterized test case execution strategy: each parameter is executed
>   as if it was its own test case, with its own test initialization and cleanup
>   (init and exit are called, etc.). However, we cannot add new test cases per TAP
>   protocol once we have already started execution. Instead, log the result of
>   each parameter run as a diagnostic comment.
>
> Changes v3->v4:
> - Rename kunit variables
> - Rename generator function helper macro
> - Add documentation for generator approach
> - Display test case name in case of failure along with param index
>
> Changes v2->v3:
> - Modifictaion of generator macro and method
>
> Changes v1->v2:
> - Use of a generator method to access test case parameters
> Changes v6->v7:
> - Clarify commit message.
> - Introduce ability to optionally generate descriptions for parameters;
>   if no description is provided, we'll still print 'param-N'.
> - Change diagnostic line format to:
>         # <test-case-name>: <ok|not ok> N - [<param description>]
> - Before execution of parameterized test case, count number of
>   parameters and display number of parameters. Currently also as a
>   diagnostic line, but this may be used in future to generate a subsubtest
>   plan. A requirement of this change is that generators must generate a
>   deterministic number of parameters.
>
> Changes v5->v6:
> - Fix alignment to maintain consistency
>
> Changes v4->v5:
> - Update kernel-doc comments.
> - Use const void* for generator return and prev value types.
> - Add kernel-doc comment for KUNIT_ARRAY_PARAM.
> - Rework parameterized test case execution strategy: each parameter is executed
>   as if it was its own test case, with its own test initialization and cleanup
>   (init and exit are called, etc.). However, we cannot add new test cases per TAP
>   protocol once we have already started execution. Instead, log the result of
>   each parameter run as a diagnostic comment.
>
> Changes v3->v4:
> - Rename kunit variables
> - Rename generator function helper macro
> - Add documentation for generator approach
> - Display test case name in case of failure along with param index
>
> Changes v2->v3:
> - Modifictaion of generator macro and method
>
> Changes v1->v2:
> - Use of a generator method to access test case parameters
>
>  include/kunit/test.h | 51 ++++++++++++++++++++++++++++++++++++++
>  lib/kunit/test.c     | 59 ++++++++++++++++++++++++++++++++++----------
>  2 files changed, 97 insertions(+), 13 deletions(-)
>
> diff --git a/include/kunit/test.h b/include/kunit/test.h
> index db1b0ae666c4..cf5f33b1c890 100644
> --- a/include/kunit/test.h
> +++ b/include/kunit/test.h
> @@ -94,6 +94,9 @@ struct kunit;
>  /* Size of log associated with test. */
>  #define KUNIT_LOG_SIZE 512
>
> +/* Maximum size of parameter description string. */
> +#define KUNIT_PARAM_DESC_SIZE 64

I think we need to make this larger, perhaps 128. I just noticed a few
of the inode-test strings are >64 chars (and it should probably also
use strncpy() to copy to description, which is my bad).

>  /*
>   * TAP specifies subtest stream indentation of 4 spaces, 8 spaces for a
>   * sub-subtest.  See the "Subtests" section in
> @@ -107,6 +110,7 @@ struct kunit;
[...]
> +/**
> + * KUNIT_ARRAY_PARAM() - Define test parameter generator from an array.
> + * @name:  prefix for the test parameter generator function.
> + * @array: array of test parameters.
> + * @get_desc: function to convert param to description; NULL to use default
> + *
> + * Define function @name_gen_params which uses @array to generate parameters.
> + */
> +#define KUNIT_ARRAY_PARAM(name, array, get_desc)                                               \
> +       static const void *name##_gen_params(const void *prev, char *desc)                      \
> +       {                                                                                       \
> +               typeof((array)[0]) * __next = prev ? ((typeof(__next)) prev) + 1 : (array);     \

Why did you reintroduce a space between * and __next? AFAIK, this
should follow the same style as the rest of the kernel, and it should
just be 'thetype *ptr'.

> +               if (__next - (array) < ARRAY_SIZE((array))) {                                   \
> +                       void (*__get_desc)(typeof(__next), char *) = get_desc;                  \
> +                       if (__get_desc)                                                         \
> +                               __get_desc(__next, desc);                                       \
> +                       return __next;                                                          \
> +               }                                                                               \
> +               return NULL;                                                                    \
> +       }
> +

Thanks,
-- Marco
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
