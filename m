Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F21DC433EF
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  1 Jul 2022 00:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2DCE845B4;
	Fri,  1 Jul 2022 00:00:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2DCE845B4
Authentication-Results: smtp1.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=DfCQu91v
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RUfVbOMTh4_2; Fri,  1 Jul 2022 00:00:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id ABE0284516;
	Fri,  1 Jul 2022 00:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABE0284516
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 87B49C002D;
	Fri,  1 Jul 2022 00:00:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4760BC0011
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 00:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 136A960F9E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 00:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 136A960F9E
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google
 header.b=DfCQu91v
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M8wdyfAYnzPf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 00:00:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE40760F9B
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE40760F9B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  1 Jul 2022 00:00:28 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id v185so750023ioe.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 30 Jun 2022 17:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PAlUtN7SL9XFXUbrECixMis635HqzUUk73c0sMI7wYQ=;
 b=DfCQu91v2qJm2MCzhcjWTkOT0huxiIQlwiVZG5YzaTebf7Tsp0l6inrI7eLwxnLfcp
 JlzvwikYppEaqvHZ8OOKoLOWlA48NEpZU1qT350aXgMNMAFcKQvJfm7Vsp8vgzUsVNdq
 0A0/687El+GnlHIf6Kt3F4csRQPHJQcE3kIwU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PAlUtN7SL9XFXUbrECixMis635HqzUUk73c0sMI7wYQ=;
 b=gBgBSSYYyvaEWJ7PiqjmH01rWRPJGRYMRrcUTV0As4u2zgHY0j+NOcyZ127WAoXPlA
 7sSUyt5yrdHhKzxM+Swm14I/wC5NGiDpX0t2yH1/TFUVmja8w1YafbKS3SA7jhOfHBqS
 5nOQlhu+4TYp0DpnGGUvFPEvNYOCfWdspDZ8Bv6OHAcg1E6UYTGyRgCCZPoJGH0DPPWM
 YY5NvjaQO++/JfHPJmtHzKsfDUSu8AGAiEj2LmJfLzyWFx+CHYxmuU7lPBLUhxrpqXcj
 7f6zf5BRuiOKwY7FKXq510XBGbbFyvLRg8po6xKFzMmxnQtI+hXa9UqwQDJvW9QfkNT/
 L6qA==
X-Gm-Message-State: AJIora/YZBh751U3ZlKzXoeTFrdgWM2CNREaYWpd18p/ZY6zsol1IMZb
 wzh5ZHRok5p1uAcW8ByQT5Qf6ImG
X-Google-Smtp-Source: AGRyM1uSw8B+vZBkRjINHHYqtDGj7eh6OecWI5/rZOo1JZbRK/1RZMWA/BuiiXZfsp/eTd53J4KbaQ==
X-Received: by 2002:a5d:890d:0:b0:668:afd6:5477 with SMTP id
 b13-20020a5d890d000000b00668afd65477mr6274571ion.195.1656633628037; 
 Thu, 30 Jun 2022 17:00:28 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1]) by smtp.gmail.com with ESMTPSA id
 k6-20020a02cb46000000b00331743a983asm7798694jap.179.2022.06.30.17.00.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 17:00:27 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Add tools/testing/crypto/chacha20-s390/
To: Siddh Raman Pant <code@siddh.me>, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20220628064621.14427-1-code@siddh.me>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <390aca1b-3b48-e0c1-07a1-ec8c29f0b8af@linuxfoundation.org>
Date: Thu, 30 Jun 2022 18:00:27 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220628064621.14427-1-code@siddh.me>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 6/28/22 12:46 AM, Siddh Raman Pant wrote:
> This adds the maintainers' information for the
> s390 ChaCha20 self-test module.
> 
> Signed-off-by: Siddh Raman Pant <code@siddh.me>
> ---
>   MAINTAINERS | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe5daf141501..0fcacd715b1c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17438,6 +17438,14 @@ F:	Documentation/s390/
>   F:	arch/s390/
>   F:	drivers/s390/
>   
> +S390 CHACHA20 SELFTEST
> +M:	Vladis Dronov <vdronov@redhat.com>
> +M:	Herbert Xu <herbert@gondor.apana.org.au>
> +R:	Harald Freudenberger <freude@linux.ibm.com>
> +L:	linux-s390@vger.kernel.org
> +S:	Supported
> +F:	tools/testing/crypto/chacha20-s390/
> +
>   S390 COMMON I/O LAYER
>   M:	Vineeth Vijayan <vneethv@linux.ibm.com>
>   M:	Peter Oberparleiter <oberpar@linux.ibm.com>
> 

Doesn't look like you cc'ed the maintainers - please do and resend.

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
