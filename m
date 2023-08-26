Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DDE7C83F01
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 26 Aug 2023 09:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D33360B19;
	Sat, 26 Aug 2023 09:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D33360B19
Authentication-Results: smtp3.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=chwHg8mG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aybbUORk_tSw; Sat, 26 Aug 2023 09:45:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 6D2C360B04;
	Sat, 26 Aug 2023 09:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D2C360B04
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E002C0039;
	Sat, 26 Aug 2023 09:45:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D73A3C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Aug 2023 09:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E54B83A59
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Aug 2023 09:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E54B83A59
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=chwHg8mG
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FNXSwB0yo6fF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Aug 2023 09:45:33 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9297683A56
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Aug 2023 09:45:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9297683A56
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-31c6cd238e0so1737256f8f.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 26 Aug 2023 02:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693043131; x=1693647931;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EcmeCq/32Wiyi3Ru6rZay2ig3zBVjavNEyIttUA3Hls=;
 b=chwHg8mGkspRC0bpi1AOT4+Xo82JletVcBQUGMJu1iMGLwh8xJs3KfV5mAM9xGQqXz
 daVXupwyuiVECSDFN/43DgShfgF6bPzGUEaLfuqgPKVYhq5pfzBTJaGG0ebhZFa5C1qD
 iGNBNjwA20ReXbAhzUmZk1NKbxIhuLyVQUKAbVuHO+hhFFzFz7sUYKJeIrCmb6nffMeJ
 dKTcLDSau51/EX3YkDm0NDttOOi9N5PBg4WQ4ITUf7codCnlTlMDEqyQzsCJEWyO/eqr
 pTNNxeLoebEsFHftK+CvX4mCidW5CIVegIKzGaDQ25ojJmQg70ipnBxiLZIJqc67/f2K
 yLMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693043131; x=1693647931;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EcmeCq/32Wiyi3Ru6rZay2ig3zBVjavNEyIttUA3Hls=;
 b=StHLihtBsbbDT2QvzYkGUtB3cgiQVIo0/h4IzROVy7Xfz+2xqb1K1yE2xPTklTmRDg
 sAJkc/2J+yazN/oVsilswoo6XIRsnjNScwu2qFBcVNg2cF+6C3zLNkT5Gco8nSzRMish
 ZNsUjhuW0F/05d9EHPoc4CL1QCsqtPyG7T3oAPcD4tVEu/ql5WAU2dM27AlQv5tzt37z
 jpPwSX/DbVrY669Ye0AH1bb+gmBXTmaiWZair5NDe3EuH5nt4hAGABfaKx1jWTYHb4+D
 VQlav8suIFYk90J6PLJNV8hmmYbU3Rvpev0EUr3lDF+no+nwMarVbp/AcI3HvH11JObo
 JT1A==
X-Gm-Message-State: AOJu0Yz5br7iPJwpqJDLPETWXIxXspm3xTUSygJWPW8yY3SEozfKUSjI
 0OPOo4qUIS1PmCS/JaSVxgY=
X-Google-Smtp-Source: AGHT+IGugDagkjN8l4cZ2iCV4RjulgnZxvwY3RYAOx3N3ArjiJDFmUO3gLNIyGsmg0LAwwuVbUP2CQ==
X-Received: by 2002:adf:ec8a:0:b0:317:de66:259b with SMTP id
 z10-20020adfec8a000000b00317de66259bmr16715345wrn.15.1693043131326; 
 Sat, 26 Aug 2023 02:45:31 -0700 (PDT)
Received: from mmaatuq-HP-Laptop-15-dy2xxx
 ([2001:8f8:1163:6db:5fbb:8783:6dd3:4939])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a05600c2a4300b003fe601a7d46sm7646174wme.45.2023.08.26.02.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Aug 2023 02:45:30 -0700 (PDT)
Date: Sat, 26 Aug 2023 13:45:23 +0400
From: Mahmoud Matook <mahmoudmatook.mm@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v2 1/2] selftests: Provide local define of min() and max()
Message-ID: <20230826094523.bl6kbcwelj23cydu@mmaatuq-HP-Laptop-15-dy2xxx>
Mail-Followup-To: Sean Christopherson <seanjc@google.com>,
 keescook@chromium.org, edumazet@google.com,
 willemdebruijn.kernel@gmail.com, wad@chromium.org,
 luto@amacapital.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kuba@kernel.org, shuah@kernel.org,
 pabeni@redhat.com, linux-kselftest@vger.kernel.org,
 davem@davemloft.net, linux-kernel-mentees@lists.linuxfoundation.org,
 David Laight <David.Laight@aculab.com>
References: <20230824202415.131824-1-mahmoudmatook.mm@gmail.com>
 <ZOjIHo2A6HZ8K4Qp@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZOjIHo2A6HZ8K4Qp@google.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 08/25, Sean Christopherson wrote:

> On Fri, Aug 25, 2023, Mahmoud Maatuq wrote:
> > to avoid manual calculation of min and max values
> > and fix coccinelle warnings such WARNING opportunity for min()/max()
> > adding one common definition that could be used in multiple files
> > under selftests.
> > there are also some defines for min/max scattered locally inside sources
> > under selftests.
> > this also prepares for cleaning up those redundant defines and include
> > kselftest.h instead.
> > 
> > Signed-off-by: Mahmoud Maatuq <mahmoudmatook.mm@gmail.com>
> > Suggested-by: David Laight <David.Laight@aculab.com>
> > ---
> > changes in v2:
> > redefine min/max in a more strict way to avoid 
> > signedness mismatch and multiple evaluation.
> > is_signed_type() moved from selftests/kselftest_harness.h 
> > to selftests/kselftest.h.
> > ---
> >  tools/testing/selftests/kselftest.h         | 24 +++++++++++++++++++++
> 
> Heh, reminds me of https://xkcd.com/927.
> 
> All of these #defines are available in tools/include/linux/kernel.h, and it's
> trivially easy for selftests to add all of tools/include to their include path.
> I don't see any reason for the selftests framework to define yet another version,
> just fix the individual tests.

giving the reviews seems that patchset is useless.
still a confusing point for me; after adding tools/include to the
include path of selftes how we can differentaite between  #include
<linux/kernel.h> that under tools/include and one under usr/include.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
