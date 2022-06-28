Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B96C43334
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 28 Jun 2022 00:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0BCA402B1;
	Tue, 28 Jun 2022 00:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0BCA402B1
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NSCcXg1e
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id czh-FWvIpLYu; Tue, 28 Jun 2022 00:32:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 0F857400D6;
	Tue, 28 Jun 2022 00:32:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F857400D6
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EA0FBC0032;
	Tue, 28 Jun 2022 00:32:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C486BC002D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 00:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8816C60B83
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 00:32:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8816C60B83
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=NSCcXg1e
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VnCUCs70Ys9R
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 00:32:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ECD060AC3
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7ECD060AC3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 28 Jun 2022 00:32:04 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id x20so4020245plx.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 27 Jun 2022 17:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=OFFvy82t3qS2mWvKMEQ2PiSLGvpukFE2JbAHWF/b/0o=;
 b=NSCcXg1ekuYiFLFIOJztsGrrf6k+Y/n8ieyeC9AuJKRrjhP+8mtp6WwejPs6ymRPCr
 3+qJflUm1uVqFWeK/w0HEf5BqijTsqUmFg2VZxI9rM7nQNtF0sLdUCFnkyWsgQ6KUdZb
 3v2/pkEqEbMMVwSSxAou0C8ixVtoQVE4C2gPxOlIBB0uFBopc3EJEWr7FrAsI607E/r5
 Uz258GrQ4ESmM+gBquhd/ZPfXvC9SRQ8EMF2KLx4JiVVW7ZwmMHy7098bTEBnI2ZqI2P
 J9d58NUejrTgglboOKwIQeUjZ54xY3xQX8pcvkNA2isKfxoSVhCxmtmtSerA+UHsitTo
 321w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OFFvy82t3qS2mWvKMEQ2PiSLGvpukFE2JbAHWF/b/0o=;
 b=XYkueAqMbFRbpQJoCt9ZFeDtBPbWlRObcpdeomZLIkzqKdrdA/z6dIyPqhoK+CPmIC
 i1h7GqCFoX8L6lwuveuyK0c60V4tO+eBEbzwDMq197WIZFN6EZ56WvoUEMmwMyH6hXws
 N2dzOuKYlYi17D/GbtU9dGEZefk+mQPoGQ3pmNh6mMTSrI/ButbvB12AtZqiWikAZtK8
 VC1tDrGLhUpsL+q1yDagOmn167verdNApiOkmPue9GqDVGN32twbaMWGwk+qiIJ2uJnu
 RkODm7N4zk8kjPlPvyNfn0poAMxhdV1I/RIx0Xtx7zq5lRqK0yJriIGzQ6gIh41ZmcJH
 IBnA==
X-Gm-Message-State: AJIora/k1rtWo+Q1WajBErSyPxnIbWKvFl54kkzsbbH+7VrWCztecRdS
 C2jkCdplatrX8I+PduHN7f8=
X-Google-Smtp-Source: AGRyM1tWsgyFKFnn4ji+g5YZhEaM1wplTOBNsi5KT3WKRaD4wmjJG2KzTXbtuZlDoMCjfrKa2kFccw==
X-Received: by 2002:a17:903:41d2:b0:16a:2cca:4869 with SMTP id
 u18-20020a17090341d200b0016a2cca4869mr2157470ple.13.1656376323885; 
 Mon, 27 Jun 2022 17:32:03 -0700 (PDT)
Received: from [192.168.43.80] (subs28-116-206-12-39.three.co.id.
 [116.206.12.39]) by smtp.gmail.com with ESMTPSA id
 x9-20020a634849000000b0040d75537824sm7726863pgk.86.2022.06.27.17.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jun 2022 17:32:03 -0700 (PDT)
Message-ID: <e2eee869-3e72-ea18-6afc-73fe5bc5dbd3@gmail.com>
Date: Tue, 28 Jun 2022 07:31:54 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] docs: fix 'make htmldocs' warning in leds
Content-Language: en-US
To: Praghadeesh T K S <praghadeeshthevendria@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20220627214311.7817-1-praghadeeshthevendria@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20220627214311.7817-1-praghadeeshthevendria@gmail.com>
Cc: praghadeeshtks@zohomail.in, linux-kernel-mentees@lists.linuxfoundation.org
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

On 6/28/22 04:43, Praghadeesh T K S wrote:
> Fix following 'make htmldocs' warnings:
> ./Documentation/leds/leds-qcom-lpg.rst: WARNING:
> document isn't included in any toctree
> 
> Signed-off-by: Praghadeesh T K S <praghadeeshthevendria@gmail.com>
> ---
>  Documentation/leds/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
> index e5d63b9..b9ca081 100644
> --- a/Documentation/leds/index.rst
> +++ b/Documentation/leds/index.rst
> @@ -26,3 +26,4 @@ LEDs
>     leds-lp55xx
>     leds-mlxcpld
>     leds-sc27xx
> +   leds-qcom-lpg

Hi,

I had already sent the fix at [1] (resend at [2]). Thanks anyway.

[1]: https://lore.kernel.org/linux-doc/20220604015735.249707-1-bagasdotme@gmail.com/
[2]: https://lore.kernel.org/linux-doc/20220612000125.9777-1-bagasdotme@gmail.com/

-- 
An old man doll... just what I always wanted! - Clara
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
