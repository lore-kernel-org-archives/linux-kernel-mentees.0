Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A3A20F0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jEqTO7ik"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A27482142
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:50:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A27482142
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jEqTO7ik
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7wEkPdnUnzOP
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 31 Dec 2023 09:50:42 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp1.osuosl.org (Postfix) with ESMTPS id AE70F82093
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE70F82093
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704016241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UW78e+F1YtmVSX3HESxIca4JE3o6LIXx9/gPDIVdjGs=;
	b=jEqTO7ikxageMO7FExPqalPI3pUrX6MGGw20dq5BzvDUxIgWkFRjchUXXnpAuihxq+nIsi
	fqzvLsQGSCNB1t3WgcGBwbyhlgIW0m4FaXUsWc6qFAtUb5EtLqFpLHoWVxIsiH7fjMF2Yf
	FRlIMMaNY8rlpOb92Z8UxafZ5ZEoBBo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-VjhwfM2mOf25AKvAMxw-Rw-1; Sun, 31 Dec 2023 04:50:40 -0500
X-MC-Unique: VjhwfM2mOf25AKvAMxw-Rw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-553b6a33a58so9603060a12.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 01:50:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704016239; x=1704621039;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UW78e+F1YtmVSX3HESxIca4JE3o6LIXx9/gPDIVdjGs=;
        b=GeaJvRBsSMEnOHUot/BZzvEo67c5HgHn/A9fZ+xoJwv4/RTw7kPhr4uqTL4FjEnUwA
         7Zb7RQlcwh3/YVTxbngTl85FYkt1Oq0kFSo0LA7ICccDXxHq2ztXfZhpbRX3sS0GPX2A
         3flkNQaS9BaFBUklR3opqNRZnal3UQ4vjoyvGtrxU7kqcXH+hHHbQav/V+D+jVUOMo+v
         W9iMj+eusKXDWQOpXa/dfotK8KEpBZgdXmPDTUBrB86UR/6wT2SHxQLGyKrrh9oL2I/L
         /I2tgm4k0ceP6vj0TnW5OAZX125zEASQQvE8Y6STmWD0011zfwj4UCSgluZ1wLtWspvL
         M3Aw==
X-Gm-Message-State: AOJu0Yya9d6qbr0I01Wc2Fsosf/9OvLn/mNY+HNK/vek/1hQEQRf1wr3
	iqoxXAplWt0K2a6yRHjBsUutEbfkG74QAIhEbft98Zaf10R77ZSYs81r1eLZJaXIlnBSW0jO5TG
	xjeV6f19pkUrxwReIIe3q9bI40lZlipOwiXqHeeTnC/61YtZYCRHkaPeL
X-Received: by 2002:a50:9f68:0:b0:555:936f:f36 with SMTP id b95-20020a509f68000000b00555936f0f36mr4604200edf.4.1704016238999;
        Sun, 31 Dec 2023 01:50:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAuVkeWzkV4UGpkYWL73BOOO7hj+mxu0DEI4qYXOLBU8Dgrsj+nfHlo9Gaj/b0bNZSUej77Q==
X-Received: by 2002:a50:9f68:0:b0:555:936f:f36 with SMTP id b95-20020a509f68000000b00555936f0f36mr4604191edf.4.1704016238710;
        Sun, 31 Dec 2023 01:50:38 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p12-20020a05640243cc00b0055493aa8905sm9894390edc.63.2023.12.31.01.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:50:38 -0800 (PST)
Message-ID: <70dd9eaa-4e41-4f4a-8dc6-a8e987b0c442@redhat.com>
Date: Sun, 31 Dec 2023 10:50:37 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media/atomisp/pci/runtime/binary/src: Fix
 spelling mistake in binary.c
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231223091521.85467-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231223091521.85467-1-kdipendra88@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/23/23 10:15, Dipendra Khadka wrote:
> codespell reported following spelling mistake
> in runtime/binary/src as below:
> 
> '''
> ./runtime/binary/src/binary.c:537: spcification ==> specification
> '''
> This patch fixes thisspelling mistake.
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
>  drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> index 0f3729e55e14..130662f8e768 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/binary/src/binary.c
> @@ -534,7 +534,7 @@ ia_css_binary_uninit(void) {
>  static int
>  binary_grid_deci_factor_log2(int width, int height)
>  {
> -	/* 3A/Shading decimation factor spcification (at August 2008)
> +	/* 3A/Shading decimation factor specification (at August 2008)
>  	 * ------------------------------------------------------------------
>  	 * [Image Width (BQ)] [Decimation Factor (BQ)] [Resulting grid cells]
>  	 * 1280 ?c             32                       40 ?c

