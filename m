Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B302C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 21:30:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6371C2078D
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 21:30:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="LzHyIxwx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6371C2078D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2D15988171;
	Wed, 19 Aug 2020 21:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pPYmkcLm0jdl; Wed, 19 Aug 2020 21:30:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 00C3687635;
	Wed, 19 Aug 2020 21:30:22 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E0A33C0889;
	Wed, 19 Aug 2020 21:30:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08768C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E51088621D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:30:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2tZJLofim8Y
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:30:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8E59986211
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 21:30:15 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y6so33549plt.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 14:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z4HmIdyoBmXa8bkZpNumWiq3Il4t2eScz31sD6PXX/8=;
 b=LzHyIxwxQomF+vwcfBJ/wkdpfAg5oSLCfChvQzGOt35G+kfh3rTm0ZnvD5izA0tBnl
 Jc26yTxW8LPFJSedWNocy9HsICLGj7EAfvUG5VtOwEoG7yeaN5PLuw2GLxAk4tlRRyVr
 iVVYvp0Q1xDUF3awSzz7/gX4VpseJgpZrKAJu8F78NoELp3Ax3CHspGAXBNh5VWamwce
 6KUltCZzJ8VISkoiKmk08zfssHJ+kjaClWuYS4z2HPYtlSQX1loZkZdT44tAUmNfZKTw
 mCCNbrtnJI2Lp+kNvoKYD7NUqn99mt6C/ajSFf/V4utAwhuHQDgYL49oakCD4AvW+F+j
 7hOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z4HmIdyoBmXa8bkZpNumWiq3Il4t2eScz31sD6PXX/8=;
 b=VGvWu2HYueMgrrX4+1NHmyKFjmMdGoBA2hsCX87MOFtPQWqB+VKFxQucfvgyLQlrN+
 H5LPrGN22VjmwhhEUMjNVdu6/ZDSnOEZ3Xw4VLJG1UWMd12+dODACaY1KKJ6g1djBba6
 r5H97osrw9Q5akPj1QtJE82H7KKv8m0acQjD/fTR9vNCtdAV9waXhhPX4je2XXVxDog7
 XD51f4qr7DV4Z+FlY7QJfKGcf/7BuQfSAiAcCA+zB/CHvMV95WveghKxXyvmgputahK1
 PfP7hjL2z5VTVc0yb9GnRzImzb4RVY8dZ6fLAjIdSsDg4kXEkkvIbsCTol8r38Th/K9v
 fIAA==
X-Gm-Message-State: AOAM532FRNzClNUlKY0w6WuiHEULp4VViPrpyJFe+RDDB4uJcMPNLM2h
 Rf7YtGlJus12WV5yp0hHXC6I6bXlRB0WfAV5BFXdEA==
X-Google-Smtp-Source: ABdhPJwKDzgJeqCba5RnsNXuHqPXbk2gkIIWoy+1Kv/N+HGJOGjTDlTIEKuxXw8RAASJaziJiQ8ofTFcWNHRyyTvwEo=
X-Received: by 2002:a17:902:c382:: with SMTP id g2mr51370plg.297.1597872614809; 
 Wed, 19 Aug 2020 14:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200819194634.68976-1-vitor@massaru.org>
In-Reply-To: <20200819194634.68976-1-vitor@massaru.org>
Date: Wed, 19 Aug 2020 14:30:03 -0700
Message-ID: <CAFd5g45AuxZYY_92rOXwtVjmbaGuts+DV6WpqhHNxWYNotxq+g@mail.gmail.com>
To: Vitor Massaru Iha <vitor@massaru.org>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH] kunit: fix:
 kunit_binary_assert_format() only prints signed int
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

On Wed, Aug 19, 2020 at 12:46 PM Vitor Massaru Iha <vitor@massaru.org> wrote:
>
> Some tests, such as overflow_kunit(), uses unsigned int,
> But kunit_binary_assert_format() only prints signed int,
> this commit also deals with the unsigned int print.
>
> Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> ---
>  lib/kunit/assert.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
>
> diff --git a/lib/kunit/assert.c b/lib/kunit/assert.c
> index 202f9fdeed0e..3ae90c09986a 100644
> --- a/lib/kunit/assert.c
> +++ b/lib/kunit/assert.c
> @@ -104,12 +104,23 @@ void kunit_binary_assert_format(const struct kunit_assert *assert,
>                                   binary_assert->left_text,
>                                   binary_assert->operation,
>                                   binary_assert->right_text);
> -               string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld\n",
> +
> +               if (binary_assert->left_value - 1 < 0) {
> +                       string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld\n",
> +                                 binary_assert->left_text,
> +                                 binary_assert->left_value);
> +                       string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld",
> +                                 binary_assert->right_text,
> +                                 binary_assert->right_value);
> +               }
> +               else {
> +                       string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %llu\n",
>                                   binary_assert->left_text,
>                                   binary_assert->left_value);
> -               string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld",
> +                       string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %llu",
>                                   binary_assert->right_text,
>                                   binary_assert->right_value);
> +               }

I agree that you found a bug here; however, I disagree that this is
the correct fix. Given that the value is stored as a long long; isn't
the value always stored as a signed value? So if the value overflows,
won't it still not pass the check you have here?

>         }
>         kunit_assert_print_msg(assert, stream);
>  }
>
> base-commit: d43c7fb05765152d4d4a39a8ef957c4ea14d8847
> prerequisite-patch-id: bf4b0962b0b955e4e45f5d25fece889562118158
> --
> 2.26.2
>
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
