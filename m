Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AE6610A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dEUTQIqU"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D17780E90
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D17780E90
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dEUTQIqU
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hQ7th4-Uo9Eb
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 31 Dec 2023 09:44:14 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id A223A80E8F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:44:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A223A80E8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704015853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aoRYRzmOMOJJ4RXzl3IlNI75xYwxW5bvz/7dVLMLKv0=;
	b=dEUTQIqURD9lqtqIonEFE2c2lgBthQNcrWHp+gng2kv9yQBsCykAQRS6Uu3KJjuXGW+n1v
	ZU/kCWyKqROvqUM/R2zUJUf8rTXIw8e3qd1QreQARsjYttsp71mNLGrPSW5U3Yw8LAnc8E
	IvDCBAtw4SbEMJuiOmjoUQRCP96Hcw0=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-wWJmrO48NWyO9yF_-R1ncw-1; Sun, 31 Dec 2023 04:44:11 -0500
X-MC-Unique: wWJmrO48NWyO9yF_-R1ncw-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-50e7bf11ef2so4063622e87.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 01:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704015850; x=1704620650;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aoRYRzmOMOJJ4RXzl3IlNI75xYwxW5bvz/7dVLMLKv0=;
        b=Nd8QHubmiL8YiTrI+J49iZ/5ul8StkXls2p9a4HQ31X48BjI7eJFvQeOrmlYCH/XTJ
         WoVcorAPjqM7SfZuSqiLTXgZtcPPmNsD7FChb/lcm/c6yuCVRM38Bwf/HjzeTS7fpuaN
         YUvPwiJ24zqcx50WEF9Smc9+hmbq35vgJuA6f9uu6KLXFKEVXDmsLY5dyRUkwJRh5Lrr
         ro40LdeZ4ulAkiQUVf0iX2udSDMUsIkmwaAH4eMKueh6kSDsGC+i363mn85xAORCRtY3
         ufH+5IQ2Qk7GF349I0sJDO7PAbR1G09EOXFsJanm7snk7X8a9YEhc5d0kkPrTb/NIjOu
         +GVg==
X-Gm-Message-State: AOJu0Ywt1KJDBSChqPAKBUYTIMz15mUCWLpy+aacI0ra2/ENXhcwcwfc
	Jv98OTYYQbNzjvdVq1oE7bHi0GOI8nsCWaN1s+dYXHBQgpJwqcvtGkuFMCWyvW6n2fXlQgx86pe
	azgJQH4864Bcaxfv9o/oiUpvEFRt2pdRofGRsj3iqZQuuearE1v0IcKwk
X-Received: by 2002:ac2:5e33:0:b0:50e:6b49:dcb with SMTP id o19-20020ac25e33000000b0050e6b490dcbmr5083330lfg.62.1704015850406;
        Sun, 31 Dec 2023 01:44:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzNZGGVmMW3iCVqv16siFv74SOZgPs6vzt0xYSpEq9SxVnRan3smFZvn81ZKSPyMltDFUZBA==
X-Received: by 2002:ac2:5e33:0:b0:50e:6b49:dcb with SMTP id o19-20020ac25e33000000b0050e6b490dcbmr5083322lfg.62.1704015850111;
        Sun, 31 Dec 2023 01:44:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z17-20020a170906715100b00a26966683e3sm10072345ejj.144.2023.12.31.01.44.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:44:09 -0800 (PST)
Message-ID: <0856fd3a-4ff2-4dac-bb94-d7775bd535cc@redhat.com>
Date: Sun, 31 Dec 2023 10:44:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media/atomisp/pci/base/circbuf/src: Fix spelling
 mistakes in circbuf.c
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231223060422.77789-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231223060422.77789-1-kdipendra88@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/23/23 07:04, Dipendra Khadka wrote:
> codespell reported following spelling mistakes
> in circbuf.c as below:
> 
> '''
> ./circbuf.c:27: whehter ==> whether
> ./circbuf.c:132: offest ==> offset
> '''
> This patch fixes these spelling mistakes.
> 
> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans


> ---
>  drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> index d9f7c143794d..2f484ef9d4b5 100644
> --- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> +++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
> @@ -24,7 +24,7 @@
>   **********************************************************************/
>  /*
>   * @brief Read the oldest element from the circular buffer.
> - * Read the oldest element WITHOUT checking whehter the
> + * Read the oldest element WITHOUT checking whether the
>   * circular buffer is empty or not. The oldest element is
>   * also removed out from the circular buffer.
>   *
> @@ -129,7 +129,7 @@ uint32_t ia_css_circbuf_extract(ia_css_circbuf_t *cb, int offset)
>  	u32 src_pos;
>  	u32 dest_pos;
>  
> -	/* get the maximum offest */
> +	/* get the maximum offset */
>  	max_offset = ia_css_circbuf_get_offset(cb, cb->desc->start, cb->desc->end);
>  	max_offset--;
>  

