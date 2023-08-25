Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9E3C3DA6F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 25 Aug 2023 15:26:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C9D9C417D7;
	Fri, 25 Aug 2023 15:26:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9D9C417D7
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=vvVTkRT+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sqidpUsiCF1M; Fri, 25 Aug 2023 15:26:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C89F4417B0;
	Fri, 25 Aug 2023 15:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C89F4417B0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A817AC0071;
	Fri, 25 Aug 2023 15:26:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E3DE9C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 15:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1ED583C1E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 15:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1ED583C1E
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20221208 header.b=vvVTkRT+
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kVDSGLFAh27f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 15:26:24 +0000 (UTC)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com
 [IPv6:2607:f8b0:4864:20::649])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF61783BEE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 15:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF61783BEE
Received: by mail-pl1-x649.google.com with SMTP id
 d9443c01a7336-1bf75ca4e4fso11531665ad.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 25 Aug 2023 08:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1692977184; x=1693581984;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=uT9B5IhwSieTS/lycgAO9B5cbkxabumJT7OeFCsXGMk=;
 b=vvVTkRT+VuK5043ahLb/u/zj4f8sB0vqgAunodyYuRhNLeufoefzhoe4WNJFWBlqnT
 fOjWSwwVNPHbk3edqUSOVA+XxAEjDCKjxs3HxwUIlookvW4KiCnYLFtt1qTalqSJOVGF
 sScsGhUtVxEoQK15lzMQlLomYBvjcE2Sz4k/e1Oy+HS/9hhEtZcDcaVdaQEeyjXxZh3R
 TzsVUTWd7XZcUj1STnMDvCZ5q8x5tT67ioP2DbuxoS8Xvt4bmsdKfkLeTHrNoo93HISk
 V1NYfBP6/ZvZCCCq3TieE6qyCIY3XWbSHhfJP0iP2R+QQbrK8/8rYTZUS4Q+EnvzC4ai
 inOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692977184; x=1693581984;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uT9B5IhwSieTS/lycgAO9B5cbkxabumJT7OeFCsXGMk=;
 b=WNDEIgWW+/vqyI/6KxouoIVVkGJ59rqZyDhh+qF2ALLEDkYkzl3nbKXh1gogSdqojK
 Q2s/ujKLi0dSWqVhIOS6YcwvsKOnbP3kj+zn8D/TiEmDVG5Wxlg7uZrGIKXF/SeMTo8z
 ImsdXcGCFreoJ2GjZGjijzMzK2Pd1I6ozW0Y5sbHvYIMtIMVB1aEQFSyDBV5BWICJXhE
 VoOCpkft9EQatmx6MfcA/Osbl51tHivx5JmDGlLNAitviGvK19T4VJvZ1/SGoFdlYEtv
 ljSb/6imcy1OtNYog+Qj/BT9V6TwF4lX8JWhZRqJzZ/BOJwqOUnCG7CURfmrHRiFjZn0
 8Qfw==
X-Gm-Message-State: AOJu0YxJ6dURz/1Gpip7b79C2voIFiLHeT6S0tKvX98W0WwC1OTRpcGC
 /2pbLNDxiP0EkYJ3TPgrFWQvRwl32+k=
X-Google-Smtp-Source: AGHT+IHBe26z5RAiUFUIi9mr/ywY4xvfcSUx9IiaElkVhEpKpN2zZSyFkiUVw2XIEkVi8AWhgt40SvUlcq8=
X-Received: from zagreus.c.googlers.com
 ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e801:b0:1bc:4452:59c4 with SMTP id
 u1-20020a170902e80100b001bc445259c4mr7073353plg.4.1692977184048; Fri, 25 Aug
 2023 08:26:24 -0700 (PDT)
Date: Fri, 25 Aug 2023 08:26:22 -0700
In-Reply-To: <20230824202415.131824-1-mahmoudmatook.mm@gmail.com>
Mime-Version: 1.0
References: <20230824202415.131824-1-mahmoudmatook.mm@gmail.com>
Message-ID: <ZOjIHo2A6HZ8K4Qp@google.com>
Subject: Re: [PATCH v2 1/2] selftests: Provide local define of min() and max()
To: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
Cc: willemdebruijn.kernel@gmail.com, wad@chromium.org, keescook@chromium.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, luto@amacapital.net,
 edumazet@google.com, David Laight <David.Laight@aculab.com>,
 linux-kselftest@vger.kernel.org, kuba@kernel.org, pabeni@redhat.com,
 shuah@kernel.org, davem@davemloft.net,
 linux-kernel-mentees@lists.linuxfoundation.org
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
From: Sean Christopherson via Linux-kernel-mentees
 <linux-kernel-mentees@lists.linuxfoundation.org>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Aug 25, 2023, Mahmoud Maatuq wrote:
> to avoid manual calculation of min and max values
> and fix coccinelle warnings such WARNING opportunity for min()/max()
> adding one common definition that could be used in multiple files
> under selftests.
> there are also some defines for min/max scattered locally inside sources
> under selftests.
> this also prepares for cleaning up those redundant defines and include
> kselftest.h instead.
> 
> Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
> Suggested-by: David Laight <David.Laight@aculab.com>
> ---
> changes in v2:
> redefine min/max in a more strict way to avoid 
> signedness mismatch and multiple evaluation.
> is_signed_type() moved from selftests/kselftest_harness.h 
> to selftests/kselftest.h.
> ---
>  tools/testing/selftests/kselftest.h         | 24 +++++++++++++++++++++

Heh, reminds me of https://xkcd.com/927.

All of these #defines are available in tools/include/linux/kernel.h, and it's
trivially easy for selftests to add all of tools/include to their include path.
I don't see any reason for the selftests framework to define yet another version,
just fix the individual tests.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
