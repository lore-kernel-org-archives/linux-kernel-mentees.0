Return-Path: <SRS0=2zBv=7I=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9722C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 23:42:03 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75934207D8
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 26 May 2020 23:42:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="CCE+sc2P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75934207D8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id DD36B2042C;
	Tue, 26 May 2020 23:42:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19HP2OQb4ZQl; Tue, 26 May 2020 23:42:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 03B102041D;
	Tue, 26 May 2020 23:42:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7A42C088D;
	Tue, 26 May 2020 23:42:01 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 54D52C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 23:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3B9428867B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 23:42:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kHeyT-nfa5vW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 23:41:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1E38A88651
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 23:41:57 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id q8so6197254qkm.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 26 May 2020 16:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=hXQqv/v9vEVYiQfhG65G3PbZzCVHsVLEfF5BwtCgffQ=;
 b=CCE+sc2PHzbrIdaja5D95876TdFmtlvMwrZdxapWFx+gcP/UjUcuZDtdW6X4Awh3gM
 iDH0DKaGQmql1ZEmlKdncgkvW68rzQ1bPsMyzzYKfBbgD2zPwIQWVtCvqAXtDs+FJPdA
 r23b/rRw7qmQYzX/W2pp1jT6jlCz+DkheqodVzvs9yq4YBSeULxIaqAH29A5PDJ4xkVZ
 teWED5H5O9Tvd8vecCa1b+szTWTEh4M8rktKSOgtu3BBMsvpexasFyyOkCrs/idNOsa2
 q1Z/MiBe7s4wdzL/XOmY8r6qC23mZzD1FtqZgxFcATDrNDni5s2h85YRRP5drFYU+FQf
 SRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=hXQqv/v9vEVYiQfhG65G3PbZzCVHsVLEfF5BwtCgffQ=;
 b=YOn+29+wAHcIXkbJw17sU2zT/LX053OUJiQbkDBY6bZ0kDpyyL69KjjndFRzpqBV89
 mLlbfviPyXtsHrU7/c9tLzS+GQXYkjHHuhNen7u0dDE0tt4ywd84wdjRUGiei5HaZi9s
 XOI9WxQpXUgmLQzON7YYbiwxY63WJlSOTKKHX3/lL2GECbU49sWCVMqYTP5yF07sgZax
 jLmmX9DgaafR1mTmGvhY2PeBBJTsFWFcN1lmMtK7nOxNEtGjpUptOT8bmUiUz3cF/wxC
 4gMxGxSM/gOyRiOWGu31j8VXRktRlgdJI2jMokYlhbwovyjYykIFf1YDk4TNEKSUwPHE
 n8ow==
X-Gm-Message-State: AOAM530T2cLOOunrh4GUp+/sqCU5kIS5NpMgeV3ZEvWrRBfzBaIUDfht
 HxdJ3R16bTUMlaG4u1t4D2K7eg==
X-Google-Smtp-Source: ABdhPJyE14ZUR04SAQDVd8MHMq53V+KJw3CgOd4MvBhRY9xxbeFMhUtX1Xb318fAiIuunVXvHq0vMQ==
X-Received: by 2002:a37:8302:: with SMTP id f2mr1397002qkd.220.1590536516733; 
 Tue, 26 May 2020 16:41:56 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
 by smtp.gmail.com with ESMTPSA id k43sm1150727qtk.67.2020.05.26.16.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 16:41:56 -0700 (PDT)
Message-ID: <adc28ceff89a7fffb8b6af4badc850b29b9e6207.camel@massaru.org>
From: Vitor Massaru Iha <vitor@massaru.org>
To: Shuah Khan <skhan@linuxfoundation.org>, kunit-dev@googlegroups.com
Date: Tue, 26 May 2020 20:41:53 -0300
In-Reply-To: <ace26347-a78e-1bd1-86f5-f8e644aa93ec@linuxfoundation.org>
References: <20200526183436.47026-1-vitor@massaru.org>
 <ace26347-a78e-1bd1-86f5-f8e644aa93ec@linuxfoundation.org>
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [Linux-kernel-mentees] [fixup] kunit: use --build_dir=.kunit as
	default
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

On Tue, 2020-05-26 at 16:29 -0600, Shuah Khan wrote:
> On 5/26/20 12:34 PM, Vitor Massaru Iha wrote:
> > To make KUnit easier to use, and to avoid overwriting object and
> > .config files, the default KUnit build directory is set to .kunit
> > 
> >   * Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=205221
> > 
> > Fixed up minor merge conflicts - Shuah Khan <
> > skhan@linuxfoundation.org>
> > 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> > Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> > Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> > ---
> > version after merge on kunit brach:
> >   * fix identation (tabs instead of spaces)
> 
> You mentioned spaces breaking python. Please include the python
> errors and make it clear in the change log what is fixes.

Of course, I will add this.
> 
> thanks,
> -- Shuah
> 

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
