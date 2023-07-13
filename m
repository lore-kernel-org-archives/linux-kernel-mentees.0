Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974D2C0015E
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 13 Jul 2023 19:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22B5B42140;
	Thu, 13 Jul 2023 19:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22B5B42140
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=X5N5snRX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nl3Q10HS9i_W; Thu, 13 Jul 2023 19:42:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id E674A4213E;
	Thu, 13 Jul 2023 19:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E674A4213E
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C4B0BC0072;
	Thu, 13 Jul 2023 19:42:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 47FC7C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Jul 2023 19:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2929140589
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Jul 2023 19:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2929140589
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google
 header.b=X5N5snRX
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hbWDEoDANhap
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Jul 2023 19:42:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4460C40280
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4460C40280
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Jul 2023 19:42:26 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id
 e9e14a558f8ab-34637e55d9dso765085ab.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 13 Jul 2023 12:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1689277345; x=1689882145;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7Jk/x9PV9ODetnZHc6allowBBDkx3rDFvMc6Ss76jDg=;
 b=X5N5snRX/yqfSBX4t0OY3WQGaZSuAiG6t1bjm2AXtTCfL4aj2J5k183yjKfyDmcF+K
 VqsxouzAcNuCqBmi9D+HD3Bjdp1hhXfZ6FlY37bjjwObkaCKHwwEE+VjqJkJiKU3YKHv
 AJFxU9sryt6+0nrCN1RcnRvqF9yYYFAPQ8IsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689277345; x=1689882145;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Jk/x9PV9ODetnZHc6allowBBDkx3rDFvMc6Ss76jDg=;
 b=NNkG6LF6Ez8TMbttUdDkRGzkf4Pde/PTbvd8Dbu+LM7SWYaTw1pKzzIQ2oqeOWgcLY
 /QhmoiLsHwXGwOEiS/A9IDl718lGFySHMTYtg17wEPa+f1wrVnwt4xqg2gVytg99HwMT
 WC4l+KRXAtTtwtlQyEq7pyKJSu6oWsja7/ZQWyk4ZL+GCmkoAtheS41ItsGyGbUeJaH1
 Fl5kpYtM/APKJsI8/pPuwhJ8vByC60aucavzPjV3bVBslPRwS+h+eKNl3cbRVfZiyq29
 odsGvbH8KsADoollDe2mY2gYAAu6BY3Rq/uvBzJI9nqr+yUc/I3GthevFqm5NnrortFm
 VZKQ==
X-Gm-Message-State: ABy/qLZlZwGI5Zj5SpRPrYVO6nPmUsZ75t43mSYx75eOBqQQNQem9szU
 BywTsIafO1Up5xZYl0vttI1jmqDH
X-Google-Smtp-Source: APBJJlEgPJINkKyms9Rkn3x68Lwx+JLuHS66rtjI93H7MeOovHsmQWeSIdm7dDPykshZaq8xUM6IDA==
X-Received: by 2002:a05:6602:389b:b0:780:d6ef:160 with SMTP id
 br27-20020a056602389b00b00780d6ef0160mr2515764iob.1.1689277345332; 
 Thu, 13 Jul 2023 12:42:25 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1]) by smtp.gmail.com with ESMTPSA id
 cu5-20020a05663848c500b0042b28c6a8f4sm1969569jab.75.2023.07.13.12.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 12:42:24 -0700 (PDT)
Message-ID: <8a14a99d-ce54-4fe3-ab42-e41f002080ce@linuxfoundation.org>
Date: Thu, 13 Jul 2023 13:42:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] tools/counter: Add checking directory exists for make
 clean
Content-Language: en-US
To: Anh Tuan Phan <tuananhlfc@gmail.com>, william.gray@linaro.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <362e127d-6018-5fc6-247b-3c729b99d946@gmail.com>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <362e127d-6018-5fc6-247b-3c729b99d946@gmail.com>
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

On 7/7/23 08:08, Anh Tuan Phan wrote:
> rmdir requires the directory exist so it causes "make -C tools clean"
> failed if someone only builds other tools but not counter. This commit
> adds checking the directory exist before doing rmdir.
> 
> Signed-off-by: Anh Tuan Phan <tuananhlfc@gmail.com>
> ---
>   tools/counter/Makefile | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/counter/Makefile b/tools/counter/Makefile
> index a0f4cab71fe5..2907f3b3094b 100644
> --- a/tools/counter/Makefile
> +++ b/tools/counter/Makefile
> @@ -40,7 +40,9 @@ $(OUTPUT)counter_example: $(COUNTER_EXAMPLE)
>   clean:
>   	rm -f $(ALL_PROGRAMS)
>   	rm -rf $(OUTPUT)include/linux/counter.h
> -	rmdir -p $(OUTPUT)include/linux
> +	@if [ -d $(OUTPUT)include/linux ]; then \
> +		rmdir -p $(OUTPUT)include/linux; \
> +	fi
>   	find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.d' -delete
> 
>   install: $(ALL_PROGRAMS)

Please cc appropriate linux kernel mailing lists and reviewers.
You can find them by running get_maintainers.pl script.

thanks,
-- Shuah


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
