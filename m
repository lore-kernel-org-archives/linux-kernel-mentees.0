Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8349FCDB483
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Oct 2023 20:10:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 026F541A04;
	Tue, 17 Oct 2023 20:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 026F541A04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HL924ta3GhdJ; Tue, 17 Oct 2023 20:10:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id D7EEA4194E;
	Tue, 17 Oct 2023 20:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7EEA4194E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BA31EC0071;
	Tue, 17 Oct 2023 20:10:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7BB52C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 20:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3547081359
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 20:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3547081359
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0feoC34PER01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 20:10:24 +0000 (UTC)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18BA88134F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 20:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18BA88134F
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6bd73395bceso2294020b3a.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Oct 2023 13:10:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697573423; x=1698178223;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:dkim-signature:date:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Uj2R21g4EPlt4YZKWi7SG89ievVQJ+iyFG5BwjhrmmE=;
 b=KUVMfOJT3YUBYmqfFCinKWdYmFQqkdQB/oZkIxJVV8VNn/penwcewImrWPDaHa4Chi
 2nggZiVHxIjVIct6gtjPUsZ86uaopZC2Sb8BUP3+0/cUg6PHO3R40nuAzL4p+HVvq8EL
 8bynwmPVFDR/MepHOneqh8csJGLsB+yNyNy2fVxxODIpVl88lUIoot7/CmmAuth3dbVw
 HB12I5Y70rcQI2GXeKvaCxfwInFCm6PwHg3G3+/jnj17ZNBS0Sm4aYwhWTDRZKnDFh1i
 3T0v9dtGbH++kqvXU7uIlHtw6tGo90noH708xg4L/OQWfgPSx4iqGrLMhpUTpv+s+arB
 aUmw==
X-Gm-Message-State: AOJu0Yx5LTU0/0RlPXsu73Ox+uCISUbhhNPNffCgakcmgC3VDs4Ez0S8
 XxH/Sijtia1qbeIBVR2ZbsM=
X-Google-Smtp-Source: AGHT+IEPY0k7Zb1PMfxn6P2a1QNtfE7IToifhIIwsP0rg4ArLxFEVp2FOQ6vFHPhJI2ALpNnMSKmzw==
X-Received: by 2002:a05:6a00:3408:b0:691:27b:15b4 with SMTP id
 cn8-20020a056a00340800b00691027b15b4mr3871596pfb.5.1697573423273; 
 Tue, 17 Oct 2023 13:10:23 -0700 (PDT)
Received: from mail.marliere.net ([24.199.118.162])
 by smtp.gmail.com with ESMTPSA id
 z21-20020aa79f95000000b0069323619f69sm1918389pfr.143.2023.10.17.13.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 13:10:22 -0700 (PDT)
Date: Tue, 17 Oct 2023 17:10:14 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
 s=2023; t=1697573418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Uj2R21g4EPlt4YZKWi7SG89ievVQJ+iyFG5BwjhrmmE=;
 b=Sd7GNP/bf0yRIpIrDgRsW5XZ4eSKsUoJ5xRV2D58RK5XCT0LV2IxaO3HmNa60rGT2E3d5L
 jtdldngQhriPe+qNxE1kT0DMtqconE5I+up4eMlISXEI8569NwNjfV7GoHvR51wmEXnDgQ
 j0Awwtx/zDEM/wM1rwbOLFHJb8fxtJ+i1G2HDQzv3Iit94/AZTABUdDt0j4B2xHzadTkmd
 q6W+nawquOo//gCaRyawwJu7omaFskXMsQg2GgTH8CY6kPME9wleTHg4ppGpLSOoedSLe2
 8ifxIM9dfCcdghArMGZ+4W1wU4pJWKcgmsdsM7mpNHOvJOvlBVolya0dupzNQQ==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Juntong Deng <juntong.deng@outlook.com>
Subject: Re: [RFC] mm/kasan: Add Allocation, Free, Error timestamps to KASAN
 report
Message-ID: <eqinp4exznpgclzgz3ytjfdbpjffyyfn62dqfiaw2htk4ppa5p@ip25t7yczqc3>
References: <VI1P193MB075256E076A09E5B2EF7A16F99D6A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1P193MB075256E076A09E5B2EF7A16F99D6A@VI1P193MB0752.EURP193.PROD.OUTLOOK.COM>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, linux-mm@kvack.org, ryabinin.a.a@gmail.com,
 glider@google.com, akpm@linux-foundation.org, vincenzo.frascino@arm.com,
 "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>, dvyukov@google.com,
 andreyknvl@gmail.com
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

On 23/10/18 03:39AM, Juntong Deng wrote:
> If the free time is slightly before the error time, then there is a
> high probability that this is an error caused by race condition.
> 
> If the free time is long before the error time, then this is obviously
> not caused by race condition, but by something else.

That sounds a bit arbitrary to me. How do you set the threshold for each
case? I mean, the fact remains: an invalid read after the object being
freed. Does it matter what it was caused by? It should be fixed
regardless.
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
