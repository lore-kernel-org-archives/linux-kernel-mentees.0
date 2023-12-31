Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FF31C2F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fKxsTxXD"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04136409A2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04136409A2
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fKxsTxXD
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IL90-j3nJKvE
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 31 Dec 2023 09:50:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id F238040997
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F238040997
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704016227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kEf7d/YGdeFm03zUvPaO/2U+4jX1XrcVLrOXY0pw9B4=;
	b=fKxsTxXDR2rhd39UBTE002xGvUfEBsmXtgvkhZraOkYRUj7ZXREVN3Yofvpty62XfLaOCT
	oJvavVtaRW1le46LZhKGPyHbW1AFH2QeJswG5TRxguuGMvZcbtI2mG8yDgErKuSd/Cv6YJ
	OUfcdYh6uLRv3OYszSwVfbdsg+jD9PQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-QA2ybDWLOS2-uJm7FHjhQg-1; Sun, 31 Dec 2023 04:50:25 -0500
X-MC-Unique: QA2ybDWLOS2-uJm7FHjhQg-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-555e8b639abso645027a12.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 01:50:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704016225; x=1704621025;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kEf7d/YGdeFm03zUvPaO/2U+4jX1XrcVLrOXY0pw9B4=;
        b=YkBI2A1+gpmHj57gW4rV166ci2rovQKzHaye1FTBLEUyxKnr/0gP0zSAUC0T2mmEFc
         b1bvg7o5/Pdyft+nXQOiXi9/1EAi2rnQNb9BVTKhNirE8kfu3/UULtQwAaR0Jct1d6jK
         JnPbAVhOgZtKSbgml99R3Zkkb5QnSTDIQ2MYdUt3pox4BIDgKOeETjy0LN4S4+FDMYwt
         XDfw6cGQQIeFoo6mugqBMjEvkGtTw4XZHPAqTo9B59emUzbwUS5OEPFH639jo11dLGcs
         xXV6zpYcdDmjJoNOhLDscN9JycC/Y8E3twAZwMbx7iZJ2vJPbI+vhMrhf1V3YGjEtfBG
         MMyQ==
X-Gm-Message-State: AOJu0Yz5t3BMAd/ALQjrl4gzzlXFkReUe0Yvp7ah0b3rIj+nxMbC/Zzu
	gR9DyIMaDcGoc/0bXYanyxW+yn7RVMey7JDIHzYBGfafa48jbUOB+V7vjGHxPqx3y+h4+nbHqjJ
	0Q4XkZ9R1YeGiq50DrFQmkoc3IBJpn67Gj3BJAme8GuBt1WfdOmFfTRkz
X-Received: by 2002:a05:6402:308b:b0:555:aa7f:d497 with SMTP id de11-20020a056402308b00b00555aa7fd497mr2093641edb.78.1704016224822;
        Sun, 31 Dec 2023 01:50:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3d64gvre5UEtDcBCBGdINd+i9LVRHckeXIouY1yFGpHks7z/uFszsGDHYUupOFufsytkjmw==
X-Received: by 2002:a05:6402:308b:b0:555:aa7f:d497 with SMTP id de11-20020a056402308b00b00555aa7fd497mr2093638edb.78.1704016224521;
        Sun, 31 Dec 2023 01:50:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p12-20020a05640243cc00b0055493aa8905sm9894390edc.63.2023.12.31.01.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:50:24 -0800 (PST)
Message-ID: <7e1cd3de-053a-4664-a728-1d5999f4d354@redhat.com>
Date: Sun, 31 Dec 2023 10:50:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media/atomisp/pci/isp/kernels/hdr: Fix spelling
 mistakes in ia_css_hdr_types.h
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231223083157.84090-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231223083157.84090-1-kdipendra88@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/23/23 09:31, Dipendra Khadka wrote:
> codespell reported following spelling mistake
> in ia_css_hdr_types.h below:
> 
> '''
> ./isp/kernels/hdr/ia_css_hdr_types.h:60: paramterers ==> parameters
> ./isp/kernels/hdr/ia_css_hdr_types.h:62: Currenly ==> Currently
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
>  .../media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
> index 175c301ee96a..ecc98686f5cf 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/hdr/ia_css_hdr_types.h
> @@ -57,9 +57,9 @@ struct ia_css_hdr_exclusion_params {
>  };
>  
>  /**
> - * \brief HDR public paramterers.
> + * \brief HDR public parameters.
>   * \details Struct with all parameters for HDR that can be seet from
> - * the CSS API. Currenly, only test parameters are defined.
> + * the CSS API. Currently, only test parameters are defined.
>   */
>  struct ia_css_hdr_config {
>  	struct ia_css_hdr_irradiance_params irradiance; /** HDR irradiance parameters */

