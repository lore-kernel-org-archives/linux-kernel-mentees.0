Return-Path: <SRS0=NLmV=EC=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A063C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 07:55:37 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA3C32224E
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 27 Oct 2020 07:55:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="p0ybGNuo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA3C32224E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=lists.linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A0AE987136;
	Tue, 27 Oct 2020 07:55:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tVgmV-w93aOV; Tue, 27 Oct 2020 07:55:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3EE8F870E1;
	Tue, 27 Oct 2020 07:55:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 28B3DC0859;
	Tue, 27 Oct 2020 07:55:36 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E60EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 07:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 8ADC020392
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 07:55:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cFpA9I5ks0cT
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 07:55:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 83C422014A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 07:55:34 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id y186so406975oia.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 27 Oct 2020 00:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DOZ/or+uXcofLUI05AASj9pqYEI1+H4nTxttRQeOH3w=;
 b=p0ybGNuotD2awoJRp4EIUps3i33wWnSBscgfxKE+PLT03BAAfghsklin5UQ1AI5LHb
 NKoqRRtTa/rJIBjm2EWYL+fKZ+pwXGCG9lFC5kLy0Hdm9u+zLFyksmaM+WRGUtZjYNoj
 c3ikMGBTs+zDygIBiywKzSXWg5zfr96Pqw/VHcrTy79z5wSofz4rPXO8K3QreT1V7ylJ
 uM14o74YCSexauZZ3iyZwyKFTdex1g9v2Uxpx9ISawxwvePFy+zZMHYdiDvPsHcAYaUx
 0iMz9wq8LP+Qv4HgF0HBr2ybRH2ImmsnCgs1B6Prd2o6mLH7LAvmdo4V8xgU5YDNOs28
 Oz5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DOZ/or+uXcofLUI05AASj9pqYEI1+H4nTxttRQeOH3w=;
 b=QT6xel93J1f0aeqL1dRUvTTW/CV6jqEgbV8oKyX1n99pudSO0+7+N+dX3cQxAvu/0r
 4Kz9hyUF0ZmEookfx1TfcUuVP5yuXbR5msWKHgQxHodBGo9DH854StaRqeT/KxcTfYrE
 w+z5BJX1P9FKDIFUKLyQG1ZCm5nmUNg2GzhfWi/cjF8Ad+gkzB7Iz6p4rdtcjUR7spuB
 HzzsQ0A5duleyGMDJ3ztSAo7wKOadsdFw7EH+/jmPG/n93Q1Kt2R0y5xz3/O3w+wUCgj
 zyiNE3oKQM4YmOBhmvt3Smi4uSrEJSuC809vPpuam9yFH8kJ5LuA3AAtYVWuVSWyNUyZ
 Yg0w==
X-Gm-Message-State: AOAM5336G8UgZEAThtYOojBBMVHscTmTPGmBSkfVVmZ9b/tneJLmAB3F
 n62bHjUaKmcBOJ68klWVcoQEpxeOGZxLkt7HyaDU+w==
X-Google-Smtp-Source: ABdhPJy9DnGoYipYvpataI7s7gEKop4LEknvR99sUFOYQrgxmqfLbYJYMFlpKS8G5wR7l7le8Ljz97l7WA1fdaM5ZvA=
X-Received: by 2002:a54:4812:: with SMTP id j18mr632555oij.70.1603785333575;
 Tue, 27 Oct 2020 00:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201026183523.82749-1-98.arpi@gmail.com>
In-Reply-To: <20201026183523.82749-1-98.arpi@gmail.com>
Date: Tue, 27 Oct 2020 08:55:22 +0100
Message-ID: <CANpmjNMNd2fMmqsmBMSTwD6Cp0OBORjTgDBiDOzXD1zVyELLnw@mail.gmail.com>
To: Arpitha Raghunandan <98.arpi@gmail.com>
Cc: linux-ext4@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 Brendan Higgins <brendanhiggins@google.com>,
 LKML <linux-kernel@vger.kernel.org>, Andreas Dilger <adilger.kernel@dilger.ca>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Iurii Zaikin <yzaikin@google.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v3 1/2] kunit: Support for
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

On Mon, 26 Oct 2020 at 19:36, Arpitha Raghunandan <98.arpi@gmail.com> wrote:
[...]
>          * success starts as true, and may only be set to false during a
>          * test case; thus, it is safe to update this across multiple
> @@ -1742,4 +1760,18 @@ do {                                                                            \
>                                                 fmt,                           \
>                                                 ##__VA_ARGS__)
>
> +/**
> + * KUNIT_PARAM_GENERATOR() - Helper method for test parameter generators
> + *                          required in parameterized tests.
> + * @name:  prefix of the name for the test parameter generator function.

This could mention that the generator function will be suffixed by
"_gen_params".

> + * @prev: a pointer to the previous test parameter, NULL for first parameter.
> + * @array: a user-supplied pointer to an array of test parameters.
> + */

I just noticed this: the interface of this macro does not include
"prev" (which is an argument of the generated function, but not
supplied to this macro; "prev" should hopefully be explained in the
other comment you're adding for the new struct field). So, the
kernel-doc comment here should only list the actual arguments of this
macro, which is only "name" and "array".

> +#define KUNIT_PARAM_GENERATOR(name, array)                                                     \
[...]

Thanks,
-- Marco
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
