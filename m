Return-Path: <SRS0=tqep=BJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C4A9C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 08:11:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 151512173E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 30 Jul 2020 08:11:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 151512173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E620D855EF;
	Thu, 30 Jul 2020 08:11:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jJvsIbxFMU-k; Thu, 30 Jul 2020 08:11:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EE0C1855CC;
	Thu, 30 Jul 2020 08:11:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D690CC0050;
	Thu, 30 Jul 2020 08:11:29 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27693C004D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 08:11:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 10A0087D46
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 08:11:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DK5ckXPBxtwI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 08:11:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A841387D0B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 08:11:27 +0000 (UTC)
Received: from mail-qt1-f182.google.com ([209.85.160.182]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N4i3d-1kjqwN3UQx-011juD for
 <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 30 Jul 2020 10:11:25
 +0200
Received: by mail-qt1-f182.google.com with SMTP id e5so5688463qth.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jul 2020 01:11:24 -0700 (PDT)
X-Gm-Message-State: AOAM533ifDDVbzDXQSnODiEikltmFzoTTNusluPa9KIYVj1ikYbpkwhH
 RSn5gaWtWTV9joBJm2k/hvqQKZAToAJXVErR0Rk=
X-Google-Smtp-Source: ABdhPJyi8EKI+AIaFPt4gm4DpxtwBsJeU20bhkDhmCW6PRTBeUF30Hz/fPEst/ZpzIRbEjFkzYHg8KIN+OaDxrvgq9w=
X-Received: by 2002:aed:2946:: with SMTP id s64mr1820401qtd.204.1596096683269; 
 Thu, 30 Jul 2020 01:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200728141946.426245-1-yepeilin.cs@gmail.com>
 <20200729115157.8519-1-yepeilin.cs@gmail.com> <20200729125820.GB1840@kadam>
 <f2cf6137-987a-ab41-d88a-6828d46c255f@linux.com>
In-Reply-To: <f2cf6137-987a-ab41-d88a-6828d46c255f@linux.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 30 Jul 2020 10:11:07 +0200
X-Gmail-Original-Message-ID: <CAK8P3a20SEoYCrp3jOK32oZc9OkiPv+1KTjNZ2GxLbHpY4WexQ@mail.gmail.com>
Message-ID: <CAK8P3a20SEoYCrp3jOK32oZc9OkiPv+1KTjNZ2GxLbHpY4WexQ@mail.gmail.com>
To: Denis Efremov <efremov@linux.com>
X-Provags-ID: V03:K1:m779y6h4Uwl/lg1iQkHoIusm4nR8d2X+AhyYYbfbRzxH7w3poDW
 LaR6mkF378UgkuNxZrHu+Mr7CE3CxpmetCy4I55AOq4vkDpwbd+g6ddyp1npVE+bAV2ruRB
 lmpsvixHIOwT6vDA75yeW7G+aof08RhH5Y+8G6tZlis6QsXAfviy5O+49MuK3CGkdUDU6bU
 jYCRcRrpXCI50ssRlX36Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:l0GH9x0kb6o=:h+AFDYppBGULdkTuHDXVYE
 5gqeaXIPGDhLaHr8lcajShfqYul8e8MF+3iNBIGnzOqpD0gAOPCBRxQgrNBJnVPS3gui1cVfX
 jS5jXQYHsXcZeRWUzdbDz7S/r9cZa1a7BZwrlY+TcKcD0LtSVpYy0A77P1xyt5TGn+ZYgDLpz
 nDalkbxBLKishJgvpP9SKUDm4mrEpxLKnmG3hBDqin20E9Q4dHjC3L3GooyCjXc9F8LwOlPlq
 6De98DR+4E1ghZbMumudi34pfb5KQrP7enqZBQpbb+Eraatyk9SaHkXpNhPqxT//rssvYrDzP
 RR6ri8zQP2plAPe+5yy+0O2r1TGW/C2mKRSA6g8wH7bgPcC4EWajDn8Q9yBce6JwQPxp7VvH8
 QbPRZ/ELZSekWTaXMFlUKt6etO0+6AglCv7k8yU6RexUJOz12so68l9whqJZO1rZ1LH0UzWmL
 9jYy6QGMz2G1NCILcon+g7uUM6SsKLsb0Gs5XKDt3O7MB5uvX08QxdiNdHzNVLl26CXphqrDP
 BUCEYmEE3QnECF1QoSqSJodiouFFxqQomY/ssOX3l50q576bUiGGK1qwJPGrsHfvcPXyMSPUx
 GP5GkIBK127ENfcyiq6YV67aXAN87n6Zdq+ydBT2munNtmDsgNQeir8wYWBV8XAeckcIUHXbh
 tzDQhMSdYLJwncDWzjYd/q5EdEC1lNJxzpLg52JH8J4sWaH5OmPUY43dAxruAbcEvjSjuWdBZ
 V63zxagvo+j0AyPUEWl2EdkkK5zaR4RyqXv84zg2flweXpSiinDWewxJSuzYWUapQx5OKWWH/
 AvVzsrcfxwgO1+KxbTFXfn3eh5YKqqets65gVOksV7JgEcf+dmeRJ6pmsqzaH1nZRQD31IYfy
 Pd5P2N1S5m6vf+zYGGHJiw0Yxx26fXNUVoIbMwuk100W1WMf/NHQwT+w8UG0nEr+NvxdzI2y6
 5STP7kZXpiFUlUIR+CBwmyIHWQK60ugZl+LMlZGeJ+gQx2L9K+rus
Cc: Jens Axboe <axboe@kernel.dk>, Kees Cook <keescook@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-block <linux-block@vger.kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Peilin Ye <yepeilin.cs@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH v2] block/floppy: Prevent
 kernel-infoleak in raw_cmd_copyout()
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

> On Wed, Jul 29, 2020 at 3:22 PM Denis Efremov <efremov@linux.com> wrote:

> And checked for leaks on x86_64 with the script test.sh
> $ cat test.sh
> #!/bin/bash
>
> for i in 4.8 5 6 7 8 9 10
> do
> ./run_container.sh gcc-$i $(pwd)/src $(pwd)/out bash -c 'gcc test.c; ./a.out'
> ./run_container.sh gcc-$i $(pwd)/src $(pwd)/out bash -c 'gcc -O2 test.c; ./a.out'
> ./run_container.sh gcc-$i $(pwd)/src $(pwd)/out bash -c 'gcc -O3 test.c; ./a.out'
> done
>
> No leaks reported. Is it really possible this this kind of init, i.e. cmd = *ptr?

The problem is that the behavior is dependent not just on the compiler
version but
also optimization flags, target architecture and specific structure
layouts. Most
of the time, both gcc and clang will initialize the whole structure
rather than just
the individual members, but you still can't be sure that this is true
for all configurations
that this code runs on, except by using CONFIG_GCC_PLUGIN_STRUCTLEAK.

Kees pointed me to the lib/test_stackinit.c file in the kernel in which he has
collected a number of combinations that are known to trigger the problem.

What I see there though are only cases of struct initializers like

  struct test_big_hole var = { .one = arg->one, .two=arg->two, .three
= arg->three, .four = arg->four };

but not the syntax used in the floppy driver:

   struct test_big_hole var = *arg;

or the a constructor like

  struct test_big_hole var;
  var = (struct test_big_hole){ .one = arg->one, .two=arg->two, .three
= arg->three, .four = arg->four };

Kees, do you know whether those two would behave differently?
Would it make sense to also check for those, or am I perhaps
misreading your code and it already gets checked?

      Arnd
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
