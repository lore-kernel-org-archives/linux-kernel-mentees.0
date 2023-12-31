Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5646D9449
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DCQyUXg9"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF7A0607C0
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF7A0607C0
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DCQyUXg9
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ws7Ox9BN8dh
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sun, 31 Dec 2023 09:50:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by smtp3.osuosl.org (Postfix) with ESMTPS id E6C7860783
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 09:50:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6C7860783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704016255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QhZUTd/H07Uvw7u2aVbJSjltpuPY6hRS4P4m9ENSPLw=;
	b=DCQyUXg9bF90mhg4bS3tVjwftV8gpS1McBWIYLAGvh/Ww3GriP1UUtvIRjh0cpkhEFPf2v
	myg7GOsV/7sXFRLzPNammVpwMMJVJgJlwj7bIXVwYqF3gnL7QoXJkXDgkwxSq0dPq3DK5T
	cMIb7qJGRhs8n4tM8XaboQbYDCMoIrk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-DtFhvNrQPceqjbQLZJ6_hw-1; Sun, 31 Dec 2023 04:50:48 -0500
X-MC-Unique: DtFhvNrQPceqjbQLZJ6_hw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-5545aa32c47so7639234a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 31 Dec 2023 01:50:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704016248; x=1704621048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QhZUTd/H07Uvw7u2aVbJSjltpuPY6hRS4P4m9ENSPLw=;
        b=nxtP7XaITcEC8ARkPD1nMw7CAfjbrHaO8rLDDTIf+SFwb4u2qUsS8WwWqxFii9ZbAR
         P2hx0BWRVhp+BNo33LqEHcz6AWyVE3DTWvKt+SpNRi/ib/HlRcC7lcpM+8xaBlXHxCRn
         rx8f6iLOAnGSMFFvD+4aLAuiQfyunpe6qL5jI7C+rMdpqjzm5CLugNS4JUMO64x1341l
         nR9eOgudZ+rUpF22V3CpgpDvGkTW0m5Lx/YYm6LBrCQbpLXG9oe0oq/mKj4G0W3BO1pp
         EzzhWNl+6Vm5Wcs7mgpfinpXlU7asXvYBaJP06SI75jAqv/OIZ/0fWD/Cbp1VsWUNFWx
         agQQ==
X-Gm-Message-State: AOJu0YzyTxH6Kvg7yqKlVOAAvN9GG4BJd2Q7PP7ZZ5W1D+TYmfjT4EU2
	J7oXYbT3n7PU/dwMFN7DGPJ5oUj4dLGNbe7V5jSatGMH1nsQzQeXgds3LVKXwp1l+H5f4GC0Ij9
	DWuuXj0/mJHrH5FW9u0Tp2W8kO8hBcxzqIa3SQ2PS7Pr57PIaHyJkEi5O
X-Received: by 2002:a05:6402:206c:b0:554:448d:c4a5 with SMTP id bd12-20020a056402206c00b00554448dc4a5mr11611693edb.13.1704016247851;
        Sun, 31 Dec 2023 01:50:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH5IZnzaHDdgE/IRBdvRxny2kWlK9XSzfGwaU2d8BMjhMEYr1AvINGSZPGd2vxco9f93vQgiA==
X-Received: by 2002:a05:6402:206c:b0:554:448d:c4a5 with SMTP id bd12-20020a056402206c00b00554448dc4a5mr11611684edb.13.1704016247673;
        Sun, 31 Dec 2023 01:50:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id p12-20020a05640243cc00b0055493aa8905sm9894390edc.63.2023.12.31.01.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 31 Dec 2023 01:50:47 -0800 (PST)
Message-ID: <7d43e396-9496-42c3-9396-7f0fbda40bc0@redhat.com>
Date: Sun, 31 Dec 2023 10:50:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] staging: media: atomisp: pci: Fix spelling mistake in
 ia_css_acc_types.h
To: Dipendra Khadka <kdipendra88@gmail.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org, hpa@redhat.com
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org
References: <20231223141157.95501-1-kdipendra88@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231223141157.95501-1-kdipendra88@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/23/23 15:11, Dipendra Khadka wrote:
> codespell reported spelling mistakes in
> ia_css_acc_types.h as below:
> 
> '''
> ia_css_acc_types.h:87: cummulative ==> cumulative
> ia_css_acc_types.h:411: descibes ==> describes
> '''
> 
> This patch fixes these spelling mistakes.
> Word "cummulative" is changed to "accumulation"
> and "descibes" to "describes".
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
> v3:
>  - Changed "cummulative" to "accumulation" as suggested by Randy.
> v2: https://lore.kernel.org/lkml/20231223051108.74711-1-kdipendra88@gmail.com/
>  - Previously only corrected spelling  mistake reported by checkpatch.pl.
>  - All spelling mistakes reported by codespell are fixed.
> v1: https://lore.kernel.org/lkml/20231222200350.2024-1-kdipendra88@gmail.com/
> 
>  drivers/staging/media/atomisp/pci/ia_css_acc_types.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> index d6e52b4971d6..f6838a8fc9d5 100644
> --- a/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> +++ b/drivers/staging/media/atomisp/pci/ia_css_acc_types.h
> @@ -84,7 +84,7 @@ struct ia_css_blob_info {
>  		memory_offsets;  /** offset wrt hdr in bytes */
>  	u32 prog_name_offset;  /** offset wrt hdr in bytes */
>  	u32 size;			/** Size of blob */
> -	u32 padding_size;	/** total cummulative of bytes added due to section alignment */
> +	u32 padding_size;	/** total accumulation of bytes added due to section alignment */
>  	u32 icache_source;	/** Position of icache in blob */
>  	u32 icache_size;	/** Size of icache section */
>  	u32 icache_padding;/** bytes added due to icache section alignment */
> @@ -408,7 +408,7 @@ struct ia_css_acc_sp {
>  };
>  
>  /* Acceleration firmware descriptor.
> -  * This descriptor descibes either SP code (stand-alone), or
> +  * This descriptor describes either SP code (stand-alone), or
>    * ISP code (a separate pipeline stage).
>    */
>  struct ia_css_acc_fw_hdr {

