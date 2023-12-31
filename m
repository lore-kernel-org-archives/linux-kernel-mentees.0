Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92187211C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BsjVRQ3N"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C156410B8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:50:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C156410B8
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BsjVRQ3N
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IRxsvKxvnrJV
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 31 Dec 2023 09:50:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 261D440997
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 261D440997
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704016204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tK113Awfl6OWkpPlOKRE5e32nRk0EPC7dusyF+tpu2M=;
	b=BsjVRQ3Nx/B1J/N6RguIgPixXX9KswsOmgN8r92gvIaRyMJz0k4h2ygbhGMEH67DxPSj3F
	V8LpsUnpsTYxPixLfhmLzOcxsm5oKn+ilFgopsyxMMSLC2uXq2dXFozOsj1gduUNgjTwZb
	lhrc1HlCoVfujNZQD0nhbGKXiUtlhvU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-ZnDP5pzBNuWwPtr9Apj5rQ-1; Sun, 31 Dec 2023 04:50:01 -0500
X-MC-Unique: ZnDP5pzBNuWwPtr9Apj5rQ-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5564b72bbffso2262a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 01:50:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704016200; x=1704621000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tK113Awfl6OWkpPlOKRE5e32nRk0EPC7dusyF+tpu2M=;
        b=OPS7EnKsJlfWq0OiU1306+I56YXPmlEtXmTFL0oWhFJGhinnDUeYf64orU6mnDkwUf
         ysQlekQxh5uAqNXjoQjd6Ts8rE51GA3w08Qn2C6kPCEjA5iuZSFTNyTqAdWo0fkESuRr
         Dc/FJRf21nCMflW6BpimAjekzGo3gMpM7/aHdAB4tqvXNIMFvBkC+xkfEw46m0ENAn33
         TDePamF/AKAbgYQmAKUslsvQZHtyqetEQmU5wTxK8bY4zWaVIg5CQGVUYrkEIe4T4Sw+
         vYLiVIH1eRWyIeCrXIEXLh+4Kxuq2m0RbRqi7PfK4VhAbgO9A7/o68hJNLYxvwaww1FA
         Yyqw==
X-Gm-Message-State: AOJu0Yzd71XBu8MUc0zwx+8RDCXBJdrQ1/CJ4eaqfui8lcqQgCc1SK7q
	yQ0fcOBsTMkJRAVXv1yS7TLJBKM+pBTRK0w6NGb8+QrcQk4yE88PS89iMl8acULng5Wt2PuhaBl
	lxMFo35dzFv9wJSQhcZ9el6ezvgwlTMYgqT6DSW+u3oj0elPS6B5o+/tG
X-Received: by 2002:aa7:dac5:0:b0:555:65c0:e72b with SMTP id x5-20020aa7dac5000000b0055565c0e72bmr3651945eds.62.1704016199984;
        Sun, 31 Dec 2023 01:49:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/Hd8+uyhttvW+IY+lq2OUulSHmV7vOvPZBgbXZNJOHhyGzh3vYz6wI+KQXJ17t0X6E4g63Q==
X-Received: by 2002:aa7:dac5:0:b0:555:65c0:e72b with SMTP id x5-20020aa7dac5000000b0055565c0e72bmr3651933eds.62.1704016199772;
        Sun, 31 Dec 2023 01:49:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p12-20020a05640243cc00b0055493aa8905sm9894390edc.63.2023.12.31.01.49.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:49:59 -0800 (PST)
Message-ID: <8cfc7753-37f6-48be-b7ae-dc28022989ae@redhat.com>
Date: Sun, 31 Dec 2023 10:49:58 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: media/atomisp/pci/runtime/rmgr/src: Fix spelling
 mistakes in rmgr_vbuf.c
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231223072245.81630-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231223072245.81630-1-kdipendra88@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/23/23 08:22, Dipendra Khadka wrote:
> codespell reported following spelling mistake
> in rmgr_vbuf.cas below:
> 
> '''
> ./runtime/rmgr/src/rmgr_vbuf.c:201: succes ==> success
> ./runtime/rmgr/src/rmgr_vbuf.c:211: succes ==> success
> ./runtime/rmgr/src/rmgr_vbuf.c:215: succes ==> success
> '''
> This patch fixes these spelling mistakes.
> It is good to use variable name that gives
> proper meaning and spelling error free.
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
>  .../staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c  | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
> index 2e07dab8bf51..1f24db77fe38 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/rmgr/src/rmgr_vbuf.c
> @@ -198,7 +198,7 @@ void rmgr_push_handle(struct ia_css_rmgr_vbuf_pool *pool,
>  		      struct ia_css_rmgr_vbuf_handle **handle)
>  {
>  	u32 i;
> -	bool succes = false;
> +	bool success = false;
>  
>  	assert(pool);
>  	assert(pool->recycle);
> @@ -208,11 +208,11 @@ void rmgr_push_handle(struct ia_css_rmgr_vbuf_pool *pool,
>  		if (!pool->handles[i]) {
>  			ia_css_rmgr_refcount_retain_vbuf(handle);
>  			pool->handles[i] = *handle;
> -			succes = true;
> +			success = true;
>  			break;
>  		}
>  	}
> -	assert(succes);
> +	assert(success);
>  }
>  
>  /*

