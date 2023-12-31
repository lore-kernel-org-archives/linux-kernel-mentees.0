Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C454184C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BIfymaVE"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9BCAA81F41
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BCAA81F41
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BIfymaVE
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DlqiC0yTzK5G
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 31 Dec 2023 09:39:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 775A881C67
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 775A881C67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704015547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HdM5Vkomds4h/QuK6n7mA0GCkNM9rwKnYx1KoPXzk3M=;
	b=BIfymaVEjZxIS0yZktcgfzUIOJ+pshNWEE9Ig7XtJjos9IQGrCzgXEMAp7a8PMM0IfpmL/
	Jdkyqj6YRgUIBiU/0CZ8homJeVH28STPFXpe7XQ0z7+mkMFp3+tyz2U8UUZ5aHs+v17+bv
	QoHxIWxw8jOhVE+SxpmygzDRQbFHCqw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-323-SaI6MDT2O525Fiq8rOELFA-1; Sun, 31 Dec 2023 04:39:05 -0500
X-MC-Unique: SaI6MDT2O525Fiq8rOELFA-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-555f630f901so518187a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 01:39:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704015544; x=1704620344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HdM5Vkomds4h/QuK6n7mA0GCkNM9rwKnYx1KoPXzk3M=;
        b=APcic8i5T10XTayWi1w3xcnHXTsNyNMcKjlVJ++CfYD3uNlNG9qqrRNnrTgLw6tK+j
         1Ldi9Eq+ON6Xz/fk/lTUcKocVXEslis35o2ZfYJN0cAIgQwjcFhowD7pteJt60j0PnY7
         QRUGPc6wwG1NX+j+QDcaY0ycahp0wi9+uIhSOlrg/+RzKyhTeUVj72ibkkqqzbh3RQ47
         BHoMwZH6o29QXTYD3yRVbpdBGZp+fyHBOvVJegbLEL4XmPftfuOZdHsz2Ug7yK/pTrYW
         fO0nB5bBjKvbbK29QP9TBrJHWrkVHQGwxVpKxuQljzBana3BZNc6bcEvMDlJIQWFQwlF
         GjEQ==
X-Gm-Message-State: AOJu0YzaH1ClpaS8oMnNmbZSHo2h6c3deVlEKQoMVaO5JyAmB5olM6X5
	PnD8oOg8+Hf+Zc0yxqyaQ1V5xxhc8ROMYnza8v8pk2LcNP1SDQJ2z1ZvK5+hyTpC/D2gnbE0nlS
	pYC7ruKBWT2838i9XxzAlLROYFgD71BEEyU9s5/dSRjd2IFh4bNtVwa5b
X-Received: by 2002:a50:c10a:0:b0:555:226:764d with SMTP id l10-20020a50c10a000000b005550226764dmr5011592edf.70.1704015544344;
        Sun, 31 Dec 2023 01:39:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKA4bIPmpXp944hcEIeAaNCeCPsFiUapyDLV3C65+FtIjZ6pKJ+8TZ+8J3pxtFD0ToWuT4Sw==
X-Received: by 2002:a50:c10a:0:b0:555:226:764d with SMTP id l10-20020a50c10a000000b005550226764dmr5011587edf.70.1704015544056;
        Sun, 31 Dec 2023 01:39:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ew10-20020a056402538a00b005546ba152f4sm10900308edb.71.2023.12.31.01.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:39:03 -0800 (PST)
Message-ID: <32c5d324-c768-40d0-9c67-5038a24a89b6@redhat.com>
Date: Sun, 31 Dec 2023 10:39:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drivers: staging: media: atomisp: pci: Fixes spelling
 mistakes in ia_css_irq.h
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231218151704.449883-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231218151704.449883-1-kdipendra88@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/18/23 16:17, Dipendra Khadka wrote:
> The script checkpatch.pl reported spelling errors
> in ia_css_irq.h as below:
> 
> '''
> WARNING: Possible repeated word: 'in'
>         /** the input system in in error */
> 
> WARNING: Possible repeated word: 'in'
>         /** the input formatter in in error */
> 
> WARNING: Possible repeated word: 'in'
>         /** the dma in in error */
> '''
> 
> This patch corrects spelling errors,
> changing "in" to "is" in all three comments.
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
>  drivers/staging/media/atomisp/pci/ia_css_irq.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_irq.h b/drivers/staging/media/atomisp/pci/ia_css_irq.h
> index 26b1b3c8ba62..00e2fd1f9647 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_irq.h
> +++ b/drivers/staging/media/atomisp/pci/ia_css_irq.h
> @@ -84,11 +84,11 @@ enum ia_css_irq_info {
>  	IA_CSS_IRQ_INFO_ISP_BINARY_STATISTICS_READY   = BIT(17),
>  	/** ISP binary statistics are ready */
>  	IA_CSS_IRQ_INFO_INPUT_SYSTEM_ERROR            = BIT(18),
> -	/** the input system in in error */
> +	/** the input system is in error */
>  	IA_CSS_IRQ_INFO_IF_ERROR                      = BIT(19),
> -	/** the input formatter in in error */
> +	/** the input formatter is in error */
>  	IA_CSS_IRQ_INFO_DMA_ERROR                     = BIT(20),
> -	/** the dma in in error */
> +	/** the dma is in error */
>  	IA_CSS_IRQ_INFO_ISYS_EVENTS_READY             = BIT(21),
>  	/** end-of-frame events are ready in the isys_event queue */
>  };

