Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE50FC001DF
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Aug 2023 07:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60DA3822BE;
	Wed, 16 Aug 2023 07:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60DA3822BE
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=b5lPwvMo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aA-Kw4xQo82L; Wed, 16 Aug 2023 07:05:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 2E58E8229D;
	Wed, 16 Aug 2023 07:05:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E58E8229D
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0A7EAC0071;
	Wed, 16 Aug 2023 07:05:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 79D2DC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 07:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EA3B41918
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 07:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EA3B41918
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=b5lPwvMo
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YVNQ5GT09wW5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 07:05:43 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30311418EC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 07:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30311418EC
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5236a9788a7so8426296a12.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Aug 2023 00:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692169541; x=1692774341;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=F66b+WiJQhWCTNUtmQ9U4s1ZL0iS1ZKW40DQdZOBThE=;
 b=b5lPwvMoj1h9j6WMG6K31IBv4RI9KiOaY/V08NKgB/bIM1UmIBVMIUzS/jrI3rF5dR
 qZm0JCP4GSODAY52ZnKMCGQMiNJjpOCdhnac9hZUTpEAQjWHdRZYf5QFFhpoze/x/hZ5
 c5/bFVbbigvDPdjuAUWeg3qEB1BpduYhI4cJ/2GOsXDWzP3iTRx3dGZeT2BVTjBCv0N+
 UiSne26Aw6zuoyjvLF5c/Za4hZ4MyFufRLiUaOtLc7wgpC2UjBTYi6cX8K+JRTgHCM4o
 ENaZ5RE8jp+w/r+j132CXNNyCDJe08RFLfkz19aMQlIQNQe9af2yJF/GiurtLfRpXfNt
 3SDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692169541; x=1692774341;
 h=in-reply-to:content-disposition:mime-version:references:subject:cc
 :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F66b+WiJQhWCTNUtmQ9U4s1ZL0iS1ZKW40DQdZOBThE=;
 b=Vd8WH1vyyKmQraHXuuMisoeWJmkemECcTu7a8S1f2i3Bs7HdR8Mrg452A1bjMWT/Ee
 JNrF2G4frQP5qVwe7/9ltmtEqC/VMv4Y8VAUEIVEtoNna6z885jVA9CuDEOy2RSBADX5
 MV9piQ9wMwSY8az5rpYcfaBIEAaW8B4jskkpHwdq3zyE/g15VBtNmz/K9zGn4IS9XmvC
 iRp/MLAUCK9mC03ODUs9WhNY1plTLXu8g2i/LaltVEfOdndRf/euTanVGPiMLd/nZXH4
 5HZ+dTPt/VBSfw8vOT+zRdGakhum3FJWYLPFOi7XX5Du0zZgggkSxuZGjhFxJsfMnbvl
 lBAw==
X-Gm-Message-State: AOJu0Yxtqknkw6S/k76yBkVy7UcvIP2Q2HdCoBx3kRNI6TuH3ZyqDN9t
 NdrAOnpvBXT5MKG+5bYiFB0=
X-Google-Smtp-Source: AGHT+IHoFbVhtpG8pq/iUfBdydWXnasjtRZUXNg+G1N4Vi93Y4/LUy/Hl4bX9yJDD+lB9vM3kz5Hqg==
X-Received: by 2002:a17:906:200a:b0:99b:f820:5d0e with SMTP id
 10-20020a170906200a00b0099bf8205d0emr957729ejo.25.1692169540896; 
 Wed, 16 Aug 2023 00:05:40 -0700 (PDT)
Received: from akanner-r14. ([77.222.24.45]) by smtp.gmail.com with ESMTPSA id
 vr2-20020a170906bfe200b00988b8ff849csm8053175ejb.108.2023.08.16.00.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 00:05:40 -0700 (PDT)
Message-ID: <64dc7544.170a0220.90098.7253@mx.google.com>
X-Google-Original-Message-ID: <ZNx1FFzoIiLYRLHq@akanner-r14.>
Date: Wed, 16 Aug 2023 10:05:33 +0300
From: Andrew Kanner <andrew.kanner@gmail.com>
To: Paul Moore <paul@paul-moore.com>
Subject: Re: [PATCH 0/1] netlabel: KMSAN warning
References: <20230815205917.1504837-1-andrew.kanner@gmail.com>
 <CAHC9VhRRcMQhbobpGZy0ha3saOJ4Ke1CCnExKSJq1E2jXCU3NQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHC9VhRRcMQhbobpGZy0ha3saOJ4Ke1CCnExKSJq1E2jXCU3NQ@mail.gmail.com>
Cc: selinux@vger.kernel.org, eparis@parisplace.org,
 stephen.smalley.work@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
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

On Tue, Aug 15, 2023 at 06:27:43PM -0400, Paul Moore wrote:
> 
> I think the answer is going to depend on the particular "bug" and the
> patch required to resolve it.  In this particular case I think the
> patch is okay so I went ahead and merged it, although I did remove the
> "Fixes" tag as the current code isn't broken.
> 
> In general, if a test tool dumps an error or warning for something
> under security/ and you aren't sure if it's valid or if we need to
> resolve it upstream, you can always send us an email and ask what to
> do :)
> 
> -- 
> paul-moore.com

Thanks, Paul.
I got the idea.

-- 
Andrew Kanner
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
