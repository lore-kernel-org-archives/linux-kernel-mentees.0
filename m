Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC7FE743F0
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 29 Sep 2023 07:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0760E82038;
	Fri, 29 Sep 2023 07:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0760E82038
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jY9mnedu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Txck2b4Cmlrt; Fri, 29 Sep 2023 07:06:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3A60080F02;
	Fri, 29 Sep 2023 07:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A60080F02
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 21D41C0071;
	Fri, 29 Sep 2023 07:06:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BCDA7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 07:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87847414FA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 07:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87847414FA
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=jY9mnedu
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XC7Hm8Y9XlL6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 07:06:28 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 56F4340122
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 07:06:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56F4340122
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3215f19a13aso13618629f8f.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 29 Sep 2023 00:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695971186; x=1696575986;
 darn=lists.linuxfoundation.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+codVGGhv2SeiYMJcTB77YXyphBd1FT0aX06zEio1mg=;
 b=jY9mneduVVBFwAwu6ZnGxHdZNTIWfQMI0FL+Wc/6sp1qwbqug01GANCdI2LN8lePg7
 bF3+oTf60MOV4ZJwJPl8DSfNy/2Me4EH2gHXyG7rFn4vhV5qi/8feeNyjE65sQxr+AHl
 TBL4XAOSoah+I2ISg/ollsdydJz1FcjZQveUc1abMlIft0ro7txRfKUER75uLC+qHzpG
 +Mq5A9vNJjjMpISB2H9jeLZVgAs4hQp0ILizOEY5bcb/q7E4UWfjJWF/daV9R7m63BhH
 00TZCIsbHdDvD7g1OIwPKCk4ivIP2uRD/klmamlht1NVKt+slCQXJM06nXxPmB548qBq
 iKEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695971186; x=1696575986;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+codVGGhv2SeiYMJcTB77YXyphBd1FT0aX06zEio1mg=;
 b=FJ+kZz966dBx1cWUisvd6IR3o+SRH3ZYhmUL5J9TToW/7svHvmRcz4wI8u1lNGHhM6
 PCDjr+h4asrIvhL7Y2KgjF8+YqAQPlptR6LdyIdMXeoK5EpAOrcAT4mDDV4D73FOjO/s
 aDATt7ibJzQSZHwfJWKGXputpCkUdJSiF9NdPRkyEyULAWAB8jvdv032KtmxZBJujmQ7
 u+NCFUnLG05uG3ynt6UD6FY2W8gnI/AxpmgNWBA6ZOTc1DjJRxwwp7SsphTHCSge/jaQ
 OTn+BD5vC1cRBXA2S8jWnuxpHQZg3QprVSeUv6aI7APnSeeTRzEL5PHp4AGE0NmDf6JA
 /bag==
X-Gm-Message-State: AOJu0Yz3AKoUkLTpAKp77CTnYF9OsvFfj9XwGMXYdoK4eYh+sezkOVvy
 0YOeLdog5ctEk+XR9ncBatOX0A==
X-Google-Smtp-Source: AGHT+IHLqhqTQu0Fr5JMPqWwa7uQJwfQRsA/hKEBcTKE77tO24/89NMM282LtWvd6H4sBTkNo0TI5A==
X-Received: by 2002:a05:6000:1085:b0:323:2c39:bb3d with SMTP id
 y5-20020a056000108500b003232c39bb3dmr2776319wrw.64.1695971186094; 
 Fri, 29 Sep 2023 00:06:26 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 q18-20020adfb192000000b0031f8a59dbeasm8634280wra.62.2023.09.29.00.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Sep 2023 00:06:25 -0700 (PDT)
Date: Fri, 29 Sep 2023 10:06:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH] gfs2: fix 'passing zero to ERR_PTR()' warning
Message-ID: <a2d702b0-e819-47b0-a945-c2e38a162381@kadam.mountain>
References: <ZRXA7n0wD83zhPxC@runicha.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZRXA7n0wD83zhPxC@runicha.com>
Cc: Andreas Gruenbacher <agruenba@redhat.com>, linux-kernel@vger.kernel.org,
 gfs2@lists.linux.dev, Bob Peterson <rpeterso@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <error27@gmail.com>
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

On Thu, Sep 28, 2023 at 11:37:42PM +0530, Deepak R Varma wrote:
> Resolve the following Smatch static checker warning:
> 	fs/gfs2/acl.c:54 __gfs2_get_acl() warn: passing zero to 'ERR_PTR'
> 
> by returning NULL when an extended attribute length is zero, instead of
> passing on zero to the ERR_PTR().
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---

Passing zero to ERR_PTR() is not a bug.

You're patch doesn't change how the code works at all, right?  So it's
like a cleanup patch.  But the code was nicer in the original.

This is just a false positive.  Ignore static checker false positives.
Fix the checker instead.  Although in this case, I can't think of an
easy way fix the checker.  Perhaps don't print a warning if the callers
check for NULL?

The passing zero to ERR_PTR() warning is actually a pretty good
heuristic.  90% of the time in new code this is a real bug.  But in old
code then probably it's 0% real bugs because we've been reviewing these
warnings for over a decade.

I have a blog which might be useful.
https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

When I'm reviewing this patch I think:
1) Does gfs2_xattr_acl_get() return zero?  And it does.
2) Does that look intentional.  It's harder to tell because there aren't
   comments and it looks like it might be a missing error code.  But
   when you read it closely then actually it does look intentional.
   In terms of Smatch, I consider it "intentional" if there is an
   "error = 0;" within 5 lines for the goto.  (Other languages like Rust
   are better than C because they force everyone to follow the rules.
   #trolling).
3) Do the callers of __gfs2_get_acl() check for NULL and they do.

So this code is fine.

I hope this helps you in your review process.  1)  Ignore old warnings.
2)  Ignore false positives.  3)  If you think it is a bug, then try to
figure out how it will cause a crash.  Look at the caller etc.

regards,
dan carpenter

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
