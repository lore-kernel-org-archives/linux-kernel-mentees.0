Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2AF8BE9
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Apr 2026 07:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928646; cv=none; b=NdtS6MA6vcTrIzpF6wQoEK76GNbx5gCtsC8aDofPLEOJ9aGA4JQhH1vsUQn0pXNkisueT+JlFqhVFM5fznNLN4prq98Ykj8+5juLoXFu/NUPapkitBOxQ5P6HBAfuMFBGLgWq41iCXi8rzAhTpGWyPELTEkb3PCE3Rfx6jz+BV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928646; c=relaxed/simple;
	bh=zqTtblBgVBvR4PqgE3QaoFiL53X3HfCSi/tlFkgspTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sx6tuxSlvWqjHScaYk3gjIWwaXKZlG5Ecue0+8XzbqMWhQfzYQ6p2LL32NTBZYf5Zaa7HKvEl2W5C1AmjfvTKHk2qNnicW6dCQ5RFI0U4wW7tZzr8Hs+WD4LWPXMzg6hatlBkFDhB1wGpOcqCsD4FjS5ZU4KPUMD6tgI4XFpu2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pa4HO1O2; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pa4HO1O2"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9244F4062C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Apr 2026 07:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VxTngUYBMoaq for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 23 Apr 2026 07:17:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1136; helo=mail-yw1-x1136.google.com; envelope-from=error27@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6430F404ED
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6430F404ED
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pa4HO1O2
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 6430F404ED
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Apr 2026 07:17:22 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-79a60975dc5so69095517b3.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 23 Apr 2026 00:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776928641; x=1777533441; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=naCAeEutfEuGQvFW2rc7B0bW9t3/crv6VVbt4Hmx2q8=;
        b=pa4HO1O2fwpPwN023z1jaDj2uXrtBE3JmswQJdxjK3Ump1qVXKBqRlSjV9XEiMG5ZQ
         PhBalg1+zTiS/VN5YhTJ0wKqFdhZwNGpdVsao/41hnt8e7PuQFLNCh8wVKuRjF4aJLWt
         Wthiu5HO+SGo4hCEDv/G6TM3+IiJiahis7906UnowH9i0oyAvXW10Yh1xw613T4KywgU
         yt5Laqk7y8I3TQdC/fXlJoYVO4SfmILh4pwUJBSfNauH8vnfeQ7bvGRmxlMkqsYkwcsE
         i2gXJjtUZ4xkPzSb8vOGLuBE0Az7zH+oAdyxVsNlQCnGVmjqelQ7vs65WMcBdbjeUU7V
         W4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776928641; x=1777533441;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=naCAeEutfEuGQvFW2rc7B0bW9t3/crv6VVbt4Hmx2q8=;
        b=J85tq5CEsYY4OnMjPpk9irV71LS23HMjaHfZWh6/J/4ArLAwj6s7ybtCsG8+3hV99k
         Plce+HIWg06TVnWNHUJ6AWo9ep57pZHf9+2Qw9upoCvwqNSj8tIhlA7MnfKGNCwAdjik
         z0yPsze6pXcdgN425Z6yIzdh2K9fftB/XcvODn4WhrP1VasZ62r9AeoLnR8owqu/P6h9
         Thtk4lbAZzvcv3Kss5HxnAMwjGPMN6WwfY+DDPF6Zgsntnrr223H3kh3xneQjWyPY84N
         jraQ62NQt3l4wAQJbWQwrbpF82r/tqvWMqxiFmxy7p1THAK6ZWJ1OTj+OgfRuVozCVWe
         KxPQ==
X-Forwarded-Encrypted: i=1; AFNElJ84XKA5ljFh7o7qPkMXbM13ceAhgWLANpZ2VPWe2azl8bHrdthHlmuC8msi5W2mbdrHczkSDDpE4xPOzZFhlE1QMw+Fgg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywqvc+rOPrgQuw/UpM6vM0vJhjLTHd2G/Riq+Cu4IDa7AxmQBYh
	O0W34ysf115Dvqn8tlBUYOL/u13Adn5vHddLRWjrJIgS/gPxz1HrMmuN
X-Gm-Gg: AeBDiesaizGr30X49cU8zB/5sQZsGoMmrT8mpM8EVSx+/JaovCLLUwHSA4ySi7+C8uh
	Z3pRJ1vRXS8WsruUgIsjUPIQ00lZuX53tB36S2phgXXcWi/63gYBnfdBUsBcJr0ImSwN+4pPkoj
	7ld3wkWT9P0OeVG9qK4alD9n1k5bu+SVfhq3aZOw8PH9/e8w0MZkaJTU0T+oMAt5v5d9jA+N9+m
	201l5CP+ZkbfluxhZ+0oZrcWYLlcIjfRleKivxQZeUk3PPFvXJIq9iKUeICeMtkcpAUSr1AR4wT
	HHuOROvcJ7S4e8cGjpho/1WTYX6EVqhHpWRAQurVKMCuJqWtmpSoB7tMp+RFtgjJYNvN4PMdhz4
	lVfr8U6L7+odQ9rTv3Cj3iIAr+ym3kG/rkiuVJBAWX3g9MkrhTpEgmcjAoIJPe0zmQscIL5NjGw
	6g9u1jM27FWy/pZcy5b8fBy9kwSw6K
X-Received: by 2002:a05:690c:698a:b0:7b7:fb9f:e9a1 with SMTP id 00721157ae682-7b9ed0279c4mr260079227b3.47.1776928641023;
        Thu, 23 Apr 2026 00:17:21 -0700 (PDT)
Received: from localhost ([172.216.252.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7b9ee8e2bb7sm77076787b3.22.2026.04.23.00.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:17:19 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:17:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: Robertus Diawan Chris <robertusdchris@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH RFT] media: atomisp: Add error check in
 create_host_regular_capture_pipeline()
Message-ID: <aenHeWS4y8iLkMAn@stanley.mountain>
References: <20260423060246.296986-1-robertusdchris@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423060246.296986-1-robertusdchris@gmail.com>

On Thu, Apr 23, 2026 at 01:02:46PM +0700, Robertus Diawan Chris wrote:
> When calling ia_css_pipeline_create_and_add_stage() function, there's no
> condition to check whether ia_css_pipeline_create_and_add_stage() throw
> an error or not. So add conditional check for the return value of
> ia_css_pipeline_create_and_add_stage() function.
> 
> This is reported by Coverity Scan with CID 1408952 as UNUSED_VALUE.
> 
> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> ---

You need a Fixes tag.

regards,
dan carpenter

