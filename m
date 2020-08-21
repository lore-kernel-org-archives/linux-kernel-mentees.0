Return-Path: <SRS0=fjKG=B7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C4FC433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 09:48:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ABBE20732
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 21 Aug 2020 09:48:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="osVGyMuE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ABBE20732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 740A485773;
	Fri, 21 Aug 2020 09:48:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwJwl74sMY9z; Fri, 21 Aug 2020 09:48:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 08EFB85010;
	Fri, 21 Aug 2020 09:48:28 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0492BC0889;
	Fri, 21 Aug 2020 09:48:28 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9E75EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 09:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6BE44203B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 09:48:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AHZl-hBaHYxL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 09:48:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by silver.osuosl.org (Postfix) with ESMTPS id A7F52203AE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 09:48:25 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id y6so636646plk.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 21 Aug 2020 02:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=n0gxWhKy8HZT9XqQrHP7qU76kr+KPT1ex9umU9pXHWE=;
 b=osVGyMuEzo2+GKkTLQba7FeGgYH958kaGau2qYDDBI/XvHwKz+hfv3Kb9gLOEYFuQ9
 Oy5LbYuAwZPVMpeTVtFsG1gIANz5vXPHJApamEGGDFIRhYz+x3bw8yyETS6pccCUtREM
 p0evb7r3GCK2wbmUo3N1e5b4w0v5ZETiUq64KFOdIHutXsMheDKwQxwxKvhnatFuc5Zk
 vLMmt0oKZU6E5DfJVNTLAU49zdiYnvpSpXFhwXVvVpscce9JiSUpXv/yLaoNkcV8CK/I
 9sJO0srddWK35YRu6gC4W2ZZ+7xwnqR6H/xon3v6ix37Ckm6PHwki17PZ9PUfrC3iGgS
 bJsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=n0gxWhKy8HZT9XqQrHP7qU76kr+KPT1ex9umU9pXHWE=;
 b=cR8rIO8yq5AmxloS4lHSovcb2iesvaeRpmDSNBPni2Gz7Mn2V9EFrH87l7AVE4wr55
 9cF0Ne5oRvC/3HL1IqewIS7Ttkpbo6JDMes+Ih3IccmbJIcKtodk2mq6oXyKeU/xBnjX
 iCrf0q61sCp8Ek7YPOl3ffJ7wX+oOcCHhLrRlu724vGs56nG9TbSHG9RBMljKWNgoakI
 5PaN9fM3j4ErxkoRfSzmtiRdatph2etzkRM+rPE4wI2yPLawI4CzUNHTCM9Hx7VkoyUR
 VbaOJOZ8uKuzLZ/mwm/1K6AM/giR1V8/Awj7s1PyqLWkW7VepT7HNjEH8u74cv3eQcng
 WQNw==
X-Gm-Message-State: AOAM533ws4zhZa4iqZ3fW334yFuCvXoXBAKIA3EOIf3WbrgM3XPG1JmG
 c/nTMxpSZSvg8qOQV0G/ng==
X-Google-Smtp-Source: ABdhPJzPxMw/GkVtaa/3YcwQtpvwf805RqnVAiPPLRe6mxdBj+kjewtcCTKhpqRRxLQIzXrDRdfaQw==
X-Received: by 2002:a17:90a:17a7:: with SMTP id
 q36mr1856454pja.61.1598003305256; 
 Fri, 21 Aug 2020 02:48:25 -0700 (PDT)
Received: from PWN ([2600:3c01::f03c:91ff:fe6e:64cd])
 by smtp.gmail.com with ESMTPSA id u29sm1993493pfl.180.2020.08.21.02.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 02:48:24 -0700 (PDT)
Date: Fri, 21 Aug 2020 05:48:13 -0400
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <20200821094813.GB480216@PWN>
References: <20200810050532.640075-1-yepeilin.cs@gmail.com>
 <774bcf2d-c8eb-086a-3569-c7e530d8a63d@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <774bcf2d-c8eb-086a-3569-c7e530d8a63d@xs4all.nl>
Cc: syzkaller-bugs@googlegroups.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [PATCH] v4l2-tpg: Fix
 global-out-of-bounds read in precalculate_color()
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

Hi Mr. Verkuil,

On Wed, Aug 19, 2020 at 04:26:28PM +0200, Hans Verkuil wrote:
> Hi Peilin,
>
> On 10/08/2020 07:05, Peilin Ye wrote:
> > precalculate_color() is reading out of `sin` since `tpg->hue` is not being
> > properly checked. Fix it. `cos` is safe, as long as `tpg->hue` is higher
> > than or equal to -192.
>
> Thank you for this patch, but there is something I don't understand, namely
> just *how* tpg->hue can be out-of-range.
>
> From what I can see vivid sets hue via tpg_s_hue() when the V4L2_CID_HUE control
> is set. But that control has a range of -128...128, so ctrl->val should always be in
> that range.
>
> I would really like to know 1) what the value of tpg->hue actually is when it goes
> out of range, and 2) who is changing it to that value. Can you do a bit more digging?

The value of `tpg->hue` was -20551. It came from the userspace, see the
"\xb9\xaf" on line 500 of the reproducer:

https://syzkaller.appspot.com/text?tag=ReproC&x=14b49e71e00000

  NONFAILING(memcpy((void*)0x20000200, "/dev/video6\000\000", 13));
  res = syscall(__NR_openat, 0xffffffffffffff9cul, 0x20000200ul, 2ul, 0ul);
  if (res != -1)
    r[0] = res;
  NONFAILING(memcpy((void*)0x20000140,
                    "\x4d\x43\x66\x34\xfd\x89\xb9\xaf\x0d\x59\xa2\x83\x4c\xfd"
                     ^^^^    ^^^^    ^^^^    ^^^^^^^^
                    "\x3e\x64\x7c\x96\xcd\x59\xf2\x3a\x18\xa3\x81\x49\x22\xc0"
                    "\xc1\xbf\x02\xa5\x50\x5f\xcb\x48\x92\x0e\xf3\xdc\xff\x85"
                    "\xb7\x84\x21\xab\xef\x31\x3d\xb1\xb6\x5d\xbf\x07\x8e\xee"
                    "\x5e\x7c\x73\x32\xf4\x9d\x1e\x62\x6b\x6a\xa0\x74\x73\xe6"
                    "\xca\x1b\xdb\x7a\xca\x76\xd8\x37\xb8\xd9",
                    80));
  syscall(__NR_write, r[0], 0x20000140ul, 8ul);

I guess the root cause is a race condition in the vivid test driver,
which completely corrupted `tpg`. I see bytes like "\x4d", "\x66" and
"\xfd" around `tpg->hue`, too.

The reproducer does two things: the above write() on /dev/video6, and a
preadv() on /dev/video3:

  NONFAILING(*(uint64_t*)0x20000800 = 0x20000000);
  NONFAILING(*(uint64_t*)0x20000808 = 0x1f);
  NONFAILING(*(uint64_t*)0x20000810 = 0);
  NONFAILING(*(uint64_t*)0x20000818 = 0);
  NONFAILING(*(uint64_t*)0x20000820 = 0);
  NONFAILING(*(uint64_t*)0x20000828 = 0);
  NONFAILING(*(uint64_t*)0x20000830 = 0);
  NONFAILING(*(uint64_t*)0x20000838 = 0);
  NONFAILING(*(uint64_t*)0x20000840 = 0);
  NONFAILING(*(uint64_t*)0x20000848 = 0);
  syscall(__NR_preadv, r[1], 0x20000800ul, 5ul, 0ul);

I commented out this preadv(), then the reproducer didn't cause any
crash. Unfortunately I don't know the code well enough in order to
figure out exactly why...At this point of time I'd like to send you an
v2 as you suggested, it should work as a mitigation.

Thank you for the suggestion!

Peilin Ye
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
